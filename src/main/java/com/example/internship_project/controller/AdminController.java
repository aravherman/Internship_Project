package com.example.internship_project.controller;

import com.example.internship_project.model.User;
import com.example.internship_project.repository.UserRepo;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserRepo userRepo;
    
    private boolean isAdminLoggedIn(HttpSession session) {
        return session.getAttribute("adminUser") != null;
    }

    // manage users
    @GetMapping("/dashboard")
    public String userManagement( @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10")  int size, 
        @RequestParam(defaultValue = "")    String search,
        @RequestParam(defaultValue = "all") String status,
        HttpSession session,
        Model model) {
        if (!isAdminLoggedIn(session)) 
            return "redirect:/admin_login";

        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<User> userPage;

        // Filter by search + status
        if (!search.isBlank() && !status.equals("all")) {
            userPage = userRepo.search(search, status.toUpperCase(), pageable);
        } else if (!search.isBlank()) {
            userPage = userRepo.searchByNameOrEmail(search, pageable);
        } else if (!status.equals("all")) {
            userPage = userRepo.findByStatus(status.toUpperCase(), pageable);
        } else {
            userPage = userRepo.findAll(pageable);
        }

        long totalUsers    = userRepo.count();
        long activeUsers   = userRepo.countByStatus("ACTIVE");
        long inactiveUsers = userRepo.countByStatus("INACTIVE");

        model.addAttribute("users",        userPage.getContent());
        model.addAttribute("currentPage",  page);
        model.addAttribute("totalPages",   userPage.getTotalPages());
        model.addAttribute("totalUsers",   totalUsers);
        model.addAttribute("activeUsers",  activeUsers);
        model.addAttribute("inactiveUsers",inactiveUsers);
        model.addAttribute("search",       search);
        model.addAttribute("status",       status);
        model.addAttribute("pageSize",     size);
        model.addAttribute("adminName",    ((User) session.getAttribute("adminUser")).getFullName());

        return "adminDash";
    }

    @PostMapping("/users/{id}/toggle-status")
    public String toggleStatus(
            @PathVariable Long id,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        if (!isAdminLoggedIn(session)) return "redirect:/admin_login";

        User user = userRepo.findById(id).orElse(null);
        if (user == null) {
            redirectAttributes.addFlashAttribute("error", "User not found.");
            return "adminDash";
        }

        // Prevent admin from deactivating themselves
        User admin = (User) session.getAttribute("adminUser");
        if (user.getUserId().equals(admin.getUserId())) {
            redirectAttributes.addFlashAttribute("error", "You cannot deactivate your own account.");
            return "adminDash";
        }

        String newStatus = "ACTIVE".equals(user.getStatus()) ? "INACTIVE" : "ACTIVE";
        user.setStatus(newStatus);
        userRepo.save(user);

        redirectAttributes.addFlashAttribute("success", user.getFullName() + " has been " + (newStatus.equals("ACTIVE") ? "activated" : "deactivated") + ".");
        return "adminDash";
    }
}