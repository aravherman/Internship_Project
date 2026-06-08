package com.example.internship_project.service;

import com.example.internship_project.model.Goal;
import com.example.internship_project.model.GoalStatus;
import com.example.internship_project.model.User;
import com.example.internship_project.repository.GoalRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@Service
public class GoalService {

    @Autowired
    private GoalRepo goalRepo;

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

    // ── Add funds to a goal ──
    public boolean addFunds(Long goalId, Long userId, BigDecimal amount) {
        Goal goal = goalRepo.findByGoalIdAndUserUserId(goalId, userId);
        if (goal == null) return false;

        BigDecimal newAmount = goal.getCurrentAmount().add(amount);
        goal.setCurrentAmount(newAmount);

        // Auto-complete if target reached
        if (newAmount.compareTo(goal.getTargetAmount()) >= 0) {
            goal.setStatus(GoalStatus.COMPLETED);
        }

        goalRepo.save(goal);
        return true;
    }

    // ── Delete goal ──
    public boolean delete(Long goalId, Long userId) {
        Goal goal = goalRepo.findByGoalIdAndUserUserId(goalId, userId);
        if (goal == null) return false;
        goalRepo.delete(goal);
        return true;
    }

    // ── Progress percent (0-100, capped) ──
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

    // ── SVG circle dashoffset for goal progress ring ──
    // circumference = 2 * PI * 40 ≈ 251.2
    public String getDashOffset(int percent) {
        double offset = 251.2 * (1.0 - percent / 100.0);
        return String.format("%.1f", offset);
    }

    // ── Remaining amount ──
    public BigDecimal getRemaining(Goal goal) {
        BigDecimal current = goal.getCurrentAmount() != null ? goal.getCurrentAmount() : BigDecimal.ZERO;
        BigDecimal remaining = goal.getTargetAmount().subtract(current);
        return remaining.max(BigDecimal.ZERO);
    }
}