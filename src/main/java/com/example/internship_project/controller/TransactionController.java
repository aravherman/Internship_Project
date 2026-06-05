package com.example.internship_project.controller;

import com.example.internship_project.model.Category;
import com.example.internship_project.model.Transactions;
import com.example.internship_project.model.User;
import com.example.internship_project.repository.CategoryRepo;
import com.example.internship_project.service.TransactionService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/transactions")
public class TransactionController {

    @Autowired
    private TransactionService transactionService;

    @Autowired
    private CategoryRepo categoryRepo;

    @GetMapping
    public String listTransactions(
            @RequestParam(required = false) String type,
            @RequestParam(required = false) Long categoryId,
            HttpSession session,
            Model model
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        Long userId = user.getUserId();
        List<Transactions> transactions;

        if (type != null && !type.isEmpty()) {
            transactions = transactionService.getAllByUser(userId).stream()
                    .filter(t -> t.getTransactionType().equalsIgnoreCase(type))
                    .toList();
        } else if (categoryId != null) {
            transactions = transactionService.getAllByUser(userId).stream()
                    .filter(t -> t.getCategory() != null &&
                                 t.getCategory().getCategoryId().equals(categoryId))
                    .toList();
        } else {
            transactions = transactionService.getAllByUser(userId);
        }

        List<Category> categories = categoryRepo.findAll();

        model.addAttribute("transactions",   transactions);
        model.addAttribute("categories",     categories);
        model.addAttribute("selectedType",   type != null ? type : "");
        model.addAttribute("selectedCatId",  categoryId);
        model.addAttribute("totalIncome",    transactionService.getTotalIncome(userId));
        model.addAttribute("totalExpenses",  transactionService.getTotalExpenses(userId));
        model.addAttribute("userName",       user.getFullName());

        return "trans/transpage";
    }

    // ─────────────────────────────────────────────
    //  ADD FORM  —  GET /transactions/add
    // ─────────────────────────────────────────────

    @GetMapping("/add")
    public String showAddForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        model.addAttribute("categories", categoryRepo.findAll());
        model.addAttribute("userName",   user.getFullName());
        model.addAttribute("today",      LocalDate.now().toString());
        return "trans/add_trans";
    }

    // ─────────────────────────────────────────────
    //  SAVE  —  POST /transactions/add
    // ─────────────────────────────────────────────

    @PostMapping("/add")
    public String saveTransaction(
            @RequestParam String type,
            @RequestParam BigDecimal amount,
            @RequestParam String transactionDate,
            @RequestParam Long categoryId,
            @RequestParam(required = false, defaultValue = "") String description,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        if (amount.compareTo(BigDecimal.ZERO) <= 0) {
            redirectAttributes.addFlashAttribute("error", "Amount must be greater than zero.");
            return "redirect:/transactions/add";
        }

        transactionService.save(user, type, amount, LocalDate.parse(transactionDate), categoryId, description);

        redirectAttributes.addFlashAttribute("success", "Transaction saved successfully.");
        return "redirect:/transactions";
    }

    // ─────────────────────────────────────────────
    //  EDIT FORM  —  GET /transactions/edit/{id}
    // ─────────────────────────────────────────────

    @GetMapping("/edit/{id}")
    public String showEditForm(
            @PathVariable Long id,
            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        Transactions tx = transactionService.getByIdAndUser(id, user.getUserId());
        if (tx == null) {
            redirectAttributes.addFlashAttribute("error", "Transaction not found.");
            return "redirect:/transactions";
        }

        model.addAttribute("transaction", tx);
        model.addAttribute("categories",  categoryRepo.findAll());
        model.addAttribute("userName",    user.getFullName());
        return "trans/edit_trans";
    }

    // ─────────────────────────────────────────────
    //  UPDATE  —  POST /transactions/edit/{id}
    // ─────────────────────────────────────────────

    @PostMapping("/edit/{id}")
    public String updateTransaction(
            @PathVariable Long id,
            @RequestParam String type,
            @RequestParam BigDecimal amount,
            @RequestParam String transactionDate,
            @RequestParam Long categoryId,
            @RequestParam(required = false, defaultValue = "") String description,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        if (amount.compareTo(BigDecimal.ZERO) <= 0) {
            redirectAttributes.addFlashAttribute("error", "Amount must be greater than zero.");
            return "redirect:/transactions/edit/" + id;
        }

        boolean updated = transactionService.update(
                id, user.getUserId(), type, amount,
                LocalDate.parse(transactionDate), categoryId, description);

        if (!updated) {
            redirectAttributes.addFlashAttribute("error", "Transaction not found or access denied.");
        } else {
            redirectAttributes.addFlashAttribute("success", "Transaction updated.");
        }

        return "redirect:/transactions";
    }

    // ─────────────────────────────────────────────
    //  DELETE  —  POST /transactions/delete/{id}
    // ─────────────────────────────────────────────

    @PostMapping("/delete/{id}")
    public String deleteTransaction(
            @PathVariable Long id,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        boolean deleted = transactionService.delete(id, user.getUserId());
        if (!deleted) {
            redirectAttributes.addFlashAttribute("error", "Could not delete transaction.");
        } else {
            redirectAttributes.addFlashAttribute("success", "Transaction deleted.");
        }

        return "redirect:/transactions";
    }
}