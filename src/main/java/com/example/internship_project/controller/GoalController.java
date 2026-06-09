package com.example.internship_project.controller;

import com.example.internship_project.model.Goal;
import com.example.internship_project.model.User;
import com.example.internship_project.service.GoalService;
import com.example.internship_project.service.TransactionService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.math.RoundingMode;
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

    @Autowired
    private TransactionService transactionService;

    private static final BigDecimal MINIMUM_BALANCE = new BigDecimal("1000");

    // ─────────────────────────────────────────────
    //  LIST  —  GET /goals
    // ─────────────────────────────────────────────

    @GetMapping
    public String listGoals(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        Long userId = user.getUserId();

        BigDecimal totalIncome   = transactionService.getTotalIncome(userId);
        BigDecimal totalExpenses = transactionService.getTotalExpenses(userId);
        BigDecimal balance       = totalIncome.subtract(totalExpenses);
        BigDecimal allocatable   = balance.subtract(MINIMUM_BALANCE).max(BigDecimal.ZERO);

        List<Goal> goals = goalService.getAllByUser(userId);

        List<Map<String, Object>> goalRows = new ArrayList<>();
        for (Goal g : goals) {
            int        percent    = goalService.getProgressPercent(g);
            String     dashOffset = goalService.getDashOffset(percent);
            BigDecimal remaining  = goalService.getRemaining(g);

            // Per-goal slider max = min(allocatable, remaining) so slider can't exceed need
            BigDecimal sliderMax = allocatable.min(remaining);

            Map<String, Object> row = new HashMap<>();
            row.put("goal",       g);
            row.put("percent",    percent);
            row.put("dashOffset", dashOffset);
            row.put("remaining",  remaining);
            row.put("sliderMax",  sliderMax);

            // Format targetDate safely for display (avoid EL rendering issues)
            if (g.getTargetDate() != null) {
                java.time.format.DateTimeFormatter sdf = java.time.format.DateTimeFormatter.ofPattern("dd MMM yyyy");
                row.put("targetDateStr", sdf.format(g.getTargetDate()));
            } else {
                row.put("targetDateStr", "—");
            }

            goalRows.add(row);
        }

        model.addAttribute("goalRows",       goalRows);
        model.addAttribute("balance",        balance);
        model.addAttribute("allocatable",    allocatable);
        model.addAttribute("belowMinimum",   balance.compareTo(MINIMUM_BALANCE) <= 0);
        model.addAttribute("minimumBalance", MINIMUM_BALANCE);
        model.addAttribute("userName",       user.getFullName());

        return "goals/goalspage";
    }

    // ─────────────────────────────────────────────
    //  ADD FORM  —  GET /goals/add
    // ─────────────────────────────────────────────

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

        goalService.save(user, goalName.trim(), targetAmount, currentAmount,
                         LocalDate.parse(targetDate), frequency);
        redirectAttributes.addFlashAttribute("success", "Goal \"" + goalName + "\" created!");
        return "redirect:/goals";
    }

    // ─────────────────────────────────────────────
    //  ADD FUNDS  —  POST /goals/{id}/fund
    //  Records EXPENSE transaction + updates goal currentAmount atomically
    // ─────────────────────────────────────────────

    @PostMapping("/{id}/fund")
    public String addFunds(
            @PathVariable Long id,
            @RequestParam BigDecimal amount,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        Long userId = user.getUserId();

        // Re-check balance server-side (slider is a UI hint, not security)
        BigDecimal balance     = transactionService.getTotalIncome(userId)
                                     .subtract(transactionService.getTotalExpenses(userId));
        BigDecimal allocatable = balance.subtract(MINIMUM_BALANCE).max(BigDecimal.ZERO);

        if (balance.compareTo(MINIMUM_BALANCE) <= 0) {
            redirectAttributes.addFlashAttribute("error",
                "Your balance is ₹" + balance.setScale(2, RoundingMode.HALF_UP) +
                " — below the ₹1,000 minimum. Cannot add funds to goals.");
            return "redirect:/goals";
        }

        if (amount == null || amount.compareTo(BigDecimal.ZERO) <= 0) {
            redirectAttributes.addFlashAttribute("error", "Amount must be greater than zero.");
            return "redirect:/goals";
        }

        if (amount.compareTo(allocatable) > 0) {
            redirectAttributes.addFlashAttribute("error",
                "You can only allocate up to ₹" + allocatable.setScale(2, RoundingMode.HALF_UP) +
                " (keeping ₹1,000 in reserve).");
            return "redirect:/goals";
        }

        // addFunds now also writes the EXPENSE transaction
        boolean ok = goalService.addFunds(id, userId, amount, user);
        if (!ok) {
            redirectAttributes.addFlashAttribute("error", "Goal not found.");
        } else {
            redirectAttributes.addFlashAttribute("success",
                "₹" + amount.setScale(2, RoundingMode.HALF_UP) +
                " added to your goal and deducted from your balance.");
        }

        return "redirect:/goals";
    }

    // ─────────────────────────────────────────────
    //  DELETE  —  POST /goals/{id}/delete
    // ─────────────────────────────────────────────

    @PostMapping("/{id}/delete")
    public String deleteGoal(
            @PathVariable Long id,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        boolean ok = goalService.delete(id, user.getUserId());
        redirectAttributes.addFlashAttribute(ok ? "success" : "error",
            ok ? "Goal deleted." : "Goal not found.");
        return "redirect:/goals";
    }
}