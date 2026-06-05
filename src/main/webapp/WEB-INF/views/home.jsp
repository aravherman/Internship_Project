<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>WealthWise | Dashboard</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <style>
      .material-symbols-outlined { font-variation-settings: "FILL" 0, "wght" 400, "GRAD" 0, "opsz" 24; }
      body { font-family: "Inter", sans-serif; -webkit-font-smoothing: antialiased; }
      ::-webkit-scrollbar { width: 6px; }
      ::-webkit-scrollbar-track { background: #f1f1f1; }
      ::-webkit-scrollbar-thumb { background: #bec9c2; border-radius: 10px; }
    </style>
    <script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            colors: {
              "on-error": "#ffffff", "on-error-container": "#93000a",
              "on-secondary": "#ffffff", "on-background": "#151c27",
              "on-secondary-container": "#720b17",
              "surface-container-low": "#f0f3ff", error: "#ba1a1a",
              "on-surface-variant": "#3f4944", "tertiary-fixed": "#d8e2ff",
              "secondary-fixed": "#ffdad8", "surface-container-high": "#e2e8f8",
              primary: "#004532", "primary-fixed-dim": "#8bd6b6",
              "surface-bright": "#f9f9ff", "surface-variant": "#dce2f3",
              "inverse-on-surface": "#ebf1ff", "on-tertiary-fixed": "#001a42",
              "surface-container-lowest": "#ffffff",
              "surface-container-highest": "#dce2f3",
              "primary-container": "#065f46", "on-secondary-fixed": "#410006",
              secondary: "#a83639", "on-primary": "#ffffff",
              "error-container": "#ffdad6", "surface-tint": "#1b6b51",
              tertiary: "#003980", "inverse-surface": "#2a313d",
              background: "#f9f9ff", "secondary-fixed-dim": "#ffb3b0",
              "tertiary-fixed-dim": "#adc6ff", "on-tertiary": "#ffffff",
              "primary-fixed": "#a6f2d1", "on-primary-fixed": "#002116",
              "surface-container": "#e7eefe", surface: "#f9f9ff",
              "outline-variant": "#bec9c2", "on-tertiary-container": "#aec7ff",
              "on-primary-container": "#8bd6b7",
              "on-primary-fixed-variant": "#00513b", outline: "#6f7973",
              "inverse-primary": "#8bd6b6",
              "secondary-container": "#fe7676", "surface-dim": "#d3daea",
              "tertiary-container": "#004fac", "on-surface": "#151c27",
            },
            spacing: {
              sm: "12px", gutter: "24px", xl: "64px", base: "8px",
              "margin-mobile": "16px", md: "24px", "margin-desktop": "48px",
              lg: "40px", xs: "4px",
            },
            fontFamily: {
              "body-sm": ["Inter"], "headline-lg": ["Inter"],
              "label-sm": ["Inter"], "label-lg": ["Inter"],
              "label-md": ["Inter"], "headline-md": ["Inter"],
              "body-md": ["Inter"], "headline-sm": ["Inter"],
            },
            fontSize: {
              "body-sm": ["14px", { lineHeight: "20px", fontWeight: "400" }],
              "headline-lg": ["32px", { lineHeight: "40px", letterSpacing: "-0.02em", fontWeight: "700" }],
              "label-sm": ["10px", { lineHeight: "12px", fontWeight: "700" }],
              "label-lg": ["14px", { lineHeight: "20px", letterSpacing: "0.01em", fontWeight: "600" }],
              "label-md": ["12px", { lineHeight: "16px", letterSpacing: "0.02em", fontWeight: "600" }],
              "headline-md": ["24px", { lineHeight: "32px", fontWeight: "600" }],
              "body-md": ["16px", { lineHeight: "24px", fontWeight: "400" }],
              "headline-sm": ["20px", { lineHeight: "28px", fontWeight: "600" }],
            },
          },
        },
      };
    </script>
  </head>
  <body class="bg-background text-on-background min-h-screen">

    <%-- ── Sidebar (Desktop) ── --%>
    <aside class="hidden md:flex flex-col fixed left-0 top-0 h-screen w-64 bg-white border-r border-outline-variant py-md gap-xs z-50">
      <div class="px-6 mb-lg">
        <h1 class="font-headline-sm text-headline-sm font-bold text-primary">WealthWise</h1>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Financial Clarity</p>
      </div>
      <nav class="flex-1 overflow-y-auto">

        <%-- Active page helper: compare request URI --%>
        <%
          String uri = request.getRequestURI();
          String activeClass   = "flex items-center gap-sm bg-primary-container text-on-primary-container rounded-lg px-4 py-3 mx-2 cursor-pointer active:scale-[0.98] transition-transform";
          String inactiveClass = "flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 mx-2 cursor-pointer active:scale-[0.98] transition-all";
        %>

        <a class="<%= uri.equals("/home")              ? activeClass : inactiveClass %>" href="/home">
          <span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">home</span>
          <span class="font-label-lg text-label-lg">Home</span>
        </a>
        <a class="<%= uri.startsWith("/transactions")  ? activeClass : inactiveClass %>" href="/transactions">
          <span class="material-symbols-outlined">list_alt</span>
          <span class="font-label-lg text-label-lg">Transactions</span>
        </a>
        <a class="<%= uri.startsWith("/budget")        ? activeClass : inactiveClass %>" href="/budget">
          <span class="material-symbols-outlined">account_balance_wallet</span>
          <span class="font-label-lg text-label-lg">Budget</span>
        </a>
        <a class="<%= uri.startsWith("/goals")         ? activeClass : inactiveClass %>" href="/goals">
          <span class="material-symbols-outlined">stars</span>
          <span class="font-label-lg text-label-lg">Goals</span>
        </a>
        <a class="<%= uri.startsWith("/subscriptions") ? activeClass : inactiveClass %>" href="/subscriptions">
          <span class="material-symbols-outlined">subscriptions</span>
          <span class="font-label-lg text-label-lg">Subscriptions</span>
        </a>
        <a class="<%= uri.startsWith("/reports")       ? activeClass : inactiveClass %>" href="/reports">
          <span class="material-symbols-outlined">assessment</span>
          <span class="font-label-lg text-label-lg">Reports</span>
        </a>
      </nav>
      <div class="mt-auto px-2">
        <a class="flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 transition-all" href="/logout">
          <span class="material-symbols-outlined">logout</span>
          <span class="font-label-lg text-label-lg">Logout</span>
        </a>
      </div>
    </aside>

    <%-- ── Main Content ── --%>
    <main class="md:ml-64 flex flex-col min-h-screen">

      <%-- Top Bar --%>
      <header class="flex justify-between items-center w-full h-16 px-gutter bg-surface shadow-sm sticky top-0 z-40">
        <div class="flex items-center gap-md">
          <p class="font-body-sm text-on-surface-variant hidden sm:block">
            Welcome back, <span class="font-semibold text-on-surface"><c:out value="${userName}"/></span>
          </p>
        </div>
        <div class="flex items-center gap-sm">
          <a href="/transactions/add"
            class="bg-primary text-white px-4 py-2 rounded-lg font-label-lg text-label-lg flex items-center gap-xs hover:opacity-90 active:scale-95 transition-all">
            <span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">add</span>
            Quick Add
          </a>
          <a href="/subsc/subscriptionpage" class="p-2 text-on-surface-variant hover:bg-surface-container-low rounded-full transition-colors" title="Upcoming bills">
            <span class="material-symbols-outlined">notifications</span>
          </a>
          <%-- Avatar initials fallback --%>
          <div class="h-8 w-8 rounded-full bg-primary flex items-center justify-center text-white font-bold text-xs">
            ${userName != null ? userName.substring(0,1).toUpperCase() : "U"}
          </div>
        </div>
      </header>

      <%-- Dashboard Body --%>
      <div class="p-gutter md:p-margin-desktop space-y-gutter max-w-7xl mx-auto w-full">

        <%-- ── Summary Cards ── --%>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-gutter">

          <%-- Balance --%>
          <div class="bg-white p-6 rounded-xl border border-outline-variant shadow-sm hover:shadow-md transition-shadow">
            <div class="flex justify-between items-start mb-4">
              <div class="p-2 bg-primary-container/10 rounded-lg text-primary">
                <span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">account_balance</span>
              </div>
            </div>
            <p class="font-label-md text-label-md text-on-surface-variant mb-1">Current Balance</p>
            <h3 class="font-headline-md text-headline-md font-bold text-on-surface">
              ₹<fmt:formatNumber value="${balance}" pattern="#,##0.00"/>
            </h3>
          </div>

          <%-- Income --%>
          <div class="bg-white p-6 rounded-xl border border-outline-variant shadow-sm hover:shadow-md transition-shadow">
            <div class="flex justify-between items-start mb-4">
              <div class="p-2 bg-primary-container/10 rounded-lg text-primary">
                <span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">trending_up</span>
              </div>
            </div>
            <p class="font-label-md text-label-md text-on-surface-variant mb-1">Total Income</p>
            <h3 class="font-headline-md text-headline-md font-bold text-on-surface">
              ₹<fmt:formatNumber value="${totalIncome}" pattern="#,##0.00"/>
            </h3>
          </div>

          <%-- Expenses --%>
          <div class="bg-white p-6 rounded-xl border border-outline-variant shadow-sm hover:shadow-md transition-shadow">
            <div class="flex justify-between items-start mb-4">
              <div class="p-2 bg-secondary-container/10 rounded-lg text-secondary">
                <span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">trending_down</span>
              </div>
            </div>
            <p class="font-label-md text-label-md text-on-surface-variant mb-1">Total Expenses</p>
            <h3 class="font-headline-md text-headline-md font-bold text-on-surface">
              ₹<fmt:formatNumber value="${totalExpenses}" pattern="#,##0.00"/>
            </h3>
          </div>
        </div>

        <%-- ── Main Bento Grid ── --%>
        <div class="grid grid-cols-1 lg:grid-cols-12 gap-gutter">

          <%-- Recent Transactions (col-span 8) --%>
          <div class="lg:col-span-8 bg-white rounded-xl border border-outline-variant shadow-sm overflow-hidden">
            <div class="p-6 flex justify-between items-center border-b border-outline-variant">
              <h2 class="font-headline-sm text-headline-sm text-on-surface">Recent Transactions</h2>
              <a href="/transactions" class="text-primary font-label-md text-label-md hover:underline">View All</a>
            </div>
            <div class="overflow-x-auto">
              <table class="w-full text-left">
                <thead class="bg-surface-container-lowest">
                  <tr>
                    <th class="px-6 py-4 font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider">Description</th>
                    <th class="px-6 py-4 font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider">Category</th>
                    <th class="px-6 py-4 font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider">Date</th>
                    <th class="px-6 py-4 font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider text-right">Amount</th>
                  </tr>
                </thead>
                <tbody class="divide-y divide-outline-variant">
                  <c:choose>
                    <c:when test="${not empty recentTransactions}">
                      <c:forEach var="tx" items="${recentTransactions}">
                        <tr class="hover:bg-surface-container-low transition-colors">
                          <td class="px-6 py-4 flex items-center gap-3">
                            <div class="w-8 h-8 rounded-full bg-surface-container-low flex items-center justify-center text-primary">
                              <c:choose>
                                <c:when test="${tx.transactionType == 'INCOME'}">
                                  <span class="material-symbols-outlined text-sm">payments</span>
                                </c:when>
                                <c:otherwise>
                                  <span class="material-symbols-outlined text-sm">shopping_bag</span>
                                </c:otherwise>
                              </c:choose>
                            </div>
                            <span class="font-body-md text-body-md font-semibold">
                              <c:out value="${tx.description}"/>
                            </span>
                          </td>
                          <td class="px-6 py-4">
                            <c:choose>
                              <c:when test="${tx.transactionType == 'INCOME'}">
                                <span class="px-2 py-1 bg-primary-container/10 text-primary rounded text-xs">
                                  <c:out value="${tx.category != null ? tx.category.categoryName : 'Income'}"/>
                                </span>
                              </c:when>
                              <c:otherwise>
                                <span class="px-2 py-1 bg-surface-container-high rounded text-xs">
                                  <c:out value="${tx.category != null ? tx.category.categoryName : 'Expense'}"/>
                                </span>
                              </c:otherwise>
                            </c:choose>
                          </td>
                          <td class="px-6 py-4 font-body-sm text-body-sm text-on-surface-variant">
                            <c:out value="${tx.transactionDate.toString().substring(0, 10)}"/>
                          </td>
                          <td class="px-6 py-4 font-body-md text-body-md font-bold text-right
                            ${tx.transactionType == 'INCOME' ? 'text-primary' : 'text-secondary'}">
                            <c:choose>
                              <c:when test="${tx.transactionType == 'INCOME'}">+</c:when>
                              <c:otherwise>-</c:otherwise>
                            </c:choose>
                            ₹<fmt:formatNumber value="${tx.amount}" pattern="#,##0.00"/>
                          </td>
                        </tr>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <tr>
                        <td colspan="4" class="px-6 py-12 text-center text-on-surface-variant font-body-sm">
                          No transactions yet.
                          <a href="/transactions/add" class="text-primary font-semibold hover:underline ml-1">Add your first one →</a>
                        </td>
                      </tr>
                    </c:otherwise>
                  </c:choose>
                </tbody>
              </table>
            </div>
          </div>

          <%-- Right sidebar (col-span 4) --%>
          <div class="lg:col-span-4 space-y-gutter">

            <%-- Quick Links --%>
            <div class="bg-white p-6 rounded-xl border border-outline-variant shadow-sm">
              <h2 class="font-headline-sm text-headline-sm text-on-surface mb-4">Quick Actions</h2>
              <div class="grid grid-cols-2 gap-3">
                <a href="/transactions/add"
                  class="flex flex-col items-center gap-2 p-4 bg-surface-container-low rounded-xl hover:bg-primary-container/10 hover:text-primary transition-all text-on-surface-variant">
                  <span class="material-symbols-outlined">add_circle</span>
                  <span class="font-label-md text-label-md text-center">Add Transaction</span>
                </a>
                <a href="/budget"
                  class="flex flex-col items-center gap-2 p-4 bg-surface-container-low rounded-xl hover:bg-primary-container/10 hover:text-primary transition-all text-on-surface-variant">
                  <span class="material-symbols-outlined">account_balance_wallet</span>
                  <span class="font-label-md text-label-md text-center">Set Budget</span>
                </a>
                <a href="/goals"
                  class="flex flex-col items-center gap-2 p-4 bg-surface-container-low rounded-xl hover:bg-primary-container/10 hover:text-primary transition-all text-on-surface-variant">
                  <span class="material-symbols-outlined">stars</span>
                  <span class="font-label-md text-label-md text-center">Goals</span>
                </a>
                <a href="/reports"
                  class="flex flex-col items-center gap-2 p-4 bg-surface-container-low rounded-xl hover:bg-primary-container/10 hover:text-primary transition-all text-on-surface-variant">
                  <span class="material-symbols-outlined">assessment</span>
                  <span class="font-label-md text-label-md text-center">Reports</span>
                </a>
              </div>
            </div>

            <%-- Upcoming Bills (links to subscriptions page) --%>
            <div class="bg-white p-6 rounded-xl border border-outline-variant shadow-sm">
              <div class="flex justify-between items-center mb-4">
                <h2 class="font-headline-sm text-headline-sm text-on-surface">Upcoming Bills</h2>
                <a href="/subsc/subscriptionpage" class="text-primary font-label-md text-label-md hover:underline">View All</a>
              </div>
              <%-- Static placeholder — replace with dynamic data once SubscriptionService is ready --%>
              <div class="space-y-3">
                <div class="flex items-center justify-between p-3 bg-surface-container-low rounded-lg">
                  <div class="flex items-center gap-3">
                    <div class="bg-white p-2 rounded-md border border-outline-variant">
                      <span class="material-symbols-outlined text-primary text-sm">subscriptions</span>
                    </div>
                    <div>
                      <p class="font-label-lg text-label-lg text-on-surface">Bills & Reminders</p>
                      <p class="text-[10px] text-on-surface-variant uppercase font-bold">Check Subscriptions page</p>
                    </div>
                  </div>
                  <a href="/subsc/subscriptionpage" class="text-primary">
                    <span class="material-symbols-outlined text-sm">chevron_right</span>
                  </a>
                </div>
              </div>
            </div>
          </div>

          <%-- Financial Goals (col-span 12) - links to goals page --%>
          <div class="lg:col-span-12">
            <div class="bg-white p-6 rounded-xl border border-outline-variant shadow-sm">
              <div class="flex justify-between items-center mb-6">
                <h2 class="font-headline-sm text-headline-sm text-on-surface">Financial Goals</h2>
                <a href="/goals/goalspage" class="text-primary font-label-md text-label-md hover:underline">Manage Goals</a>
              </div>
              <%-- Placeholder — replace with dynamic goal list once GoalService is wired --%>
              <div class="flex flex-col items-center justify-center py-8 text-on-surface-variant">
                <span class="material-symbols-outlined text-4xl mb-3 text-outline">stars</span>
                <p class="font-body-sm text-body-sm mb-3">Track your savings goals here.</p>
                <a href="/goals/add_goal"
                  class="px-4 py-2 bg-primary text-white rounded-lg font-label-lg text-label-lg hover:opacity-90 transition-all">
                  + Set a Goal
                </a>
              </div>
            </div>
          </div>

        </div>
      </div>
    </main>

    <%-- Mobile FAB --%>
    <a href="/transactions/add"
      class="md:hidden fixed bottom-20 right-6 w-14 h-14 bg-primary text-white rounded-full shadow-lg flex items-center justify-center active:scale-90 transition-transform z-50">
      <span class="material-symbols-outlined text-2xl" style="font-variation-settings:'FILL' 1">add</span>
    </a>

    <%-- Mobile Bottom Nav --%>
    <nav class="md:hidden fixed bottom-0 left-0 w-full h-16 bg-white border-t border-outline-variant flex justify-around items-center px-4 z-40">
      <a class="flex flex-col items-center gap-1 text-primary" href="/home">
        <span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">home</span>
        <span class="text-[10px] font-bold">Home</span>
      </a>
      <a class="flex flex-col items-center gap-1 text-on-surface-variant" href="/trans/transpage">
        <span class="material-symbols-outlined">list_alt</span>
        <span class="text-[10px] font-bold">Trans.</span>
      </a>
      <a class="flex flex-col items-center gap-1 text-on-surface-variant" href="/budget">
        <span class="material-symbols-outlined">account_balance_wallet</span>
        <span class="text-[10px] font-bold">Budget</span>
      </a>
      <a class="flex flex-col items-center gap-1 text-on-surface-variant" href="/logout">
        <span class="material-symbols-outlined">logout</span>
        <span class="text-[10px] font-bold">Logout</span>
      </a>
    </nav>

    <script>
      // Subtle lift on card hover
      document.querySelectorAll(".bg-white.rounded-xl").forEach(card => {
        card.addEventListener("mouseenter", () => card.style.transform = "translateY(-2px)");
        card.addEventListener("mouseleave", () => card.style.transform = "translateY(0)");
      });
    </script>
  </body>
</html>