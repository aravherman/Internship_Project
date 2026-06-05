<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Add Transaction - WealthWise</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <style>
      body { font-family:"Inter",sans-serif; }
      .material-symbols-outlined { font-variation-settings:"FILL" 0,"wght" 400,"GRAD" 0,"opsz" 24; }
      .transaction-card { box-shadow:0px 4px 12px rgba(0,0,0,0.04); }
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
          secondary:"#a83639","secondary-fixed":"#ffdad8",
          "secondary-container":"#fe7676","on-secondary":"#ffffff",
          "on-secondary-fixed-variant":"#881d24","on-secondary-container":"#720b17",
          tertiary:"#003980","tertiary-container":"#004fac","on-tertiary":"#ffffff",
          error:"#ba1a1a","error-container":"#ffdad6","on-error":"#ffffff","on-error-container":"#93000a",
          background:"#f9f9ff",surface:"#f9f9ff",
          "on-background":"#151c27","on-surface":"#151c27",
          "on-surface-variant":"#3f4944",outline:"#6f7973","outline-variant":"#bec9c2",
          "inverse-primary":"#8bd6b6","surface-tint":"#1b6b51",
        },spacing:{xl:"64px",xs:"4px",base:"8px",sm:"12px","margin-mobile":"16px",lg:"40px",gutter:"24px",md:"24px","margin-desktop":"48px"},
        fontSize:{
          "headline-lg":["32px",{lineHeight:"40px",letterSpacing:"-0.02em",fontWeight:"700"}],
          "label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],
          "label-lg":["14px",{lineHeight:"20px",letterSpacing:"0.01em",fontWeight:"600"}],
          "headline-md":["24px",{lineHeight:"32px",fontWeight:"600"}],
          "headline-sm":["20px",{lineHeight:"28px",fontWeight:"600"}],
          "body-md":["16px",{lineHeight:"24px",fontWeight:"400"}],
          "body-sm":["14px",{lineHeight:"20px",fontWeight:"400"}],
          "label-sm":["10px",{lineHeight:"12px",fontWeight:"700"}],
          "body-lg":["18px",{lineHeight:"28px",fontWeight:"400"}],
        }}}};
    </script>
  </head>
  <body class="bg-surface text-on-surface min-h-screen">

    <%-- ── Sidebar ── --%>
    <%
      String uri = request.getRequestURI();
      String active   = "flex items-center gap-sm bg-primary-container text-on-primary-container rounded-lg px-4 py-3 mx-2 cursor-pointer transition-all";
      String inactive = "flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 mx-2 cursor-pointer transition-all";
    %>
    <aside class="fixed left-0 top-0 h-screen w-64 bg-white border-r border-outline-variant flex flex-col py-md gap-xs z-50">
      <div class="px-6 mb-8">
        <h1 class="font-headline-sm text-headline-sm font-bold text-primary">WealthWise</h1>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Financial Clarity</p>
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
        <a class="flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 mx-2" href="/logout">
          <span class="material-symbols-outlined">logout</span><span class="font-label-lg text-label-lg">Logout</span>
        </a>
      </div>
    </aside>

    <%-- ── Main Canvas ── --%>
    <main class="ml-64 min-h-screen flex flex-col">
      <header class="flex justify-between items-center w-full h-16 px-gutter sticky top-0 z-40 bg-surface shadow-sm">
        <div></div>
        <div class="flex items-center gap-4">
          <a href="/subscriptions" class="p-2 hover:bg-surface-container-low rounded-full transition-colors">
            <span class="material-symbols-outlined text-on-surface-variant">notifications</span>
          </a>
          <div class="h-10 w-10 rounded-full bg-primary flex items-center justify-center text-white font-bold text-sm">
            ${userName != null ? userName.substring(0,1).toUpperCase() : "U"}
          </div>
        </div>
      </header>

      <div class="flex-1 p-margin-desktop flex items-start justify-center bg-[#F9FAFB] pt-8">
        <div class="w-full max-w-2xl bg-white rounded-xl border border-[#E5E7EB] transaction-card overflow-hidden">

          <%-- Card Header --%>
          <div class="px-gutter py-6 border-b border-outline-variant bg-surface-container-lowest flex justify-between items-center">
            <div>
              <h2 class="font-headline-md text-headline-md text-primary">Add Transaction</h2>
              <p class="font-body-sm text-body-sm text-on-surface-variant">Log your income or expenses to stay on track.</p>
            </div>
            <a href="/transactions" class="text-on-surface-variant hover:bg-surface-container-low p-2 rounded-full transition-colors">
              <span class="material-symbols-outlined">close</span>
            </a>
          </div>

          <%-- Flash error --%>
          <c:if test="${not empty error}">
            <div class="mx-gutter mt-4 flex items-center gap-sm rounded-lg border border-error-container bg-error-container px-md py-3 text-on-error-container">
              <span class="material-symbols-outlined text-[20px]">error</span>
              <p class="font-body-sm"><c:out value="${error}"/></p>
            </div>
          </c:if>

          <%-- ── Form — POST /transactions/add ── --%>
          <form action="/transactions/add" method="post" class="p-gutter space-y-6">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <%-- Hidden field — updated by JS toggle --%>
            <input type="hidden" id="type" name="type" value="EXPENSE"/>

            <%-- Type Toggle --%>
            <div class="flex justify-center">
              <div class="inline-flex p-1 bg-surface-container-low rounded-lg">
                <button class="px-8 py-2 rounded-md font-label-lg text-label-lg transition-all bg-secondary text-on-secondary shadow-sm"
                  id="btn-expense" onclick="setType('EXPENSE')" type="button">Expense</button>
                <button class="px-8 py-2 rounded-md font-label-lg text-label-lg transition-all text-on-surface-variant hover:text-primary"
                  id="btn-income" onclick="setType('INCOME')" type="button">Income</button>
              </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-gutter">

              <%-- Amount --%>
              <div class="col-span-full md:col-span-1">
                <label class="block font-label-md text-label-md text-on-surface-variant mb-2">Amount (₹)</label>
                <div class="relative">
                  <span class="absolute left-4 top-1/2 -translate-y-1/2 font-headline-sm text-headline-sm text-outline">₹</span>
                  <input class="w-full pl-10 pr-4 py-3 bg-white border border-outline-variant rounded-lg focus:border-primary focus:ring-1 focus:ring-primary font-headline-sm text-headline-sm outline-none transition-all"
                    name="amount" placeholder="0.00" step="0.01" min="0.01" type="number" required/>
                </div>
              </div>

              <%-- Date --%>
              <div class="col-span-full md:col-span-1">
                <label class="block font-label-md text-label-md text-on-surface-variant mb-2">Date</label>
                <div class="relative">
                  <span class="absolute left-4 top-1/2 -translate-y-1/2 material-symbols-outlined text-outline">calendar_today</span>
                  <input class="w-full pl-12 pr-4 py-3 bg-white border border-outline-variant rounded-lg focus:border-primary focus:ring-1 focus:ring-primary font-body-md text-body-md outline-none transition-all"
                    name="transactionDate" type="date" value="${today}" required/>
                </div>
              </div>

              <%-- Category --%>
              <div class="col-span-full md:col-span-1">
                <label class="block font-label-md text-label-md text-on-surface-variant mb-2">Category</label>
                <div class="relative">
                  <span class="absolute left-4 top-1/2 -translate-y-1/2 material-symbols-outlined text-outline">category</span>
                  <select class="w-full pl-12 pr-10 py-3 bg-white border border-outline-variant rounded-lg focus:border-primary focus:ring-1 focus:ring-primary font-body-md text-body-md appearance-none outline-none transition-all"
                    name="categoryId" required>
                    <option value="">-- Select Category --</option>
                    <c:forEach var="cat" items="${categories}">
                      <option value="${cat.categoryId}"><c:out value="${cat.categoryName}"/></option>
                    </c:forEach>
                  </select>
                  <span class="absolute right-4 top-1/2 -translate-y-1/2 material-symbols-outlined text-outline pointer-events-none">expand_more</span>
                </div>
              </div>

              <%-- Description --%>
              <div class="col-span-full">
                <label class="block font-label-md text-label-md text-on-surface-variant mb-2">Description / Notes</label>
                <textarea class="w-full px-4 py-3 bg-white border border-outline-variant rounded-lg focus:border-primary focus:ring-1 focus:ring-primary font-body-md text-body-md outline-none transition-all resize-none"
                  name="description" placeholder="What was this for?" rows="3"></textarea>
              </div>
            </div>

            <%-- Actions --%>
            <div class="flex items-center justify-end gap-md pt-4">
              <a href="/transactions"
                class="px-6 py-2.5 font-label-lg text-label-lg text-primary border border-primary rounded-lg hover:bg-surface-container-low transition-all">
                Cancel
              </a>
              <button class="px-8 py-2.5 font-label-lg text-label-lg bg-primary text-white rounded-lg shadow-lg hover:shadow-xl active:scale-95 transition-all"
                type="submit">
                Save Transaction
              </button>
            </div>
          </form>
        </div>
      </div>
    </main>

    <script>
      const EXPENSE_ACTIVE = "px-8 py-2 rounded-md font-label-lg transition-all bg-secondary text-on-secondary shadow-sm";
      const INCOME_ACTIVE  = "px-8 py-2 rounded-md font-label-lg transition-all bg-primary-container text-on-primary-container shadow-sm";
      const INACTIVE       = "px-8 py-2 rounded-md font-label-lg transition-all text-on-surface-variant hover:text-primary";

      function setType(type) {
        document.getElementById("type").value = type;
        if (type === "EXPENSE") {
          document.getElementById("btn-expense").className = EXPENSE_ACTIVE;
          document.getElementById("btn-income").className  = INACTIVE;
        } else {
          document.getElementById("btn-income").className  = INCOME_ACTIVE;
          document.getElementById("btn-expense").className = INACTIVE;
        }
      }

      // Focus micro-interaction
      document.querySelectorAll("input, select, textarea").forEach(el => {
        el.addEventListener("focus", () => {
          el.parentElement.style.transform = "scale(1.01)";
          el.parentElement.style.transition = "transform 0.2s ease";
        });
        el.addEventListener("blur", () => {
          el.parentElement.style.transform = "scale(1)";
        });
      });
    </script>
  </body>
</html>
