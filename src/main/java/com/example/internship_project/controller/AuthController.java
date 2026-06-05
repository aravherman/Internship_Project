package com.example.internship_project.controller;

import com.example.internship_project.model.Role;
import com.example.internship_project.model.User;
import com.example.internship_project.repository.RoleRepo;
import com.example.internship_project.repository.UserRepo;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private RoleRepo roleRepo;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @GetMapping("/")
    public String showLoginPage(HttpSession session) {
        // If already logged in, redirect to dashboard
        if (session.getAttribute("loggedInUser") != null) {
            return "redirect:/home";
        }
        return "login";
    }

    @GetMapping("/register")
    public String showRegisterPage(HttpSession session) {
        if (session.getAttribute("loggedInUser") != null) {
            return "redirect:/home";
        }
        return "register";
    }

    @GetMapping("/admin_login")
    public String showAdminLoginPage(HttpSession session) {
        if (session.getAttribute("adminUser") != null) {
            return "redirect:/adminDash";
        }
        return "adminlogin";
    }

    //  REGISTER

    @PostMapping("/register")
    public String handleRegister(
            @RequestParam String fullName,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String confirmPassword,
            RedirectAttributes redirectAttributes
    ) {
        // Validation: passwords must match
        if (!password.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("error", "Passwords do not match.");
            return "redirect:/register";
        }

        // Validation: email must not already exist
        if (userRepo.findByEmail(email) != null) {
            redirectAttributes.addFlashAttribute("error", "An account with this email already exists.");
            return "redirect:/register";
        }

        // Validation: password length
        if (password.length() < 6) {
            redirectAttributes.addFlashAttribute("error", "Password must be at least 6 characters.");
            return "redirect:/register";
        }

        // Assign default USER role
        Role userRole = roleRepo.findByRoleName("ROLE_USER");
        if (userRole == null) {
            redirectAttributes.addFlashAttribute("error", "System error: default role not found. Please contact admin.");
            return "redirect:/register";
        }

        // Build and save user
        User newUser = new User();
        newUser.setFullName(fullName);
        newUser.setEmail(email);
        newUser.setPassword(passwordEncoder.encode(password));
        newUser.setRole(userRole);
        newUser.setStatus("ACTIVE");

        userRepo.save(newUser);

        redirectAttributes.addFlashAttribute("success", "Account created successfully! Please sign in.");
        return "redirect:/";
    }

    //  USER LOGIN

    @PostMapping("/login")
    public String handleLogin(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        User user = userRepo.findByEmail(email);

        if (user == null || !passwordEncoder.matches(password, user.getPassword())) {
            redirectAttributes.addFlashAttribute("error", "Invalid email or password.");
            return "redirect:/";
        }

        if ("INACTIVE".equalsIgnoreCase(user.getStatus())) {
            redirectAttributes.addFlashAttribute("error", "Your account has been deactivated. Please contact support.");
            return "redirect:/";
        }

        // Block admins from logging in via user login
        if (user.getRole() != null && "ROLE_ADMIN".equalsIgnoreCase(user.getRole().getRoleName())) {
            redirectAttributes.addFlashAttribute("error", "Please use the Admin login portal.");
            return "redirect:/";
        }

        // Store user in session
        session.setAttribute("loggedInUser", user);
        session.setAttribute("userId", user.getUserId());
        session.setAttribute("userName", user.getFullName());
        session.setMaxInactiveInterval(5000);
        return "redirect:/home";
    }

    //  ADMIN LOGIN

    @PostMapping("/admin_login")
    public String handleAdminLogin( @RequestParam String email, @RequestParam String password, HttpSession session, RedirectAttributes redirectAttributes) {
        User admin = userRepo.findByEmail(email);

        if (admin == null || !passwordEncoder.matches(password, admin.getPassword())) {
            redirectAttributes.addFlashAttribute("error", "Invalid admin credentials.");
            return "/adminlogin";
        }

        if (admin.getRole() == null || !"ROLE_ADMIN".equalsIgnoreCase(admin.getRole().getRoleName())) {
            redirectAttributes.addFlashAttribute("error", "Access denied. Admin privileges required.");
            return "redirect:/adminlogin";
        }

        if ("INACTIVE".equalsIgnoreCase(admin.getStatus())) {
            redirectAttributes.addFlashAttribute("error", "This admin account has been deactivated.");
            return "redirect:/adminlogin";
        }

        session.setAttribute("adminUser", admin);
        session.setAttribute("adminId", admin.getUserId());
        session.setAttribute("adminName", admin.getFullName());

        return "redirect:/admin/dashboard?search=&status=all&size=10";
    }

    //  LOGOUT
    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.invalidate();
        redirectAttributes.addFlashAttribute("success", "You have been logged out.");
        return "redirect:/";
    }

    @GetMapping("/admin/logout")
    public String adminLogout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.invalidate();
        
        redirectAttributes.addFlashAttribute("success", "Admin session ended.");
        return "redirect:/admin_login";
    }
}
