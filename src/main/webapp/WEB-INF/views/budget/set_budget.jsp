<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Set Budget | WealthWise</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <style>
      body { font-family:"Inter",sans-serif; background-color:#f9f9ff; }
      .material-symbols-outlined { font-variation-settings:"FILL" 0,"wght" 400,"GRAD" 0,"opsz" 24; }
    </style>
    <script id="tailwind-config">
      tailwind.config={darkMode:"class",theme:{extend:{colors:{
        "surface-container-low":"#f0f3ff","surface-container-high":"#e2e8f8",
        "surface-container-lowest":"#ffffff","surface-container":"#e7eefe",
        primary:"#004532","primary-container":"#065f46","on-primary":"#ffffff",
        "primary-fixed":"#a6f2d1","on-primary-fixed-variant":"#00513b","on-primary-container":"#8bd6b7",
        secondary:"#a83639","on-secondary":"#ffffff",
        error:"#ba1a1a","error-container":"#ffdad6","on-error-container":"#93000a",
        background:"#f9f9ff",surface:"#f9f9ff","on-surface":"#151c27","on-surface-variant":"#3f4944",
        outline:"#6f7973","outline-variant":"#bec9c2","surface-tint":"#1b6b51",
      },spacing:{xl:"64px",xs:"4px",base:"8px",sm:"12px","margin-mobile":"16px",lg:"40px",gutter:"24px",md:"24px","margin-desktop":"48px"},
      fontSize:{
        "label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],
        "label-lg":["14px",{lineHeight:"20px",letterSpacing:"0.01em",fontWeight:"600"}],
        "headline-md":["24px",{lineHeight:"32px",fontWeight:"600"}],
        "headline-sm":["20px",{lineHeight:"28px",fontWeight:"600"}],
        "body-md":["16px",{lineHeight:"24px",fontWeight:"400"}],
        "body-sm":["14px",{lineHeight:"20px",fontWeight:"400"}],
      }}}};
    </script>
  </head>
  <body class="min-h-screen flex">

    <%-- Sidebar --%>
    <%
      String inactive = "flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 mx-2 transition-all";
      String active   = "flex items-center gap-sm bg-primary-container text-on-primary-container rounded-lg px-4 py-3 mx-2 transition-all";
    %>
    <aside class="hidden md:flex flex-col fixed left-0 top-0 h-screen w-64 bg-white border-r border-outline-variant py-md gap-xs z-50">
      <div class="px-6 mb-8">
        <h1 class="font-headline-sm text-headline-sm font-bold text-primary">WealthWise</h1>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Financial Clarity</p>
      </div>
      <nav class="flex-1 space-y-1">
        <a class="<%= inactive %>" href="/home"><span class="material-symbols-outlined">home</span><span class="font-label-lg text-label-lg">Home</span></a>
        <a class="<%= inactive %>" href="/transactions"><span class="material-symbols-outlined">list_alt</span><span class="font-label-lg text-label-lg">Transactions</span></a>
        <a class="<%= active %>" href="/budget"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">account_balance_wallet</span><span class="font-label-lg text-label-lg">Budget</span></a>
        <a class="<%= inactive %>" href="/goals"><span class="material-symbols-outlined">stars</span><span class="font-label-lg text-label-lg">Goals</span></a>
        <a class="<%= inactive %>" href="/subscriptions"><span class="material-symbols-outlined">subscriptions</span><span class="font-label-lg text-label-lg">Subscriptions</span></a>
        <a class="<%= inactive %>" href="/reports"><span class="material-symbols-outlined">assessment</span><span class="font-label-lg text-label-lg">Reports</span></a>
      </nav>
      <div class="mt-auto border-t border-outline-variant px-2 pt-4">
        <a class="flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 transition-all" href="/logout">
          <span class="material-symbols-outlined">logout</span><span class="font-label-lg text-label-lg">Logout</span>
        </a>
      </div>
    </aside>

    <main class="flex-1 md:ml-64 flex flex-col">
      <header class="flex justify-between items-center w-full h-16 px-gutter sticky top-0 z-40 bg-surface shadow-sm">
        <div></div>
        <div class="h-10 w-10 rounded-full bg-primary flex items-center justify-center text-white font-bold text-sm">
          ${userName != null ? userName.substring(0,1).toUpperCase() : "U"}
        </div>
      </header>

      <div class="p-margin-desktop flex flex-col items-center">

        <%-- Flash --%>
        <c:if test="${not empty error}">
          <div class="w-full max-w-2xl mb-md flex items-center gap-sm rounded-lg border border-error-container bg-error-container px-md py-3 text-on-error-container">
            <span class="material-symbols-outlined text-[20px]">error</span>
            <p class="font-body-sm"><c:out value="${error}"/></p>
          </div>
        </c:if>

        <div class="w-full max-w-2xl bg-white rounded-xl shadow-sm border border-outline-variant p-md md:p-lg overflow-hidden relative">
          <div class="absolute -top-12 -right-12 w-32 h-32 bg-primary-fixed opacity-20 rounded-full blur-3xl pointer-events-none"></div>

          <div class="mb-md relative">
            <h2 class="font-headline-md text-headline-md text-primary">Set Monthly Budget</h2>
            <p class="font-body-md text-body-md text-on-surface-variant">Define a spending limit for a category.</p>
          </div>

          <%-- ── Form ── --%>
          <form action="/budget/set" method="post" class="space-y-md relative">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <%-- Category --%>
            <div class="space-y-xs">
              <label class="font-label-lg text-label-lg text-on-surface block">Category</label>
              <div class="relative">
                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-outline">category</span>
                <select name="categoryId" required
                  class="w-full pl-12 pr-10 py-3 rounded-lg border border-outline-variant focus:border-primary focus:ring-1 focus:ring-primary transition-all font-body-md bg-white appearance-none outline-none">
                  <option value="">-- Select Category --</option>
                  <c:forEach var="cat" items="${categories}">
                    <option value="${cat.categoryId}"><c:out value="${cat.categoryName}"/></option>
                  </c:forEach>
                </select>
                <span class="material-symbols-outlined absolute right-4 top-1/2 -translate-y-1/2 text-outline pointer-events-none">expand_more</span>
              </div>
              <p class="font-label-sm text-on-surface-variant">
                Need a new category?
                <a href="/budget/category/add" class="text-primary font-semibold hover:underline">Create one →</a>
              </p>
            </div>

            <%-- Limit Amount --%>
            <div class="space-y-xs">
              <label class="font-label-lg text-label-lg text-on-surface block">Monthly Limit (₹)</label>
              <div class="relative">
                <span class="absolute left-4 top-1/2 -translate-y-1/2 text-on-surface-variant font-body-md">₹</span>
                <input class="w-full pl-10 pr-4 py-3 rounded-lg border border-outline-variant focus:border-primary focus:ring-1 focus:ring-primary transition-all font-body-md outline-none"
                  name="limitAmount" placeholder="0.00" step="0.01" min="1" type="number" required/>
              </div>
            </div>

            <%-- Period --%>
            <!-- <div class="space-y-xs">
              <label class="font-label-lg text-label-lg text-on-surface block">Period</label>
              <select name="period"
                class="w-full px-4 py-3 rounded-lg border border-outline-variant focus:border-primary focus:ring-1 focus:ring-primary transition-all font-body-md bg-white appearance-none outline-none">
                <option value="MONTHLY" selected>Monthly</option>
                <option value="WEEKLY">Weekly</option>
                <option value="YEARLY">Yearly</option>
              </select>
            </div> -->

            <div class="flex flex-col sm:flex-row items-center gap-md pt-md">
              <button type="submit"
                class="w-full sm:flex-1 py-3 px-6 bg-primary text-white font-label-lg text-label-lg rounded-lg shadow-sm hover:opacity-90 active:scale-[0.98] transition-all">
                Save Budget
              </button>
              <a href="/budget"
                class="w-full sm:w-auto py-3 px-8 bg-white border border-outline-variant text-on-surface-variant font-label-lg text-label-lg rounded-lg hover:bg-surface-container-low transition-all text-center">
                Cancel
              </a>
            </div>
          </form>
        </div>
      </div>
    </main>
  </body>
</html>
