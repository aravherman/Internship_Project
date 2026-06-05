<!DOCTYPE html>
<html class="light" lang="en" style="">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Transactions | WealthWise</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
      rel="stylesheet"
    />
    <script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            colors: {
              "on-error": "#ffffff",
              "on-error-container": "#93000a",
              "on-secondary": "#ffffff",
              "on-background": "#151c27",
              "on-secondary-fixed-variant": "#881d24",
              "on-secondary-container": "#720b17",
              "surface-container-low": "#f0f3ff",
              error: "#ba1a1a",
              "on-surface-variant": "#3f4944",
              "tertiary-fixed": "#d8e2ff",
              "secondary-fixed": "#ffdad8",
              "surface-container-high": "#e2e8f8",
              primary: "#004532",
              "primary-fixed-dim": "#8bd6b6",
              "surface-bright": "#f9f9ff",
              "surface-variant": "#dce2f3",
              "inverse-on-surface": "#ebf1ff",
              "on-tertiary-fixed": "#001a42",
              "surface-container-lowest": "#ffffff",
              "surface-container-highest": "#dce2f3",
              "primary-container": "#065f46",
              "on-secondary-fixed": "#410006",
              secondary: "#a83639",
              "on-primary": "#ffffff",
              "error-container": "#ffdad6",
              "surface-tint": "#1b6b51",
              tertiary: "#003980",
              "inverse-surface": "#2a313d",
              background: "#f9f9ff",
              "secondary-fixed-dim": "#ffb3b0",
              "tertiary-fixed-dim": "#adc6ff",
              "on-tertiary": "#ffffff",
              "primary-fixed": "#a6f2d1",
              "on-primary-fixed": "#002116",
              "surface-container": "#e7eefe",
              surface: "#f9f9ff",
              "outline-variant": "#bec9c2",
              "on-tertiary-container": "#aec7ff",
              "on-primary-container": "#8bd6b7",
              "on-primary-fixed-variant": "#00513b",
              outline: "#6f7973",
              "inverse-primary": "#8bd6b6",
              "on-tertiary-fixed-variant": "#004395",
              "secondary-container": "#fe7676",
              "surface-dim": "#d3daea",
              "tertiary-container": "#004fac",
              "on-surface": "#151c27",
            },
            borderRadius: {
              DEFAULT: "0.25rem",
              lg: "0.5rem",
              xl: "0.75rem",
              full: "9999px",
            },
            spacing: {
              sm: "12px",
              gutter: "24px",
              xl: "64px",
              base: "8px",
              "margin-mobile": "16px",
              md: "24px",
              "margin-desktop": "48px",
              lg: "40px",
              xs: "4px",
            },
            fontFamily: {
              "body-sm": ["Inter"],
              "headline-lg": ["Inter"],
              "label-sm": ["Inter"],
              "label-lg": ["Inter"],
              "label-md": ["Inter"],
              "headline-md": ["Inter"],
              "body-md": ["Inter"],
              "headline-sm": ["Inter"],
            },
            fontSize: {
              "body-sm": ["14px", { lineHeight: "20px", fontWeight: "400" }],
              "headline-lg": [
                "32px",
                {
                  lineHeight: "40px",
                  letterSpacing: "-0.02em",
                  fontWeight: "700",
                },
              ],
              "label-sm": ["10px", { lineHeight: "12px", fontWeight: "700" }],
              "label-lg": [
                "14px",
                {
                  lineHeight: "20px",
                  letterSpacing: "0.01em",
                  fontWeight: "600",
                },
              ],
              "label-md": [
                "12px",
                {
                  lineHeight: "16px",
                  letterSpacing: "0.02em",
                  fontWeight: "600",
                },
              ],
              "headline-md": [
                "24px",
                { lineHeight: "32px", fontWeight: "600" },
              ],
              "body-md": ["16px", { lineHeight: "24px", fontWeight: "400" }],
              "headline-sm": [
                "20px",
                { lineHeight: "28px", fontWeight: "600" },
              ],
            },
          },
        },
      };
    </script>
    <style>
      .material-symbols-outlined {
        font-variation-settings:
          "FILL" 0,
          "wght" 400,
          "GRAD" 0,
          "opsz" 24;
        vertical-align: middle;
      }
      body {
        background-color: #f9f9ff;
        color: #151c27;
      }
      .custom-scrollbar::-webkit-scrollbar {
        width: 6px;
      }
      .custom-scrollbar::-webkit-scrollbar-track {
        background: transparent;
      }
      .custom-scrollbar::-webkit-scrollbar-thumb {
        background: #bec9c2;
        border-radius: 10px;
      }
    </style>
  </head>
  <body class="font-body-md text-body-md overflow-hidden">
    <!-- Shell Layout -->
    <div class="flex h-screen overflow-hidden">
      <!-- SideNavBar (Authority Source: JSON) -->
      <aside
        class="hidden md:flex flex-col py-md gap-xs bg-white dark:bg-surface-container-lowest border-r border-outline-variant dark:border-outline fixed left-0 top-0 h-screen w-64 z-40"
      >
        <div class="px-6 mb-8">
          <div class="flex items-center gap-sm">
            <div
              class="w-10 h-10 rounded-xl bg-primary flex items-center justify-center text-white"
            >
              <span
                class="material-symbols-outlined"
                data-icon="account_balance"
                >account_balance</span
              >
            </div>
            <div>
              <h1
                class="font-headline-sm text-headline-sm font-bold text-primary dark:text-primary-fixed-dim"
              >
                WealthWise
              </h1>
              <p
                class="font-label-md text-label-md text-on-surface-variant opacity-70"
              >
                Financial Clarity
              </p>
            </div>
          </div>
        </div>
        <nav class="flex-1 space-y-1">
          <div
            class="flex items-center gap-sm text-on-surface-variant dark:text-outline-variant hover:bg-surface-container-low dark:hover:bg-surface-container-high rounded-lg px-4 py-3 mx-2 group cursor-pointer active:scale-[0.98] transition-all"
          >
            <span class="material-symbols-outlined" data-icon="home">home</span>
            <span class="font-label-lg text-label-lg">Home</span>
          </div>
          <div
            class="flex items-center gap-sm bg-primary-container dark:bg-primary-container text-on-primary-container dark:text-on-primary-container rounded-lg px-4 py-3 mx-2 group cursor-pointer active:scale-[0.98] transition-all"
          >
            <span class="material-symbols-outlined" data-icon="list_alt"
              >list_alt</span
            >
            <span class="font-label-lg text-label-lg">Transactions</span>
          </div>

          <div
            class="flex items-center gap-sm text-on-surface-variant dark:text-outline-variant hover:bg-surface-container-low dark:hover:bg-surface-container-high rounded-lg px-4 py-3 mx-2 group cursor-pointer active:scale-[0.98] transition-all"
          >
            <span
              class="material-symbols-outlined"
              data-icon="account_balance_wallet"
              >account_balance_wallet</span
            >
            <span class="font-label-lg text-label-lg">Budget</span>
          </div>
          <div
            class="flex items-center gap-sm text-on-surface-variant dark:text-outline-variant hover:bg-surface-container-low dark:hover:bg-surface-container-high rounded-lg px-4 py-3 mx-2 group cursor-pointer active:scale-[0.98] transition-all"
          >
            <span class="material-symbols-outlined" data-icon="stars"
              >stars</span
            >
            <span class="font-label-lg text-label-lg">Goals</span>
          </div>
          <div
            class="flex items-center gap-sm text-on-surface-variant dark:text-outline-variant hover:bg-surface-container-low dark:hover:bg-surface-container-high rounded-lg px-4 py-3 mx-2 group cursor-pointer active:scale-[0.98] transition-all"
          >
            <span class="material-symbols-outlined" data-icon="subscriptions"
              >subscriptions</span
            >
            <span class="font-label-lg text-label-lg">Subscriptions</span>
          </div>
          <div
            class="flex items-center gap-sm text-on-surface-variant dark:text-outline-variant hover:bg-surface-container-low dark:hover:bg-surface-container-high rounded-lg px-4 py-3 mx-2 group cursor-pointer active:scale-[0.98] transition-all"
          >
            <span class="material-symbols-outlined" data-icon="assessment"
              >assessment</span
            >
            <span class="font-label-lg text-label-lg">Reports</span>
          </div>
        </nav>
        <div class="mt-auto border-t border-outline-variant pt-4">
          <div
            class="flex items-center gap-sm text-secondary hover:bg-error-container/20 rounded-lg px-4 py-3 mx-2 group cursor-pointer active:scale-[0.98] transition-all"
          >
            <span class="material-symbols-outlined" data-icon="logout"
              >logout</span
            >
            <span class="font-label-lg text-label-lg">Logout</span>
          </div>
        </div>
      </aside>
      <!-- Main Canvas -->
      <main class="flex-1 flex flex-col md:ml-64 bg-background min-h-screen">
        <!-- TopAppBar (Authority Source: JSON) -->
        <header
          class="flex justify-between items-center w-full h-16 px-gutter max-w-full sticky top-0 z-50 bg-surface dark:bg-surface shadow-sm"
        >
          <div class="flex items-center gap-md flex-1">
            <div class="relative w-full max-w-md hidden md:block">
              <span
                class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline"
                data-icon="search"
                >search</span
              >
              <input
                class="w-full bg-surface-container-low border-none rounded-full py-2 pl-10 pr-4 font-body-sm text-body-sm focus:ring-2 focus:ring-primary"
                placeholder="Search transactions..."
                type="text"
              />
            </div>
          </div>
          <div class="flex items-center gap-sm">
            <div
              class="p-2 rounded-full hover:bg-surface-container-low cursor-pointer transition-colors relative"
            >
              <span
                class="material-symbols-outlined text-on-surface-variant"
                data-icon="notifications"
                >notifications</span
              >
              <span
                class="absolute top-2 right-2 w-2 h-2 bg-secondary rounded-full"
              ></span>
            </div>
            <div
              class="h-10 w-10 rounded-full overflow-hidden border-2 border-primary-fixed-dim cursor-pointer"
            >
              <img
                alt="User profile avatar"
                data-alt="A professional close-up portrait of a finance executive in a modern, brightly lit office environment. The lighting is soft and natural, emphasizing a calm and trustworthy persona. The color palette is composed of clean whites and muted grays, maintaining a professional and minimalist aesthetic that aligns with a premium wealth management application."
                src="https://lh3.googleusercontent.com/aida-public/AB6AXuCnrCZnyt6qckdGiH4Ti7jBeJzthC0oziWVGhIr4iohzwnG3LkqSPmB3MArl0yowU2CUbqcrMdHPDYbux66UivHCGYZ5_eh_GNjzgtcnOTBATA907KMLvT639KBouKTBEB9SbDItPgg_K4NQjmM9sacEkBDk5BHnCmsXaBlTA5lNBZjb7Yg9MQI1Yt3OfLAqlXBOpGKXDVe_tZe1ejJje1k7vLIfUYRBtUv7SciLCrvDMuOJ4THpa4dsL97WeMSh-XDB9ORTuyKCQ"
              />
            </div>
          </div>
        </header>
        <!-- Page Content -->
        <div class="p-gutter overflow-y-auto custom-scrollbar flex-1">
          <!-- Page Header & Action -->
          <div
            class="flex flex-col md:flex-row md:items-center justify-between gap-md mb-lg"
          >
            <div>
              <h2 class="font-headline-lg text-headline-lg text-on-surface">
                Transactions
              </h2>
              <p class="text-on-surface-variant font-body-md">
                View and manage all your financial movements in one place.
              </p>
            </div>
            <button
              class="bg-primary hover:bg-primary-container text-white px-6 py-3 rounded-lg font-label-lg flex items-center gap-sm transition-all transform active:scale-95 shadow-lg shadow-primary/20"
            >
              <span class="material-symbols-outlined" data-icon="add">add</span>
              Add Transaction
            </button>
          </div>
          <!-- Filters Bento Grid Section -->
          <div class="grid grid-cols-1 md:grid-cols-12 gap-gutter mb-lg">
            <!-- Main Search & Filter Card -->
            <div
              class="md:col-span-12 bg-white rounded-xl border border-outline-variant p-md flex flex-wrap items-center gap-md shadow-sm"
            >
              <div class="flex flex-col gap-xs min-w-[200px]">
                <label class="font-label-md text-label-md text-outline"
                  >Date Range</label
                >
                <div class="relative">
                  <span
                    class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline text-[20px]"
                    data-icon="calendar_today"
                    >calendar_today</span
                  >
                  <select
                    class="w-full bg-surface-container-low border-none rounded-lg py-2 pl-10 pr-8 font-body-sm appearance-none cursor-pointer"
                  >
                    <option>Last 30 Days</option>
                    <option>Last 90 Days</option>
                    <option>This Year</option>
                    <option>Custom Range</option>
                  </select>
                </div>
              </div>
              <div class="flex flex-col gap-xs min-w-[180px]">
                <label class="font-label-md text-label-md text-outline"
                  >Category</label
                >
                <select
                  class="w-full bg-surface-container-low border-none rounded-lg py-2 px-4 font-body-sm appearance-none cursor-pointer"
                >
                  <option>All Categories</option>
                  <option>Housing</option>
                  <option>Groceries</option>
                  <option>Salary</option>
                  <option>Investments</option>
                  <option>Entertainment</option>
                </select>
              </div>
              <div class="flex flex-col gap-xs min-w-[180px]">
                <label class="font-label-md text-label-md text-outline"
                  >Type</label
                >
                <div class="flex bg-surface-container-low p-1 rounded-lg">
                  <button
                    class="flex-1 py-1.5 px-4 rounded-md text-on-surface-variant font-label-md transition-all bg-white shadow-sm"
                  >
                    All
                  </button>
                  <button
                    class="flex-1 py-1.5 px-4 rounded-md text-on-surface-variant font-label-md transition-all hover:bg-white/50"
                  >
                    Income
                  </button>
                  <button
                    class="flex-1 py-1.5 px-4 rounded-md text-on-surface-variant font-label-md transition-all hover:bg-white/50"
                  >
                    Expense
                  </button>
                </div>
              </div>
            </div>
          </div>
          <!-- Data Table Card -->
          <div
            class="bg-white rounded-xl border border-outline-variant shadow-sm overflow-hidden"
          >
            <div class="overflow-x-auto">
              <table class="w-full text-left border-collapse">
                <thead>
                  <tr
                    class="border-b border-outline-variant bg-surface-container-low/30"
                  >
                    <th
                      class="px-6 py-4 font-label-sm text-label-sm uppercase text-outline tracking-wider"
                    >
                      Date
                    </th>
                    <th
                      class="px-6 py-4 font-label-sm text-label-sm uppercase text-outline tracking-wider"
                    >
                      Category
                    </th>
                    <th
                      class="px-6 py-4 font-label-sm text-label-sm uppercase text-outline tracking-wider"
                    >
                      Type
                    </th>
                    <th
                      class="px-6 py-4 font-label-sm text-label-sm uppercase text-outline tracking-wider"
                    >
                      Description
                    </th>
                    <th
                      class="px-6 py-4 font-label-sm text-label-sm uppercase text-outline tracking-wider text-right"
                    >
                      Amount
                    </th>
                    <th
                      class="px-6 py-4 font-label-sm text-label-sm uppercase text-outline tracking-wider text-right"
                    >
                      Actions
                    </th>
                  </tr>
                </thead>
                <tbody class="divide-y divide-outline-variant">
                  <!-- Row 1 -->
                  <tr
                    class="hover:bg-surface-container-low/50 transition-colors group"
                  >
                    <td class="px-6 py-4 font-body-sm text-on-surface">
                      Oct 24, 2023
                    </td>
                    <td class="px-6 py-4">
                      <div class="flex items-center gap-sm">
                        <div
                          class="w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center text-blue-700"
                        >
                          <span
                            class="material-symbols-outlined text-[18px]"
                            data-icon="home"
                            >home</span
                          >
                        </div>
                        <span class="font-body-md">Housing</span>
                      </div>
                    </td>
                    <td class="px-6 py-4">
                      <span
                        class="px-3 py-1 rounded-full bg-secondary-fixed text-on-secondary-fixed-variant font-label-md text-[11px] uppercase tracking-wide"
                        >Expense</span
                      >
                    </td>
                    <td class="px-6 py-4 font-body-md text-on-surface">
                      Monthly Mortgage Payment
                    </td>
                    <td
                      class="px-6 py-4 font-headline-sm text-secondary text-right"
                    >
                      -$2,450.00
                    </td>
                    <td class="px-6 py-4 text-right">
                      <div
                        class="flex items-center justify-end gap-xs opacity-0 group-hover:opacity-100 transition-opacity"
                      >
                        <button
                          class="p-2 hover:bg-surface-container-high rounded-full transition-colors text-outline"
                        >
                          <span
                            class="material-symbols-outlined text-[20px]"
                            data-icon="edit"
                            >edit</span
                          >
                        </button>
                        <button
                          class="p-2 hover:bg-error-container/20 rounded-full transition-colors text-error"
                        >
                          <span
                            class="material-symbols-outlined text-[20px]"
                            data-icon="delete"
                            >delete</span
                          >
                        </button>
                      </div>
                    </td>
                  </tr>
                  <!-- Row 2 -->
                  <tr
                    class="hover:bg-surface-container-low/50 transition-colors group"
                  >
                    <td class="px-6 py-4 font-body-sm text-on-surface">
                      Oct 23, 2023
                    </td>
                    <td class="px-6 py-4">
                      <div class="flex items-center gap-sm">
                        <div
                          class="w-8 h-8 rounded-full bg-emerald-100 flex items-center justify-center text-emerald-700"
                        >
                          <span
                            class="material-symbols-outlined text-[18px]"
                            data-icon="work"
                            >work</span
                          >
                        </div>
                        <span class="font-body-md">Salary</span>
                      </div>
                    </td>
                    <td class="px-6 py-4">
                      <span
                        class="px-3 py-1 rounded-full bg-primary-fixed text-on-primary-fixed-variant font-label-md text-[11px] uppercase tracking-wide"
                        >Income</span
                      >
                    </td>
                    <td class="px-6 py-4 font-body-md text-on-surface">
                      Bi-Weekly Paycheck
                    </td>
                    <td
                      class="px-6 py-4 font-headline-sm text-primary text-right"
                    >
                      +$4,200.00
                    </td>
                    <td class="px-6 py-4 text-right">
                      <div
                        class="flex items-center justify-end gap-xs opacity-0 group-hover:opacity-100 transition-opacity"
                      >
                        <button
                          class="p-2 hover:bg-surface-container-high rounded-full transition-colors text-outline"
                        >
                          <span
                            class="material-symbols-outlined text-[20px]"
                            data-icon="edit"
                            >edit</span
                          >
                        </button>
                        <button
                          class="p-2 hover:bg-error-container/20 rounded-full transition-colors text-error"
                        >
                          <span
                            class="material-symbols-outlined text-[20px]"
                            data-icon="delete"
                            >delete</span
                          >
                        </button>
                      </div>
                    </td>
                  </tr>
                  <!-- Row 3 -->
                  <tr
                    class="hover:bg-surface-container-low/50 transition-colors group"
                  >
                    <td class="px-6 py-4 font-body-sm text-on-surface">
                      Oct 22, 2023
                    </td>
                    <td class="px-6 py-4">
                      <div class="flex items-center gap-sm">
                        <div
                          class="w-8 h-8 rounded-full bg-orange-100 flex items-center justify-center text-orange-700"
                        >
                          <span
                            class="material-symbols-outlined text-[18px]"
                            data-icon="shopping_basket"
                            >shopping_basket</span
                          >
                        </div>
                        <span class="font-body-md">Groceries</span>
                      </div>
                    </td>
                    <td class="px-6 py-4">
                      <span
                        class="px-3 py-1 rounded-full bg-secondary-fixed text-on-secondary-fixed-variant font-label-md text-[11px] uppercase tracking-wide"
                        >Expense</span
                      >
                    </td>
                    <td class="px-6 py-4 font-body-md text-on-surface">
                      Whole Foods Market
                    </td>
                    <td
                      class="px-6 py-4 font-headline-sm text-secondary text-right"
                    >
                      -$185.42
                    </td>
                    <td class="px-6 py-4 text-right">
                      <div
                        class="flex items-center justify-end gap-xs opacity-0 group-hover:opacity-100 transition-opacity"
                      >
                        <button
                          class="p-2 hover:bg-surface-container-high rounded-full transition-colors text-outline"
                        >
                          <span
                            class="material-symbols-outlined text-[20px]"
                            data-icon="edit"
                            >edit</span
                          >
                        </button>
                        <button
                          class="p-2 hover:bg-error-container/20 rounded-full transition-colors text-error"
                        >
                          <span
                            class="material-symbols-outlined text-[20px]"
                            data-icon="delete"
                            >delete</span
                          >
                        </button>
                      </div>
                    </td>
                  </tr>
                  <!-- Row 4 -->
                  <tr
                    class="hover:bg-surface-container-low/50 transition-colors group"
                  >
                    <td class="px-6 py-4 font-body-sm text-on-surface">
                      Oct 20, 2023
                    </td>
                    <td class="px-6 py-4">
                      <div class="flex items-center gap-sm">
                        <div
                          class="w-8 h-8 rounded-full bg-purple-100 flex items-center justify-center text-purple-700"
                        >
                          <span
                            class="material-symbols-outlined text-[18px]"
                            data-icon="theater_comedy"
                            >theater_comedy</span
                          >
                        </div>
                        <span class="font-body-md">Entertainment</span>
                      </div>
                    </td>
                    <td class="px-6 py-4">
                      <span
                        class="px-3 py-1 rounded-full bg-secondary-fixed text-on-secondary-fixed-variant font-label-md text-[11px] uppercase tracking-wide"
                        >Expense</span
                      >
                    </td>
                    <td class="px-6 py-4 font-body-md text-on-surface">
                      Netflix Monthly Subscription
                    </td>
                    <td
                      class="px-6 py-4 font-headline-sm text-secondary text-right"
                    >
                      -$15.99
                    </td>
                    <td class="px-6 py-4 text-right">
                      <div
                        class="flex items-center justify-end gap-xs opacity-0 group-hover:opacity-100 transition-opacity"
                      >
                        <button
                          class="p-2 hover:bg-surface-container-high rounded-full transition-colors text-outline"
                        >
                          <span
                            class="material-symbols-outlined text-[20px]"
                            data-icon="edit"
                            >edit</span
                          >
                        </button>
                        <button
                          class="p-2 hover:bg-error-container/20 rounded-full transition-colors text-error"
                        >
                          <span
                            class="material-symbols-outlined text-[20px]"
                            data-icon="delete"
                            >delete</span
                          >
                        </button>
                      </div>
                    </td>
                  </tr>
                  <!-- Row 5 -->
                  <tr
                    class="hover:bg-surface-container-low/50 transition-colors group"
                  >
                    <td class="px-6 py-4 font-body-sm text-on-surface">
                      Oct 19, 2023
                    </td>
                    <td class="px-6 py-4">
                      <div class="flex items-center gap-sm">
                        <div
                          class="w-8 h-8 rounded-full bg-blue-50 flex items-center justify-center text-blue-600"
                        >
                          <span
                            class="material-symbols-outlined text-[18px]"
                            data-icon="trending_up"
                            >trending_up</span
                          >
                        </div>
                        <span class="font-body-md">Investments</span>
                      </div>
                    </td>
                    <td class="px-6 py-4">
                      <span
                        class="px-3 py-1 rounded-full bg-primary-fixed text-on-primary-fixed-variant font-label-md text-[11px] uppercase tracking-wide"
                        >Income</span
                      >
                    </td>
                    <td class="px-6 py-4 font-body-md text-on-surface">
                      Stock Dividend Payout (AAPL)
                    </td>
                    <td
                      class="px-6 py-4 font-headline-sm text-primary text-right"
                    >
                      +$42.10
                    </td>
                    <td class="px-6 py-4 text-right">
                      <div
                        class="flex items-center justify-end gap-xs opacity-0 group-hover:opacity-100 transition-opacity"
                      >
                        <button
                          class="p-2 hover:bg-surface-container-high rounded-full transition-colors text-outline"
                        >
                          <span
                            class="material-symbols-outlined text-[20px]"
                            data-icon="edit"
                            >edit</span
                          >
                        </button>
                        <button
                          class="p-2 hover:bg-error-container/20 rounded-full transition-colors text-error"
                        >
                          <span
                            class="material-symbols-outlined text-[20px]"
                            data-icon="delete"
                            >delete</span
                          >
                        </button>
                      </div>
                    </td>
                  </tr>
                  <!-- Row 6 -->
                  <tr
                    class="hover:bg-surface-container-low/50 transition-colors group"
                  >
                    <td class="px-6 py-4 font-body-sm text-on-surface">
                      Oct 18, 2023
                    </td>
                    <td class="px-6 py-4">
                      <div class="flex items-center gap-sm">
                        <div
                          class="w-8 h-8 rounded-full bg-green-100 flex items-center justify-center text-green-700"
                        >
                          <span
                            class="material-symbols-outlined text-[18px]"
                            data-icon="restaurant"
                            >restaurant</span
                          >
                        </div>
                        <span class="font-body-md">Dining Out</span>
                      </div>
                    </td>
                    <td class="px-6 py-4">
                      <span
                        class="px-3 py-1 rounded-full bg-secondary-fixed text-on-secondary-fixed-variant font-label-md text-[11px] uppercase tracking-wide"
                        >Expense</span
                      >
                    </td>
                    <td class="px-6 py-4 font-body-md text-on-surface">
                      The Steakhouse Grill
                    </td>
                    <td
                      class="px-6 py-4 font-headline-sm text-secondary text-right"
                    >
                      -$120.00
                    </td>
                    <td class="px-6 py-4 text-right">
                      <div
                        class="flex items-center justify-end gap-xs opacity-0 group-hover:opacity-100 transition-opacity"
                      >
                        <button
                          class="p-2 hover:bg-surface-container-high rounded-full transition-colors text-outline"
                        >
                          <span
                            class="material-symbols-outlined text-[20px]"
                            data-icon="edit"
                            >edit</span
                          >
                        </button>
                        <button
                          class="p-2 hover:bg-error-container/20 rounded-full transition-colors text-error"
                        >
                          <span
                            class="material-symbols-outlined text-[20px]"
                            data-icon="delete"
                            >delete</span
                          >
                        </button>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!-- Pagination -->
            <div
              class="px-6 py-4 border-t border-outline-variant flex items-center justify-between"
            >
              <span class="text-on-surface-variant font-label-md"
                >Showing 1 to 6 of 128 transactions</span
              >
              <div class="flex items-center gap-xs">
                <button
                  class="w-10 h-10 flex items-center justify-center rounded-lg border border-outline-variant hover:bg-surface-container-low text-outline disabled:opacity-30 disabled:cursor-not-allowed"
                  disabled=""
                >
                  <span
                    class="material-symbols-outlined"
                    data-icon="chevron_left"
                    >chevron_left</span
                  >
                </button>
                <button
                  class="w-10 h-10 flex items-center justify-center rounded-lg bg-primary text-white font-label-md"
                >
                  1
                </button>
                <button
                  class="w-10 h-10 flex items-center justify-center rounded-lg hover:bg-surface-container-low text-on-surface-variant font-label-md"
                >
                  2
                </button>
                <button
                  class="w-10 h-10 flex items-center justify-center rounded-lg hover:bg-surface-container-low text-on-surface-variant font-label-md"
                >
                  3
                </button>
                <span class="px-2 text-outline">...</span>
                <button
                  class="w-10 h-10 flex items-center justify-center rounded-lg hover:bg-surface-container-low text-on-surface-variant font-label-md"
                >
                  24
                </button>
                <button
                  class="w-10 h-10 flex items-center justify-center rounded-lg border border-outline-variant hover:bg-surface-container-low text-outline"
                >
                  <span
                    class="material-symbols-outlined"
                    data-icon="chevron_right"
                    >chevron_right</span
                  >
                </button>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
    <!-- Mobile Navigation (Authority Source: JSON logic) -->
    <nav
      class="md:hidden fixed bottom-0 left-0 w-full bg-white border-t border-outline-variant px-gutter py-2 flex justify-between items-center z-50"
    >
      <div class="flex flex-col items-center gap-xs text-on-surface-variant">
        <span class="material-symbols-outlined" data-icon="home">home</span>
        <span class="text-[10px] font-label-sm">Home</span>
      </div>
      <div class="flex flex-col items-center gap-xs text-primary font-bold">
        <span class="material-symbols-outlined" data-icon="list_alt"
          >list_alt</span
        >
        <span class="text-[10px] font-label-sm">Activity</span>
      </div>
      <div class="flex flex-col items-center gap-xs text-on-surface-variant">
        <div class="bg-primary text-white p-2 rounded-full -mt-8 shadow-lg">
          <span class="material-symbols-outlined" data-icon="add">add</span>
        </div>
        <span class="text-[10px] font-label-sm mt-1">Add</span>
      </div>
      <div class="flex flex-col items-center gap-xs text-on-surface-variant">
        <span class="material-symbols-outlined" data-icon="assessment"
          >assessment</span
        >
        <span class="text-[10px] font-label-sm">Stats</span>
      </div>
      <div class="flex flex-col items-center gap-xs text-on-surface-variant">
        <span class="material-symbols-outlined" data-icon="person">person</span>
        <span class="text-[10px] font-label-sm">Me</span>
      </div>
    </nav>
    <script>
      // Simple micro-interaction for rows
      document.querySelectorAll("tbody tr").forEach((row) => {
        row.addEventListener("click", (e) => {
          if (!e.target.closest("button")) {
            // Logic for opening transaction details could go here
          }
        });
      });
    </script>
  </body>
</html>
