# Personal Finance Tracker

A web-based personal finance management system that helps users track income, expenses, budgets, and recurring subscriptions. The application provides a centralized dashboard with financial summaries, spending analytics, and reports to help users monitor and manage their finances effectively.

---

## 📌 Project Overview

The Personal Finance Tracker is designed to simplify everyday financial management.

Users can record their income and expenses, organize transactions into categories, create budgets, monitor recurring subscriptions, and analyze their financial activities through charts and reports.

The application follows a layered architecture using Spring Boot, Spring MVC, Spring Data JPA, JSP, and MySQL.

---

## 🎯 Objectives

- Manage income and expenses in a centralized platform.
- Categorize and track financial transactions.
- Create and monitor monthly budgets.
- Track recurring subscriptions and upcoming payments.
- Analyze spending patterns using visual reports.
- Provide financial summaries through an interactive dashboard.
- Maintain secure access to user-specific financial data.

---

## ✨ Features

### 👤 User Management
- User registration and login
- Session-based user authentication
- User-specific financial data
- Role-based access for administrative operations

### 💰 Transaction Management
- Add income and expenses
- Edit transactions
- Delete transactions
- Categorize transactions
- View transaction history
- Filter transactions by type

### 📊 Dashboard
- Current balance
- Total income
- Total expenses
- Recent transactions
- Financial overview
- Monthly spending information

### 🎯 Budget Management
- Create budgets
- Set category-wise spending limits
- Monitor budget utilization
- Compare budgeted amount with actual expenditure

### 🔄 Subscription Management
- Add recurring subscriptions
- Track subscription costs
- Set billing cycles
- Track upcoming billing dates
- Pause and activate subscriptions
- Enable/disable reminders
- Calculate monthly subscription cost

### 📈 Reports & Analytics
- Monthly income vs. expense analysis
- Category-wise expense distribution
- Cash flow summary
- Spending trends
- Visual charts and graphs

### 🔐 Security
- Authentication and authorization
- Protected application pages
- User-specific data access
- Ownership checks for financial records

---

## 🛠️ Technology Stack

### Backend
- Java
- Spring Boot
- Spring MVC
- Spring Data JPA
- Hibernate
- Spring Security

### Frontend
- JSP
- JSTL
- HTML5
- CSS3
- JavaScript
- Tailwind CSS

### Database
- MySQL

### Build & Development Tools
- Maven
- Git
- GitHub
- IntelliJ IDEA / Eclipse / VS Code

---

## 🏗️ Project Architecture

The project follows a layered architecture:

```text
                    ┌─────────────────────┐
                    │      JSP / UI       │
                    │  HTML/CSS/JS/JSTL   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │     Controller      │
                    │   Spring MVC Layer  │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │      Service        │
                    │   Business Logic    │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │     Repository      │
                    │   Spring Data JPA   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │       MySQL         │
                    │      Database       │
                    └─────────────────────┘