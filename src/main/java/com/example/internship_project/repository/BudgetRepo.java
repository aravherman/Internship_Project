package com.example.internship_project.repository;

import com.example.internship_project.model.Budget;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface BudgetRepo extends JpaRepository<Budget, Long> {

    List<Budget> findByUserUserId(Long userId);

    Budget findByBudgetIdAndUserUserId(Long budgetId, Long userId);

    // One budget per category per user
    Budget findByUserUserIdAndCategoryCategoryId(Long userId, Long categoryId);

    // Use the actual property name from the Budget entity (budgetAmount)
    @Query("SELECT COALESCE(SUM(b.budgetAmount), 0) FROM Budget b WHERE b.user.userId = :userId")
    BigDecimal sumLimitByUserId(@Param("userId") Long userId);
}