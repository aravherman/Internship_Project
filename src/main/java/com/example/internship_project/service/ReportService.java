package com.example.internship_project.service;

import com.example.internship_project.repository.TransactionRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.*;

@Service
public class ReportService {

    @Autowired
    private TransactionRepo transactionRepo;

    //  Monthly spending bar chart — last N months

    public List<Map<String, Object>> getMonthlySpending(Long userId, int months) {
        List<Map<String, Object>> result = new ArrayList<>();
        LocalDate now = LocalDate.now();

        BigDecimal maxAmount = BigDecimal.ONE; // avoid divide-by-zero

        //collect raw amounts
        List<BigDecimal> amounts = new ArrayList<>();
        List<String>     labels  = new ArrayList<>();

        for (int i = months - 1; i >= 0; i--) {
            LocalDate month = now.minusMonths(i);
            BigDecimal spent = transactionRepo.sumExpensesByUserIdAndMonth(
                    userId, month.getMonthValue(), month.getYear());
            if (spent == null) spent = BigDecimal.ZERO;

            BigDecimal income = transactionRepo.sumIncomeByUserIdAndMonth(
                    userId, month.getMonthValue(), month.getYear());
            if (income == null) income = BigDecimal.ZERO;

            amounts.add(spent);
            labels.add(month.getMonth().getDisplayName(TextStyle.SHORT, Locale.ENGLISH)
                    + " " + month.getYear());

            if (spent.compareTo(maxAmount) > 0) maxAmount = spent;
            if (income.compareTo(maxAmount) > 0) maxAmount = income;
        }

        //compute bar heights as percent of max amount
        // for (int i = months - 1; i >= 0; i--) {
        //     LocalDate month = now.minusMonths(months - 1 - i);
        //     BigDecimal spent = amounts.get(months - 1 - i);
        //     BigDecimal income = transactionRepo.sumIncomeByUserIdAndMonth(
        //             userId, month.getMonthValue(), month.getYear());
        //     if (income == null) income = BigDecimal.ZERO;
        //     int spentPct  = maxAmount.compareTo(BigDecimal.ZERO) == 0 ? 2
        //             : spent.multiply(BigDecimal.valueOf(100)).divide(maxAmount, 0, RoundingMode.HALF_UP)
        //                 .max(BigDecimal.valueOf(2)).intValue();
        //     int incomePct = maxAmount.compareTo(BigDecimal.ZERO) == 0 ? 2
        //             : income.multiply(BigDecimal.valueOf(100)).divide(maxAmount, 0, RoundingMode.HALF_UP)
        //                 .max(BigDecimal.valueOf(2)).intValue();
        //     Map<String, Object> row = new LinkedHashMap<>();
        //     row.put("label",     labels.get(months - 1 - i));
        //     row.put("shortLabel",month.getMonth().getDisplayName(TextStyle.SHORT, Locale.ENGLISH));
        //     row.put("spent",     spent);
        //     row.put("income",    income);
        //     row.put("spentPct",  spentPct);
        //     row.put("incomePct", incomePct);
        //     result.add(row);
        // }

        for (int i = 0; i < months; i++) {
            LocalDate month = now.minusMonths(months - 1 - i);
            BigDecimal spent = amounts.get(i);
            BigDecimal income = transactionRepo.sumIncomeByUserIdAndMonth(
                    userId,
                    month.getMonthValue(),
                    month.getYear());
            if (income == null) income = BigDecimal.ZERO;
            int spentPct = maxAmount.compareTo(BigDecimal.ZERO) == 0 ? 2 : spent.multiply(BigDecimal.valueOf(100))
                        .divide(maxAmount, 0, RoundingMode.HALF_UP)
                        .max(BigDecimal.valueOf(2))
                        .intValue();
            int incomePct = maxAmount.compareTo(BigDecimal.ZERO) == 0 ? 2 : income.multiply(BigDecimal.valueOf(100))
                            .divide(maxAmount, 0, RoundingMode.HALF_UP)
                            .max(BigDecimal.valueOf(2))
                            .intValue();
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("label", labels.get(i));
            row.put("shortLabel", month.getMonth().getDisplayName(TextStyle.SHORT, Locale.ENGLISH));
            row.put("spent", spent);
            row.put("income", income);
            row.put("spentPct", spentPct);
            row.put("incomePct", incomePct);

            result.add(row);
        }
        return result;
    }

    //  Category distribution donut

    public List<Map<String, Object>> getCategoryBreakdown(Long userId) {
        List<Object[]> raw = transactionRepo.sumExpensesByCategoryForUser(userId);
        List<Map<String, Object>> result = new ArrayList<>();

        // Total for percent calculation
        BigDecimal total = raw.stream()
                .map(r -> r[1] != null ? (BigDecimal) r[1] : BigDecimal.ZERO)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        //circumference = 2π×42 ≈ 263.9. Each segment = (percent/100) * 263.9
        double circumference = 263.9;
        double offset        = 0; // running dashoffset

        String[] palette = {"#004532", "#8bd6b6", "#065f46", "#a6f2d1",
                             "#003980", "#adc6ff", "#a83639", "#fe7676"};

        for (int i = 0; i < raw.size() && i < 8; i++) {
            Object[] row    = raw.get(i);
            String catName  = row[0] != null ? row[0].toString() : "Other";
            BigDecimal amt  = row[1] != null ? (BigDecimal) row[1] : BigDecimal.ZERO;

            int pct = total.compareTo(BigDecimal.ZERO) == 0 ? 0
                    : amt.multiply(BigDecimal.valueOf(100))
                         .divide(total, 0, RoundingMode.HALF_UP)
                         .intValue();

            double dash   = (pct / 100.0) * circumference;
            double dashOff = circumference - offset;

            Map<String, Object> item = new LinkedHashMap<>();
            item.put("name",       catName);
            item.put("amount",     amt);
            item.put("percent",    pct);
            item.put("color",      palette[i % palette.length]);
            item.put("dash",       String.format("%.1f", dash));
            item.put("dashOffset", String.format("%.1f", dashOff));

            result.add(item);
            offset += dash;
        }

        return result;
    }

    //  Cash flow summary — current month

    public Map<String, BigDecimal> getCashFlowSummary(Long userId) {
        LocalDate now = LocalDate.now();
        BigDecimal income   = transactionRepo.sumIncomeByUserIdAndMonth(userId, now.getMonthValue(), now.getYear());
        BigDecimal expenses = transactionRepo.sumExpensesByUserIdAndMonth(userId, now.getMonthValue(), now.getYear());
        if (income   == null) income   = BigDecimal.ZERO;
        if (expenses == null) expenses = BigDecimal.ZERO;

        Map<String, BigDecimal> map = new LinkedHashMap<>();
        map.put("income",   income);
        map.put("expenses", expenses);
        map.put("net",      income.subtract(expenses));
        return map;
    }

    //  SVG line chart path — income and expense lines
    //  Returns two SVG path "d" strings for a 1000×200 viewBox

    public Map<String, String> getCashFlowPaths(Long userId, int months) {
        LocalDate now = LocalDate.now();
        List<Double> incomePoints  = new ArrayList<>();
        List<Double> expensePoints = new ArrayList<>();
        double maxVal = 1.0;

        for (int i = months - 1; i >= 0; i--) {
            LocalDate m   = now.minusMonths(i);
            BigDecimal inc = transactionRepo.sumIncomeByUserIdAndMonth(userId, m.getMonthValue(), m.getYear());
            BigDecimal exp = transactionRepo.sumExpensesByUserIdAndMonth(userId, m.getMonthValue(), m.getYear());
            double iv = inc != null ? inc.doubleValue() : 0;
            double ev = exp != null ? exp.doubleValue() : 0;
            incomePoints.add(iv);
            expensePoints.add(ev);
            if (iv > maxVal) maxVal = iv;
            if (ev > maxVal) maxVal = ev;
        }

        // Build SVG path strings
        String incomePath  = buildPath(incomePoints,  maxVal, 1000, 180);
        String expensePath = buildPath(expensePoints, maxVal, 1000, 180);

        // X-axis labels
        List<String> xLabels = new ArrayList<>();
        for (int i = months - 1; i >= 0; i--) {
            LocalDate m = now.minusMonths(i);
            xLabels.add(m.getMonth().getDisplayName(TextStyle.SHORT, Locale.ENGLISH) + " " + m.getYear());
        }

        Map<String, String> result = new LinkedHashMap<>();
        result.put("incomePath",  incomePath);
        result.put("expensePath", expensePath);
        result.put("xFirst",      xLabels.get(0));
        result.put("xMid",        xLabels.get(months / 2));
        result.put("xLast",       xLabels.get(months - 1));
        return result;
    }

    private String buildPath(List<Double> vals, double maxVal, double width, double height) {
        if (vals.isEmpty()) return "";
        int n = vals.size();
        StringBuilder sb = new StringBuilder("M");
        for (int i = 0; i < n; i++) {
            double x = (i / (double)(n - 1)) * width;
            double y = height - (vals.get(i) / maxVal) * height + 10;
            if (i == 0) sb.append(String.format("%.1f,%.1f", x, y));
            else        sb.append(String.format(" L%.1f,%.1f", x, y));
        }
        return sb.toString();
    }
}