package com.example.internship_project.repository;

import com.example.internship_project.model.Transactions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface TransactionRepo extends JpaRepository<Transactions, Long> {

    // HomeController — recent 5
    List<Transactions> findTop5ByUserUserIdOrderByTransactionDateDesc(Long userId);

    // TransactionController — full list + filters
    List<Transactions> findByUserUserIdOrderByTransactionDateDesc(Long userId);
    List<Transactions> findByUserUserIdAndTransactionTypeOrderByTransactionDateDesc(Long userId, String type);

    // Ownership-safe single fetch (edit / delete)
    Transactions findByTransactionIdAndUserUserId(Long transactionId, Long userId);

    // Summary totals (all categories)
       // Use the actual property name `transactionType` from the Transactions entity
       @Query("SELECT COALESCE(SUM(t.amount), 0) FROM Transactions t WHERE t.user.userId = :userId AND t.transactionType = 'INCOME'")
    BigDecimal sumIncomeByUserId(@Param("userId") Long userId);

       @Query("SELECT COALESCE(SUM(t.amount), 0) FROM Transactions t WHERE t.user.userId = :userId AND t.transactionType = 'EXPENSE'")
    BigDecimal sumExpensesByUserId(@Param("userId") Long userId);

    // BudgetService — expenses for a specific category this month
    @Query("SELECT COALESCE(SUM(t.amount), 0) FROM Transactions t " +
           "WHERE t.user.userId = :userId AND t.transactionType = 'EXPENSE' " +
           "AND t.category.categoryId = :categoryId " +
           "AND MONTH(t.transactionDate) = MONTH(CURRENT_DATE) " +
           "AND YEAR(t.transactionDate)  = YEAR(CURRENT_DATE)")
    BigDecimal sumExpensesByUserIdAndCategoryId(@Param("userId") Long userId,
                                                @Param("categoryId") Long categoryId);
}