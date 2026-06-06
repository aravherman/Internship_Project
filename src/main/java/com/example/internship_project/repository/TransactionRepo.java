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

    // ── Used by HomeController & TransactionController ──
    List<Transactions> findByUserUserIdOrderByTransactionDateDesc(Long userId);

    List<Transactions> findByUserUserIdAndTransactionTypeOrderByTransactionDateDesc(Long userId, String transactionType);

    List<Transactions> findByUserUserIdAndCategoryCategoryIdOrderByTransactionDateDesc(Long userId, Long categoryId);

    // ── Ownership-safe single fetch (edit / delete) ──
    Transactions findByTransactionIdAndUserUserId(Long transactionId, Long userId);

    // ── Summary totals ──
    @Query("SELECT COALESCE(SUM(t.amount), 0) FROM Transactions t WHERE t.user.userId = :userId AND t.transactionType = 'INCOME'")
    BigDecimal sumIncome(@Param("userId") Long userId);

    @Query("SELECT COALESCE(SUM(t.amount), 0) FROM Transactions t WHERE t.user.userId = :userId AND t.transactionType = 'EXPENSE'")
    BigDecimal sumExpenses(@Param("userId") Long userId);
}