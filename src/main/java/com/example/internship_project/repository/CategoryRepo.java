package com.example.internship_project.repository;

import org.springframework.stereotype.Repository;
import com.example.internship_project.model.Category;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface CategoryRepo extends JpaRepository<Category, Long> {
    List<Category> findAll();
    List<Category> findById(long id); 
}
