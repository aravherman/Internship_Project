<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Budget Planning | WealthWise</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <style>
      .material-symbols-outlined { font-variation-settings:"FILL" 0,"wght" 400,"GRAD" 0,"opsz" 24; }
      body { font-family:"Inter",sans-serif; }
      .custom-scrollbar::-webkit-scrollbar { width:4px; }
      .custom-scrollbar::-webkit-scrollbar-thumb { background:#bec9c2; border-radius:10px; }
    </style>
    <script id="tailwind-config">
      tailwind.config = {
        darkMode:"class",
        theme:{extend:{colors:{
          "surface-container-low":"#f0f3ff","surface-container-high":"#e2e8f8",
          "surface-container-lowest":"#ffffff","surface-container-highest":"#dce2f3",
          "surface-container":"#e7eefe","surface-dim":"#d3daea","surface-bright":"#f9f9ff",
          primary:"#004532","primary-fixed":"#a6f2d1","primary-fixed-dim":"#8bd6b6",
          "primary-container":"#065f46","on-primary":"#ffffff",
          "on-primary-fixed":"#002116","on-primary-fixed-variant":"#00513b","on-primary-container":"#8bd6b7",
          secondary:"#a83639","secondary-fixed":"#ffdad8","secondary-fixed-dim":"#ffb3b0",
          "secondary-container":"#fe7676","on-secondary":"#ffffff",
          "on-secondary-fixed":"#410006","on-secondary-fixed-variant":"#881d24","on-secondary-container":"#720b17",
          tertiary:"#003980","tertiary-container":"#004fac","on-tertiary":"#ffffff",
          error:"#ba1a1a","error-container":"#ffdad6","on-error":"#ffffff","on-error-container":"#93000a",
          background:"#f9f9ff",surface:"#f9f9ff","on-background":"#151c27","on-surface":"#151c27",
          "on-surface-variant":"#3f4944","surface-variant":"#dce2f3",
          outline:"#6f7973","outline-variant":"#bec9c2",
          "inverse-primary":"#8bd6b6","inverse-surface":"#2a313d","surface-tint":"#1b6b51",
        },spacing:{sm:"12px",gutter:"24px",xl:"64px",base:"8px","margin-mobile":"16px",md:"24px","margin-desktop":"48px",lg:"40px",xs:"4px"},
        fontSize:{
          "body-sm":["14px",{lineHeight:"20px",fontWeight:"400"}],
          "headline-lg":["32px",{lineHeight:"40px",letterSpacing:"-0.02em",fontWeight:"700"}],
          "label-sm":["10px",{lineHeight:"12px",fontWeight:"700"}],
          "label-lg":["14px",{lineHeight:"20px",letterSpacing:"0.01em",fontWeight:"600"}],
          "label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],
          "headline-md":["24px",{lineHeight:"32px",fontWeight:"600"}],
          "body-md":["16px",{lineHeight:"24px",fontWeight:"400"}],
          "headline-sm":["20px",{lineHeight:"28px",fontWeight:"600"}],
        }}}};
    </script>
  </head>
  <body class="bg-background text-on-surface font-body-md overflow-hidden">

    <%-- ── Sidebar ── --%>
    <%
      String uri = request.getRequestURI();
      String active   = "flex items-center gap-sm bg-primary-container text-on-primary-container rounded-lg px-4 py-3 mx-2 transition-all";
      String inactive = "flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 mx-2 transition-all";
    %>
    <aside class="fixed left-0 top-0 h-screen w-64 bg-white border-r border-outline-variant flex flex-col py-md gap-xs z-50">
      <div class="px-6 mb-8">
        <h1 class="font-headline-sm text-headline-sm font-bold text-primary">WealthWise</h1>
        <p class="font-body-sm text-body-sm text-outline">Financial Clarity</p>
      </div>
      <nav class="flex-1 space-y-1">
        <a class="<%= uri.equals("/home") ? active : inactive %>" href="/home"><span class="material-symbols-outlined">home</span><span class="font-label-lg text-label-lg">Home</span></a>
        <a class="<%= uri.startsWith("/transactions") ? active : inactive %>" href="/transactions"><span class="material-symbols-outlined">list_alt</span><span class="font-label-lg text-label-lg">Transactions</span></a>
        <a class="<%= uri.startsWith("/budget") ? active : inactive %>" href="/budget"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">account_balance_wallet</span><span class="font-label-lg text-label-lg">Budget</span></a>
        <a class="<%= uri.startsWith("/goals") ? active : inactive %>" href="/goals"><span class="material-symbols-outlined">stars</span><span class="font-label-lg text-label-lg">Goals</span></a>
        <a class="<%= uri.startsWith("/subscriptions") ? active : inactive %>" href="/subscriptions"><span class="material-symbols-outlined">subscriptions</span><span class="font-label-lg text-label-lg">Subscriptions</span></a>
        <a class="<%= uri.startsWith("/reports") ? active : inactive %>" href="/reports"><span class="material-symbols-outlined">assessment</span><span class="font-label-lg text-label-lg">Reports</span></a>
      </nav>
      <div class="mt-auto px-2 pb-md">
        <a class="flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 transition-all" href="/logout">
          <span class="material-symbols-outlined">logout</span><span class="font-label-lg text-label-lg">Logout</span>
        </a>
      </div>
    </aside>

    <main class="ml-64 min-h-screen flex flex-col">
      <%-- Top Bar --%>
      <header class="flex justify-between items-center w-full h-16 px-gutter sticky top-0 z-40 bg-surface shadow-sm">
        <div></div>
        <div class="flex items-center gap-md">
          <a href="/subscriptions" class="relative p-2 rounded-full hover:bg-surface-container-low transition-colors">
            <span class="material-symbols-outlined text-on-surface-variant">notifications</span>
          </a>
          <div class="h-10 w-10 rounded-full bg-primary flex items-center justify-center text-white font-bold text-sm">
            ${userName != null ? userName.substring(0,1).toUpperCase() : "U"}
          </div>
        </div>
      </header>

      <div class="flex-1 p-margin-desktop overflow-y-auto custom-scrollbar">

        <%-- Flash messages --%>
        <c:if test="${not empty error}">
          <div class="mb-md flex items-center gap-sm rounded-lg border border-error-container bg-error-container px-md py-3 text-on-error-container">
            <span class="material-symbols-outlined text-[20px]">error</span>
            <p class="font-body-sm"><c:out value="${error}"/></p>
          </div>
        </c:if>
        <c:if test="${not empty success}">
          <div class="mb-md flex items-center gap-sm rounded-lg border border-green-200 bg-green-50 px-md py-3 text-green-800">
            <span class="material-symbols-outlined text-[20px]">check_circle</span>
            <p class="font-body-sm"><c:out value="${success}"/></p>
          </div>
        </c:if>

        <%-- Page Header --%>
        <div class="flex justify-between items-end mb-lg">
          <div>
            <h2 class="font-headline-lg text-headline-lg text-on-surface">Budget Planning</h2>
            <p class="font-body-md text-body-md text-on-surface-variant mt-1">Monitor your monthly spending limits.</p>
          </div>
          <div class="flex gap-sm">
            <a href="/budget/category/add"
              class="px-6 py-2.5 bg-white border border-outline-variant text-primary font-label-lg rounded-lg hover:bg-surface-container-low transition-all flex items-center gap-2">
              <span class="material-symbols-outlined text-sm">add</span> New Category
            </a>
            <a href="/budget/set"
              class="px-6 py-2.5 bg-primary text-white font-label-lg rounded-lg hover:opacity-90 active:scale-95 transition-all flex items-center gap-2">
              <span class="material-symbols-outlined text-sm">account_balance_wallet</span> Set Budget
            </a>
          </div>
        </div>

        <div class="grid grid-cols-12 gap-gutter">

          <%-- ── Budget Health Gauge ── --%>
          <div class="col-span-12 lg:col-span-4 bg-white rounded-xl border border-outline-variant shadow-sm p-md flex flex-col items-center justify-center relative overflow-hidden">
            <div class="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-primary via-primary-container to-secondary"></div>
            <p class="font-label-md text-label-md text-outline uppercase tracking-wider mb-6">Total Budget Health</p>
            <div class="relative w-48 h-48">
              <svg class="w-full h-full transform -rotate-90">
                <circle class="text-surface-container-highest" cx="96" cy="96" fill="transparent" r="80"
                  stroke="currentColor" stroke-width="12"/>
                <%-- dashOffset is pre-calculated server-side --%>
                <circle class="text-primary" cx="96" cy="96" fill="transparent" r="80"
                  stroke="currentColor" stroke-width="12"
                  stroke-dasharray="502.6"
                  stroke-dashoffset="502.6"
                  id="gauge-circle"
                  style="transition:stroke-dashoffset 1s"/>
              </svg>
              <div class="absolute inset-0 flex flex-col items-center justify-center">
                <span class="font-headline-lg text-headline-lg text-primary">${remainingPercent}%</span>
                <span class="font-label-sm text-label-sm text-outline">Remaining</span>
              </div>
            </div>
            <div class="mt-8 grid grid-cols-2 gap-md w-full">
              <div class="text-center">
                <p class="font-label-sm text-label-sm text-outline">Spent</p>
                <p class="font-headline-sm text-headline-sm text-on-surface">
                  ₹<fmt:formatNumber value="${totalSpent}" pattern="#,##0.00"/>
                </p>
              </div>
              <div class="text-center border-l border-outline-variant">
                <p class="font-label-sm text-label-sm text-outline">Monthly Limit</p>
                <p class="font-headline-sm text-headline-sm text-on-surface">
                  ₹<fmt:formatNumber value="${totalLimit}" pattern="#,##0.00"/>
                </p>
              </div>
            </div>
          </div>

          <%-- ── Tips / quick stats ── --%>
          <div class="col-span-12 lg:col-span-8 bg-white rounded-xl border border-outline-variant shadow-sm p-md flex flex-col justify-between">
            <h3 class="font-headline-sm text-headline-sm mb-md">Budget Summary</h3>
            <c:choose>
              <c:when test="${not empty budgetRows}">
                <div class="grid grid-cols-2 gap-gutter flex-1">
                  <c:forEach var="row" items="${budgetRows}" end="3">
                    <div class="p-md bg-surface-container-low rounded-xl">
                      <p class="font-label-lg text-label-lg text-on-surface mb-1">
                        <c:out value="${row.budget.category.categoryName}"/>
                      </p>
                      <div class="w-full h-2 bg-outline-variant/30 rounded-full overflow-hidden mb-1">
                        <div class="h-full rounded-full ${row.percent >= 100 ? 'bg-secondary' : 'bg-primary'}"
                          :style="width:${row.percent > 100 ? 100 : row.percent}%"></div>
                      </div>
                      <p class="font-label-sm text-label-sm ${row.percent >= 100 ? 'text-secondary' : 'text-outline'}">
                        ${row.percent}% used
                      </p>
                    </div>
                  </c:forEach>
                </div>
              </c:when>
              <c:otherwise>
                <div class="flex flex-col items-center justify-center flex-1 py-8 text-on-surface-variant">
                  <span class="material-symbols-outlined text-4xl mb-3 text-outline">account_balance_wallet</span>
                  <p class="font-body-sm mb-3">No budgets set yet.</p>
                  <a href="/budget/set" class="px-4 py-2 bg-primary text-white rounded-lg font-label-lg hover:opacity-90 transition-all">
                    + Set Your First Budget
                  </a>
                </div>
              </c:otherwise>
            </c:choose>
          </div>

          <%-- ── Category Breakdown Table ── --%>
          <div class="col-span-12 bg-white rounded-xl border border-outline-variant shadow-sm overflow-hidden">
            <div class="px-md py-4 border-b border-outline-variant bg-surface-bright flex justify-between items-center">
              <h3 class="font-headline-sm text-headline-sm">Category Breakdown</h3>
              <a href="/budget/set" class="text-primary font-label-md hover:underline flex items-center gap-xs">
                <span class="material-symbols-outlined text-[18px]">add</span> Add Budget
              </a>
            </div>
            <c:choose>
              <c:when test="${not empty budgetRows}">
                <div class="overflow-x-auto">
                  <table class="w-full text-left border-collapse">
                    <thead>
                      <tr class="bg-surface-container-lowest">
                        <th class="px-md py-4 font-label-sm text-label-sm uppercase text-outline">Category</th>
                        <th class="px-md py-4 font-label-sm text-label-sm uppercase text-outline">Budgeted</th>
                        <th class="px-md py-4 font-label-sm text-label-sm uppercase text-outline">Actual Spent</th>
                        <th class="px-md py-4 font-label-sm text-label-sm uppercase text-outline w-1/3">Progress</th>
                        <th class="px-md py-4 font-label-sm text-label-sm uppercase text-outline">Status</th>
                        <th class="px-md py-4 font-label-sm text-label-sm uppercase text-outline">Actions</th>
                      </tr>
                    </thead>
                    <tbody class="divide-y divide-outline-variant">
                      <c:forEach var="row" items="${budgetRows}">
                        <tr class="hover:bg-surface-container-lowest transition-colors">
                          <td class="px-md py-5">
                            <div class="flex items-center gap-sm">
                              <div class="w-10 h-10 rounded-lg bg-surface-container-low flex items-center justify-center">
                                <span class="material-symbols-outlined text-primary">category</span>
                              </div>
                              <div>
                                <p class="font-label-lg text-label-lg"><c:out value="${row.budget.category.categoryName}"/></p>
                                <p class="font-body-sm text-body-sm text-outline"><c:out value="${row.budget.period}"/></p>
                              </div>
                            </div>
                          </td>
                          <td class="px-md py-5 font-body-md font-semibold">
                            ₹<fmt:formatNumber value="${row.budget.budgetAmount}" pattern="#,##0.00"/>
                          </td>
                          <td class="px-md py-5 font-body-md ${row.percent >= 100 ? 'text-secondary font-bold' : ''}">
                            ₹<fmt:formatNumber value="${row.spent}" pattern="#,##0.00"/>
                          </td>
                          <td class="px-md py-5">
                            <div class="w-full h-2 ${row.percent >= 100 ? 'bg-secondary/10' : 'bg-primary/10'} rounded-full overflow-hidden">
                              <div class="h-full ${row.percent >= 100 ? 'bg-secondary' : 'bg-primary'} rounded-full"
                                :style="width:${row.percent > 100 ? 100 : row.percent}%"></div>
                            </div>
                            <p class="font-label-sm text-label-sm ${row.percent >= 100 ? 'text-secondary' : 'text-outline'} mt-1">
                              ${row.percent}% of budget
                            </p>
                          </td>
                          <td class="px-md py-5">
                            <c:choose>
                              <c:when test="${row.status == 'OVER BUDGET'}">
                                <span class="px-3 py-1 bg-secondary-container text-on-secondary-container text-label-sm font-bold rounded-full">OVER BUDGET</span>
                              </c:when>
                              <c:when test="${row.status == 'WARNING'}">
                                <span class="px-3 py-1 bg-yellow-100 text-yellow-800 text-label-sm font-bold rounded-full">WARNING</span>
                              </c:when>
                              <c:otherwise>
                                <span class="px-3 py-1 bg-primary-fixed text-on-primary-fixed-variant text-label-sm font-bold rounded-full">HEALTHY</span>
                              </c:otherwise>
                            </c:choose>
                          </td>
                          <td class="px-md py-5">
                            <form action="/budget/delete/${row.budget.budgetId}" method="post"
                              onsubmit="return confirm('Remove this budget?');" style="display:inline;">
                              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                              <button type="submit" class="p-2 hover:bg-error-container/20 rounded-full text-error transition-colors">
                                <span class="material-symbols-outlined text-[20px]">delete</span>
                              </button>
                            </form>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </c:when>
              <c:otherwise>
                <div class="px-md py-16 text-center text-on-surface-variant font-body-sm">
                  No budgets set yet.
                  <a href="/budget/set" class="text-primary font-semibold hover:underline ml-1">Set one now →</a>
                </div>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </div>
    </main>

    <script>
      // Animate gauge on load using server-rendered dashOffset
      window.addEventListener("DOMContentLoaded", () => {
        const circle = document.getElementById("gauge-circle");
        if (circle) {
          const target = parseFloat('<c:out value="${dashOffset}" />') || 0;
          setTimeout(() => { circle.style.strokeDashoffset = target; }, 100);
        }
      });
    </script>
  </body>
</html>
