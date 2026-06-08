package com.example.internship_project.controller;

import com.example.internship_project.model.Goal;
import com.example.internship_project.model.User;
import com.example.internship_project.service.GoalService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/goals")
public class GoalController {
    @Autowired
    private GoalService goalService;
    //  GOALS LIST  —  GET /goals

    @GetMapping
    public String listGoals(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        List<Goal> goals = goalService.getAllByUser(user.getUserId());

        // Enrich each goal with computed display values
        List<Map<String, Object>> goalRows = new ArrayList<>();
        for (Goal g : goals) {
            int    percent    = goalService.getProgressPercent(g);
            String dashOffset = goalService.getDashOffset(percent);
            BigDecimal remaining = goalService.getRemaining(g);

            Map<String, Object> row = new HashMap<>();
            row.put("goal",       g);
            row.put("percent",    percent);
            row.put("dashOffset", dashOffset);
            row.put("remaining",  remaining);
            goalRows.add(row);
        }

        model.addAttribute("goalRows", goalRows);
        model.addAttribute("userName", user.getFullName());
        return "goals/goalspage";
    }

    //  ADD FORM  —  GET /goals/add

    @GetMapping("/add")
    public String showAddForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        model.addAttribute("today",    LocalDate.now().toString());
        model.addAttribute("userName", user.getFullName());
        return "goals/add_goal";
    }

    // ─────────────────────────────────────────────
    //  SAVE  —  POST /goals/add
    // ─────────────────────────────────────────────

    @PostMapping("/add")
    public String saveGoal(
            @RequestParam String goalName,
            @RequestParam BigDecimal targetAmount,
            @RequestParam(required = false, defaultValue = "0") BigDecimal currentAmount,
            @RequestParam String targetDate,
            @RequestParam(required = false, defaultValue = "MONTHLY") String frequency,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        if (goalName == null || goalName.isBlank()) {
            redirectAttributes.addFlashAttribute("error", "Goal name is required.");
            return "redirect:/goals/add";
        }
        if (targetAmount.compareTo(BigDecimal.ZERO) <= 0) {
            redirectAttributes.addFlashAttribute("error", "Target amount must be greater than zero.");
            return "redirect:/goals/add";
        }

        goalService.save(user, goalName.trim(), targetAmount, currentAmount, LocalDate.parse(targetDate), frequency);

        redirectAttributes.addFlashAttribute("success", "Goal \"" + goalName + "\" created!");
        return "redirect:/goals";
    }

    //  ADD FUNDS  —  POST /goals/{id}/fund

    @PostMapping("/{id}/fund")
    public String addFunds(
            @PathVariable Long id,
            @RequestParam BigDecimal amount,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        if (amount == null || amount.compareTo(BigDecimal.ZERO) <= 0) {
            redirectAttributes.addFlashAttribute("error", "Amount must be greater than zero.");
            return "redirect:/goals";
        }

        boolean ok = goalService.addFunds(id, user.getUserId(), amount);
        if (!ok) redirectAttributes.addFlashAttribute("error", "Goal not found.");
        else     redirectAttributes.addFlashAttribute("success", "Funds added successfully!");

        return "redirect:/goals";
    }

    //  DELETE  —  POST /goals/{id}/delete

    @PostMapping("/{id}/delete")
    public String deleteGoal(
            @PathVariable Long id,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        boolean ok = goalService.delete(id, user.getUserId());
        if (!ok) redirectAttributes.addFlashAttribute("error", "Goal not found.");
        else     redirectAttributes.addFlashAttribute("success", "Goal deleted.");

        return "redirect:/goals";
    }
}
