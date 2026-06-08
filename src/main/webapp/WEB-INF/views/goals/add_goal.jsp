<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <title>Add New Goal - WealthWise</title>
  <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
  <style>
    .material-symbols-outlined { font-variation-settings:'FILL' 0,'wght' 400,'GRAD' 0,'opsz' 24; }
    body { font-family:'Inter',sans-serif; background-color:#f9f9ff; }
    .glass-card { background:rgba(255,255,255,0.95); backdrop-filter:blur(8px); border:1px solid #E5E7EB; }
  </style>
  <script id="tailwind-config">
    tailwind.config={darkMode:"class",theme:{extend:{colors:{
      "surface-container-low":"#f0f3ff","surface-container-high":"#e2e8f8",
      "surface-container-lowest":"#ffffff","surface-container":"#e7eefe",
      "surface-container-highest":"#dce2f3","surface-dim":"#d3daea","surface-bright":"#f9f9ff",
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
      outline:"#6f7973","outline-variant":"#bec9c2","inverse-primary":"#8bd6b6","surface-tint":"#1b6b51",
    },spacing:{xl:"64px",xs:"4px",base:"8px",sm:"12px","margin-mobile":"16px",lg:"40px",gutter:"24px",md:"24px","margin-desktop":"48px"},
    fontSize:{
      "label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],
      "label-lg":["14px",{lineHeight:"20px",letterSpacing:"0.01em",fontWeight:"600"}],
      "label-sm":["10px",{lineHeight:"12px",fontWeight:"700"}],
      "body-sm":["14px",{lineHeight:"20px",fontWeight:"400"}],
      "body-md":["16px",{lineHeight:"24px",fontWeight:"400"}],
      "headline-sm":["20px",{lineHeight:"28px",fontWeight:"600"}],
      "headline-md":["24px",{lineHeight:"32px",fontWeight:"600"}],
    }}}};
  </script>
</head>
<body class="bg-surface text-on-surface">
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
        <a href="/subscriptions" class="p-2 hover:bg-surface-container-low rounded-full cursor-pointer relative">
          <span class="material-symbols-outlined">notifications</span>
        </a>
        <div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center text-white font-bold text-xs">
          ${userName != null ? userName.substring(0,1).toUpperCase() : "U"}
        </div>
      </div>
    </header>

    <section class="flex-1 p-gutter flex items-start justify-center overflow-y-auto">
      <div class="w-full max-w-5xl flex flex-col lg:flex-row gap-gutter">

        <%-- Main Form Card --%>
        <div class="flex-1 glass-card p-lg rounded-xl shadow-sm">
          <div class="mb-lg flex justify-between items-center">
            <div>
              <h2 class="font-headline-md text-headline-md font-bold text-primary">Add New Goal</h2>
              <p class="font-body-md text-body-md text-on-surface-variant">Visualize your future and set a clear path to achievement.</p>
            </div>
            <span class="material-symbols-outlined text-primary text-4xl" style="font-variation-settings:'FILL' 1">flag</span>
          </div>

          <%-- Flash --%>
          <c:if test="${not empty error}">
            <div class="mb-md flex items-center gap-sm rounded-lg border border-error-container bg-error-container px-md py-3 text-on-error-container">
              <span class="material-symbols-outlined text-[20px]">error</span>
              <p class="font-body-sm"><c:out value="${error}"/></p>
            </div>
          </c:if>

          <%-- ── Form — POST /goals/add ── --%>
          <form action="/goals/add" method="post" class="space-y-md">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <%-- frequency driven by toggle — updated by JS --%>
            <input type="hidden" id="frequency" name="frequency" value="MONTHLY"/>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-md">

              <%-- Goal Name --%>
              <div class="col-span-full">
                <label class="block font-label-md text-label-md text-on-surface-variant mb-2">Goal Name</label>
                <input class="w-full px-4 py-3 rounded-lg border border-outline-variant bg-white font-body-md text-body-md focus:border-primary focus:ring-1 focus:ring-primary outline-none transition-all"
                  name="goalName" placeholder="e.g. Dream House Downpayment" type="text" required
                  value="<c:out value='${param.goalName}'/>"/>
              </div>

              <%-- Target Amount --%>
              <div>
                <label class="block font-label-md text-label-md text-on-surface-variant mb-2">Target Amount (₹)</label>
                <div class="relative">
                  <span class="absolute left-4 top-1/2 -translate-y-1/2 font-body-md text-body-md text-on-surface-variant">₹</span>
                  <input class="w-full pl-8 pr-4 py-3 rounded-lg border border-outline-variant bg-white font-body-md text-body-md focus:border-primary focus:ring-1 focus:ring-primary outline-none transition-all"
                    name="targetAmount" placeholder="0.00" type="number" step="0.01" min="1" required/>
                </div>
              </div>

              <%-- Initial Savings --%>
              <div>
                <label class="block font-label-md text-label-md text-on-surface-variant mb-2">Initial Savings <span class="text-on-surface-variant font-normal">(Optional)</span></label>
                <div class="relative">
                  <span class="absolute left-4 top-1/2 -translate-y-1/2 font-body-md text-body-md text-on-surface-variant">₹</span>
                  <input class="w-full pl-8 pr-4 py-3 rounded-lg border border-outline-variant bg-white font-body-md text-body-md focus:border-primary focus:ring-1 focus:ring-primary outline-none transition-all"
                    name="currentAmount" placeholder="0.00" type="number" step="0.01" min="0"/>
                </div>
              </div>

              <%-- Target Date --%>
              <div>
                <label class="block font-label-md text-label-md text-on-surface-variant mb-2">Target Date</label>
                <input class="w-full px-4 py-3 rounded-lg border border-outline-variant bg-white font-body-md text-body-md focus:border-primary focus:ring-1 focus:ring-primary outline-none transition-all"
                  name="targetDate" type="date" min="${today}" required/>
              </div>
            </div>

            <%-- Icon picker (visual only) --%>
            <div class="pt-md border-t border-outline-variant grid grid-cols-1 md:grid-cols-2 gap-md">
              <div>
                <label class="block font-label-md text-label-md text-on-surface-variant mb-3">Choose Icon <span class="text-on-surface-variant font-normal">(display only)</span></label>
                <div class="grid grid-cols-5 gap-sm" id="icon-grid">
                  <c:forEach var="ico" items="home,directions_car,flight,school,favorite,savings,beach_access,restaurant,fitness_center,laptop">
                    <div class="w-12 h-12 flex items-center justify-center rounded-lg border border-outline-variant hover:bg-surface-container-low cursor-pointer icon-btn transition-all" data-icon="${ico}">
                      <span class="material-symbols-outlined">${ico}</span>
                    </div>
                  </c:forEach>
                </div>
              </div>
              <div>
                <label class="block font-label-md text-label-md text-on-surface-variant mb-3">Select Color <span class="text-on-surface-variant font-normal">(display only)</span></label>
                <div class="flex gap-sm flex-wrap">
                  <div class="w-8 h-8 rounded-full bg-primary cursor-pointer ring-offset-2 ring-2 ring-primary color-btn"></div>
                  <div class="w-8 h-8 rounded-full bg-secondary cursor-pointer hover:ring-2 ring-offset-1 hover:ring-secondary color-btn"></div>
                  <div class="w-8 h-8 rounded-full bg-tertiary cursor-pointer hover:ring-2 ring-offset-1 hover:ring-tertiary color-btn"></div>
                  <div class="w-8 h-8 rounded-full bg-emerald-400 cursor-pointer hover:ring-2 ring-offset-1 hover:ring-emerald-400 color-btn"></div>
                  <div class="w-8 h-8 rounded-full bg-blue-400 cursor-pointer hover:ring-2 ring-offset-1 hover:ring-blue-400 color-btn"></div>
                  <div class="w-8 h-8 rounded-full bg-amber-400 cursor-pointer hover:ring-2 ring-offset-1 hover:ring-amber-400 color-btn"></div>
                </div>
              </div>
            </div>

            <%-- Contribution Frequency toggle --%>
            <div class="pt-md border-t border-outline-variant">
              <h3 class="font-headline-sm text-headline-sm font-semibold text-primary mb-4">Contribution Frequency</h3>
              <div class="grid grid-cols-1 md:grid-cols-2 gap-md">
                <div>
                  <label class="block font-label-md text-label-md text-on-surface-variant mb-2">How often will you contribute?</label>
                  <div class="flex bg-surface-container-low p-1 rounded-lg" id="freq-toggle">
                    <button class="flex-1 py-2 px-3 rounded-md bg-white shadow-sm font-label-lg text-label-lg text-primary freq-btn" type="button" data-val="MONTHLY">Monthly</button>
                    <button class="flex-1 py-2 px-3 rounded-md font-label-lg text-label-lg text-on-surface-variant hover:bg-surface-container freq-btn" type="button" data-val="BIWEEKLY">Bi-weekly</button>
                    <button class="flex-1 py-2 px-3 rounded-md font-label-lg text-label-lg text-on-surface-variant hover:bg-surface-container freq-btn" type="button" data-val="WEEKLY">Weekly</button>
                  </div>
                </div>
              </div>
            </div>

            <%-- Actions --%>
            <div class="pt-lg flex flex-col sm:flex-row items-center gap-md">
              <button class="w-full sm:flex-1 py-4 bg-primary text-on-primary font-label-lg text-label-lg rounded-lg hover:brightness-110 active:scale-[0.98] transition-all"
                type="submit">Create Goal</button>
              <a href="/goals"
                class="w-full sm:w-auto px-10 py-4 bg-white border border-primary text-primary font-label-lg text-label-lg rounded-lg hover:bg-surface-container-low transition-all text-center">
                Cancel
              </a>
            </div>
          </form>
        </div>

        <%-- Side panel: tip card --%>
        <aside class="w-full lg:w-72 space-y-md">
          <div class="bg-white rounded-xl border border-outline-variant shadow-sm p-md">
            <div class="flex items-center gap-sm mb-3">
              <span class="material-symbols-outlined text-primary" style="font-variation-settings:'FILL' 1">lightbulb</span>
              <p class="font-label-lg text-label-lg text-on-surface">Pro Tip</p>
            </div>
            <p class="font-body-sm text-body-sm text-on-surface-variant">
              Set a realistic target date and break your goal into smaller monthly contributions. Even ₹500/month adds up to ₹6,000 per year!
            </p>
          </div>
          <div class="bg-primary-container/10 rounded-xl border border-primary/20 shadow-sm p-md">
            <p class="font-label-md text-label-md text-primary uppercase tracking-wider mb-2">Savings Formula</p>
            <p class="font-body-sm text-body-sm text-on-surface-variant">
              Monthly contribution = (Target − Initial savings) ÷ Months to target date
            </p>
          </div>
        </aside>
      </div>
    </section>
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
  // ── Frequency toggle ──
  const freqBtns = document.querySelectorAll(".freq-btn");
  const freqInput = document.getElementById("frequency");
  const ACTIVE_FREQ  = "flex-1 py-2 px-3 rounded-md bg-white shadow-sm font-label-lg text-label-lg text-primary";
  const INACTIVE_FREQ = "flex-1 py-2 px-3 rounded-md font-label-lg text-label-lg text-on-surface-variant hover:bg-surface-container";

  freqBtns.forEach(btn => {
    btn.addEventListener("click", () => {
      freqBtns.forEach(b => b.className = INACTIVE_FREQ);
      btn.className = ACTIVE_FREQ;
      freqInput.value = btn.dataset.val;
    });
  });

  // ── Icon picker ──
  const iconBtns = document.querySelectorAll(".icon-btn");
  iconBtns.forEach(btn => {
    btn.addEventListener("click", () => {
      iconBtns.forEach(b => {
        b.classList.remove("border-2","border-primary","bg-primary-container","text-on-primary-container");
        b.classList.add("border","border-outline-variant");
        const s = b.querySelector("span");
        if (s) s.style.fontVariationSettings = "'FILL' 0";
      });
      btn.classList.add("border-2","border-primary","bg-primary-container","text-on-primary-container");
      btn.classList.remove("border","border-outline-variant");
      const s = btn.querySelector("span");
      if (s) s.style.fontVariationSettings = "'FILL' 1";
    });
  });

  // ── Color picker ──
  const colorBtns = document.querySelectorAll(".color-btn");
  colorBtns.forEach(btn => {
    btn.addEventListener("click", () => {
      colorBtns.forEach(b => b.classList.remove("ring-2","ring-offset-2","ring-primary"));
      btn.classList.add("ring-2","ring-offset-2","ring-primary");
    });
  });
</script>
</body>
</html>
