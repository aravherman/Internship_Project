package com.example.internship_project.controller;

import com.example.internship_project.model.Goal;
import com.example.internship_project.model.Transactions;
import com.example.internship_project.model.User;
import com.example.internship_project.repository.TransactionRepo;
// import com.example.internship_project.repository.SubscriptionRepo;
import com.example.internship_project.service.GoalService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.math.BigDecimal;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private TransactionRepo transactionRepo;

    @Autowired
    private GoalService goalService;

    // @Autowired
    // private SubscriptionRepo subscriptionRepo;

    @GetMapping("/home")
    public String dashboard(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/";
        }

        Long userId = user.getUserId();
        // GoalService goalService = new GoalService();
        //recent trans
        List<Transactions> recentTransactions =
                transactionRepo.findTop5ByUserUserIdOrderByTransactionDateDesc(userId);

        BigDecimal totalIncome   = transactionRepo.sumIncomeByUserId(userId);
        BigDecimal totalExpenses = transactionRepo.sumExpensesByUserId(userId);

        if (totalIncome   == null) totalIncome   = BigDecimal.ZERO;
        if (totalExpenses == null) totalExpenses = BigDecimal.ZERO;

        BigDecimal balance = totalIncome.subtract(totalExpenses);

        model.addAttribute("userName",         user.getFullName());
        model.addAttribute("recentTransactions", recentTransactions);
        model.addAttribute("totalIncome",      totalIncome);
        model.addAttribute("totalExpenses",    totalExpenses);
        model.addAttribute("balance",          balance);

        List<Goal> topGoals = goalService.getTop3Goals(user.getUserId());
        model.addAttribute("goals", topGoals);
        return "home";
    }
}