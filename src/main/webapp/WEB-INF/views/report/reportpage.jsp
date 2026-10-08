<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <title>WealthWise | Reports & Analytics</title>
  <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
  <style>
    .material-symbols-outlined { font-variation-settings:'FILL' 0,'wght' 400,'GRAD' 0,'opsz' 24; vertical-align:middle; }
    body { font-family:'Inter',sans-serif; background-color:#f9f9ff; }
    ::-webkit-scrollbar { width:6px; }
    ::-webkit-scrollbar-thumb { background:#bec9c2; border-radius:10px; }

    /* Bar hover */
    .chart-bar { transition: opacity 0.15s, filter 0.15s; cursor:pointer; }
    .chart-bar:hover { opacity:0.75; filter:brightness(1.15); }

    /* Tooltip */
    .bar-tooltip {
      position:absolute; background:#151c27; color:#fff;
      font-size:11px; font-weight:600; padding:4px 8px; border-radius:6px;
      pointer-events:none; white-space:nowrap; z-index:10;
      transform:translateX(-50%); display:none;
    }
    .bar-group:hover .bar-tooltip { display:block; }
  </style>
  <script id="tailwind-config">
    tailwind.config={darkMode:"class",theme:{extend:{colors:{
      "surface-container-low":"#f0f3ff","surface-container-high":"#e2e8f8",
      "surface-container-lowest":"#ffffff","surface-container":"#e7eefe",
      "surface-container-highest":"#dce2f3","surface-dim":"#d3daea","surface-bright":"#f9f9ff",
      primary:"#004532","primary-fixed":"#a6f2d1","primary-fixed-dim":"#8bd6b6",
      "primary-container":"#065f46","on-primary":"#ffffff",
      "on-primary-fixed":"#002116","on-primary-fixed-variant":"#00513b","on-primary-container":"#8bd6b7",
      secondary:"#a83639","secondary-fixed":"#ffdad8",
      "secondary-container":"#fe7676","on-secondary":"#ffffff","on-secondary-container":"#720b17",
      tertiary:"#003980","on-tertiary":"#ffffff",
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
<body class="bg-background text-on-background font-body-md min-h-screen">

  <%-- ── Sidebar ── --%>
  <%
    String uri = request.getRequestURI();
    String active   = "flex items-center gap-sm bg-primary-container text-on-primary-container rounded-lg px-4 py-3 mx-2 cursor-pointer transition-all";
    String inactive = "flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 mx-2 cursor-pointer transition-all";
  %>
  <aside class="fixed left-0 top-0 h-screen w-64 bg-white border-r border-outline-variant hidden md:flex flex-col py-md gap-xs z-40">
    <div class="px-gutter mb-lg">
      <h2 class="font-headline-sm text-headline-sm font-bold text-primary">WealthWise</h2>
      <p class="font-body-sm text-body-sm text-outline">Financial Clarity</p>
    </div>
    <nav class="flex-grow space-y-1">
      <a class="<%= inactive %>" href="/home"><span class="material-symbols-outlined">home</span><span class="font-label-lg text-label-lg">Home</span></a>
      <a class="<%= inactive %>" href="/transactions"><span class="material-symbols-outlined">list_alt</span><span class="font-label-lg text-label-lg">Transactions</span></a>
      <a class="<%= inactive %>" href="/budget"><span class="material-symbols-outlined">account_balance_wallet</span><span class="font-label-lg text-label-lg">Budget</span></a>
      <a class="<%= inactive %>" href="/goals"><span class="material-symbols-outlined">stars</span><span class="font-label-lg text-label-lg">Goals</span></a>
      <a class="<%= inactive %>" href="/subscriptions"><span class="material-symbols-outlined">subscriptions</span><span class="font-label-lg text-label-lg">Subscriptions</span></a>
      <a class="<%= active %>" href="/report"><span class="material-symbols-outlined">assessment</span><span class="font-label-lg text-label-lg">Reports</span></a>
    </nav>
    <div class="mt-auto px-2">
      <a class="flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 transition-all" href="/logout">
        <span class="material-symbols-outlined">logout</span><span class="font-label-lg text-label-lg">Logout</span>
      </a>
    </div>
  </aside>

  <div class="flex">
    <main class="flex-grow md:ml-64 p-gutter md:p-margin-desktop">

      <%-- Top bar --%>
      <header class="bg-surface shadow-sm flex justify-between items-center w-full h-16 px-gutter sticky top-0 z-50 -mx-gutter md:-mx-margin-desktop mb-lg px-gutter md:px-margin-desktop">
        <h1 class="font-headline-md text-headline-md font-bold text-primary">WealthWise</h1>
        <div class="flex items-center gap-md">
          <a href="/subscriptions" class="hover:bg-surface-container-low p-2 rounded-full transition-colors">
            <span class="material-symbols-outlined text-primary">notifications</span>
          </a>
          <div class="w-10 h-10 rounded-full bg-primary flex items-center justify-center text-white font-bold text-sm">
            ${userName != null ? userName.substring(0,1).toUpperCase() : "U"}
          </div>
        </div>
      </header>

      <header class="mb-lg">
        <h1 class="font-headline-lg text-headline-lg text-on-background mb-xs">Reports &amp; Analytics</h1>
        <p class="font-body-md text-body-md text-on-surface-variant">Analyze your financial performance and export your data.</p>
      </header>

      <div class="grid grid-cols-12 gap-gutter">

        <%-- ══════════════════════════════════════════
             MONTHLY SPENDING BAR CHART — col-span 8
        ══════════════════════════════════════════ --%>
        <div class="col-span-12 lg:col-span-8 bg-white rounded-xl border border-outline-variant shadow-sm p-md">
          <div class="flex justify-between items-center mb-lg">
            <h3 class="font-headline-sm text-headline-sm">Monthly Spending</h3>
            <div class="flex gap-sm">
              <a href="/report?months=6"
                class="px-3 py-1 rounded-full font-label-md transition-colors
                  ${selectedMonths == 6 ? 'bg-primary text-white' : 'bg-surface-container-low hover:bg-surface-container'}">
                6 Months
              </a>
              <a href="/report?months=12"
                class="px-3 py-1 rounded-full font-label-md transition-colors
                  ${selectedMonths == 12 ? 'bg-primary text-white' : 'bg-surface-container-low hover:bg-surface-container'}">
                12 Months
              </a>
            </div>
          </div>

          <%-- Legend --%>
          <div class="flex gap-md mb-md">
            <span class="flex items-center gap-xs font-label-md text-on-surface-variant">
              <span class="w-3 h-3 rounded-full bg-primary inline-block"></span> Income
            </span>
            <span class="flex items-center gap-xs font-label-md text-on-surface-variant">
              <span class="w-3 h-3 rounded-full bg-secondary inline-block"></span> Expenses
            </span>
          </div>
          
          <c:choose>
            <c:when test="${not empty monthlySpending}">
              <%-- Bar chart --%>
              <div class="h-64 w-full flex items-end gap-1 px-2 pb-4 border-b border-outline-variant relative">
                <%-- Y-axis grid lines --%>
                <div class="absolute inset-0 flex flex-col justify-between py-4 pointer-events-none opacity-20">
                  <div class="border-t border-outline w-full"></div>
                  <div class="border-t border-outline w-full"></div>
                  <div class="border-t border-outline w-full"></div>
                  <div class="border-t border-outline w-full"></div>
                </div>
                <div class="flex-grow flex items-end justify-around h-full gap-1 relative z-10">
                  <c:forEach var="m" items="${monthlySpending}">
                    <div class="flex flex-col items-center gap-0.5 h-full justify-end bar-group relative">
                      <%-- Tooltip --%>
                      <div class="bar-tooltip -top-8">
                        ₹<fmt:formatNumber value="${m.income}" pattern="#,##0"/> in /
                        ₹<fmt:formatNumber value="${m.spent}" pattern="#,##0"/> out
                      </div>
                      <%-- Income bar (lighter) --%>
                      <div class="chart-bar w-4 rounded-t-sm bg-primary-fixed-dim"
                        style="height: ${m.incomePct}%"
                        title="Income: ₹${m.income}"></div>
                      <%-- Expense bar (darker) --%>
                      <div class="chart-bar w-4 rounded-t-sm bg-secondary"
                        style="height:${m.spentPct}%; opacity:0.75"
                        title="Expenses: ₹${m.spent}"></div>
                    </div>
                  </c:forEach>
                </div>
              </div>

              <%-- X-axis labels --%>
              <div class="flex justify-around mt-3 px-2">
                <c:forEach var="m" items="${monthlySpending}">
                  <span class="font-label-sm text-outline text-center" style="min-width:30px">
                    <c:out value="${m.shortLabel}"/>
                  </span>
                </c:forEach>
              </div>
            </c:when>
            <c:otherwise>
              <div class="h-64 flex items-center justify-center text-on-surface-variant font-body-sm">
                No transaction data yet.
                <a href="/transactions/add" class="text-primary hover:underline ml-1">Add a transaction →</a>
              </div>
            </c:otherwise>
          </c:choose>
        </div>

        <%-- ══════════════════════════════════════════
             CATEGORY DONUT — col-span 4
        ══════════════════════════════════════════ --%>
        <div class="col-span-12 lg:col-span-4 bg-white rounded-xl border border-outline-variant shadow-sm p-md">
          <h3 class="font-headline-sm text-headline-sm mb-lg">Category Distribution</h3>

          <c:choose>
            <c:when test="${not empty categoryBreakdown}">
              <div class="flex flex-col items-center justify-center py-sm">
                <%-- Donut SVG — segments drawn from categoryBreakdown --%>
                <div class="relative w-48 h-48 mb-md">
                  <svg class="w-full h-full -rotate-90" viewBox="0 0 100 100">
                    <%-- Background ring --%>
                    <circle cx="50" cy="50" r="42" fill="transparent"
                      stroke="#e2e8f8" stroke-width="14"/>
                    <%-- Colored segments --%>
                    <c:forEach var="cat" items="${categoryBreakdown}">
                      <circle cx="50" cy="50" r="42" fill="transparent"
                        stroke="${cat.color}"
                        stroke-width="14"
                        stroke-dasharray="${cat.dash} 263.9"
                        stroke-dashoffset="${cat.dashOffset}"/>
                    </c:forEach>
                  </svg>
                  <%-- Center label --%>
                  <div class="absolute inset-0 flex flex-col items-center justify-center">
                    <p class="font-headline-sm text-headline-sm text-on-surface">
                      ₹<fmt:formatNumber value="${totalSpent}" pattern="#,##0"/>
                    </p>
                    <p class="font-label-md text-label-md text-outline">Total Spent</p>
                  </div>
                </div>

                <%-- Legend --%>
                <div class="w-full space-y-sm">
                  <c:forEach var="cat" items="${categoryBreakdown}">
                    <div class="flex justify-between items-center">
                      <div class="flex items-center gap-xs">
                        <span class="w-3 h-3 rounded-full inline-block flex-shrink-0"
                          style="background:${cat.color}"></span>
                        <span class="font-label-lg text-on-surface truncate max-w-[120px]">
                          <c:out value="${cat.name}"/>
                        </span>
                      </div>
                      <div class="text-right flex-shrink-0 ml-2">
                        <span class="font-label-lg text-on-surface">${cat.percent}%</span>
                        <span class="font-label-sm text-outline ml-1">
                          ₹<fmt:formatNumber value="${cat.amount}" pattern="#,##0"/>
                        </span>
                      </div>
                    </div>
                  </c:forEach>
                </div>
              </div>
            </c:when>
            <c:otherwise>
              <div class="flex flex-col items-center justify-center py-16 text-on-surface-variant font-body-sm">
                <span class="material-symbols-outlined text-4xl text-outline mb-3">pie_chart</span>
                No expense data yet.
              </div>
            </c:otherwise>
          </c:choose>
        </div>

        <%-- ══════════════════════════════════════════
             CASH FLOW LINE CHART — col-span 12
        ══════════════════════════════════════════ --%>
        <div class="col-span-12 bg-white rounded-xl border border-outline-variant shadow-sm p-md">
          <div class="flex justify-between items-start mb-lg">
            <div>
              <h3 class="font-headline-sm text-headline-sm">Cash Flow Analysis</h3>
              <p class="font-body-sm text-on-surface-variant">Monthly income vs. expenses</p>
            </div>
            <div class="text-right">
              <c:choose>
                <c:when test="${cashFlow.net >= 0}">
                  <h2 class="font-headline-md text-headline-md text-primary">
                    +₹<fmt:formatNumber value="${cashFlow.net}" pattern="#,##0.00"/>
                  </h2>
                  <p class="font-label-sm text-primary">This month's net</p>
                </c:when>
                <c:otherwise>
                  <h2 class="font-headline-md text-headline-md text-secondary">
                    -₹<fmt:formatNumber value="${cashFlow.net.abs()}" pattern="#,##0.00"/>
                  </h2>
                  <p class="font-label-sm text-secondary">This month's net</p>
                </c:otherwise>
              </c:choose>
            </div>
          </div>

          <%-- Summary strip --%>
          <div class="grid grid-cols-3 gap-gutter mb-md">
            <div class="bg-surface-container-low rounded-xl p-md text-center">
              <p class="font-label-md text-label-md text-on-surface-variant mb-1">Income</p>
              <p class="font-headline-sm text-headline-sm text-primary">
                ₹<fmt:formatNumber value="${cashFlow.income}" pattern="#,##0.00"/>
              </p>
            </div>
            <div class="bg-surface-container-low rounded-xl p-md text-center">
              <p class="font-label-md text-label-md text-on-surface-variant mb-1">Expenses</p>
              <p class="font-headline-sm text-headline-sm text-secondary">
                ₹<fmt:formatNumber value="${cashFlow.expenses}" pattern="#,##0.00"/>
              </p>
            </div>
            <div class="bg-surface-container-low rounded-xl p-md text-center">
              <p class="font-label-md text-label-md text-on-surface-variant mb-1">Net</p>
              <p class="font-headline-sm text-headline-sm
                ${cashFlow.net >= 0 ? 'text-primary' : 'text-secondary'}">
                <c:choose>
                  <c:when test="${cashFlow.net >= 0}">+</c:when>
                  <c:otherwise>-</c:otherwise>
                </c:choose>
                ₹<fmt:formatNumber value="${cashFlow.net.abs()}" pattern="#,##0.00"/>
              </p>
            </div>
          </div>

          <%-- SVG Line chart — paths pre-built in ReportService --%>
          <div class="h-56 w-full relative overflow-hidden rounded-lg bg-surface-container-lowest border border-outline-variant">
            <svg class="w-full h-full" preserveAspectRatio="none" viewBox="0 0 1000 200">
              <%-- Area fills --%>
              <path d="${cashFlowPaths.incomePath} L1000,200 L0,200 Z"
                fill="#004532" fill-opacity="0.08"/>
              <path d="${cashFlowPaths.expensePath} L1000,200 L0,200 Z"
                fill="#a83639" fill-opacity="0.08"/>
              <%-- Lines --%>
              <path d="${cashFlowPaths.incomePath}"
                fill="none" stroke="#004532" stroke-width="3" stroke-linecap="round"/>
              <path d="${cashFlowPaths.expensePath}"
                fill="none" stroke="#a83639" stroke-width="3" stroke-linecap="round" opacity="0.8"/>
              <%-- Grid lines --%>
              <line x1="0" y1="50"  x2="1000" y2="50"  stroke="#bec9c2" stroke-width="0.5" opacity="0.5"/>
              <line x1="0" y1="100" x2="1000" y2="100" stroke="#bec9c2" stroke-width="0.5" opacity="0.5"/>
              <line x1="0" y1="150" x2="1000" y2="150" stroke="#bec9c2" stroke-width="0.5" opacity="0.5"/>
            </svg>
            <%-- Legend overlay --%>
            <div class="absolute top-3 right-4 flex gap-md bg-white/90 px-3 py-2 rounded-lg border border-outline-variant">
              <span class="flex items-center gap-xs font-label-md">
                <span class="w-3 h-3 rounded-full bg-primary inline-block"></span> Income
              </span>
              <span class="flex items-center gap-xs font-label-md">
                <span class="w-3 h-3 rounded-full bg-secondary inline-block"></span> Expenses
              </span>
            </div>
          </div>
          <%-- X-axis labels --%>
          <div class="flex justify-between mt-3 font-label-sm text-outline">
            <span><c:out value="${cashFlowPaths.xFirst}"/></span>
            <span><c:out value="${cashFlowPaths.xMid}"/></span>
            <span><c:out value="${cashFlowPaths.xLast}"/></span>
          </div>
        </div>

        <%-- ══════════════════════════════════════════
             EXPORT — col-span 12
        ══════════════════════════════════════════ --%>
        <div class="col-span-12 flex flex-col sm:flex-row items-center justify-center gap-md mt-md">
          <a href="/report/export/csv"
            class="flex items-center gap-sm px-gutter py-3 bg-primary text-white rounded-full font-label-lg hover:opacity-90 active:scale-95 transition-all shadow-lg shadow-primary/20">
            <span class="material-symbols-outlined">download</span>
            Export as CSV
          </a>
          <a href="/transactions"
            class="flex items-center gap-sm px-gutter py-3 border border-primary text-primary rounded-full font-label-lg hover:bg-surface-container-low transition-all">
            <span class="material-symbols-outlined">list_alt</span>
            View All Transactions
          </a>
        </div>

      </div><%-- /grid --%>
    </main>
  </div>

  <%-- Mobile Bottom Nav --%>
  <nav class="md:hidden fixed bottom-0 left-0 w-full bg-white border-t border-outline-variant px-6 py-2 flex justify-around items-center z-50">
    <a class="flex flex-col items-center gap-1 text-on-surface-variant" href="/home">
      <span class="material-symbols-outlined">home</span><span class="font-label-sm text-label-sm">Home</span>
    </a>
    <a class="flex flex-col items-center gap-1 text-on-surface-variant" href="/transactions">
      <span class="material-symbols-outlined">list_alt</span><span class="font-label-sm text-label-sm">Trans.</span>
    </a>
    <a class="flex flex-col items-center gap-1 text-primary" href="/report">
      <span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">assessment</span>
      <span class="font-label-sm text-label-sm">Reports</span>
    </a>
    <a class="flex flex-col items-center gap-1 text-on-surface-variant" href="/logout">
      <span class="material-symbols-outlined">logout</span><span class="font-label-sm text-label-sm">Logout</span>
    </a>
  </nav>

  <script>
    // Bar hover tooltip position
    document.querySelectorAll('.bar-group').forEach(g => {
      const tooltip = g.querySelector('.bar-tooltip');
      if (!tooltip) return;
      g.addEventListener('mouseenter', e => {
        tooltip.style.display = 'block';
        tooltip.style.top     = '-36px';
        tooltip.style.left    = '50%';
      });
      g.addEventListener('mouseleave', () => {
        tooltip.style.display = 'none';
      });
    });
  </script>
</body>
</html>
