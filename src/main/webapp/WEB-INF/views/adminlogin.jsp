<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>WealthWise Admin Portal</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            colors: {
              "secondary-fixed": "#ffdad8", error: "#ba1a1a",
              secondary: "#a83639", "inverse-primary": "#8bd6b6",
              "primary-fixed": "#a6f2d1", "on-error-container": "#93000a",
              "surface-container-lowest": "#ffffff", "on-tertiary-fixed": "#001a42",
              background: "#f9f9ff", "on-primary-container": "#8bd6b7",
              "surface-container-highest": "#dce2f3", outline: "#6f7973",
              "on-secondary-fixed": "#410006", "on-surface": "#151c27",
              "on-primary-fixed-variant": "#00513b", "inverse-surface": "#2a313d",
              "on-secondary-container": "#720b17", "primary-fixed-dim": "#8bd6b6",
              "on-background": "#151c27", "surface-tint": "#1b6b51",
              "inverse-on-surface": "#ebf1ff", "primary-container": "#065f46",
              "tertiary-fixed-dim": "#adc6ff", primary: "#004532",
              tertiary: "#003980", "on-tertiary-container": "#aec7ff",
              "on-primary": "#ffffff", "surface-bright": "#f9f9ff",
              "on-surface-variant": "#3f4944", "secondary-container": "#fe7676",
              "on-primary-fixed": "#002116", "surface-container-high": "#e2e8f8",
              "tertiary-container": "#004fac", "surface-container-low": "#f0f3ff",
              "outline-variant": "#bec9c2", "surface-container": "#e7eefe",
              "on-error": "#ffffff", "secondary-fixed-dim": "#ffb3b0",
              "on-secondary": "#ffffff", "on-tertiary": "#ffffff",
              "error-container": "#ffdad6", "tertiary-fixed": "#d8e2ff",
              surface: "#f9f9ff", "surface-dim": "#d3daea", "surface-variant": "#dce2f3",
            },
            borderRadius: { DEFAULT: "0.25rem", lg: "0.5rem", xl: "0.75rem", full: "9999px" },
            spacing: {
              "margin-desktop": "48px", base: "8px", xs: "4px", md: "24px",
              sm: "12px", lg: "40px", "margin-mobile": "16px", gutter: "24px", xl: "64px",
            },
            fontFamily: { "body-sm": ["Inter"], "label-lg": ["Inter"], "body-md": ["Inter"], "label-sm": ["Inter"], "label-md": ["Inter"], "headline-lg": ["Inter"], "headline-md": ["Inter"], "headline-sm": ["Inter"], "body-lg": ["Inter"] },
            fontSize: {
              "body-sm": ["14px", { lineHeight: "20px", fontWeight: "400" }],
              "label-lg": ["14px", { lineHeight: "20px", letterSpacing: "0.01em", fontWeight: "600" }],
              "body-md": ["16px", { lineHeight: "24px", fontWeight: "400" }],
              "label-sm": ["10px", { lineHeight: "12px", fontWeight: "700" }],
              "label-md": ["12px", { lineHeight: "16px", letterSpacing: "0.02em", fontWeight: "600" }],
              "headline-lg": ["32px", { lineHeight: "40px", letterSpacing: "-0.02em", fontWeight: "700" }],
              "headline-md": ["24px", { lineHeight: "32px", fontWeight: "600" }],
              "headline-sm": ["20px", { lineHeight: "28px", fontWeight: "600" }],
              "body-lg": ["18px", { lineHeight: "28px", fontWeight: "400" }],
            },
          },
        },
      };
    </script>
    <style>
      .material-symbols-outlined { font-variation-settings: "FILL" 0, "wght" 400, "GRAD" 0, "opsz" 24; }
      .admin-grid-pattern {
        background-image: radial-gradient(circle, rgba(255,255,255,0.05) 1px, transparent 1px);
        background-size: 32px 32px;
      }
    </style>
  </head>
  <body class="bg-background text-on-surface font-body-md overflow-hidden">
    <main class="flex min-h-screen">

      <!-- Left Side: Brand -->
      <section class="hidden lg:flex w-1/2 bg-primary relative items-center justify-center overflow-hidden p-xl">
        <div class="absolute inset-0 bg-gradient-to-br from-primary via-primary-container to-on-primary-fixed-variant opacity-90"></div>
        <div class="absolute inset-0 admin-grid-pattern"></div>
        <div class="absolute -top-24 -left-24 w-96 h-96 bg-primary-fixed rounded-full mix-blend-soft-light filter blur-3xl opacity-20"></div>
        <div class="absolute -bottom-24 -right-24 w-96 h-96 bg-tertiary-container rounded-full mix-blend-soft-light filter blur-3xl opacity-20"></div>
        <div class="relative z-10 w-full max-w-lg">
          <div class="inline-flex items-center gap-xs bg-white/10 backdrop-blur-md px-4 py-2 rounded-full border border-white/20 mb-md">
            <span class="material-symbols-outlined text-primary-fixed text-[18px]">admin_panel_settings</span>
            <span class="font-label-md text-white tracking-widest">ADMIN PORTAL</span>
          </div>
          <h1 class="font-headline-lg text-headline-lg text-white mb-md leading-tight">
            WealthWise <br/> Command Center
          </h1>
        </div>
      </section>

      <!-- Right Side: Form -->
      <section class="w-full lg:w-1/2 flex items-center justify-center p-gutter relative bg-surface">
        <div class="w-full max-w-[440px] space-y-lg">

          <!-- Mobile branding -->
          <div class="lg:hidden flex flex-col items-center mb-lg">
            <div class="w-12 h-12 bg-primary rounded-lg flex items-center justify-center mb-sm">
              <span class="material-symbols-outlined text-on-primary">account_balance_wallet</span>
            </div>
            <h2 class="font-headline-sm text-headline-sm text-primary">WealthWise</h2>
          </div>

          <div class="space-y-xs">
            <h2 class="font-headline-md text-headline-md text-on-surface">Admin Sign In</h2>
            <p class="font-body-md text-on-surface-variant">Enter your credentials to access the administrative dashboard.</p>
          </div>

          <%-- ── Flash messages ── --%>
          <% String error = (String) request.getAttribute("error"); %>
          <% if (error != null) { %>
          <div class="flex items-center gap-sm rounded-lg border border-error-container bg-error-container px-md py-3 text-on-error-container">
            <span class="material-symbols-outlined text-[20px]">error</span>
            <p class="font-body-sm"><%= error %></p>
          </div>
          <% } %>

          <% String success = (String) request.getAttribute("success"); %>
          <% if (success != null) { %>
          <div class="flex items-center gap-sm rounded-lg border border-green-200 bg-green-50 px-md py-3 text-green-800">
            <span class="material-symbols-outlined text-[20px]">check_circle</span>
            <p class="font-body-sm"><%= success %></p>
          </div>
          <% } %>

          <%-- ── Admin Login form — POSTs to /admin_login ── --%>
          <form action="/admin_login" method="post" class="space-y-md">

            <!-- Admin Email -->
            <div class="space-y-xs">
              <label class="font-label-md text-label-md text-on-surface-variant block" for="email">Admin Email</label>
              <div class="relative">
                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-outline text-[20px]">badge</span>
                <input class="w-full pl-12 pr-4 py-3 rounded-lg border border-outline-variant focus:border-primary focus:ring-1 focus:ring-primary bg-white transition-all outline-none"
                  id="email" name="email" placeholder="admin@wealthwise.com" type="email" required
                  value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"/>
              </div>
            </div>

            <!-- Password -->
            <div class="space-y-xs">
              <label class="font-label-md text-label-md text-on-surface-variant block" for="password">Password</label>
              <div class="relative">
                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-outline text-[20px]">lock</span>
                <input class="w-full pl-12 pr-12 py-3 rounded-lg border border-outline-variant focus:border-primary focus:ring-1 focus:ring-primary bg-white transition-all outline-none"
                  id="password" name="password" placeholder="••••••••" type="password" required/>
                <button class="absolute right-4 top-1/2 -translate-y-1/2 text-outline-variant hover:text-primary transition-colors"
                  onclick="togglePassword()" type="button">
                  <span class="material-symbols-outlined text-[20px]" id="pw-icon">visibility</span>
                </button>
              </div>
            </div>

            <button class="w-full py-4 bg-primary hover:bg-on-primary-fixed-variant text-white font-label-lg rounded-lg shadow-sm transition-all active:scale-[0.98] flex items-center justify-center gap-sm mt-4"
              type="submit">
              <span class="material-symbols-outlined text-[20px]">shield_person</span>
              Enter Secure Portal
            </button>
          </form>

          <div class="pt-md text-center">
            <a class="inline-flex items-center gap-xs font-label-md text-on-surface-variant hover:text-primary transition-colors hover:underline" href="/">
              <span class="material-symbols-outlined text-[16px]">arrow_back</span>
              Switch to User Login
            </a>
          </div>
        </div>
      </section>
    </main>

    <script>
      function togglePassword() {
        const input = document.getElementById("password");
        const icon  = document.getElementById("pw-icon");
        input.type  = input.type === "password" ? "text" : "password";
        icon.textContent = input.type === "password" ? "visibility" : "visibility_off";
      }
    </script>
  </body>
</html>
