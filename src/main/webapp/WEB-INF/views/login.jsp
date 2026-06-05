<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Login | WealthWise</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            colors: {
              "primary-fixed": "#a6f2d1", "primary-fixed-dim": "#8bd6b6",
              "surface-container-high": "#e2e8f8", "on-tertiary": "#ffffff",
              tertiary: "#003980", "on-secondary-container": "#720b17",
              "on-primary-fixed": "#002116", "on-secondary": "#ffffff",
              "tertiary-fixed": "#d8e2ff", "surface-container": "#e7eefe",
              "inverse-primary": "#8bd6b6", "error-container": "#ffdad6",
              "surface-bright": "#f9f9ff", "on-tertiary-fixed-variant": "#004395",
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
    <style>
      .material-symbols-outlined { font-variation-settings: "FILL" 0, "wght" 400, "GRAD" 0, "opsz" 24; }
      body { background-color: #f9f9ff; }
      .login-card-shadow { box-shadow: 0px 12px 24px rgba(0,0,0,0.08); }
      .marketing-overlay { background: linear-gradient(135deg, rgba(0,69,50,0.85) 0%, rgba(6,95,70,0.7) 100%); }
    </style>
  </head>
  <body class="min-h-screen flex items-center justify-center font-body-md text-on-surface p-gutter">
    <main class="w-full max-w-[1200px] bg-white rounded-xl overflow-hidden flex flex-col md:flex-row login-card-shadow min-h-[720px]">

      <!-- Left Side: Marketing -->
      <section class="relative w-full md:w-1/2 min-h-[300px] md:min-h-full overflow-hidden flex flex-col justify-end p-lg">
        <img alt="Wealth Management Illustration"
          class="absolute inset-0 w-full h-full object-cover"
          src="https://lh3.googleusercontent.com/aida-public/AB6AXuDruNPcTf29hrZOP6Rzg4ZdeFSvryoH4rNGPDM_k3RTKMXqojvM2TFVUPV1dnTDwsoK9o8lBR1K2ZkpoVPV-FwYZYmUe21Q2E1PA5qZjYGpgql-MOAIf1WQqYCi8vVcSXpXtCQHrYWh4CmL5bDQhXySZYxaXRqSJj8NrdcbKfETJ6H9LATWlTVAAhYDrXhU9O0-3saerejbKY2zTD_I4v_ZekFLX6t0IDPBRl-zZkU6PYwo35KU-Uec_EqFOv87CMnFUYl-MAhlYA"/>
        <div class="absolute inset-0 marketing-overlay z-10"></div>
        <div class="relative z-20 text-white">
          <div class="flex items-center gap-sm mb-lg">
            <span class="material-symbols-outlined text-[40px] text-primary-fixed" style="font-variation-settings:'FILL' 1">account_balance_wallet</span>
            <h1 class="font-headline-md text-headline-md tracking-tight">WealthWise</h1>
          </div>
          <h2 class="font-headline-lg text-headline-lg mb-sm">Welcome Back to WealthWise</h2>
          <p class="font-body-lg text-body-lg opacity-90 max-w-md">
            Your path to financial clarity begins here. Manage your investments, track expenses, and grow your wealth with precision.
          </p>
        </div>
        <div class="absolute top-12 right-12 w-32 h-32 bg-white/10 rounded-full blur-2xl z-10"></div>
        <div class="absolute bottom-24 left-1/4 w-64 h-64 bg-primary-fixed/20 rounded-full blur-3xl z-10"></div>
      </section>

      <!-- Right Side: Login Form -->
      <section class="w-full md:w-1/2 bg-white flex flex-col justify-center p-lg md:p-xl">
        <div class="max-w-[420px] mx-auto w-full">
          <header class="mb-xl">
            <h3 class="font-headline-md text-headline-md text-on-surface mb-xs">Sign In</h3>
            <p class="font-body-sm text-on-surface-variant">Access your dashboard and financial insights.</p>
          </header>

          <%-- ── Flash messages ── --%>
          <% String error = (String) request.getAttribute("error"); %>
          <% if (error != null) { %>
          <div class="mb-md flex items-center gap-sm rounded-lg border border-error-container bg-error-container px-md py-3 text-on-error-container">
            <span class="material-symbols-outlined text-[20px]">error</span>
            <p class="font-body-sm"><%= error %></p>
          </div>
          <% } %>

          <% String success = (String) request.getAttribute("success"); %>
          <% if (success != null) { %>
          <div class="mb-md flex items-center gap-sm rounded-lg border border-green-200 bg-green-50 px-md py-3 text-green-800">
            <span class="material-symbols-outlined text-[20px]">check_circle</span>
            <p class="font-body-sm"><%= success %></p>
          </div>
          <% } %>

          <!-- Admin portal callout -->
          <div class="mb-xl rounded-2xl border border-surface-container-high bg-surface-container-low p-md">
            <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
              <div>
                <p class="font-label-lg text-label-lg text-on-surface">Admin login</p>
                <p class="font-body-sm text-on-surface-variant">Use the admin portal if you manage users</p>
              </div>
              <a href="/admin_login" class="inline-flex items-center justify-center gap-xs rounded-lg bg-secondary px-4 py-3 text-on-secondary font-label-md hover:bg-secondary-container transition-colors">
                Go to Admin Login
                <span class="material-symbols-outlined">admin_panel_settings</span>
              </a>
            </div>
          </div>

          <%-- ── Login form — POSTs to /login ── --%>
          <form action="/login" method="post" class="space-y-sm">

            <!-- Email -->
            <div class="space-y-xs">
              <label class="font-label-md text-label-md text-on-surface-variant block" for="email">Email Address</label>
              <div class="relative group">
                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-outline group-focus-within:text-primary transition-colors">mail</span>
                <input class="w-full pl-12 pr-4 py-3 bg-surface rounded-lg border border-outline-variant focus:border-primary focus:ring-1 focus:ring-primary outline-none transition-all font-body-md text-on-surface placeholder:text-outline"
                  id="email" name="email" placeholder="abc@gmail.com" type="email" required
                  value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"/>
              </div>
            </div>

            <!-- Password -->
            <div class="space-y-xs">
              <label class="font-label-md text-label-md text-on-surface-variant block" for="password">Password</label>
              <div class="relative group">
                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-outline group-focus-within:text-primary transition-colors">lock</span>
                <input class="w-full pl-12 pr-12 py-3 bg-surface rounded-lg border border-outline-variant focus:border-primary focus:ring-1 focus:ring-primary outline-none transition-all font-body-md text-on-surface placeholder:text-outline"
                  id="password" name="password" placeholder="••••••••" type="password" required/>
                <button class="absolute right-4 top-1/2 -translate-y-1/2 text-outline hover:text-on-surface transition-colors"
                  onclick="togglePassword()" type="button">
                  <span class="material-symbols-outlined" id="password-toggle-icon">visibility</span>
                </button>
              </div>
            </div>

            <button class="w-full bg-primary hover:bg-primary-container text-on-primary font-label-lg text-label-lg py-3.5 rounded-lg shadow-sm active:scale-[0.98] transition-all flex items-center justify-center gap-xs mt-md"
              type="submit">
              Sign In
              <span class="material-symbols-outlined">arrow_forward</span>
            </button>
          </form>

          <footer class="mt-xl text-center">
            <p class="font-body-sm text-on-surface-variant">
              Don't have an account?
              <a class="text-primary font-bold hover:underline underline-offset-4 ml-xs" href="/register">Sign Up</a>
            </p>
          </footer>
        </div>
      </section>
    </main>

    <script>
      function togglePassword() {
        const input = document.getElementById("password");
        const icon  = document.getElementById("password-toggle-icon");
        input.type  = input.type === "password" ? "text" : "password";
        icon.innerText = input.type === "password" ? "visibility" : "visibility_off";
      }
    </script>
  </body>
</html>
