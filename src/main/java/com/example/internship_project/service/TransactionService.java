package com.example.internship_project.service;

import com.example.internship_project.model.Category;
import com.example.internship_project.model.Transactions;
import com.example.internship_project.model.User;
import com.example.internship_project.repository.CategoryRepo;
import com.example.internship_project.repository.TransactionRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Service
public class TransactionService {

    @Autowired
    private TransactionRepo transactionRepo;

    @Autowired
    private CategoryRepo categoryRepo;

    // ── Fetch all transactions for a user ──
    public List<Transactions> getAllByUser(Long userId) {
        return transactionRepo.findByUserUserIdOrderByTransactionDateDesc(userId);
    }

    // ── Fetch single transaction (with ownership check) ──
    public Transactions getByIdAndUser(Long transactionId, Long userId) {
        return transactionRepo.findByTransactionIdAndUserUserId(transactionId, userId);
    }

    // ── Save new transaction ──
    public void save(User user, String type, BigDecimal amount,
                     LocalDate date, Long categoryId, String description) {

        Category category = categoryRepo.findById(categoryId).orElse(null);

        Transactions tx = new Transactions();
        tx.setUser(user);
        tx.setTransactionType(type.toUpperCase());
        tx.setAmount(amount);
        tx.setTransactionDate(date);
        tx.setCategory(category);
        tx.setDescription(description);

        transactionRepo.save(tx);
    }

    // ── Update existing transaction ──
    public boolean update(Long transactionId, Long userId,
                          String type, BigDecimal amount,
                          LocalDate date, Long categoryId, String description) {

        Transactions tx = transactionRepo.findByTransactionIdAndUserUserId(transactionId, userId);
        if (tx == null) return false;

        Category category = categoryRepo.findById(categoryId).orElse(null);

        tx.setTransactionType(type.toUpperCase());
        tx.setAmount(amount);
        tx.setTransactionDate(date);
        tx.setCategory(category);
        tx.setDescription(description);

        transactionRepo.save(tx);
        return true;
    }

    // ── Delete transaction ──
    public boolean delete(Long transactionId, Long userId) {
        Transactions tx = transactionRepo.findByTransactionIdAndUserUserId(transactionId, userId);
        if (tx == null) return false;
        transactionRepo.delete(tx);
        return true;
    }

    // ── Summary helpers ──
    public BigDecimal getTotalIncome(Long userId) {
        BigDecimal v = transactionRepo.sumIncome(userId);
        return v != null ? v : BigDecimal.ZERO;
    }

    public BigDecimal getTotalExpenses(Long userId) {
        BigDecimal v = transactionRepo.sumExpenses(userId);
        return v != null ? v : BigDecimal.ZERO;
    }
}