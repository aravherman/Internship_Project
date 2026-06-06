<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Add Category | WealthWise</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <style>
      body { background-color:#f9f9ff; font-family:'Inter',sans-serif; }
      .material-symbols-outlined { font-variation-settings:'FILL' 0,'wght' 400,'GRAD' 0,'opsz' 24; }
      .no-scrollbar::-webkit-scrollbar { display:none; }
      .no-scrollbar { -ms-overflow-style:none; scrollbar-width:none; }
    </style>
    <script id="tailwind-config">
      tailwind.config={darkMode:"class",theme:{extend:{colors:{
        "surface-container-low":"#f0f3ff","surface-container-high":"#e2e8f8",
        "surface-container-lowest":"#ffffff","surface-container":"#e7eefe",
        primary:"#004532","primary-container":"#065f46","on-primary":"#ffffff",
        "primary-fixed":"#a6f2d1","primary-fixed-dim":"#8bd6b6",
        "on-primary-fixed":"#002116","on-primary-fixed-variant":"#00513b","on-primary-container":"#8bd6b7",
        secondary:"#a83639","secondary-container":"#fe7676","on-secondary":"#ffffff",
        "on-secondary-container":"#720b17",
        error:"#ba1a1a","error-container":"#ffdad6","on-error-container":"#93000a",
        background:"#f9f9ff",surface:"#f9f9ff","on-surface":"#151c27","on-surface-variant":"#3f4944",
        outline:"#6f7973","outline-variant":"#bec9c2","surface-tint":"#1b6b51",
      },spacing:{xl:"64px",xs:"4px",base:"8px",sm:"12px","margin-mobile":"16px",lg:"40px",gutter:"24px",md:"24px","margin-desktop":"48px"},
      fontSize:{
        "headline-md":["24px",{lineHeight:"32px",fontWeight:"600"}],
        "headline-sm":["20px",{lineHeight:"28px",fontWeight:"600"}],
        "label-lg":["14px",{lineHeight:"20px",letterSpacing:"0.01em",fontWeight:"600"}],
        "label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],
        "label-sm":["10px",{lineHeight:"12px",fontWeight:"700"}],
        "body-md":["16px",{lineHeight:"24px",fontWeight:"400"}],
        "body-sm":["14px",{lineHeight:"20px",fontWeight:"400"}],
      }}}};
    </script>
  </head>
  <body class="flex min-h-screen">

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
      <nav class="flex-1 space-y-1 overflow-y-auto no-scrollbar">
        <a class="<%= inactive %>" href="/home"><span class="material-symbols-outlined">home</span><span class="font-label-lg text-label-lg">Home</span></a>
        <a class="<%= inactive %>" href="/transactions"><span class="material-symbols-outlined">list_alt</span><span class="font-label-lg text-label-lg">Transactions</span></a>
        <a class="<%= active %>" href="/budget"><span class="material-symbols-outlined">account_balance_wallet</span><span class="font-label-lg text-label-lg">Budget</span></a>
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
      <header class="flex justify-between items-center w-full h-16 px-gutter sticky top-0 z-50 bg-surface shadow-sm">
        <div></div>
        <div class="flex items-center gap-4">
          <a href="/subscriptions" class="p-2 hover:bg-surface-container-low rounded-full transition-colors relative">
            <span class="material-symbols-outlined text-primary">notifications</span>
            <span class="absolute top-2 right-2 w-2 h-2 bg-secondary rounded-full"></span>
          </a>
          <div class="h-10 w-10 rounded-full bg-primary flex items-center justify-center text-white font-bold text-sm">
            ${userName != null ? userName.substring(0,1).toUpperCase() : "U"}
          </div>
        </div>
      </header>

      <div class="p-margin-mobile md:p-margin-desktop flex flex-col items-center">

        <%-- Breadcrumb --%>
        <nav class="w-full max-w-2xl mb-8 flex items-center gap-2 text-on-surface-variant font-label-md text-label-md">
          <a href="/budget" class="hover:text-primary transition-colors">Budget</a>
          <span class="material-symbols-outlined text-[16px]">chevron_right</span>
          <span class="text-primary font-bold">Add New Category</span>
        </nav>

        <%-- Flash --%>
        <c:if test="${not empty error}">
          <div class="w-full max-w-2xl mb-md flex items-center gap-sm rounded-lg border border-error-container bg-error-container px-md py-3 text-on-error-container">
            <span class="material-symbols-outlined text-[20px]">error</span>
            <p class="font-body-sm"><c:out value="${error}"/></p>
          </div>
        </c:if>

        <div class="w-full max-w-2xl bg-white rounded-xl shadow-sm border border-outline-variant p-md md:p-lg overflow-hidden relative">
          <div class="absolute -top-12 -right-12 w-32 h-32 bg-primary-fixed-dim opacity-20 rounded-full blur-3xl pointer-events-none"></div>

          <div class="mb-md relative">
            <h2 class="font-headline-md text-headline-md text-primary">Create Category</h2>
            <p class="font-body-md text-body-md text-on-surface-variant">Define a new spending group for your financial tracking.</p>
          </div>

          <%-- ── Form ── --%>
          <form action="/budget/category/add" method="post" class="space-y-md">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <%-- Name --%>
            <div class="space-y-xs">
              <label class="font-label-lg text-label-lg text-on-surface block">Category Name</label>
              <input class="w-full px-4 py-3 rounded-lg border border-outline-variant focus:border-primary focus:ring-1 focus:ring-primary transition-all font-body-md outline-none"
                name="categoryName" placeholder="e.g. Weekly Groceries" type="text" required
                value="<c:out value='${param.categoryName}'/>"/>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-md">
              <%-- Type --%>
              <div class="space-y-xs">
                <label class="font-label-lg text-label-lg text-on-surface block">Type</label>
                <select name="categoryType"
                  class="w-full px-4 py-3 rounded-lg border border-outline-variant focus:border-primary focus:ring-1 focus:ring-primary transition-all font-body-md bg-white appearance-none outline-none">
                  <option value="EXPENSE" selected>Expense</option>
                  <option value="INCOME">Income</option>
                </select>
              </div>
            </div>

            <%-- Description --%>
            <div class="space-y-xs">
              <label class="font-label-lg text-label-lg text-on-surface block">Description <span class="text-on-surface-variant font-normal">(Optional)</span></label>
              <textarea class="w-full px-4 py-3 rounded-lg border border-outline-variant focus:border-primary focus:ring-1 focus:ring-primary transition-all font-body-md resize-none outline-none"
                name="description" placeholder="Brief details about what this category covers..." rows="3"><c:out value="${param.description}"/></textarea>
            </div>

            <%-- Icon picker (visual only — not persisted unless your Category model has icon field) --%>
            <div class="space-y-md pt-md border-t border-outline-variant">
              <div>
                <label class="font-label-lg text-label-lg text-on-surface block mb-base">Select Icon <span class="text-on-surface-variant font-normal">(display only)</span></label>
                <div class="grid grid-cols-5 sm:grid-cols-8 gap-sm" id="icon-grid">
                  <c:forEach var="icon" items="shopping_bag,directions_car,home,favorite,work,restaurant,flight,fitness_center,movie,category,bolt,wifi,school,pets,local_pharmacy">
                    <button class="aspect-square flex items-center justify-center rounded-lg border border-outline-variant hover:border-primary transition-all text-on-surface-variant hover:bg-surface-container-low icon-btn" type="button" data-icon="${icon}">
                      <span class="material-symbols-outlined">${icon}</span>
                    </button>
                  </c:forEach>
                </div>
              </div>
            </div>

            <div class="flex flex-col sm:flex-row items-center gap-md pt-lg">
              <button type="submit"
                class="w-full sm:flex-1 py-3 px-6 bg-primary text-white font-label-lg text-label-lg rounded-lg shadow-sm hover:opacity-90 active:scale-[0.98] transition-all">
                Create Category
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

    <%-- Mobile Bottom Nav --%>
    <nav class="md:hidden fixed bottom-0 left-0 right-0 bg-surface h-16 flex justify-around items-center px-4 z-50 border-t border-outline-variant shadow-sm">
      <a class="flex flex-col items-center justify-center text-on-surface-variant" href="/home">
        <span class="material-symbols-outlined">home</span><span class="text-[10px] font-bold">Home</span>
      </a>
      <a class="flex flex-col items-center justify-center text-on-surface-variant" href="/transactions">
        <span class="material-symbols-outlined">list_alt</span><span class="text-[10px] font-bold">Trans</span>
      </a>
      <a class="flex flex-col items-center justify-center text-primary" href="/budget">
        <span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">account_balance_wallet</span>
        <span class="text-[10px] font-bold">Budget</span>
      </a>
      <a class="flex flex-col items-center justify-center text-on-surface-variant" href="/logout">
        <span class="material-symbols-outlined">logout</span><span class="text-[10px] font-bold">Logout</span>
      </a>
    </nav>

    <script>
      // Icon selection highlight
      const iconBtns = document.querySelectorAll(".icon-btn");
      iconBtns.forEach(btn => {
        btn.addEventListener("click", () => {
          iconBtns.forEach(b => {
            b.classList.remove("bg-primary-container","text-on-primary-container","ring-2","ring-primary");
            b.classList.add("text-on-surface-variant");
            const s = b.querySelector("span");
            if (s) s.style.fontVariationSettings = "'FILL' 0";
          });
          btn.classList.add("bg-primary-container","text-on-primary-container","ring-2","ring-primary");
          btn.classList.remove("text-on-surface-variant");
          const s = btn.querySelector("span");
          if (s) s.style.fontVariationSettings = "'FILL' 1";
        });
      });
    </script>
  </body>
</html>
