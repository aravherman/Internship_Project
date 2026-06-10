<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <title>Subscriptions | WealthWise</title>
  <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
  <style>
    .material-symbols-outlined { font-variation-settings:'FILL' 0,'wght' 400,'GRAD' 0,'opsz' 24; vertical-align:middle; }
    body { font-family:'Inter',sans-serif; background-color:#f9f9ff; }
    ::-webkit-scrollbar { width:6px; }
    ::-webkit-scrollbar-thumb { background:#bec9c2; border-radius:10px; }
    /* Toggle switch */
    .toggle-track {
      width:44px; height:24px; border-radius:9999px;
      background:#bec9c2; position:relative; transition:background 0.2s;
      cursor:pointer; flex-shrink:0;
    }
    .toggle-track.on  { background:#004532; }
    .toggle-track.off { background:#bec9c2; }
    .toggle-thumb {
      position:absolute; top:3px; left:3px;
      width:18px; height:18px; border-radius:50%;
      background:#fff; transition:transform 0.2s;
      box-shadow:0 1px 3px rgba(0,0,0,0.2);
    }
    .toggle-track.on .toggle-thumb { transform:translateX(20px); }
  </style>
  <script id="tailwind-config">
    tailwind.config={darkMode:"class",theme:{extend:{colors:{
      "surface-container-low":"#f0f3ff","surface-container-high":"#e2e8f8",
      "surface-container-lowest":"#ffffff","surface-container":"#e7eefe",
      "surface-container-highest":"#dce2f3","surface-bright":"#f9f9ff",
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
<body class="bg-background text-on-surface">
<div class="flex min-h-screen">

  <%-- ── Sidebar ── --%>
  <%
    String uri = request.getRequestURI();
    String active   = "flex items-center gap-sm bg-primary-container text-on-primary-container rounded-lg px-4 py-3 mx-2 transition-all";
    String inactive = "flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 mx-2 transition-all";
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

  <%-- ── Main ── --%>
  <main class="flex-1 md:ml-64 min-h-screen">
    <header class="flex justify-between items-center w-full h-16 px-gutter sticky top-0 z-50 bg-surface shadow-sm">
      <div></div>
      <div class="flex items-center gap-gutter">
        <div class="relative cursor-pointer hover:bg-surface-container-low p-2 rounded-full transition-colors">
          <span class="material-symbols-outlined text-on-surface-variant">notifications</span>
          <c:if test="${not empty upcomingSoon}">
            <span class="absolute top-2 right-2 w-2 h-2 bg-secondary rounded-full"></span>
          </c:if>
        </div>
        <div class="w-10 h-10 rounded-full bg-primary flex items-center justify-center text-white font-bold text-sm">
          ${userName != null ? userName.substring(0,1).toUpperCase() : "U"}
        </div>
      </div>
    </header>

    <div class="p-gutter md:p-margin-desktop space-y-lg">

      <%-- Flash --%>
      <c:if test="${not empty error}">
        <div class="flex items-center gap-sm rounded-lg border border-error-container bg-error-container px-md py-3 text-on-error-container">
          <span class="material-symbols-outlined text-[20px]">error</span>
          <p class="font-body-sm"><c:out value="${error}"/></p>
        </div>
      </c:if>
      <c:if test="${not empty success}">
        <div class="flex items-center gap-sm rounded-lg border border-green-200 bg-green-50 px-md py-3 text-green-800">
          <span class="material-symbols-outlined text-[20px]">check_circle</span>
          <p class="font-body-sm"><c:out value="${success}"/></p>
        </div>
      </c:if>

      <%-- Page Header --%>
      <div class="flex flex-col md:flex-row md:items-end justify-between gap-md">
        <div>
          <h2 class="font-headline-lg text-headline-lg text-on-surface">Manage Subscriptions</h2>
          <p class="font-body-md text-body-md text-outline">Track and optimise your recurring expenses.</p>
        </div>
        <a href="/subscriptions/add"
          class="bg-primary text-white px-gutter py-3 rounded-lg font-label-lg text-label-lg flex items-center gap-2 hover:opacity-90 transition-opacity active:scale-95">
          <span class="material-symbols-outlined">add</span> Add New Subscription
        </a>
      </div>

      <%-- ── Bento Summary ── --%>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-gutter">

        <%-- Main summary card --%>
        <div class="md:col-span-4 bg-primary rounded-xl p-gutter text-white relative overflow-hidden shadow-sm">
          <div class="relative z-10 flex flex-col h-full justify-between">
            <div>
              <p class="font-label-lg text-label-lg opacity-80">Total Monthly Expenditure</p>
              <h3 class="font-headline-lg text-headline-lg mt-2">
                ₹<fmt:formatNumber value="${totalMonthlyCost}" pattern="#,##0.00"/>
              </h3>
            </div>
            <div class="mt-lg flex gap-md">
              <div class="bg-white/10 p-4 rounded-lg flex-1">
                <p class="font-label-sm text-label-sm uppercase tracking-wider opacity-70">Next Billing</p>
                <p class="font-headline-sm text-headline-sm mt-1"><c:out value="${nextBillStr}"/></p>
              </div>
              <div class="bg-white/10 p-4 rounded-lg flex-1">
                <p class="font-label-sm text-label-sm uppercase tracking-wider opacity-70">Active</p>
                <p class="font-headline-sm text-headline-sm mt-1">${activeCount}</p>
              </div>
            </div>
          </div>
          <div class="absolute -right-10 -bottom-10 w-64 h-64 bg-white/5 rounded-full blur-3xl pointer-events-none"></div>
        </div>
      </div>

      <%-- ── Upcoming Bills Alert ── --%>
      <c:if test="${not empty upcomingSoon}">
        <div class="bg-yellow-50 border border-yellow-200 rounded-xl p-md">
          <div class="flex items-center gap-sm mb-3">
            <span class="material-symbols-outlined text-yellow-700" style="font-variation-settings:'FILL' 1">notifications_active</span>
            <p class="font-label-lg text-label-lg text-yellow-800">Bills due within 7 days</p>
          </div>
          <div class="flex flex-wrap gap-sm">
            <c:forEach var="row" items="${subscriptionRows}">
              <c:if test="${row.daysUntil <= 7 && row.sub.status == 'ACTIVE'}">
                <div class="flex items-center gap-2 bg-white border border-yellow-200 rounded-lg px-3 py-2">
                  <span class="material-symbols-outlined text-yellow-600 text-[18px]">schedule</span>
                  <div>
                    <p class="font-label-lg text-label-lg text-on-surface"><c:out value="${row.sub.subscriptionName}"/></p>
                    <p class="font-label-sm text-yellow-700">
                      <c:choose>
                        <c:when test="${row.daysUntil == 0}">Due today</c:when>
                        <c:when test="${row.daysUntil == 1}">Due tomorrow</c:when>
                        <c:otherwise>Due in ${row.daysUntil} days</c:otherwise>
                      </c:choose>
                      — ₹<fmt:formatNumber value="${row.sub.amount}" pattern="#,##0.00"/>
                    </p>
                  </div>
                </div>
              </c:if>
            </c:forEach>
          </div>
        </div>
      </c:if>

      <%-- ── Subscription Cards ── --%>
      <div>
        <div class="flex items-center justify-between mb-md">
          <h3 class="font-headline-sm text-headline-sm text-on-surface">All Subscriptions</h3>
          <span class="font-label-md text-label-md text-on-surface-variant">${subscriptionRows.size()} total</span>
        </div>

        <c:choose>
          <c:when test="${not empty subscriptionRows}">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-gutter">
              <c:forEach var="row" items="${subscriptionRows}">
                <div class="bg-white border border-outline-variant rounded-xl p-gutter hover:shadow-md transition-shadow group relative overflow-hidden
                  ${row.sub.status == 'PAUSED' ? 'opacity-75' : ''}">

                  <%-- Card top --%>
                  <div class="flex justify-between items-start mb-md">
                    <%-- <div class="w-12 h-12 rounded-xl bg-surface-container-low flex items-center justify-center text-primary">
                      <span class="material-symbols-outlined text-3xl" style="font-variation-settings:'FILL' 1">
                        <c:choose>
                          <c:when test="${row.sub.category == 'Streaming'}">play_circle</c:when>
                          <c:when test="${row.sub.category == 'Health & Fitness'}">fitness_center</c:when>
                          <c:when test="${row.sub.category == 'Utilities'}">wifi</c:when>
                          <c:when test="${row.sub.category == 'Software & SaaS'}">devices</c:when>
                          <c:when test="${row.sub.category == 'Education'}">school</c:when>
                          <c:otherwise>subscriptions</c:otherwise>
                        </c:choose>
                      </span>
                    </div> --%>
                    <c:choose>
                      <c:when test="${row.sub.status == 'ACTIVE'}">
                        <span class="bg-primary-fixed text-on-primary-fixed-variant px-3 py-1 rounded-full text-xs font-bold uppercase">Active</span>
                      </c:when>
                      <c:otherwise>
                        <span class="bg-outline-variant text-on-surface-variant px-3 py-1 rounded-full text-xs font-bold uppercase">Paused</span>
                      </c:otherwise>
                    </c:choose>
                  </div>

                  <%-- Name + category --%>
                  <div>
                    <h4 class="font-headline-sm text-headline-sm"><c:out value="${row.sub.subscriptionName}"/></h4>
                    <%-- <p class="font-body-sm text-body-sm text-outline mt-0.5"><c:out value="${row.sub.category}"/></p> --%>
                  </div>

                  <%-- Billing info --%>
                  <div class="mt-lg flex justify-between items-end">
                    <div>
                      <p class="font-label-sm text-label-sm text-outline uppercase tracking-wider">
                        <c:choose>
                          <c:when test="${row.sub.status == 'ACTIVE'}">Next bill</c:when>
                          <c:otherwise>Status</c:otherwise>
                        </c:choose>
                      </p>
                      <p class="font-body-md text-body-md font-bold text-on-surface">
                        <c:choose>
                          <c:when test="${row.sub.status == 'ACTIVE'}">
                            <c:out value="${row.dueDateStr}"/>
                            <c:if test="${row.daysUntil <= 3}">
                              <span class="ml-1 text-[10px] bg-yellow-100 text-yellow-700 px-1.5 py-0.5 rounded-full font-bold">
                                <c:choose>
                                  <c:when test="${row.daysUntil == 0}">Today</c:when>
                                  <c:when test="${row.daysUntil == 1}">Tomorrow</c:when>
                                  <c:otherwise>${row.daysUntil}d</c:otherwise>
                                </c:choose>
                              </span>
                            </c:if>
                          </c:when>
                          <c:otherwise>Paused</c:otherwise>
                        </c:choose>
                      </p>
                    </div>
                    <%-- <p class="font-headline-sm text-headline-sm ${row.sub.status == 'ACTIVE' ? 'text-primary' : 'text-outline'}">
                      ₹<fmt:formatNumber value="${row.sub.amount}" pattern="#,##0.00"/>
                      <span class="text-sm font-normal text-outline">/<c:out value="${row.sub.dueDateCycle != null ? row.sub.dueDate.toLowerCase().substring(0,2) : 'mo'}"/></span>
                    </p> --%>
                  </div>

                  <%-- Bottom controls --%>
                  <div class="mt-md pt-md border-t border-outline-variant flex justify-between items-center">

                    <%-- Reminder toggle 
                    <form action="/subscriptions/${row.sub.subscriptionId}/reminder" method="post"
                    style="display:inline;">
                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                      <button type="submit" class="flex items-center gap-2 cursor-pointer group/rem">
                        <div class="toggle-track ${row.sub.reminderDaysBefore > 0 ? 'on' : 'off'}">
                          <div class="toggle-thumb"></div>
                        </div>
                        <span class="font-label-md text-label-md ${row.sub.reminderDaysBefore > 0 ? 'text-on-surface-variant' : 'text-outline'}">
                          Reminders
                        </span>
                      </button>
                    </form>--%>

                    <%-- Action buttons --%>
                    <div class="flex items-center gap-1">
                      <%-- Pause/Resume --%>
                      <form action="/subscriptions/${row.sub.subscriptionId}/toggle" method="post" style="display:inline;">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit"
                          class="p-2 rounded-full hover:bg-surface-container-high transition-colors text-outline hover:text-primary"
                          title="${row.sub.status == 'ACTIVE' ? 'Pause' : 'Resume'}">
                          <span class="material-symbols-outlined text-[20px]">
                            ${row.sub.status == 'ACTIVE' ? 'pause_circle' : 'play_circle'}
                          </span>
                        </button>
                      </form>
                      <%-- Delete --%>
                      <form action="/subscriptions/${row.sub.subscriptionId}/delete" method="post"
                        onsubmit="return confirm('Delete this subscription?');" style="display:inline;">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit"
                          class="p-2 rounded-full hover:bg-error-container/20 transition-colors text-outline hover:text-error">
                          <span class="material-symbols-outlined text-[20px]">delete</span>
                        </button>
                      </form>
                    </div>
                  </div>
                </div>
              </c:forEach>

              <%-- Dashed add card --%>
              <a href="/subscriptions/add"
                class="border-2 border-dashed border-outline-variant rounded-xl p-gutter flex flex-col items-center justify-center gap-3 text-on-surface-variant hover:border-primary hover:text-primary transition-all min-h-[220px]">
                <span class="material-symbols-outlined text-4xl">add_circle</span>
                <p class="font-label-lg text-label-lg">Add Subscription</p>
              </a>
            </div>
          </c:when>
          <c:otherwise>
            <div class="flex flex-col items-center justify-center py-20 text-on-surface-variant">
              <span class="material-symbols-outlined text-5xl mb-4 text-outline">subscriptions</span>
              <p class="font-body-md text-body-md mb-4">No subscriptions yet.</p>
              <a href="/subscriptions/add" class="px-6 py-3 bg-primary text-white rounded-lg font-label-lg hover:opacity-90 transition-all">
                + Add Your First Subscription
              </a>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </main>
</div>

<%-- Mobile FAB --%>
<a href="/subscriptions/add"
  class="fixed bottom-gutter right-gutter w-14 h-14 bg-primary text-white rounded-full shadow-lg flex items-center justify-center hover:scale-110 active:scale-95 transition-all z-50 md:hidden">
  <span class="material-symbols-outlined">add</span>
</a>
</body>
</html>
