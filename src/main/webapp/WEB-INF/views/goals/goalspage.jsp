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

    /* ── Slider ── */
    .goal-slider {
      -webkit-appearance:none; appearance:none;
      width:100%; height:6px; border-radius:9999px;
      background:transparent; outline:none; cursor:pointer;
      position:relative; z-index:2;
    }
    .goal-slider::-webkit-slider-thumb {
      -webkit-appearance:none; appearance:none;
      width:20px; height:20px; border-radius:50%;
      background:#004532; cursor:pointer;
      border:2px solid #fff;
      box-shadow:0 1px 4px rgba(0,0,0,0.25);
      transition:transform 0.15s ease;
    }
    .goal-slider::-webkit-slider-thumb:hover { transform:scale(1.2); }
    .goal-slider::-moz-range-thumb {
      width:20px; height:20px; border-radius:50%;
      background:#004532; border:2px solid #fff;
      box-shadow:0 1px 4px rgba(0,0,0,0.25); cursor:pointer;
    }
    .goal-slider:disabled { opacity:0.35; cursor:not-allowed; }
    .goal-slider:disabled::-webkit-slider-thumb { cursor:not-allowed; }

    .slider-wrap { position:relative; height:20px; display:flex; align-items:center; }
    .slider-track {
      position:absolute; left:0; right:0;
      height:6px; border-radius:9999px; background:#e2e8f8;
    }
    .slider-fill {
      position:absolute; left:0; top:0;
      height:6px; border-radius:9999px;
      background:#004532; pointer-events:none;
      transition:width 0.08s linear;
    }
  </style>
  <script id="tailwind-config">
    tailwind.config={darkMode:"class",theme:{extend:{colors:{
      "surface-container-low":"#f0f3ff","surface-container-high":"#e2e8f8",
      "surface-container-lowest":"#ffffff","surface-container":"#e7eefe",
      "surface-container-highest":"#dce2f3",
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

  <%-- ── Main ── --%>
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

      <%-- Flash --%>
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
          <p class="font-body-md text-body-md text-on-surface-variant mt-1">Track and fund your savings milestones.</p>
        </div>
        <a href="/goals/add"
          class="px-6 py-2.5 bg-primary text-white font-label-lg rounded-lg hover:opacity-90 active:scale-95 transition-all flex items-center gap-2 shadow-lg shadow-primary/20">
          <span class="material-symbols-outlined text-sm">add</span> New Goal
        </a>
      </div>

      <%-- ── Balance Summary Strip ── --%>
      <div class="grid grid-cols-1 sm:grid-cols-3 gap-gutter mb-lg">

        <div class="bg-white rounded-xl border border-outline-variant shadow-sm p-md">
          <p class="font-label-md text-label-md text-on-surface-variant mb-1">Current Balance</p>
          <p class="font-headline-sm text-headline-sm font-bold
            <c:choose><c:when test="${belowMinimum}">text-secondary</c:when><c:otherwise>text-primary</c:otherwise></c:choose>">
            ₹<fmt:formatNumber value="${balance}" pattern="#,##0.00"/>
          </p>
          <c:if test="${belowMinimum}">
            <p class="font-label-sm text-secondary mt-1">Below ₹1,000 minimum</p>
          </c:if>
        </div>

        <div class="bg-white rounded-xl border border-outline-variant shadow-sm p-md">
          <p class="font-label-md text-label-md text-on-surface-variant mb-1">Available to Allocate</p>
          <p class="font-headline-sm text-headline-sm font-bold text-on-surface">
            ₹<fmt:formatNumber value="${allocatable}" pattern="#,##0.00"/>
          </p>
          <p class="font-label-sm text-on-surface-variant mt-1">Balance kept above ₹1,000</p>
        </div>

        <div class="rounded-xl border shadow-sm p-md flex items-center gap-3
          <c:choose><c:when test="${belowMinimum}">bg-error-container border-secondary/20</c:when><c:otherwise>bg-surface-container-low border-outline-variant</c:otherwise></c:choose>">
          <span class="material-symbols-outlined
            <c:choose><c:when test="${belowMinimum}">text-secondary</c:when><c:otherwise>text-primary</c:otherwise></c:choose>"
            style="font-variation-settings:'FILL' 1">
            <c:choose><c:when test="${belowMinimum}">warning</c:when><c:otherwise>lock</c:otherwise></c:choose>
          </span>
          <div>
            <p class="font-label-lg text-label-lg
              <c:choose><c:when test="${belowMinimum}">text-secondary</c:when><c:otherwise>text-primary</c:otherwise></c:choose>">
              <c:choose><c:when test="${belowMinimum}">Funding locked</c:when><c:otherwise>Reserve active</c:otherwise></c:choose>
            </p>
            <p class="font-body-sm text-on-surface-variant text-[12px]">
              <c:choose>
                <c:when test="${belowMinimum}">Add income to unlock goal funding.</c:when>
                <c:otherwise>₹1,000 is always kept in reserve.</c:otherwise>
              </c:choose>
            </p>
          </div>
        </div>
      </div>

      <%-- ── Goals Grid ── --%>
      <c:choose>
        <c:when test="${not empty goalRows}">
          <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-gutter">
            <c:forEach var="row" items="${goalRows}">
              <div class="bg-white rounded-xl border border-outline-variant shadow-sm p-6 flex flex-col gap-4 hover:shadow-md transition-shadow group">

                <%-- Top: Ring + info --%>
                <div class="flex items-center gap-gutter">
                  <div class="relative w-24 h-24 flex-shrink-0">
                    <svg class="w-full h-full transform -rotate-90">
                      <circle class="text-surface-container-highest" cx="48" cy="48"
                        fill="transparent" r="40" stroke="currentColor" stroke-width="8"/>
                      <circle cx="48" cy="48" fill="transparent" r="40"
                        stroke="#004532" stroke-width="8"
                        stroke-dasharray="251.2"
                        stroke-dashoffset="${row.dashOffset}"
                        style="transition:stroke-dashoffset 1s ease-out"/>
                    </svg>
                    <div class="absolute inset-0 flex items-center justify-center">
                      <span class="font-bold text-primary text-sm">${row.percent}%</span>
                    </div>
                  </div>

                  <div class="flex-1 min-w-0">
                    <div class="flex justify-between items-start gap-2">
                      <h3 class="font-headline-sm text-headline-sm text-on-surface truncate">
                        <c:out value="${row.goal.goalName}"/>
                      </h3>
                      <c:choose>
                        <c:when test="${row.goal.status == 'COMPLETED'}">
                          <span class="px-2 py-0.5 bg-primary-fixed text-on-primary-fixed-variant text-label-sm rounded-full flex-shrink-0">DONE</span>
                        </c:when>
                        <c:when test="${row.percent >= 80}">
                          <span class="px-2 py-0.5 bg-yellow-100 text-yellow-800 text-label-sm rounded-full flex-shrink-0">NEAR</span>
                        </c:when>
                      </c:choose>
                    </div>
                    <p class="font-body-sm text-body-sm text-on-surface-variant mt-1">
                      Saved <strong>₹<fmt:formatNumber value="${row.goal.currentAmount}" pattern="#,##0"/></strong>
                      of ₹<fmt:formatNumber value="${row.goal.targetAmount}" pattern="#,##0"/>
                    </p>
                    <%-- targetDateStr is pre-formatted in controller — no fmt:formatDate needed --%>
                    <p class="font-label-sm text-on-surface-variant">
                      Target: <c:out value="${row.targetDateStr}"/>
                    </p>
                    <p class="font-label-sm text-on-surface-variant">
                      Still needed: ₹<fmt:formatNumber value="${row.remaining}" pattern="#,##0.00"/>
                    </p>
                  </div>
                </div>

                <%-- Slider + Fund section --%>
                <c:choose>

                  <%-- Completed goal --%>
                  <c:when test="${row.goal.status == 'COMPLETED'}">
                    <div class="border-t border-outline-variant pt-3 flex items-center gap-2 text-primary">
                      <span class="material-symbols-outlined text-[20px]" style="font-variation-settings:'FILL' 1">check_circle</span>
                      <span class="font-label-lg text-label-lg">Goal Achieved!</span>
                    </div>
                  </c:when>

                  <%-- Balance too low — locked --%>
                  <c:when test="${belowMinimum}">
                    <div class="border-t border-outline-variant pt-3 space-y-3">
                      <div class="flex items-center gap-2 rounded-lg bg-error-container/70 px-3 py-2 text-on-error-container">
                        <span class="material-symbols-outlined text-[18px]">lock</span>
                        <p class="font-label-md text-label-md">Balance below ₹1,000 — funding locked</p>
                      </div>
                      <div class="slider-wrap opacity-40 pointer-events-none">
                        <div class="slider-track"><div class="slider-fill" style="width:0%"></div></div>
                        <input type="range" class="goal-slider" min="0" max="0" value="0" disabled/>
                      </div>
                      <button disabled type="button"
                        class="w-full py-2.5 rounded-lg font-label-md text-label-md bg-surface-container-high text-on-surface-variant opacity-50 cursor-not-allowed">
                        Add Funds
                      </button>
                    </div>
                  </c:when>

                  <%-- Normal — interactive slider --%>
                  <c:otherwise>
                    <div class="border-t border-outline-variant pt-3 space-y-3">

                      <%-- Slider UI --%>
                      <div>
                        <div class="flex justify-between items-center mb-2">
                          <span class="font-label-md text-label-md text-on-surface-variant">How much to add?</span>
                          <span class="font-label-lg text-label-lg text-primary font-bold"
                            id="disp-${row.goal.goalId}">₹0</span>
                        </div>

                        <div class="slider-wrap">
                          <div class="slider-track">
                            <div class="slider-fill" id="fill-${row.goal.goalId}" style="width:0%"></div>
                          </div>
                          <input type="range"
                            class="goal-slider"
                            id="slider-${row.goal.goalId}"
                            min="0"
                            max="${row.sliderMax}"
                            step="50"
                            value="0"
                            oninput="onSlider(`${row.goal.goalId}`, `${row.sliderMax}`, `${row.remaining}`)"/>
                        </div>

                        <div class="flex justify-between mt-1">
                          <span class="font-label-sm text-on-surface-variant">₹0</span>
                          <span class="font-label-sm text-on-surface-variant">
                            max ₹<fmt:formatNumber value="${row.sliderMax}" pattern="#,##0"/>
                          </span>
                        </div>

                        <%-- Shown when slider exceeds goal's remaining need --%>
                        <p class="font-label-sm text-yellow-700 mt-1 hidden" id="warn-${row.goal.goalId}">
                          Only ₹<fmt:formatNumber value="${row.remaining}" pattern="#,##0.00"/> is needed — extra will be capped.
                        </p>
                      </div>

                      <%-- Fund form --%>
                      <form action="/goals/${row.goal.goalId}/fund" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" name="amount" id="amt-${row.goal.goalId}" value="0"/>
                        <button type="submit"
                          id="btn-${row.goal.goalId}"
                          disabled
                          onclick="return preSubmit(`${row.goal.goalId}`)"
                          class="w-full py-2.5 rounded-lg font-label-md text-label-md transition-all
                            bg-surface-container-high text-on-surface-variant
                            disabled:opacity-50 disabled:cursor-not-allowed">
                          Add Funds
                        </button>
                      </form>

                      <%-- Live deduction preview --%>
                      <p class="font-label-sm text-on-surface-variant text-center hidden" id="preview-${row.goal.goalId}">
                        Balance after: <strong id="after-${row.goal.goalId}"></strong>
                      </p>
                    </div>
                  </c:otherwise>
                </c:choose>

                <%-- Delete (hover reveal) --%>
                <form action="/goals/${row.goal.goalId}/delete" method="post"
                  onsubmit="return confirm('Delete this goal? This cannot be undone.');"
                  class="opacity-0 group-hover:opacity-100 transition-opacity flex justify-end -mt-2">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                  <button type="submit" class="p-1.5 hover:bg-error-container/20 rounded-full text-error transition-colors" title="Delete goal">
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
            <a href="/goals/add" class="px-6 py-3 bg-primary text-white rounded-lg font-label-lg hover:opacity-90 transition-all">
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
  // Current balance injected from server — used for live preview
  const CURRENT_BALANCE = parseFloat("${balance}");

  function onSlider(goalId, sliderMax, remaining) {
    const slider   = document.getElementById('slider-'  + goalId);
    const display  = document.getElementById('disp-'    + goalId);
    const fill     = document.getElementById('fill-'    + goalId);
    const amtInput = document.getElementById('amt-'     + goalId);
    const btn      = document.getElementById('btn-'     + goalId);
    const warn     = document.getElementById('warn-'    + goalId);
    const preview  = document.getElementById('preview-' + goalId);
    const after    = document.getElementById('after-'   + goalId);

    const raw = parseFloat(slider.value) || 0;

    // Effective amount submitted = min(slider, remaining)
    const effective = Math.min(raw, remaining, sliderMax);
    amtInput.value  = effective.toFixed(2);

    // Display label (show raw slider value)
    display.textContent = '₹' + raw.toLocaleString('en-IN', {maximumFractionDigits: 0});

    // Track fill
    const pct = sliderMax > 0 ? (raw / sliderMax) * 100 : 0;
    fill.style.width = Math.min(pct, 100) + '%';

    // Button state
    if (raw > 0) {
      btn.disabled = false;
      btn.className = 'w-full py-2.5 rounded-lg font-label-md text-label-md transition-all bg-primary text-white hover:opacity-90 active:scale-95';
    } else {
      btn.disabled = true;
      btn.className = 'w-full py-2.5 rounded-lg font-label-md text-label-md transition-all bg-surface-container-high text-on-surface-variant disabled:opacity-50 disabled:cursor-not-allowed';
    }

    // Warn if exceeds remaining
    warn.classList.toggle('hidden', raw <= remaining);

    // Live balance preview
    if (raw > 0) {
      const balAfter = CURRENT_BALANCE - effective;
      after.textContent = '₹' + balAfter.toLocaleString('en-IN', {minimumFractionDigits: 2, maximumFractionDigits: 2});
      preview.classList.remove('hidden');
    } else {
      preview.classList.add('hidden');
    }
  }

  function preSubmit(goalId) {
    const amt = parseFloat(document.getElementById('amt-' + goalId).value);
    if (!amt || amt <= 0) {
      alert('Move the slider to choose an amount first.');
      return false;
    }
    return true;
  }
</script>
</body>
</html>
