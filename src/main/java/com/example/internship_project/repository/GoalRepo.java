package com.example.internship_project.repository;

import com.example.internship_project.model.Goal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoalRepo extends JpaRepository<Goal, Long> {

    List<Goal> findByUserUserIdOrderByTargetDateAsc(Long userId);

    Goal findByGoalIdAndUserUserId(Long goalId, Long userId);
}