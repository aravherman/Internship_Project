<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>WealthWise | Join the Future of Finance</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <style>
      .material-symbols-outlined { font-variation-settings: "FILL" 0, "wght" 400, "GRAD" 0, "opsz" 24; }
      body { font-family: "Inter", sans-serif; background-color: #f9f9ff; }
      .glass-card { background: rgba(255,255,255,0.95); backdrop-filter: blur(10px); }
      @keyframes float {
        0%, 100% { transform: translateY(0) translateX(0); opacity: 0.1; }
        50%       { transform: translateY(-50px) translateX(20px); opacity: 0.3; }
      }
    </style>
    <script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            colors: {
              "primary-fixed": "#a6f2d1", "primary-fixed-dim": "#8bd6b6",
              "surface-container-high": "#e2e8f8",
              "on-tertiary": "#ffffff", tertiary: "#003980",
              "on-secondary-container": "#720b17", "on-primary-fixed": "#002116",
              "on-secondary": "#ffffff", "tertiary-fixed": "#d8e2ff",
              "surface-container": "#e7eefe", "inverse-primary": "#8bd6b6",
              "error-container": "#ffdad6", "surface-bright": "#f9f9ff",
              "on-primary-container": "#8bd6b7", "on-error": "#ffffff",
              "surface-variant": "#dce2f3", "tertiary-container": "#004fac",
              error: "#ba1a1a", "tertiary-fixed-dim": "#adc6ff",
              "surface-dim": "#d3daea", "on-tertiary-fixed": "#001a42",
              "secondary-fixed-dim": "#ffb3b0", "primary-container": "#065f46",
              "on-primary": "#ffffff", "on-tertiary-container": "#aec7ff",
              "on-primary-fixed-variant": "#00513b", "surface-tint": "#1b6b51",
              "surface-container-low": "#f0f3ff", "on-surface": "#151c27",
              "on-surface-variant": "#3f4944", "inverse-surface": "#2a313d",
              "on-secondary-fixed": "#410006", "surface-container-lowest": "#ffffff",
              secondary: "#a83639", "secondary-fixed": "#ffdad8",
              "secondary-container": "#fe7676", "outline-variant": "#bec9c2",
              background: "#f9f9ff", surface: "#f9f9ff",
              outline: "#6f7973", "inverse-on-surface": "#ebf1ff",
              "on-error-container": "#93000a", "on-background": "#151c27",
              "surface-container-highest": "#dce2f3", primary: "#004532",
            },
            borderRadius: { DEFAULT: "0.25rem", lg: "0.5rem", xl: "0.75rem", full: "9999px" },
            spacing: {
              gutter: "24px", xs: "4px", md: "24px", "margin-mobile": "16px",
              lg: "40px", base: "8px", sm: "12px", "margin-desktop": "48px", xl: "64px",
            },
            fontFamily: { "headline-sm": ["Inter"], "label-lg": ["Inter"], "headline-md": ["Inter"], "headline-lg": ["Inter"], "label-md": ["Inter"], "body-sm": ["Inter"], "body-lg": ["Inter"], "label-sm": ["Inter"], "body-md": ["Inter"] },
            fontSize: {
              "headline-sm": ["20px", { lineHeight: "28px", fontWeight: "600" }],
              "label-lg": ["14px", { lineHeight: "20px", letterSpacing: "0.01em", fontWeight: "600" }],
              "headline-md": ["24px", { lineHeight: "32px", fontWeight: "600" }],
              "headline-lg": ["32px", { lineHeight: "40px", letterSpacing: "-0.02em", fontWeight: "700" }],
              "label-md": ["12px", { lineHeight: "16px", letterSpacing: "0.02em", fontWeight: "600" }],
              "body-sm": ["14px", { lineHeight: "20px", fontWeight: "400" }],
              "body-lg": ["18px", { lineHeight: "28px", fontWeight: "400" }],
              "label-sm": ["10px", { lineHeight: "12px", fontWeight: "700" }],
              "body-md": ["16px", { lineHeight: "24px", fontWeight: "400" }],
            },
          },
        },
      };
    </script>
  </head>
  <body class="bg-background text-on-background min-h-screen flex flex-col">
    <main class="flex-grow flex flex-col md:flex-row h-screen overflow-hidden">

      <!-- Left Column: Brand -->
      <div class="hidden md:flex md:w-1/2 lg:w-3/5 bg-primary overflow-hidden relative items-center justify-center p-xl">
        <div class="absolute inset-0 opacity-10 pointer-events-none">
          <svg height="100%" width="100%" xmlns="http://www.w3.org/2000/svg">
            <defs>
              <pattern height="40" id="grid" patternUnits="userSpaceOnUse" width="40">
                <path d="M 40 0 L 0 0 0 40" fill="none" stroke="white" stroke-width="1"></path>
              </pattern>
            </defs>
            <rect fill="url(#grid)" height="100%" width="100%"></rect>
          </svg>
        </div>
        <div class="relative z-10 max-w-xl">
          <div class="mb-sm flex items-center gap-xs">
            <span class="material-symbols-outlined text-primary-fixed text-4xl">account_balance_wallet</span>
            <span class="font-headline-md text-headline-md font-extrabold text-white tracking-tight">WealthWise</span>
          </div>
          <h1 class="font-headline-lg text-headline-lg text-white mb-md">Master your finances with surgical precision.</h1>
          <p class="font-body-lg text-body-lg text-primary-fixed-dim opacity-90 mb-lg leading-relaxed">
            Join over 50,000 users managing their wealth with clarity. Secure, intuitive, and designed for your growth.
          </p>
          <div class="grid grid-cols-2 gap-md">
            <div class="bg-primary-container/30 border border-primary-fixed/20 p-md rounded-xl backdrop-blur-sm">
              <span class="material-symbols-outlined text-primary-fixed mb-xs">trending_up</span>
              <div class="font-label-lg text-label-lg text-white">Smart Growth</div>
              <div class="font-body-sm text-body-sm text-primary-fixed-dim">AI-powered insights for your portfolio.</div>
            </div>
            <div class="bg-primary-container/30 border border-primary-fixed/20 p-md rounded-xl backdrop-blur-sm">
              <span class="material-symbols-outlined text-primary-fixed mb-xs">security</span>
              <div class="font-label-lg text-label-lg text-white">Bank-Grade</div>
              <div class="font-body-sm text-body-sm text-primary-fixed-dim">Multi-layer encryption for peace of mind.</div>
            </div>
          </div>
        </div>
        <img class="absolute inset-0 w-full h-full object-cover mix-blend-overlay opacity-30"
          src="https://lh3.googleusercontent.com/aida-public/AB6AXuAkD2cPO7SG1XgQVBYeBYwbT6z8pcctFQu5V7DERLt3j2kkfa0nUUE8FYA8B9KbsuIGE3XYf0jpPdAoYCk2uekzlDI-k9EClARNYqoAJt5u5L8a3J0ehLYJdi1_khmgLZdL-JrkGqZ_J65AJyFUUwQZVDtqi1JojaKMtdTyLJmQe__MxGpe2uW5sgh62yshzoYgP9IJlUDN8D2ynGfGvXn298SmsfG46BFbnKVoWFUlgC6wFjLb6kAW2U75dgxSwS7Q8_6o-AYbNA"/>
      </div>

      <!-- Right Column: Registration Form -->
      <div class="w-full md:w-1/2 lg:w-2/5 h-full overflow-y-auto bg-surface-container-lowest px-gutter py-xl flex flex-col justify-center">
        <div class="max-w-md mx-auto w-full">

          <!-- Mobile Header -->
          <div class="md:hidden mb-lg flex items-center gap-xs">
            <span class="material-symbols-outlined text-primary text-3xl">account_balance_wallet</span>
            <span class="font-headline-sm text-headline-sm font-bold text-primary">WealthWise</span>
          </div>

          <div class="mb-lg">
            <h2 class="font-headline-md text-headline-md text-on-surface mb-xs">Create your account</h2>
            <p class="font-body-md text-body-md text-on-surface-variant">Start your journey to financial clarity today.</p>
          </div>

          <%-- ── Flash messages ── --%>
          <% String error = (String) request.getAttribute("error"); %>
          <% if (error != null) { %>
          <div class="mb-md flex items-center gap-sm rounded-lg border border-error-container bg-error-container px-md py-3 text-on-error-container">
            <span class="material-symbols-outlined text-[20px]">error</span>
            <p class="font-body-sm"><%= error %></p>
          </div>
          <% } %>

          <%-- ── Register form ── --%>
          <form action="/register" method="post" class="space-y-sm" id="registration-form">

            <!-- Full Name -->
            <div class="space-y-xs">
              <label class="font-label-md text-label-md text-on-surface-variant" for="fullName">Full Name</label>
              <div class="relative group">
                <span class="absolute left-3 top-1/2 -translate-y-1/2 material-symbols-outlined text-outline text-lg transition-colors group-focus-within:text-primary">person</span>
                <input class="w-full pl-10 pr-4 py-3 bg-white border border-outline-variant rounded-lg font-body-md text-body-md focus:ring-2 focus:ring-primary-fixed focus:border-primary outline-none transition-all placeholder:text-outline-variant"
                  id="fullName" name="fullName" placeholder="John Doe" required type="text"
                  value="<%= request.getParameter("fullName") != null ? request.getParameter("fullName") : "" %>"/>
              </div>
            </div>

            <!-- Email -->
            <div class="space-y-xs">
              <label class="font-label-md text-label-md text-on-surface-variant" for="email">Email Address</label>
              <div class="relative group">
                <span class="absolute left-3 top-1/2 -translate-y-1/2 material-symbols-outlined text-outline text-lg transition-colors group-focus-within:text-primary">mail</span>
                <input class="w-full pl-10 pr-4 py-3 bg-white border border-outline-variant rounded-lg font-body-md text-body-md focus:ring-2 focus:ring-primary-fixed focus:border-primary outline-none transition-all placeholder:text-outline-variant"
                  id="email" name="email" placeholder="name@gmail.com" required type="email"
                  value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"/>
              </div>
            </div>

            <!-- Phone Number -->
            <div class="space-y-xs">
              <label class="font-label-md text-label-md text-on-surface-variant" for="phone">Phone Number</label>
              <div class="relative group">
                <span class="absolute left-3 top-1/2 -translate-y-1/2 material-symbols-outlined text-outline text-lg transition-colors group-focus-within:text-primary">call</span>
                <input class="w-full pl-10 pr-4 py-3 bg-white border border-outline-variant rounded-lg font-body-md text-body-md focus:ring-2 focus:ring-primary-fixed focus:border-primary outline-none transition-all placeholder:text-outline-variant"
                  id="phone" name="phone" placeholder="+91" type="tel"
                  value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>"/>
              </div>
            </div>

            <!-- Password -->
            <div class="space-y-xs">
              <label class="font-label-md text-label-md text-on-surface-variant" for="password">Password</label>
              <div class="relative group">
                <span class="absolute left-3 top-1/2 -translate-y-1/2 material-symbols-outlined text-outline text-lg transition-colors group-focus-within:text-primary">lock</span>
                <input class="w-full pl-10 pr-12 py-3 bg-white border border-outline-variant rounded-lg font-body-md text-body-md focus:ring-2 focus:ring-primary-fixed focus:border-primary outline-none transition-all placeholder:text-outline-variant"
                  id="password" name="password" placeholder="••••••••" required type="password" minlength="6"/>
                <button class="absolute right-3 top-1/2 -translate-y-1/2 text-outline-variant hover:text-primary transition-colors"
                  onclick="togglePassword('password', 'icon-pw')" type="button">
                  <span class="material-symbols-outlined text-lg" id="icon-pw">visibility</span>
                </button>
              </div>
              <p class="font-label-sm text-on-surface-variant">Min. 6 characters</p>
            </div>

            <!-- Confirm Password -->
            <div class="space-y-xs">
              <label class="font-label-md text-label-md text-on-surface-variant" for="confirmPassword">Confirm Password</label>
              <div class="relative group">
                <span class="absolute left-3 top-1/2 -translate-y-1/2 material-symbols-outlined text-outline text-lg transition-colors group-focus-within:text-primary">lock_reset</span>
                <input class="w-full pl-10 pr-12 py-3 bg-white border border-outline-variant rounded-lg font-body-md text-body-md focus:ring-2 focus:ring-primary-fixed focus:border-primary outline-none transition-all placeholder:text-outline-variant"
                  id="confirmPassword" name="confirmPassword" placeholder="••••••••" required type="password"/>
                <button class="absolute right-3 top-1/2 -translate-y-1/2 text-outline-variant hover:text-primary transition-colors"
                  onclick="togglePassword('confirmPassword', 'icon-cpw')" type="button">
                  <span class="material-symbols-outlined text-lg" id="icon-cpw">visibility</span>
                </button>
              </div>
              <p class="font-label-sm text-error hidden" id="pw-mismatch">Passwords do not match</p>
            </div>

            <!-- Submit -->
            <div class="pt-md">
              <button class="w-full bg-primary hover:bg-primary-container text-white font-label-lg text-label-lg py-4 rounded-xl shadow-sm hover:shadow-md transition-all active:scale-[0.98] flex items-center justify-center gap-xs"
                type="submit" id="submit-btn">
                Create Account
                <span class="material-symbols-outlined text-lg">arrow_forward</span>
              </button>
            </div>
          </form>

          <div class="mt-4 text-center">
            <p class="font-body-sm text-body-sm text-on-surface-variant">
              Already have an account?
              <a class="text-primary font-bold hover:underline" href="/">Log In</a>
            </p>
          </div>
        </div>
      </div>
    </main>

    <script>
      function togglePassword(inputId, iconId) {
        const input = document.getElementById(inputId);
        const icon  = document.getElementById(iconId);
        input.type  = input.type === "password" ? "text" : "password";
        icon.textContent = input.type === "password" ? "visibility" : "visibility_off";
      }

      //password match check before submit
      document.getElementById("registration-form").addEventListener("submit", function(e) {
        const pw  = document.getElementById("password").value;
        const cpw = document.getElementById("confirmPassword").value;
        const msg = document.getElementById("pw-mismatch");
        if (pw !== cpw) {
          e.preventDefault();
          msg.classList.remove("hidden");
          document.getElementById("confirmPassword").focus();
          return;
        }
        msg.classList.add("hidden");
      });

      document.getElementById("confirmPassword").addEventListener("input", function() {
        const match = this.value === document.getElementById("password").value;
        document.getElementById("pw-mismatch").classList.toggle("hidden", match);
      });
    </script>
  </body>
</html>
