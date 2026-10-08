package com.example.internship_project.controller;

import com.example.internship_project.model.Transactions;
import com.example.internship_project.model.User;
import com.example.internship_project.repository.TransactionRepo;
import com.example.internship_project.service.ReportService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.time.format.DateTimeFormatter;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @Autowired
    private TransactionRepo transactionRepo;
    //  reportpage  —  GET /reports

    @GetMapping
    public String analyticsPage(
            @RequestParam(defaultValue = "12") int months,
            HttpSession session,
            Model model
    ) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/";

        Long userId = user.getUserId();

        // Clamp months to 6 or 12
        if (months != 6) 
            months = 12;
        List<Map<String, Object>> monthlySpending  = reportService.getMonthlySpending(userId, months);
        List<Map<String, Object>> categoryBreakdown = reportService.getCategoryBreakdown(userId);
        Map<String, BigDecimal>   cashFlow          = reportService.getCashFlowSummary(userId);
        Map<String, String>       cashFlowPaths     = reportService.getCashFlowPaths(userId, months);

        // Total spent across all time (for donut center)
        BigDecimal totalSpent = transactionRepo.sumExpensesByUserId(userId);
        if (totalSpent == null) totalSpent = BigDecimal.ZERO;

        BigDecimal totalIncome = transactionRepo.sumIncomeByUserId(userId);
        if (totalIncome == null) totalIncome = BigDecimal.ZERO;

        model.addAttribute("monthlySpending",   monthlySpending);
        model.addAttribute("categoryBreakdown", categoryBreakdown);
        model.addAttribute("cashFlow",          cashFlow);
        model.addAttribute("cashFlowPaths",     cashFlowPaths);
        model.addAttribute("totalSpent",        totalSpent);
        model.addAttribute("totalIncome",       totalIncome);
        model.addAttribute("selectedMonths",    months);
        model.addAttribute("userName",          user.getFullName());

        return "report/reportpage";
    }
    //  csv download  —  GET /reports/export/csv

    @GetMapping("/export/csv")
    public void exportCsv(HttpServletResponse response, HttpSession session) throws IOException {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            response.sendRedirect("/");
            return;
        }

        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"wealthwise-transactions.csv\"");

        List<Transactions> transactions =
                transactionRepo.findByUserUserIdOrderByTransactionDateDesc(user.getUserId());

        DateTimeFormatter sdf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        PrintWriter writer   = response.getWriter();

        writer.println("Date,Type,Category,Description,Amount");
        for (Transactions tx : transactions) {
            String date     = tx.getTransactionDate() != null ? sdf.format(tx.getTransactionDate()) : "";
            String type     = tx.getTransactionType() != null ? tx.getTransactionType() : "";
            String category = (tx.getCategory() != null && tx.getCategory().getCategoryName() != null)
                              ? tx.getCategory().getCategoryName() : "";
            String desc     = tx.getDescription() != null
                              ? "\"" + tx.getDescription().replace("\"", "\"\"") + "\"" : "";
            String amount   = tx.getAmount() != null ? tx.getAmount().toString() : "0.00";

            writer.println(date + "," + type + "," + category + "," + desc + "," + amount);
        }
        writer.flush();
    }
}