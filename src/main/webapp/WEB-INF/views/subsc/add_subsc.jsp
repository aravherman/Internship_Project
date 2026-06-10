<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <title>Add Subscription | WealthWise</title>
  <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
  <style>
    body { font-family:'Inter',sans-serif; }
    .material-symbols-outlined { font-variation-settings:'FILL' 0,'wght' 400,'GRAD' 0,'opsz' 24; vertical-align:middle; }
    .custom-shadow { box-shadow:0px 4px 12px rgba(0,0,0,0.04); }
  </style>
  <script id="tailwind-config">
    tailwind.config={darkMode:"class",theme:{extend:{colors:{
      "surface-container-low":"#f0f3ff","surface-container-high":"#e2e8f8",
      "surface-container-lowest":"#ffffff","surface-container":"#e7eefe",
      "surface-container-highest":"#dce2f3","surface-bright":"#f9f9ff","surface-dim":"#d3daea",
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
      outline:"#6f7973","outline-variant":"#bec9c2","surface-tint":"#1b6b51",
      "inverse-primary":"#8bd6b6","inverse-surface":"#2a313d",
    },spacing:{sm:"12px",xs:"4px","margin-mobile":"16px",md:"24px",lg:"40px",base:"8px",xl:"64px",gutter:"24px","margin-desktop":"48px"},
    fontSize:{
      "body-lg":["18px",{lineHeight:"28px",fontWeight:"400"}],
      "label-sm":["10px",{lineHeight:"12px",fontWeight:"700"}],
      "body-md":["16px",{lineHeight:"24px",fontWeight:"400"}],
      "label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],
      "headline-sm":["20px",{lineHeight:"28px",fontWeight:"600"}],
      "body-sm":["14px",{lineHeight:"20px",fontWeight:"400"}],
      "headline-lg":["32px",{lineHeight:"40px",letterSpacing:"-0.02em",fontWeight:"700"}],
      "label-lg":["14px",{lineHeight:"20px",letterSpacing:"0.01em",fontWeight:"600"}],
      "headline-md":["24px",{lineHeight:"32px",fontWeight:"600"}],
    }}}};
  </script>
</head>
<body class="bg-surface-container-low text-on-surface">

  <%-- ── Sidebar ── --%>
  <%
    String inactive = "flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 mx-2 transition-all group";
    String active   = "flex items-center gap-sm bg-primary-container text-on-primary-container rounded-lg px-4 py-3 mx-2 transition-all";
  %>
  <aside class="fixed left-0 top-0 h-screen w-64 bg-white border-r border-outline-variant flex flex-col py-md gap-xs z-50 hidden md:flex">
    <div class="px-6 mb-lg">
      <h1 class="font-headline-sm text-headline-sm font-bold text-primary">WealthWise</h1>
      <p class="font-body-sm text-body-sm text-outline">Financial Clarity</p>
    </div>
    <nav class="flex-1 space-y-1">
      <a class="<%= inactive %>" href="/home"><span class="material-symbols-outlined">home</span><span class="font-label-lg text-label-lg">Home</span></a>
      <a class="<%= inactive %>" href="/transactions"><span class="material-symbols-outlined">list_alt</span><span class="font-label-lg text-label-lg">Transactions</span></a>
      <a class="<%= inactive %>" href="/budget"><span class="material-symbols-outlined">account_balance_wallet</span><span class="font-label-lg text-label-lg">Budget</span></a>
      <a class="<%= inactive %>" href="/goals"><span class="material-symbols-outlined">stars</span><span class="font-label-lg text-label-lg">Goals</span></a>
      <a class="<%= active %>" href="/subscriptions"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">subscriptions</span><span class="font-label-lg text-label-lg font-bold">Subscriptions</span></a>
      <a class="<%= inactive %>" href="/reports"><span class="material-symbols-outlined">assessment</span><span class="font-label-lg text-label-lg">Reports</span></a>
    </nav>
    <div class="mt-auto px-2">
      <a class="flex items-center gap-sm text-secondary hover:bg-error-container rounded-lg px-4 py-3 transition-all" href="/logout">
        <span class="material-symbols-outlined">logout</span><span class="font-label-lg text-label-lg">Logout</span>
      </a>
    </div>
  </aside>

  <%-- Top Bar --%>
  <header class="flex justify-between items-center w-full h-16 px-gutter bg-surface shadow-sm sticky top-0 z-40 md:pl-64">
    <div></div>
    <div class="flex items-center gap-md">
      <button class="p-2 hover:bg-surface-container-low rounded-full transition-colors relative">
        <span class="material-symbols-outlined text-on-surface-variant">notifications</span>
      </button>
      <div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center text-white font-bold text-xs">
        ${userName != null ? userName.substring(0,1).toUpperCase() : "U"}
      </div>
    </div>
  </header>

  <%-- Main Content --%>
  <main class="md:pl-64 min-h-[calc(100vh-64px)] p-8 flex justify-center items-start">
    <div class="w-full max-w-5xl grid grid-cols-1 lg:grid-cols-12 gap-8">

      <%-- Form Section --%>
      <div class="lg:col-span-8 bg-white rounded-xl custom-shadow border border-outline-variant p-8">
        <div class="flex items-center gap-sm mb-8">
          <div class="w-12 h-12 rounded-lg bg-primary-container flex items-center justify-center">
            <span class="material-symbols-outlined text-on-primary-container text-2xl">add_card</span>
          </div>
          <div>
            <h2 class="font-headline-md text-headline-md font-bold text-on-surface">Add New Subscription</h2>
            <p class="font-body-sm text-body-sm text-outline">Manage your recurring payments and track expenses</p>
          </div>
        </div>

        <%-- Flash --%>
        <c:if test="${not empty error}">
          <div class="mb-6 flex items-center gap-sm rounded-lg border border-error-container bg-error-container px-md py-3 text-on-error-container">
            <span class="material-symbols-outlined text-[20px]">error</span>
            <p class="font-body-sm"><c:out value="${error}"/></p>
          </div>
        </c:if>

        <%-- ── Form — POST /subscriptions/add ── --%>
        <form action="/subscriptions/add" method="post" class="space-y-6">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <%-- Service Name --%>
            <div class="space-y-2">
              <label class="font-label-md text-label-md text-on-surface-variant block">Service Name</label>
              <input class="w-full border border-outline-variant rounded-lg py-3 px-4 focus:border-primary focus:ring-1 focus:ring-primary outline-none font-body-md text-body-md transition-all"
                name="serviceName" placeholder="e.g. Netflix, Spotify" type="text" required
                value="<c:out value='${param.serviceName}'/>"/>
            </div>

            <%-- Cost --%>
            <div class="space-y-2">
              <label class="font-label-md text-label-md text-on-surface-variant block">Cost (₹)</label>
              <div class="relative">
                <span class="absolute left-4 top-1/2 -translate-y-1/2 font-body-md text-body-md text-outline">₹</span>
                <input class="w-full border border-outline-variant rounded-lg py-3 pl-8 pr-4 focus:border-primary focus:ring-1 focus:ring-primary outline-none font-body-md text-body-md transition-all"
                  name="cost" placeholder="0.00" step="0.01" min="0.01" type="number" required/>
              </div>
            </div>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <%-- Billing Cycle --%>
            <div class="space-y-2">
              <label class="font-label-md text-label-md text-on-surface-variant block">Billing Cycle</label>
              <select name="billingCycle" disabled
                class="w-full border border-outline-variant rounded-lg py-3 px-4 focus:border-primary focus:ring-1 focus:ring-primary outline-none font-body-md text-body-md bg-white transition-all">
                <option value="MONTHLY" selected>Monthly</option>
                <%-- <option value="QUARTERLY">Quarterly</option>
                <option value="BIANNUALLY">Bi-Annually</option>
                <option value="ANNUALLY">Annually</option> --%>
              </select>
            </div>

            <%-- Next Billing Date --%>
            <div class="space-y-2">
              <label class="font-label-md text-label-md text-on-surface-variant block">Next Billing Date</label>
              <input class="w-full border border-outline-variant rounded-lg py-3 px-4 focus:border-primary focus:ring-1 focus:ring-primary outline-none font-body-md text-body-md transition-all"
                name="nextBillingDate" type="date" min="${today}" required value="${today}"/>
            </div>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <%-- Category --%>
            <div class="space-y-2">
              <label class="font-label-md text-label-md text-on-surface-variant block">Category</label>
              <select name="category"
                class="w-full border border-outline-variant rounded-lg py-3 px-4 focus:border-primary focus:ring-1 focus:ring-primary outline-none font-body-md text-body-md bg-white transition-all">
                <option value="Streaming">Streaming</option>
                <option value="Software & SaaS">Software &amp; SaaS</option>
                <option value="Health & Fitness">Health &amp; Fitness</option>
                <option value="Utilities">Utilities</option>
                <option value="Education">Education</option>
                <option value="Other">Other</option>
              </select>
            </div>
          </div>

          <%-- Reminder Toggle 
          <div class="flex items-center justify-between p-4 bg-surface-container-low rounded-lg border border-outline-variant">
             <div class="flex items-center gap-sm">
              <span class="material-symbols-outlined text-primary" style="font-variation-settings:'FILL' 1">notifications_active</span>
               <div>
                <p class="font-label-lg text-label-lg text-on-surface">Billing Reminders</p>
                <p class="font-body-sm text-body-sm text-outline">Get notified before the charge</p>
              </div>
            </div>
            <label class="relative inline-flex items-center cursor-pointer">
              <input type="checkbox" id="reminderCheck" class="sr-only peer" onchange="document.getElementById('reminderVal').value = this.checked"/>
              <div class="w-11 h-6 bg-outline-variant peer-focus:outline-none rounded-full peer
                peer-checked:after:translate-x-full peer-checked:after:border-white
                after:content-[''] after:absolute after:top-[2px] after:left-[2px]
                after:bg-white after:border after:rounded-full after:h-5 after:w-5
                after:transition-all peer-checked:bg-primary">
              </div>
            </label>
            <input type="hidden" name="reminderEnabled" id="reminderVal" value="false"/>
          </div> --%>

          <%-- Actions --%>
          <div class="flex items-center gap-md pt-4">
            <button type="submit"
              class="flex-1 bg-primary text-white py-3 rounded-lg font-label-lg text-label-lg hover:brightness-110 active:scale-[0.98] transition-all">
              Add Subscription
            </button>
            <a href="/subscriptions"
              class="flex-1 bg-white border border-primary text-primary py-3 rounded-lg font-label-lg text-label-lg hover:bg-surface-container-low active:scale-[0.98] transition-all text-center">
              Cancel
            </a>
          </div>
        </form>
      </div>

      <%-- Side panel --%>
      <div class="lg:col-span-4 space-y-6">
        <div class="bg-white rounded-xl custom-shadow border border-outline-variant p-6">
          <div class="flex items-center gap-sm mb-3">
            <span class="material-symbols-outlined text-primary" style="font-variation-settings:'FILL' 1">lightbulb</span>
            <p class="font-label-lg text-label-lg text-on-surface">Tip</p>
          </div>
          <p class="font-body-sm text-body-sm text-on-surface-variant">
            Reminders are set to notify you a few days before the subscription is due. You can manage this for each subscription after adding it.
          </p>
        </div>
        
      </div>
    </div>
  </main>

  <script>
    // Sync checkbox state to hidden input on load too
    document.getElementById('reminderCheck').checked = false;

    // Focus label highlight
    document.querySelectorAll('input, select').forEach(el => {
      el.addEventListener('focus', () => {
        const lbl = el.closest('.space-y-2')?.querySelector('label');
        if (lbl) lbl.classList.add('text-primary');
      });
      el.addEventListener('blur', () => {
        const lbl = el.closest('.space-y-2')?.querySelector('label');
        if (lbl) lbl.classList.remove('text-primary');
      });
    });
  </script>
</body>
</html>
