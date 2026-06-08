<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <title>Goals | WealthWise</title>
  <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
  <style>
    .material-symbols-outlined { font-variation-settings:'FILL' 0,'wght' 400,'GRAD' 0,'opsz' 24; }
    body { font-family:'Inter',sans-serif; background-color:#f9f9ff; }
    ::-webkit-scrollbar { width:6px; }
    ::-webkit-scrollbar-thumb { background:#bec9c2; border-radius:10px; }
  </style>
  <script id="tailwind-config">
    tailwind.config={darkMode:"class",theme:{extend:{colors:{
      "surface-container-low":"#f0f3ff","surface-container-high":"#e2e8f8",
      "surface-container-lowest":"#ffffff","surface-container":"#e7eefe",
      "surface-container-highest":"#dce2f3","surface-dim":"#d3daea",
      primary:"#004532","primary-fixed":"#a6f2d1","primary-fixed-dim":"#8bd6b6",
      "primary-container":"#065f46","on-primary":"#ffffff",
      "on-primary-fixed":"#002116","on-primary-fixed-variant":"#00513b","on-primary-container":"#8bd6b7",
      secondary:"#a83639","secondary-fixed":"#ffdad8",
      "secondary-container":"#fe7676","on-secondary":"#ffffff","on-secondary-container":"#720b17",
      tertiary:"#003980","tertiary-container":"#004fac","on-tertiary":"#ffffff",
      error:"#ba1a1a","error-container":"#ffdad6","on-error":"#ffffff","on-error-container":"#93000a",
      background:"#f9f9ff",surface:"#f9f9ff","on-background":"#151c27","on-surface":"#151c27",
      "on-surface-variant":"#3f4944","surface-variant":"#dce2f3",
      outline:"#6f7973","outline-variant":"#bec9c2","surface-tint":"#1b6b51",
    },spacing:{xl:"64px",xs:"4px",base:"8px",sm:"12px","margin-mobile":"16px",lg:"40px",gutter:"24px",md:"24px","margin-desktop":"48px"},
    fontSize:{
      "label-sm":["10px",{lineHeight:"12px",fontWeight:"700"}],
      "label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],
      "label-lg":["14px",{lineHeight:"20px",letterSpacing:"0.01em",fontWeight:"600"}],
      "body-sm":["14px",{lineHeight:"20px",fontWeight:"400"}],
      "body-md":["16px",{lineHeight:"24px",fontWeight:"400"}],
      "headline-sm":["20px",{lineHeight:"28px",fontWeight:"600"}],
      "headline-md":["24px",{lineHeight:"32px",fontWeight:"600"}],
      "headline-lg":["32px",{lineHeight:"40px",letterSpacing:"-0.02em",fontWeight:"700"}],
    }}}};
  </script>
</head>
<body class="bg-background text-on-surface min-h-screen">
<div class="flex min-h-screen">

  <%-- ── Sidebar ── --%>
  <%
    String uri = request.getRequestURI();
    String active   = "flex items-center gap-sm bg-primary-container text-on-primary-container rounded-lg px-4 py-3 mx-2 cursor-pointer transition-all";
    String inactive = "flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 mx-2 cursor-pointer transition-all";
  %>
  <aside class="fixed left-0 top-0 h-screen w-64 bg-white border-r border-outline-variant flex flex-col py-md gap-xs z-40 hidden md:flex">
    <div class="px-6 mb-8">
      <h1 class="font-headline-sm text-headline-sm font-bold text-primary">WealthWise</h1>
      <p class="font-body-sm text-body-sm text-on-surface-variant">Financial Clarity</p>
    </div>
    <nav class="flex-1 space-y-1">
      <a class="<%= inactive %>" href="/home"><span class="material-symbols-outlined">home</span><span class="font-label-lg text-label-lg">Home</span></a>
      <a class="<%= inactive %>" href="/transactions"><span class="material-symbols-outlined">list_alt</span><span class="font-label-lg text-label-lg">Transactions</span></a>
      <a class="<%= inactive %>" href="/budget"><span class="material-symbols-outlined">account_balance_wallet</span><span class="font-label-lg text-label-lg">Budget</span></a>
      <a class="<%= active %>" href="/goals"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">stars</span><span class="font-label-lg text-label-lg">Goals</span></a>
      <a class="<%= inactive %>" href="/subscriptions"><span class="material-symbols-outlined">subscriptions</span><span class="font-label-lg text-label-lg">Subscriptions</span></a>
      <a class="<%= inactive %>" href="/reports"><span class="material-symbols-outlined">assessment</span><span class="font-label-lg text-label-lg">Reports</span></a>
    </nav>
    <div class="mt-auto px-2">
      <a class="flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 cursor-pointer transition-all" href="/logout">
        <span class="material-symbols-outlined">logout</span><span class="font-label-lg text-label-lg">Logout</span>
      </a>
    </div>
  </aside>

  <%-- ── Main Canvas ── --%>
  <main class="flex-1 md:ml-64 min-h-screen flex flex-col">
    <header class="flex justify-between items-center w-full h-16 px-gutter sticky top-0 z-30 bg-surface shadow-sm">
      <div></div>
      <div class="flex items-center gap-md">
        <a href="/subscriptions" class="p-2 hover:bg-surface-container-low rounded-full relative">
          <span class="material-symbols-outlined">notifications</span>
        </a>
        <div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center text-white font-bold text-xs">
          ${userName != null ? userName.substring(0,1).toUpperCase() : "U"}
        </div>
      </div>
    </header>

    <div class="flex-1 p-gutter md:p-margin-desktop overflow-y-auto">

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
          <h2 class="font-headline-lg text-headline-lg text-on-surface">Financial Goals</h2>
          <p class="font-body-md text-body-md text-on-surface-variant mt-1">Track your savings milestones.</p>
        </div>
        <a href="/goals/add"
          class="px-6 py-2.5 bg-primary text-white font-label-lg rounded-lg hover:opacity-90 active:scale-95 transition-all flex items-center gap-2 shadow-lg shadow-primary/20">
          <span class="material-symbols-outlined text-sm">add</span> New Goal
        </a>
      </div>

      <%-- Goals Grid --%>
      <c:choose>
        <c:when test="${not empty goalRows}">
          <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-gutter">
            <c:forEach var="row" items="${goalRows}">
              <div class="bg-white rounded-xl border border-outline-variant shadow-sm p-6 flex flex-col gap-4 hover:shadow-md transition-shadow group">

                <%-- Progress ring + info --%>
                <div class="flex items-center gap-gutter">
                  <%-- SVG ring --%>
                  <div class="relative w-24 h-24 flex-shrink-0">
                    <svg class="w-full h-full transform -rotate-90">
                      <circle class="text-surface-container-highest" cx="48" cy="48" fill="transparent" r="40"
                        stroke="currentColor" stroke-width="8"/>
                      <circle cx="48" cy="48" fill="transparent" r="40"
                        stroke="${row.goal.status == 'COMPLETED' ? '#065f46' : '#004532'}"
                        stroke-width="8"
                        stroke-dasharray="251.2"
                        stroke-dashoffset="${row.dashOffset}"
                        style="transition:stroke-dashoffset 1s ease-out"/>
                    </svg>
                    <div class="absolute inset-0 flex items-center justify-center">
                      <span class="font-bold text-primary text-sm">${row.percent}%</span>
                    </div>
                  </div>

                  <div class="flex-1 min-w-0">
                    <div class="flex justify-between items-start">
                      <h3 class="font-headline-sm text-headline-sm text-on-surface truncate">
                        <c:out value="${row.goal.goalName}"/>
                      </h3>
                      <%-- Status badge --%>
                      <c:choose>
                        <c:when test="${row.goal.status == 'COMPLETED'}">
                          <span class="px-2 py-0.5 bg-primary-fixed text-on-primary-fixed-variant text-label-sm rounded-full flex-shrink-0 ml-2">DONE</span>
                        </c:when>
                        <c:when test="${row.percent >= 80}">
                          <span class="px-2 py-0.5 bg-yellow-100 text-yellow-800 text-label-sm rounded-full flex-shrink-0 ml-2">NEAR</span>
                        </c:when>
                      </c:choose>
                    </div>
                    <p class="font-body-sm text-body-sm text-on-surface-variant mt-1">
                      Saved ₹<fmt:formatNumber value="${row.goal.currentAmount}" pattern="#,##0.00"/>
                      of ₹<fmt:formatNumber value="${row.goal.targetAmount}" pattern="#,##0.00"/>
                    </p>
                    <p class="font-label-sm text-on-surface-variant mt-1">
                      Target: <fmt:formatDate value="${java.sql.Date.valueOf(goal.yourLocalDateField)}" pattern="yyyy-MM-dd"/>
                    </p>
                    <p class="font-label-sm text-on-surface-variant">
                      Remaining: ₹<fmt:formatNumber value="${row.remaining}" pattern="#,##0.00"/>
                    </p>
                  </div>
                </div>

                <%-- Add Funds button → opens inline mini-form --%>
                <c:if test="${row.goal.status != 'COMPLETED'}">
                  <div class="border-t border-outline-variant pt-3">
                    <button type="button"
                      class="w-full py-2 bg-surface-container-high rounded-lg font-label-md text-label-md hover:bg-primary hover:text-white transition-all"
                      onclick="toggleFundForm('fund-form-${row.goal.goalId}')">
                      Add Funds
                    </button>
                    <%-- Inline fund form --%>
                    <div id="fund-form-${row.goal.goalId}" class="hidden mt-3">
                      <form action="/goals/${row.goal.goalId}/fund" method="post" class="flex gap-sm">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div class="relative flex-1">
                          <span class="absolute left-3 top-1/2 -translate-y-1/2 text-outline font-body-sm">₹</span>
                          <input class="w-full pl-7 pr-3 py-2 rounded-lg border border-outline-variant focus:border-primary focus:ring-1 focus:ring-primary outline-none font-body-sm text-body-sm"
                            name="amount" type="number" step="0.01" min="1" placeholder="Amount" required/>
                        </div>
                        <button type="submit"
                          class="px-4 py-2 bg-primary text-white rounded-lg font-label-md hover:opacity-90 active:scale-95 transition-all">
                          Add
                        </button>
                      </form>
                    </div>
                  </div>
                </c:if>
                <c:if test="${row.goal.status == 'COMPLETED'}">
                  <div class="border-t border-outline-variant pt-3 flex items-center gap-2 text-primary">
                    <span class="material-symbols-outlined text-[18px]" style="font-variation-settings:'FILL' 1">check_circle</span>
                    <span class="font-label-lg text-label-lg">Goal Achieved!</span>
                  </div>
                </c:if>

                <%-- Delete (hover reveal) --%>
                <form action="/goals/${row.goal.goalId}/delete" method="post"
                  onsubmit="return confirm('Delete this goal?');"
                  class="opacity-0 group-hover:opacity-100 transition-opacity flex justify-end -mt-2">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                  <button type="submit" class="p-1.5 hover:bg-error-container/20 rounded-full text-error transition-colors">
                    <span class="material-symbols-outlined text-[18px]">delete</span>
                  </button>
                </form>
              </div>
            </c:forEach>
          </div>
        </c:when>
        <c:otherwise>
          <div class="flex flex-col items-center justify-center py-24 text-on-surface-variant">
            <span class="material-symbols-outlined text-5xl mb-4 text-outline">stars</span>
            <p class="font-body-md text-body-md mb-4">No goals yet. Start planning your financial future.</p>
            <a href="/goals/add"
              class="px-6 py-3 bg-primary text-white rounded-lg font-label-lg hover:opacity-90 transition-all">
              + Set Your First Goal
            </a>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </main>
</div>

<%-- Mobile Bottom Nav --%>
<nav class="md:hidden fixed bottom-0 left-0 w-full bg-white border-t border-outline-variant px-6 py-2 flex justify-between items-center z-50">
  <a class="flex flex-col items-center gap-1 text-on-surface-variant" href="/home">
    <span class="material-symbols-outlined">home</span><span class="font-label-sm text-label-sm">Home</span>
  </a>
  <a class="flex flex-col items-center gap-1 text-on-surface-variant" href="/transactions">
    <span class="material-symbols-outlined">list_alt</span><span class="font-label-sm text-label-sm">History</span>
  </a>
  <a class="flex flex-col items-center gap-1 text-primary" href="/goals">
    <span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">stars</span>
    <span class="font-label-sm text-label-sm">Goals</span>
  </a>
  <a class="flex flex-col items-center gap-1 text-on-surface-variant" href="/logout">
    <span class="material-symbols-outlined">logout</span><span class="font-label-sm text-label-sm">Logout</span>
  </a>
</nav>

<script>
  function toggleFundForm(id) {
    const el = document.getElementById(id);
    if (el) el.classList.toggle("hidden");
  }
</script>
</body>
</html>
