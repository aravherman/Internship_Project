package com.example.internship_project.service;

import com.example.internship_project.model.Goal;
import com.example.internship_project.model.GoalStatus;
import com.example.internship_project.model.Transactions;
import com.example.internship_project.model.User;
import com.example.internship_project.repository.CategoryRepo;
import com.example.internship_project.repository.GoalRepo;
import com.example.internship_project.repository.TransactionRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@Service
public class GoalService {

    @Autowired
    private GoalRepo goalRepo;

    @Autowired
    private TransactionRepo transactionRepo;

    @Autowired
    private CategoryRepo categoryRepo;

    // ── All goals for a user ──
    public List<Goal> getAllByUser(Long userId) {
        return goalRepo.findByUserUserIdOrderByTargetDateAsc(userId);
    }

    // ── Single goal (ownership check) ──
    public Goal getByIdAndUser(Long goalId, Long userId) {
        return goalRepo.findByGoalIdAndUserUserId(goalId, userId);
    }

    // ── Save new goal ──
    public void save(User user, String goalName, BigDecimal targetAmount,
                     BigDecimal currentAmount, LocalDate targetDate, String frequency) {

        Goal goal = new Goal();
        goal.setUser(user);
        goal.setGoalName(goalName);
        goal.setTargetAmount(targetAmount);
        goal.setCurrentAmount(currentAmount != null ? currentAmount : BigDecimal.ZERO);
        goal.setTargetDate(targetDate);
        // goal.setFrequency(frequency);
        goal.setStatus(GoalStatus.IN_PROGRESS);

        goalRepo.save(goal);
    }

    /**
     * Add funds to a goal AND record an EXPENSE transaction so the balance
     * is deducted everywhere (dashboard, reports, budget vs actual, etc.).
     *
     * Both writes are wrapped in @Transactional — if either fails, both roll back.
     */
    @Transactional
    public boolean addFunds(Long goalId, Long userId, BigDecimal amount, User user) {
        Goal goal = goalRepo.findByGoalIdAndUserUserId(goalId, userId);
        if (goal == null) return false;

        // 1. Update goal's currentAmount
        BigDecimal newAmount = goal.getCurrentAmount().add(amount);
        goal.setCurrentAmount(newAmount);

        if (newAmount.compareTo(goal.getTargetAmount()) >= 0) {
            goal.setStatus(GoalStatus.COMPLETED);
        }
        goalRepo.save(goal);

        // 2. Record an EXPENSE transaction so balance is reduced in the DB
        //    Description clearly marks it as a goal contribution
        Transactions tx = new Transactions();
        tx.setUser(user);
        tx.setTransactionType("EXPENSE");
        tx.setAmount(amount);
        tx.setTransactionDate(LocalDate.now());
        tx.setDescription("Goal contribution: " + goal.getGoalName());
        // category is optional — use a "Savings" category if it exists, else leave null
        categoryRepo.findAll().stream()
            .filter(c -> c.getCategoryName().equalsIgnoreCase("Savings"))
            .findFirst()
            .ifPresent(tx::setCategory);

        transactionRepo.save(tx);

        return true;
    }

    // ── Delete goal ──
    public boolean delete(Long goalId, Long userId) {
        Goal goal = goalRepo.findByGoalIdAndUserUserId(goalId, userId);
        if (goal == null) return false;
        goalRepo.delete(goal);
        return true;
    }

    // ── Progress percent (0–100, capped) ──
    public int getProgressPercent(Goal goal) {
        if (goal.getTargetAmount() == null || goal.getTargetAmount().compareTo(BigDecimal.ZERO) == 0)
            return 0;
        BigDecimal current = goal.getCurrentAmount() != null ? goal.getCurrentAmount() : BigDecimal.ZERO;
        return current
                .multiply(BigDecimal.valueOf(100))
                .divide(goal.getTargetAmount(), 0, RoundingMode.HALF_UP)
                .min(BigDecimal.valueOf(100))
                .intValue();
    }

    // ── SVG circle dashoffset  (circumference = 2π×40 ≈ 251.2) ──
    public String getDashOffset(int percent) {
        double offset = 251.2 * (1.0 - percent / 100.0);
        return String.format("%.1f", offset);
    }

    // ── Remaining amount ──
    public BigDecimal getRemaining(Goal goal) {
        BigDecimal current = goal.getCurrentAmount() != null ? goal.getCurrentAmount() : BigDecimal.ZERO;
        return goal.getTargetAmount().subtract(current).max(BigDecimal.ZERO);
    }
}