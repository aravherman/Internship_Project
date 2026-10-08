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

    // TransactionController — full list
    List<Transactions> findByUserUserIdOrderByTransactionDateDesc(Long userId);
    List<Transactions> findByUserUserIdAndTransactionTypeOrderByTransactionDateDesc(Long userId, String type);

    // Ownership-safe single fetch
    Transactions findByTransactionIdAndUserUserId(Long transactionId, Long userId);

    // ── All-time totals ──
    @Query("SELECT COALESCE(SUM(t.amount), 0) FROM Transactions t WHERE t.user.userId = :userId AND t.transactionType = 'INCOME'")
    BigDecimal sumIncomeByUserId(@Param("userId") Long userId);

    @Query("SELECT COALESCE(SUM(t.amount), 0) FROM Transactions t WHERE t.user.userId = :userId AND t.transactionType = 'EXPENSE'")
    BigDecimal sumExpensesByUserId(@Param("userId") Long userId);

    // ── Monthly totals (BudgetService + ReportService) ──
    @Query("SELECT COALESCE(SUM(t.amount), 0) FROM Transactions t " +
           "WHERE t.user.userId = :userId AND t.transactionType = 'EXPENSE' " +
           "AND t.category.categoryId = :categoryId " +
           "AND MONTH(t.transactionDate) = MONTH(CURRENT_DATE) " +
           "AND YEAR(t.transactionDate)  = YEAR(CURRENT_DATE)")
    BigDecimal sumExpensesByUserIdAndCategoryId(@Param("userId") Long userId,
                                                @Param("categoryId") Long categoryId);

    @Query("SELECT COALESCE(SUM(t.amount), 0) FROM Transactions t " +
           "WHERE t.user.userId = :userId AND t.transactionType = 'INCOME' " +
           "AND MONTH(t.transactionDate) = :month AND YEAR(t.transactionDate) = :year")
    BigDecimal sumIncomeByUserIdAndMonth(@Param("userId") Long userId,
                                         @Param("month") int month,
                                         @Param("year")  int year);

    @Query("SELECT COALESCE(SUM(t.amount), 0) FROM Transactions t " +
           "WHERE t.user.userId = :userId AND t.transactionType = 'EXPENSE' " +
           "AND MONTH(t.transactionDate) = :month AND YEAR(t.transactionDate) = :year")
    BigDecimal sumExpensesByUserIdAndMonth(@Param("userId") Long userId,
                                           @Param("month") int month,
                                           @Param("year")  int year);

    // ── Category breakdown for donut chart (ReportService) ──
    @Query("SELECT c.categoryName, COALESCE(SUM(t.amount), 0) FROM Transactions t " +
           "JOIN t.category c " +
           "WHERE t.user.userId = :userId AND t.transactionType = 'EXPENSE' " +
           "GROUP BY c.categoryName ORDER BY SUM(t.amount) DESC")
    List<Object[]> sumExpensesByCategoryForUser(@Param("userId") Long userId);
}