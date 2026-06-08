package com.example.internship_project.service;

import com.example.internship_project.model.Budget;
import com.example.internship_project.model.Category;
import com.example.internship_project.model.User;
import com.example.internship_project.repository.BudgetRepo;
import com.example.internship_project.repository.CategoryRepo;
import com.example.internship_project.repository.TransactionRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.List;
// import java.util.Optional;

@Service
public class BudgetService {

    @Autowired
    private BudgetRepo budgetRepo;

    @Autowired
    private CategoryRepo categoryRepo;

    @Autowired
    private TransactionRepo transactionRepo;

    // ── All budgets for a user ──
    public List<Budget> getAllByUser(Long userId) {
        return budgetRepo.findByUserUserId(userId);
    }

    // ── Single budget (ownership check) ──
    public Budget getByIdAndUser(Long budgetId, Long userId) {
        return budgetRepo.findByBudgetIdAndUserUserId(budgetId, userId);
    }

    // ── Save / update ──
    public void save(User user, Long categoryId, BigDecimal limitAmount, String period) {
        Category category = categoryRepo.findById(categoryId).orElse(null);

        // If a budget for this category + period already exists, update it
        Budget budget = budgetRepo.findByUserUserIdAndCategoryCategoryId(user.getUserId(), categoryId);
        if (budget == null) {
            budget = new Budget();
            budget.setUser(user);
        }
        budget.setCategory(category);
        budget.setBudgetAmount(limitAmount);
        budget.setPeriod(period != null ? period.toUpperCase() : "MONTHLY");

        LocalDate now = LocalDate.now();
        LocalDate startDate = getBudgetStartDate(now, period);
        LocalDate endDate = getBudgetEndDate(startDate, period);

        budget.setStartDate(startDate);
        budget.setEndDate(endDate);

        budgetRepo.save(budget);
    }

    private LocalDate getBudgetStartDate(LocalDate date, String period) {
        if ("WEEKLY".equalsIgnoreCase(period)) {
            return date.with(java.time.DayOfWeek.MONDAY);
        }
        if ("YEARLY".equalsIgnoreCase(period)) {
            return date.withDayOfYear(1);
        }
        return date.withDayOfMonth(1);
    }

    private LocalDate getBudgetEndDate(LocalDate startDate, String period) {
        if ("WEEKLY".equalsIgnoreCase(period)) {
            return startDate.plusDays(6);
        }
        if ("YEARLY".equalsIgnoreCase(period)) {
            return startDate.plusYears(1).minusDays(1);
        }
        return startDate.plusMonths(1).minusDays(1);
    }

    public boolean delete(Long budgetId, Long userId) {
        Budget b = budgetRepo.findByBudgetIdAndUserUserId(budgetId, userId);
        if (b == null) return false;
        budgetRepo.delete(b);
        return true;
    }

    // ── How much has been spent against a category this month ──
    public BigDecimal getActualSpent(Long userId, Long categoryId) {
        BigDecimal spent = transactionRepo.sumExpensesByUserIdAndCategoryId(userId, categoryId);
        return spent != null ? spent : BigDecimal.ZERO;
    }

    // ── Percentage used (capped at 999 to avoid SVG weirdness) ──
    public int getPercentUsed(BigDecimal limitAmount, BigDecimal actualSpent) {
        if (limitAmount == null || limitAmount.compareTo(BigDecimal.ZERO) == 0) 
            return 0;
        return actualSpent
                .multiply(BigDecimal.valueOf(100))
                .divide(limitAmount, 0, RoundingMode.HALF_UP)
                .min(BigDecimal.valueOf(999))
                .intValue();
    }

    // ── Total monthly budget limit across all categories ──
    public BigDecimal getTotalLimit(Long userId) {
        BigDecimal total = budgetRepo.sumLimitByUserId(userId);
        return total != null ? total : BigDecimal.ZERO;
    }

    // ── Total spent this month across all budget categories ──
    public BigDecimal getTotalSpent(Long userId) {
        List<Budget> budgets = getAllByUser(userId);
        return budgets.stream()
                .map(b -> getActualSpent(userId, b.getCategory().getCategoryId()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    // ── All categories (for dropdown in set-budget form) ──
    public List<Category> getAllCategories() {
        return categoryRepo.findAll();
    }
}