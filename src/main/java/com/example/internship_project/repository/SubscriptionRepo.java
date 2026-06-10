package com.example.internship_project.repository;

import com.example.internship_project.model.Subscription;
import com.example.internship_project.model.SubscriptionStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

// import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface SubscriptionRepo extends JpaRepository<Subscription, Long> {

    List<Subscription> findByUserUserIdOrderByDueDateAsc(Long userId);

    List<Subscription> findByUserUserIdAndStatus(Long userId, SubscriptionStatus status);

    Subscription findBySubscriptionIdAndUserUserId(Long subscriptionId, Long userId);

    // Due within a date window (for reminders + upcoming bills widget)
    @Query("SELECT s FROM Subscription s WHERE s.user.userId = :userId " +
           "AND s.status = 'ACTIVE' " +
           "AND s.dueDate BETWEEN :from AND :to " +
           "ORDER BY s.dueDate ASC")
    List<Subscription> findUpcomingSoon(@Param("userId") Long userId,
                                        @Param("from") LocalDate from,
                                        @Param("to") LocalDate to);
}