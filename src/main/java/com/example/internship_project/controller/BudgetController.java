package com.example.internship_project.controller;

import com.example.internship_project.model.Budget;
import com.example.internship_project.model.Category;
import com.example.internship_project.model.User;
import com.example.internship_project.repository.CategoryRepo;
import com.example.internship_project.service.BudgetService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/budget")
public class BudgetController {

    @Autowired
    private BudgetService budgetService;

    @Autowired
    private CategoryRepo categoryRepo;
    //  BUDGET OVERVIEW

    @GetMapping
    public String budgetOverview(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        Long userId = user.getUserId();

        List<Budget> budgets = budgetService.getAllByUser(userId);

        // budget + actual spent + percent
        List<Map<String, Object>> budgetRows = new ArrayList<>();
        for (Budget b : budgets) {
            BigDecimal spent   = budgetService.getActualSpent(userId, b.getCategory().getCategoryId());
            int        percent = budgetService.getPercentUsed(b.getBudgetAmount(), spent);

            // status label
            String status;
            if (percent >= 100) 
                status = "OVER BUDGET";
            else if (percent >= 80) 
                status = "WARNING";
            else                   
                status = "HEALTHY";

            Map<String, Object> row = new HashMap<>();
            row.put("budget",  b);
            row.put("spent",   spent);
            row.put("percent", percent);
            row.put("status",  status);
            budgetRows.add(row);
        }

        BigDecimal totalLimit = budgetService.getTotalLimit(userId);
        BigDecimal totalSpent = budgetService.getTotalSpent(userId);
        int overallPercent    = budgetService.getPercentUsed(totalLimit, totalSpent);
        // Remaining percent for the gauge
        int remainingPercent  = Math.max(0, 100 - overallPercent);
        // Circumference = 2 * PI * 80 ≈ 502.6
        double dashOffset     = 502.6 * (1.0 - remainingPercent / 100.0);

        model.addAttribute("budgetRows",       budgetRows);
        model.addAttribute("totalLimit",       totalLimit);
        model.addAttribute("totalSpent",       totalSpent);
        model.addAttribute("remainingPercent", remainingPercent);
        model.addAttribute("dashOffset",       String.format("%.1f", dashOffset));
        model.addAttribute("userName",         user.getFullName());

        return "budget/budgetpage";
    }
    //  SET BUDGET FORM 

    @GetMapping("/set")
    public String showSetBudgetForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        model.addAttribute("categories", budgetService.getAllCategories());
        model.addAttribute("userName",   user.getFullName());
        return "budget/set_budget";
    }

    //  SAVE BUDGET 

    @PostMapping("/set")
    public String saveBudget(
            @RequestParam Long categoryId,
            @RequestParam BigDecimal limitAmount,
            @RequestParam(defaultValue = "MONTHLY") String period,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        if (limitAmount.compareTo(BigDecimal.ZERO) <= 0) {
            redirectAttributes.addFlashAttribute("error", "Budget limit must be greater than zero.");
            return "redirect:/budget/set";
        }

        budgetService.save(user, categoryId, limitAmount, period);
        redirectAttributes.addFlashAttribute("success", "Budget saved successfully.");
        return "redirect:/budget";
    }
    //  DELETE BUDGET

    @PostMapping("/delete/{id}")
    public String deleteBudget(
            @PathVariable Long id,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        boolean deleted = budgetService.delete(id, user.getUserId());
        if (!deleted) redirectAttributes.addFlashAttribute("error", "Budget not found.");
        else          redirectAttributes.addFlashAttribute("success", "Budget removed.");
        return "redirect:/budget";
    }

    //  ADD CATEGORY FORM
    @GetMapping("/category/add")
    public String showAddCategoryForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        model.addAttribute("categories", categoryRepo.findAll()); // for parent dropdown
        model.addAttribute("userName",   user.getFullName());
        return "budget/add_budget";
    }

    //  SAVE CATEGORY

    @PostMapping("/category/add")
    public String saveCategory(
            @RequestParam String categoryName,
            @RequestParam(required = false) String description,
            @RequestParam(required = false) String categoryType,  // INCOME | EXPENSE
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        if (categoryName == null || categoryName.isBlank()) {
            redirectAttributes.addFlashAttribute("error", "Category name is required.");
            return "redirect:/budget/category/add";
        }

        Category cat = new Category();
        cat.setCategoryName(categoryName.trim());
        if (description != null && !description.isBlank()) {
            cat.setDescription(description.trim());
        }
        // CategoryType enum mapping — adjust if your enum values differ
        if (categoryType != null && !categoryType.isBlank()) {
            try {
                cat.setCategoryType(
                    com.example.internship_project.model.CategoryType.valueOf(categoryType.toUpperCase())
                );
            } catch (IllegalArgumentException ignored) {}
        }
        categoryRepo.save(cat);

        redirectAttributes.addFlashAttribute("success",
                "Category \"" + categoryName + "\" created. You can now set a budget for it.");
        return "redirect:/budget/set";
    }
}