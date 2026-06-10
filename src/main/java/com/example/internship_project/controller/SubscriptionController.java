package com.example.internship_project.controller;

import com.example.internship_project.model.Subscription;
import com.example.internship_project.model.User;
import com.example.internship_project.service.SubscriptionService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/subscriptions")
public class SubscriptionController {

    @Autowired
    private SubscriptionService subscriptionService;

    // ── LIST — GET /subscriptions ──
    @GetMapping
    public String listSubscriptions(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        Long userId = user.getUserId();
        List<Subscription> all  = subscriptionService.getAllByUser(userId);
        List<Subscription> soon = subscriptionService.getUpcomingSoon(userId);

        DateTimeFormatter sdf = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // Enrich each subscription with daysUntil and formatted date
        List<Map<String, Object>> rows = new ArrayList<>();
        for (Subscription s : all) {
            Map<String, Object> row = new HashMap<>();
            row.put("sub",        s);
            row.put("daysUntil",  subscriptionService.daysUntil(s));
            row.put("dueDateStr", s.getDueDate() != null
                    ? sdf.format(s.getDueDate()) : "—");
            rows.add(row);
        }

        // Category breakdown for the mix widget (ACTIVE only)
        // Map<String, BigDecimal> categoryTotals = new HashMap<>();
        // for (Subscription s : all) {
        //     if (s.getStatus() == com.example.internship_project.model.SubscriptionStatus.ACTIVE) {
        //         String cat = s.getCategory() != null ? s.getCategory() : "Other";
        //         categoryTotals.merge(cat,
        //                 s.getCost() != null ? s.getCost() : BigDecimal.ZERO,
        //                 BigDecimal::add);
        //     }
        // }

        long activeCount = all.stream()
                .filter(s -> s.getStatus() == com.example.internship_project.model.SubscriptionStatus.ACTIVE)
                .count();

        // Next upcoming billing date
        String nextBillStr = "—";
        if (!soon.isEmpty() && soon.get(0).getDueDate() != null) {
            nextBillStr = sdf.format(soon.get(0).getDueDate());
        }

        model.addAttribute("subscriptionRows", rows);
        model.addAttribute("upcomingSoon",      soon);
        model.addAttribute("totalMonthlyCost",  subscriptionService.getTotalMonthlyCost(userId));
        model.addAttribute("activeCount",       activeCount);
        model.addAttribute("nextBillStr",       nextBillStr);
        // model.addAttribute("categoryTotals",    categoryTotals);
        model.addAttribute("userName",          user.getFullName());

        return "subsc/subscriptionpage";
    }

    // ── ADD FORM — GET /subscriptions/add ──
    @GetMapping("/add")
    public String showAddForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        model.addAttribute("today",    LocalDate.now().toString());
        model.addAttribute("userName", user.getFullName());
        return "subsc/add_subsc";
    }

    // ── SAVE — POST /subscriptions/add ──
    @PostMapping("/add")
    public String saveSubscription(
            @RequestParam String serviceName,
            @RequestParam BigDecimal cost,
            @RequestParam(defaultValue = "MONTHLY") String billingCycle,
            @RequestParam String nextBillingDate,
            @RequestParam(required = false, defaultValue = "Other") String category,
            @RequestParam(required = false, defaultValue = "false") boolean reminderEnabled,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        if (serviceName == null || serviceName.isBlank()) {
            redirectAttributes.addFlashAttribute("error", "Service name is required.");
            return "redirect:/subscriptions/add";
        }
        if (cost.compareTo(BigDecimal.ZERO) <= 0) {
            redirectAttributes.addFlashAttribute("error", "Cost must be greater than zero.");
            return "redirect:/subscriptions/add";
        }

        subscriptionService.save(user, serviceName.trim(), cost,
                billingCycle, LocalDate.parse(nextBillingDate), category, reminderEnabled);

        redirectAttributes.addFlashAttribute("success",
                "\"" + serviceName + "\" subscription added.");
        return "redirect:/subscriptions";
    }

    // ── TOGGLE STATUS — POST /subscriptions/{id}/toggle ──
    @PostMapping("/{id}/toggle")
    public String toggleStatus(
            @PathVariable Long id,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        boolean ok = subscriptionService.toggleStatus(id, user.getUserId());
        redirectAttributes.addFlashAttribute(ok ? "success" : "error",
                ok ? "Subscription status updated." : "Subscription not found.");
        return "redirect:/subscriptions";
    }

    // ── TOGGLE REMINDER — POST /subscriptions/{id}/reminder ──
    // @PostMapping("/{id}/reminder")
    // public String toggleReminder(
    //         @PathVariable Long id,
    //         HttpSession session,
    //         RedirectAttributes redirectAttributes
    // ) {
    //     User user = (User) session.getAttribute("loggedInUser");
    //     if (user == null) return "redirect:/";

    //     subscriptionService.toggleReminder(id, user.getUserId());
    //     return "redirect:/subscriptions";
    // }

    // ── DELETE — POST /subscriptions/{id}/delete ──
    @PostMapping("/{id}/delete")
    public String deleteSubscription(
            @PathVariable Long id,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        boolean ok = subscriptionService.delete(id, user.getUserId());
        redirectAttributes.addFlashAttribute(ok ? "success" : "error",
                ok ? "Subscription deleted." : "Not found.");
        return "redirect:/subscriptions";
    }
}