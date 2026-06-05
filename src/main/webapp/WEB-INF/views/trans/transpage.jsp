<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Transactions | WealthWise</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <style>
      .material-symbols-outlined { font-variation-settings:"FILL" 0,"wght" 400,"GRAD" 0,"opsz" 24; vertical-align:middle; }
      body { background-color:#f9f9ff; color:#151c27; font-family:"Inter",sans-serif; }
      .custom-scrollbar::-webkit-scrollbar { width:6px; }
      .custom-scrollbar::-webkit-scrollbar-thumb { background:#bec9c2; border-radius:10px; }
    </style>
    <script id="tailwind-config">
      tailwind.config = {
        darkMode:"class",
        theme:{extend:{colors:{
          "surface-container-low":"#f0f3ff","surface-container-high":"#e2e8f8",
          "surface-container-lowest":"#ffffff","surface-container-highest":"#dce2f3",
          "surface-container":"#e7eefe","surface-dim":"#d3daea",
          primary:"#004532","primary-fixed":"#a6f2d1","primary-fixed-dim":"#8bd6b6",
          "primary-container":"#065f46","on-primary":"#ffffff",
          "on-primary-fixed":"#002116","on-primary-fixed-variant":"#00513b",
          "on-primary-container":"#8bd6b7",
          secondary:"#a83639","secondary-fixed":"#ffdad8","secondary-fixed-dim":"#ffb3b0",
          "secondary-container":"#fe7676","on-secondary":"#ffffff",
          "on-secondary-fixed":"#410006","on-secondary-fixed-variant":"#881d24",
          "on-secondary-container":"#720b17",
          tertiary:"#003980","tertiary-fixed":"#d8e2ff","tertiary-fixed-dim":"#adc6ff",
          "tertiary-container":"#004fac","on-tertiary":"#ffffff",
          "on-tertiary-fixed":"#001a42","on-tertiary-fixed-variant":"#004395",
          "on-tertiary-container":"#aec7ff",
          error:"#ba1a1a","error-container":"#ffdad6",
          "on-error":"#ffffff","on-error-container":"#93000a",
          background:"#f9f9ff",surface:"#f9f9ff",
          "on-background":"#151c27","on-surface":"#151c27",
          "on-surface-variant":"#3f4944","surface-variant":"#dce2f3",
          outline:"#6f7973","outline-variant":"#bec9c2",
          "inverse-primary":"#8bd6b6","inverse-surface":"#2a313d",
          "inverse-on-surface":"#ebf1ff","surface-tint":"#1b6b51",
          "surface-bright":"#f9f9ff",
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
  <body class="font-body-md text-body-md">
    <div class="flex h-screen overflow-hidden">

      <%-- ── Sidebar ── --%>
      <%
        String uri = request.getRequestURI();
        String active   = "flex items-center gap-sm bg-primary-container text-on-primary-container rounded-lg px-4 py-3 mx-2 cursor-pointer active:scale-[0.98] transition-all";
        String inactive = "flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 mx-2 cursor-pointer active:scale-[0.98] transition-all";
      %>
      <aside class="hidden md:flex flex-col py-md gap-xs bg-white border-r border-outline-variant fixed left-0 top-0 h-screen w-64 z-40">
        <div class="px-6 mb-8">
          <h1 class="font-headline-sm text-headline-sm font-bold text-primary">WealthWise</h1>
          <p class="font-label-md text-label-md text-on-surface-variant opacity-70">Financial Clarity</p>
        </div>
        <nav class="flex-1 space-y-1">
          <a class="<%= uri.equals("/home") ? active : inactive %>" href="/home">
            <span class="material-symbols-outlined">home</span><span class="font-label-lg text-label-lg">Home</span>
          </a>
          <a class="<%= uri.startsWith("/transactions") ? active : inactive %>" href="/transactions">
            <span class="material-symbols-outlined">list_alt</span><span class="font-label-lg text-label-lg">Transactions</span>
          </a>
          <a class="<%= uri.startsWith("/budget") ? active : inactive %>" href="/budget">
            <span class="material-symbols-outlined">account_balance_wallet</span><span class="font-label-lg text-label-lg">Budget</span>
          </a>
          <a class="<%= uri.startsWith("/goals") ? active : inactive %>" href="/goals">
            <span class="material-symbols-outlined">stars</span><span class="font-label-lg text-label-lg">Goals</span>
          </a>
          <a class="<%= uri.startsWith("/subscriptions") ? active : inactive %>" href="/subscriptions">
            <span class="material-symbols-outlined">subscriptions</span><span class="font-label-lg text-label-lg">Subscriptions</span>
          </a>
          <a class="<%= uri.startsWith("/reports") ? active : inactive %>" href="/reports">
            <span class="material-symbols-outlined">assessment</span><span class="font-label-lg text-label-lg">Reports</span>
          </a>
        </nav>
        <div class="mt-auto border-t border-outline-variant pt-4">
          <a class="flex items-center gap-sm text-secondary hover:bg-error-container/20 rounded-lg px-4 py-3 mx-2 cursor-pointer transition-all" href="/logout">
            <span class="material-symbols-outlined">logout</span><span class="font-label-lg text-label-lg">Logout</span>
          </a>
        </div>
      </aside>

      <%-- ── Main Canvas ── --%>
      <main class="flex-1 flex flex-col md:ml-64 bg-background min-h-screen">

        <%-- Top Bar --%>
        <header class="flex justify-between items-center w-full h-16 px-gutter sticky top-0 z-50 bg-surface shadow-sm">
          <div class="flex items-center gap-md flex-1">
            <%-- Search — wires to ?description= filter (future enhancement) --%>
            <div class="relative w-full max-w-md hidden md:block">
              <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline">search</span>
              <input class="w-full bg-surface-container-low border-none rounded-full py-2 pl-10 pr-4 font-body-sm text-body-sm focus:ring-2 focus:ring-primary outline-none"
                placeholder="Search transactions..." type="text" disabled title="Search coming soon"/>
            </div>
          </div>
          <div class="flex items-center gap-sm">
            <a href="/subscriptions" class="p-2 rounded-full hover:bg-surface-container-low transition-colors relative">
              <span class="material-symbols-outlined text-on-surface-variant">notifications</span>
            </a>
            <div class="h-10 w-10 rounded-full bg-primary flex items-center justify-center text-white font-bold text-sm">
              ${userName != null ? userName.substring(0,1).toUpperCase() : "U"}
            </div>
          </div>
        </header>

        <div class="p-gutter overflow-y-auto custom-scrollbar flex-1">

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

          <%-- Page header --%>
          <div class="flex flex-col md:flex-row md:items-center justify-between gap-md mb-lg">
            <div>
              <h2 class="font-headline-lg text-headline-lg text-on-surface">Transactions</h2>
              <p class="text-on-surface-variant font-body-md">View and manage all your financial movements.</p>
            </div>
            <a href="/transactions/add"
              class="bg-primary hover:bg-primary-container text-white px-6 py-3 rounded-lg font-label-lg flex items-center gap-sm transition-all active:scale-95 shadow-lg shadow-primary/20">
              <span class="material-symbols-outlined">add</span>
              Add Transaction
            </a>
          </div>

          <%-- Summary strip --%>
          <div class="grid grid-cols-2 gap-gutter mb-lg">
            <div class="bg-white rounded-xl border border-outline-variant p-md shadow-sm">
              <p class="font-label-md text-label-md text-on-surface-variant mb-1">Total Income</p>
              <p class="font-headline-sm text-headline-sm text-primary font-bold">
                ₹<fmt:formatNumber value="${totalIncome}" pattern="#,##0.00"/>
              </p>
            </div>
            <div class="bg-white rounded-xl border border-outline-variant p-md shadow-sm">
              <p class="font-label-md text-label-md text-on-surface-variant mb-1">Total Expenses</p>
              <p class="font-headline-sm text-headline-sm text-secondary font-bold">
                ₹<fmt:formatNumber value="${totalExpenses}" pattern="#,##0.00"/>
              </p>
            </div>
          </div>

          <%-- Filters --%>
          <div class="bg-white rounded-xl border border-outline-variant p-md flex flex-wrap items-end gap-md shadow-sm mb-lg">

            <%-- Type filter buttons --%>
            <div class="flex flex-col gap-xs">
              <label class="font-label-md text-label-md text-outline">Type</label>
              <div class="flex bg-surface-container-low p-1 rounded-lg">
                <a href="/transactions"
                  class="flex-1 py-1.5 px-4 rounded-md font-label-md transition-all text-center
                    ${"".equals(selectedType) ? "bg-white shadow-sm text-on-surface" : "text-on-surface-variant hover:bg-white/50"}">
                  All
                </a>
                <a href="/transactions?type=INCOME"
                  class="flex-1 py-1.5 px-4 rounded-md font-label-md transition-all text-center
                    ${"INCOME".equals(selectedType) ? "bg-white shadow-sm text-primary" : "text-on-surface-variant hover:bg-white/50"}">
                  Income
                </a>
                <a href="/transactions?type=EXPENSE"
                  class="flex-1 py-1.5 px-4 rounded-md font-label-md transition-all text-center
                    ${"EXPENSE".equals(selectedType) ? "bg-white shadow-sm text-secondary" : "text-on-surface-variant hover:bg-white/50"}">
                  Expense
                </a>
              </div>
            </div>

            <%-- Category filter --%>
            <div class="flex flex-col gap-xs min-w-[180px]">
              <label class="font-label-md text-label-md text-outline">Category</label>
              <select onchange="if(this.value) window.location='/transactions?categoryId='+this.value; else window.location='/transactions';"
                class="w-full bg-surface-container-low border-none rounded-lg py-2 px-4 font-body-sm appearance-none cursor-pointer outline-none">
                <option value="">All Categories</option>
                <c:forEach var="cat" items="${categories}">
                  <option value="${cat.categoryId}" ${cat.categoryId == selectedCatId ? 'selected' : ''}>
                    <c:out value="${cat.categoryName}"/>
                  </option>
                </c:forEach>
              </select>
            </div>
          </div>

          <%-- Data Table --%>
          <div class="bg-white rounded-xl border border-outline-variant shadow-sm overflow-hidden">
            <div class="overflow-x-auto">
              <table class="w-full text-left border-collapse">
                <thead>
                  <tr class="border-b border-outline-variant bg-surface-container-low/30">
                    <th class="px-6 py-4 font-label-sm text-label-sm uppercase text-outline tracking-wider">Date</th>
                    <th class="px-6 py-4 font-label-sm text-label-sm uppercase text-outline tracking-wider">Category</th>
                    <th class="px-6 py-4 font-label-sm text-label-sm uppercase text-outline tracking-wider">Type</th>
                    <th class="px-6 py-4 font-label-sm text-label-sm uppercase text-outline tracking-wider">Description</th>
                    <th class="px-6 py-4 font-label-sm text-label-sm uppercase text-outline tracking-wider text-right">Amount</th>
                    <th class="px-6 py-4 font-label-sm text-label-sm uppercase text-outline tracking-wider text-right">Actions</th>
                  </tr>
                </thead>
                <tbody class="divide-y divide-outline-variant">
                  <c:choose>
                    <c:when test="${not empty transactions}">
                      <c:forEach var="tx" items="${transactions}">
                        <tr class="hover:bg-surface-container-low/50 transition-colors group">
                          <td class="px-6 py-4 font-body-sm text-on-surface">
                            <c:out value="${tx.transactionDate.toString().substring(0, 10)}"/>
                          </td>
                          <td class="px-6 py-4">
                            <div class="flex items-center gap-sm">
                              <div class="w-8 h-8 rounded-full bg-surface-container-low flex items-center justify-center text-primary">
                                <span class="material-symbols-outlined text-[18px]">
                                  <c:choose>
                                    <c:when test="${tx.transactionType == 'INCOME'}">payments</c:when>
                                    <c:otherwise>shopping_bag</c:otherwise>
                                  </c:choose>
                                </span>
                              </div>
                              <span class="font-body-md">
                                <c:out value="${tx.category != null ? tx.category.categoryName : '—'}"/>
                              </span>
                            </div>
                          </td>
                          <td class="px-6 py-4">
                            <c:choose>
                              <c:when test="${tx.transactionType == 'INCOME'}">
                                <span class="px-3 py-1 rounded-full bg-primary-fixed text-on-primary-fixed-variant font-label-md text-[11px] uppercase tracking-wide">Income</span>
                              </c:when>
                              <c:otherwise>
                                <span class="px-3 py-1 rounded-full bg-secondary-fixed text-on-secondary-fixed-variant font-label-md text-[11px] uppercase tracking-wide">Expense</span>
                              </c:otherwise>
                            </c:choose>
                          </td>
                          <td class="px-6 py-4 font-body-md text-on-surface">
                            <c:out value="${tx.description}"/>
                          </td>
                          <td class="px-6 py-4 font-headline-sm text-right ${tx.transactionType == 'INCOME' ? 'text-primary' : 'text-secondary'}">
                            <c:choose>
                              <c:when test="${tx.transactionType == 'INCOME'}">+</c:when>
                              <c:otherwise>-</c:otherwise>
                            </c:choose>
                            ₹<fmt:formatNumber value="${tx.amount}" pattern="#,##0.00"/>
                          </td>
                          <td class="px-6 py-4 text-right">
                            <div class="flex items-center justify-end gap-xs opacity-0 group-hover:opacity-100 transition-opacity">
                              <%-- Edit --%>
                              <a href="/transactions/edit/${tx.transactionId}"
                                class="p-2 hover:bg-surface-container-high rounded-full transition-colors text-outline">
                                <span class="material-symbols-outlined text-[20px]">edit</span>
                              </a>
                              <%-- Delete — uses a small form for POST --%>
                              <form action="/transactions/delete/${tx.transactionId}" method="post"
                                onsubmit="return confirm('Delete this transaction?');" style="display:inline;">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="p-2 hover:bg-error-container/20 rounded-full transition-colors text-error">
                                  <span class="material-symbols-outlined text-[20px]">delete</span>
                                </button>
                              </form>
                            </div>
                          </td>
                        </tr>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <tr>
                        <td colspan="6" class="px-6 py-16 text-center text-on-surface-variant font-body-sm">
                          No transactions found.
                          <a href="/transactions/add" class="text-primary font-semibold hover:underline ml-1">Add your first one →</a>
                        </td>
                      </tr>
                    </c:otherwise>
                  </c:choose>
                </tbody>
              </table>
            </div>
            <div class="px-6 py-4 border-t border-outline-variant flex items-center justify-between">
              <span class="text-on-surface-variant font-label-md">
                ${transactions.size()} transaction(s) shown
              </span>
            </div>
          </div>
        </div>
      </main>
    </div>

    <%-- Mobile Bottom Nav --%>
    <nav class="md:hidden fixed bottom-0 left-0 w-full bg-white border-t border-outline-variant px-gutter py-2 flex justify-between items-center z-50">
      <a class="flex flex-col items-center gap-xs text-on-surface-variant" href="/home">
        <span class="material-symbols-outlined">home</span>
        <span class="text-[10px] font-label-sm">Home</span>
      </a>
      <a class="flex flex-col items-center gap-xs text-primary font-bold" href="/transactions">
        <span class="material-symbols-outlined">list_alt</span>
        <span class="text-[10px] font-label-sm">Activity</span>
      </a>
      <a class="flex flex-col items-center gap-xs text-on-surface-variant" href="/transactions/add">
        <div class="bg-primary text-white p-2 rounded-full -mt-8 shadow-lg">
          <span class="material-symbols-outlined">add</span>
        </div>
        <span class="text-[10px] font-label-sm mt-1">Add</span>
      </a>
      <a class="flex flex-col items-center gap-xs text-on-surface-variant" href="/reports">
        <span class="material-symbols-outlined">assessment</span>
        <span class="text-[10px] font-label-sm">Stats</span>
      </a>
      <a class="flex flex-col items-center gap-xs text-on-surface-variant" href="/logout">
        <span class="material-symbols-outlined">logout</span>
        <span class="text-[10px] font-label-sm">Logout</span>
      </a>
    </nav>
  </body>
</html>
