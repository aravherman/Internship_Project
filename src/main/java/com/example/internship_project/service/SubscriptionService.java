package com.example.internship_project.service;

import com.example.internship_project.model.Frequency;
import com.example.internship_project.model.Subscription;
import com.example.internship_project.model.SubscriptionStatus;
import com.example.internship_project.model.User;
import com.example.internship_project.repository.SubscriptionRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
// import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;

@Service
public class SubscriptionService {

    @Autowired
    private SubscriptionRepo subscriptionRepo;

    // ── All subscriptions for a user ──
    public List<Subscription> getAllByUser(Long userId) {
        return subscriptionRepo.findByUserUserIdOrderByDueDateAsc(userId);
    }

    // ── Active only ──
    public List<Subscription> getActiveByUser(Long userId) {
        return subscriptionRepo.findByUserUserIdAndStatus(userId, SubscriptionStatus.ACTIVE);
    }

    // ── Single (ownership check) ──
    public Subscription getByIdAndUser(Long id, Long userId) {
        return subscriptionRepo.findBySubscriptionIdAndUserUserId(id, userId);
    }

    // ── Save new subscription ──
    public void save(User user, String serviceName, BigDecimal cost,
                     String billingCycle, LocalDate nextBillingDate,
                     String category, boolean reminderEnabled) {

        Subscription s = new Subscription();
        s.setUser(user);
        s.setSubscriptionName(serviceName);
        s.setAmount(cost);
        s.setDueDate(nextBillingDate);
        s.setFrequency(Frequency.valueOf(billingCycle.toUpperCase()));

        if(reminderEnabled)
            s.setReminderDaysBefore(3);
        else
            s.setReminderDaysBefore(0);

        s.setStatus(SubscriptionStatus.ACTIVE);
        subscriptionRepo.save(s);
    }

    // ── Toggle ACTIVE ↔ PAUSED ──
    public boolean toggleStatus(Long id, Long userId) {
        Subscription s = subscriptionRepo.findBySubscriptionIdAndUserUserId(id, userId);
        if (s == null) return false;
        s.setStatus(s.getStatus() == SubscriptionStatus.ACTIVE
                ? SubscriptionStatus.PAUSED
                : SubscriptionStatus.ACTIVE);
        subscriptionRepo.save(s);
        return true;
    }

    // ── Toggle reminder ──
    // public boolean toggleReminder(Long id, Long userId) {
    //     Subscription s = subscriptionRepo.findBySubscriptionIdAndUserUserId(id, userId);
    //     if (s == null)
    //         return false;
    //     if (s.getReminderDaysBefore() > 0)
    //         s.setReminderDaysBefore(0);
    //     else
    //         s.setReminderDaysBefore(3);
    //     subscriptionRepo.save(s);
    //     return true;
    // }

    // ── Delete ──
    public boolean delete(Long id, Long userId) {
        Subscription s = subscriptionRepo.findBySubscriptionIdAndUserUserId(id, userId);
        if (s == null) return false;
        subscriptionRepo.delete(s);
        return true;
    }

    // ── Total monthly cost (ACTIVE only, normalised to monthly) ──
    public BigDecimal getTotalMonthlyCost(Long userId) {
        List<Subscription> active = getActiveByUser(userId);
        return active.stream().map(s -> toMonthly(s.getAmount(), s.getFrequency()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    // ── Upcoming: due within next 7 days (ACTIVE) ──
    public List<Subscription> getUpcomingSoon(Long userId) {
        LocalDate today = LocalDate.now();
        LocalDate weekOut = today.plusDays(7);
        return subscriptionRepo.findUpcomingSoon(userId, today, weekOut);
    }

    // ── Days until next billing ──
    public long daysUntil(Subscription s) {
        if (s.getDueDate() == null) return 999;
        long days = ChronoUnit.DAYS.between(
        LocalDate.now(),
        s.getDueDate()
);

        return Math.max(0, days);
    }

    // ── Normalise any billing cycle to a monthly equivalent ──
    private BigDecimal toMonthly(BigDecimal amount, Frequency frequency) {
        if (amount == null) return BigDecimal.ZERO;
        return switch (frequency) {
            default            -> amount;   // MONTHLY
        };
    }
}