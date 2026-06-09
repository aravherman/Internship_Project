package com.example.internship_project.repository;

import org.springframework.stereotype.Repository;
import com.example.internship_project.model.GoalCategory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface GoalCatRepo extends JpaRepository<GoalCategory, Integer> {
    List<GoalCategory> findAll();
    List<GoalCategory> findById(int id);
    List<GoalCategory> findByName(String name);
}
