package com.example.internship_project.repository;

import com.example.internship_project.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

@Repository
public interface UserRepo extends JpaRepository<User, Long> {
    User findByEmail(String email);

    // admin dash
    Page<User> findByStatus(String status, Pageable pageable);
 
    long countByStatus(String status);
 
    @Query("SELECT u FROM User u WHERE " +
           "(LOWER(u.fullName) LIKE LOWER(CONCAT('%', :q, '%')) OR " +
           " LOWER(u.email)    LIKE LOWER(CONCAT('%', :q, '%')))")
    Page<User> searchByNameOrEmail(@Param("q") String query, Pageable pageable);
 
    @Query("SELECT u FROM User u WHERE " +
           "(LOWER(u.fullName) LIKE LOWER(CONCAT('%', :q, '%')) OR " +
           " LOWER(u.email)    LIKE LOWER(CONCAT('%', :q, '%'))) " +
           "AND u.status = :status")
    Page<User> search(@Param("q") String query, @Param("status") String status, Pageable pageable);
}