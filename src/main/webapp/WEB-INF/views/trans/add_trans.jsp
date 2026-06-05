<!DOCTYPE html>
<html class="light" lang="en" style="">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Add Transaction - WealthWise</title>
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
              "surface-dim": "#d3daea",
              "on-secondary-container": "#720b17",
              "on-primary-fixed-variant": "#00513b",
              "surface-container-highest": "#dce2f3",
              "primary-container": "#065f46",
              "on-surface-variant": "#3f4944",
              "surface-container-high": "#e2e8f8",
              "on-secondary": "#ffffff",
              "on-tertiary-container": "#aec7ff",
              "on-primary": "#ffffff",
              secondary: "#a83639",
              "primary-fixed": "#a6f2d1",
              "secondary-container": "#fe7676",
              "on-secondary-fixed-variant": "#881d24",
              "surface-container": "#e7eefe",
              "on-tertiary-fixed": "#001a42",
              "on-surface": "#151c27",
              "secondary-fixed": "#ffdad8",
              "surface-bright": "#f9f9ff",
              "on-background": "#151c27",
              primary: "#004532",
              "outline-variant": "#bec9c2",
              error: "#ba1a1a",
              "tertiary-fixed": "#d8e2ff",
              "tertiary-fixed-dim": "#adc6ff",
              "primary-fixed-dim": "#8bd6b6",
              surface: "#f9f9ff",
              "inverse-on-surface": "#ebf1ff",
              "on-primary-fixed": "#002116",
              background: "#f9f9ff",
              tertiary: "#003980",
              "secondary-fixed-dim": "#ffb3b0",
              "on-tertiary": "#ffffff",
              "surface-variant": "#dce2f3",
              "on-tertiary-fixed-variant": "#004395",
              outline: "#6f7973",
              "tertiary-container": "#004fac",
              "surface-container-lowest": "#ffffff",
              "inverse-primary": "#8bd6b6",
              "on-error-container": "#93000a",
              "surface-container-low": "#f0f3ff",
              "error-container": "#ffdad6",
              "on-secondary-fixed": "#410006",
              "on-primary-container": "#8bd6b7",
              "on-error": "#ffffff",
              "surface-tint": "#1b6b51",
              "inverse-surface": "#2a313d",
            },
            borderRadius: {
              DEFAULT: "0.25rem",
              lg: "0.5rem",
              xl: "0.75rem",
              full: "9999px",
            },
            spacing: {
              xl: "64px",
              xs: "4px",
              base: "8px",
              sm: "12px",
              "margin-mobile": "16px",
              lg: "40px",
              gutter: "24px",
              md: "24px",
              "margin-desktop": "48px",
            },
            fontFamily: {
              "headline-lg": ["Inter"],
              "label-md": ["Inter"],
              "label-lg": ["Inter"],
              "headline-md": ["Inter"],
              "headline-sm": ["Inter"],
              "body-md": ["Inter"],
              "body-sm": ["Inter"],
              "label-sm": ["Inter"],
              "body-lg": ["Inter"],
            },
            fontSize: {
              "headline-lg": [
                "32px",
                {
                  lineHeight: "40px",
                  letterSpacing: "-0.02em",
                  fontWeight: "700",
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
              "label-lg": [
                "14px",
                {
                  lineHeight: "20px",
                  letterSpacing: "0.01em",
                  fontWeight: "600",
                },
              ],
              "headline-md": [
                "24px",
                { lineHeight: "32px", fontWeight: "600" },
              ],
              "headline-sm": [
                "20px",
                { lineHeight: "28px", fontWeight: "600" },
              ],
              "body-md": ["16px", { lineHeight: "24px", fontWeight: "400" }],
              "body-sm": ["14px", { lineHeight: "20px", fontWeight: "400" }],
              "label-sm": ["10px", { lineHeight: "12px", fontWeight: "700" }],
              "body-lg": ["18px", { lineHeight: "28px", fontWeight: "400" }],
            },
          },
        },
      };
    </script>
    <style>
      body {
        font-family: "Inter", sans-serif;
      }
      .material-symbols-outlined {
        font-variation-settings:
          "FILL" 0,
          "wght" 400,
          "GRAD" 0,
          "opsz" 24;
      }
      .transaction-card {
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.04);
      }
    </style>
  </head>
  <body class="bg-surface text-on-surface min-h-screen">
    <!-- Sidebar Navigation (Mandatory Shared Component) -->
    <aside
      class="fixed left-0 top-0 h-screen w-64 bg-white dark:bg-surface-container-lowest border-r border-outline-variant dark:border-outline flex flex-col py-md gap-xs z-50"
    >
      <div class="px-6 mb-8">
        <h1
          class="font-headline-sm text-headline-sm font-bold text-primary dark:text-primary-fixed-dim"
        >
          WealthWise
        </h1>
        <p class="font-body-sm text-body-sm text-on-surface-variant">
          Financial Clarity
        </p>
      </div>
      <nav class="flex-1 space-y-1">
        <!-- Active State: Transactions -->
        <a
          class="flex items-center gap-sm text-on-surface-variant dark:text-outline-variant hover:bg-surface-container-low dark:hover:bg-surface-container-high rounded-lg px-4 py-3 mx-2 transition-all"
          href="#"
        >
          <span class="material-symbols-outlined" data-icon="home">home</span>
          <span class="font-label-lg text-label-lg">Home</span>
        </a>
        <a
          class="flex items-center gap-sm bg-primary-container dark:bg-primary-container text-on-primary-container dark:text-on-primary-container rounded-lg px-4 py-3 mx-2"
          href="#"
        >
          <span class="material-symbols-outlined" data-icon="list_alt"
            >list_alt</span
          >
          <span class="font-label-lg text-label-lg">Transactions</span>
        </a>
        <a
          class="flex items-center gap-sm text-on-surface-variant dark:text-outline-variant hover:bg-surface-container-low dark:hover:bg-surface-container-high rounded-lg px-4 py-3 mx-2 transition-all"
          href="#"
        >
          <span class="material-symbols-outlined" data-icon="payments"
            >payments</span
          >
          <span class="font-label-lg text-label-lg">Income</span>
        </a>
        <a
          class="flex items-center gap-sm text-on-surface-variant dark:text-outline-variant hover:bg-surface-container-low dark:hover:bg-surface-container-high rounded-lg px-4 py-3 mx-2 transition-all"
          href="#"
        >
          <span class="material-symbols-outlined" data-icon="shopping_cart"
            >shopping_cart</span
          >
          <span class="font-label-lg text-label-lg">Expenses</span>
        </a>
        <a
          class="flex items-center gap-sm text-on-surface-variant dark:text-outline-variant hover:bg-surface-container-low dark:hover:bg-surface-container-high rounded-lg px-4 py-3 mx-2 transition-all"
          href="#"
        >
          <span class="material-symbols-outlined" data-icon="category"
            >category</span
          >
          <span class="font-label-lg text-label-lg">Categories</span>
        </a>
        <a
          class="flex items-center gap-sm text-on-surface-variant dark:text-outline-variant hover:bg-surface-container-low dark:hover:bg-surface-container-high rounded-lg px-4 py-3 mx-2 transition-all"
          href="#"
        >
          <span class="material-symbols-outlined" data-icon="calendar_month"
            >calendar_month</span
          >
          <span class="font-label-lg text-label-lg">Monthly Overview</span>
        </a>
        <a
          class="flex items-center gap-sm text-on-surface-variant dark:text-outline-variant hover:bg-surface-container-low dark:hover:bg-surface-container-high rounded-lg px-4 py-3 mx-2 transition-all"
          href="#"
        >
          <span
            class="material-symbols-outlined"
            data-icon="account_balance_wallet"
            >account_balance_wallet</span
          >
          <span class="font-label-lg text-label-lg">Budget</span>
        </a>
        <a
          class="flex items-center gap-sm text-on-surface-variant dark:text-outline-variant hover:bg-surface-container-low dark:hover:bg-surface-container-high rounded-lg px-4 py-3 mx-2 transition-all"
          href="#"
        >
          <span class="material-symbols-outlined" data-icon="stars">stars</span>
          <span class="font-label-lg text-label-lg">Goals</span>
        </a>
      </nav>
      <div class="mt-auto border-t border-outline-variant pt-4">
        <a
          class="flex items-center gap-sm text-on-surface-variant dark:text-outline-variant hover:bg-surface-container-low rounded-lg px-4 py-3 mx-2"
          href="#"
        >
          <span class="material-symbols-outlined" data-icon="logout"
            >logout</span
          >
          <span class="font-label-lg text-label-lg">Logout</span>
        </a>
      </div>
    </aside>
    <!-- Main Canvas -->
    <main class="ml-64 min-h-screen flex flex-col">
      <!-- TopAppBar (Mandatory Shared Component) -->
      <header
        class="flex justify-between items-center w-full h-16 px-gutter max-w-full sticky top-0 z-40 bg-surface dark:bg-surface shadow-sm"
      >
        <div class="flex items-center gap-md">
          <div class="relative" style="transition: transform 0.2s"></div>
        </div>
        <div class="flex items-center gap-4">
          <button
            class="p-2 hover:bg-surface-container-low rounded-full transition-colors relative"
          >
            <span
              class="material-symbols-outlined text-on-surface-variant"
              data-icon="notifications"
              >notifications</span
            >
            <span
              class="absolute top-2 right-2 w-2 h-2 bg-secondary rounded-full"
            ></span>
          </button>
          <div
            class="w-10 h-10 rounded-full overflow-hidden border-2 border-primary-fixed"
          >
            <img
              alt="User profile avatar"
              class="w-full h-full object-cover"
              src="https://lh3.googleusercontent.com/aida-public/AB6AXuBxftqM6ONwXMA1WK7sr6t-2kecltex4tIKCURg1dGEaZfv_Zqu4syz3t6Zn3XBEIgMoatR36S6deynMc1XJJ18Dc_npKL1qjSFNKwzrD-ftettnUVBq0nW8ODwqs0Miig4fonOvWkbDd4ra-uGDDbLdXmYfRp_DZEy69Sv8hUasV6V7i0w5bNR-ZWiWr6x975JIDtG-K3-a2XMZ3_qH2npnd_6gqxKy8LdeDU_hlHZgJPTOACFHruY_o0gEZx1Y98SgCc4Y9hy4A"
            />
          </div>
        </div>
      </header>
      <!-- Content Area -->
      <div
        class="flex-1 p-margin-desktop flex items-center justify-center bg-[#F9FAFB]"
      >
        <!-- Add Transaction Focused Card -->
        <div
          class="w-full max-w-2xl bg-white rounded-xl border border-[#E5E7EB] transaction-card overflow-hidden"
        >
          <!-- Card Header -->
          <div
            class="px-gutter py-6 border-b border-outline-variant bg-surface-container-lowest flex justify-between items-center"
          >
            <div>
              <h2 class="font-headline-md text-headline-md text-primary">
                Add Transaction
              </h2>
              <p class="font-body-sm text-body-sm text-on-surface-variant">
                Log your income or expenses to stay on track.
              </p>
            </div>
            <button
              class="text-on-surface-variant hover:bg-surface-container-low p-2 rounded-full transition-colors"
            >
              <span class="material-symbols-outlined" data-icon="close"
                >close</span
              >
            </button>
          </div>
          <form class="p-gutter space-y-6" onsubmit="event.preventDefault()">
            <!-- Transaction Type Toggle -->
            <div class="flex justify-center">
              <div class="inline-flex p-1 bg-surface-container-low rounded-lg">
                <button
                  class="px-8 py-2 rounded-md font-label-lg text-label-lg transition-all bg-secondary text-on-secondary shadow-sm"
                  id="type-expense"
                  onclick="setType('expense')"
                  type="button"
                >
                  Expense
                </button>
                <button
                  class="px-8 py-2 rounded-md font-label-lg text-label-lg transition-all text-on-surface-variant hover:text-primary"
                  id="type-income"
                  onclick="setType('income')"
                  type="button"
                >
                  Income
                </button>
              </div>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-gutter">
              <!-- Amount -->
              <div class="col-span-full md:col-span-1">
                <label
                  class="block font-label-md text-label-md text-on-surface-variant mb-2"
                  >Amount</label
                >
                <div class="relative">
                  <span
                    class="absolute left-4 top-1/2 -translate-y-1/2 font-headline-sm text-headline-sm text-outline"
                    >$</span
                  >
                  <input
                    class="w-full pl-10 pr-4 py-3 bg-white border border-outline-variant rounded-lg focus:border-primary focus:ring-1 focus:ring-primary font-headline-sm text-headline-sm outline-none transition-all"
                    placeholder="0.00"
                    step="0.01"
                    type="number"
                  />
                </div>
              </div>
              <!-- Date Picker -->
              <div class="col-span-full md:col-span-1">
                <label
                  class="block font-label-md text-label-md text-on-surface-variant mb-2"
                  >Date</label
                >
                <div class="relative">
                  <span
                    class="absolute left-4 top-1/2 -translate-y-1/2 material-symbols-outlined text-outline"
                    data-icon="calendar_today"
                    >calendar_today</span
                  >
                  <input
                    class="w-full pl-12 pr-4 py-3 bg-white border border-outline-variant rounded-lg focus:border-primary focus:ring-1 focus:ring-primary font-body-md text-body-md outline-none transition-all"
                    type="date"
                  />
                </div>
              </div>
              <!-- Category -->
              <div class="col-span-full md:col-span-1">
                <label
                  class="block font-label-md text-label-md text-on-surface-variant mb-2"
                  >Category</label
                >
                <div class="relative">
                  <span
                    class="absolute left-4 top-1/2 -translate-y-1/2 material-symbols-outlined text-outline"
                    data-icon="category"
                    >category</span
                  >
                  <select
                    class="w-full pl-12 pr-10 py-3 bg-white border border-outline-variant rounded-lg focus:border-primary focus:ring-1 focus:ring-primary font-body-md text-body-md appearance-none outline-none transition-all"
                  >
                    <option>Housing</option>
                    <option>Food &amp; Dining</option>
                    <option>Transportation</option>
                    <option>Salary / Income</option>
                    <option>Shopping</option>
                    <option>Entertainment</option>
                    <option>Healthcare</option>
                  </select>
                  <span
                    class="absolute right-4 top-1/2 -translate-y-1/2 material-symbols-outlined text-outline pointer-events-none"
                    data-icon="expand_more"
                    >expand_more</span
                  >
                </div>
              </div>
              <!-- Payment Method -->
              <div class="col-span-full md:col-span-1">
                <label
                  class="block font-label-md text-label-md text-on-surface-variant mb-2"
                  >Payment Method</label
                >
                <div class="relative">
                  <span
                    class="absolute left-4 top-1/2 -translate-y-1/2 material-symbols-outlined text-outline"
                    data-icon="account_balance_wallet"
                    >account_balance_wallet</span
                  >
                  <select
                    class="w-full pl-12 pr-10 py-3 bg-white border border-outline-variant rounded-lg focus:border-primary focus:ring-1 focus:ring-primary font-body-md text-body-md appearance-none outline-none transition-all"
                  >
                    <option>Bank Transfer</option>
                    <option>Credit Card</option>
                    <option>Debit Card</option>
                    <option>Cash</option>
                    <option>Mobile Pay</option>
                  </select>
                  <span
                    class="absolute right-4 top-1/2 -translate-y-1/2 material-symbols-outlined text-outline pointer-events-none"
                    data-icon="expand_more"
                    >expand_more</span
                  >
                </div>
              </div>
              <!-- Description -->
              <div class="col-span-full">
                <label
                  class="block font-label-md text-label-md text-on-surface-variant mb-2"
                  >Description / Notes</label
                >
                <textarea
                  class="w-full px-4 py-3 bg-white border border-outline-variant rounded-lg focus:border-primary focus:ring-1 focus:ring-primary font-body-md text-body-md outline-none transition-all resize-none"
                  placeholder="What was this for?"
                  rows="3"
                ></textarea>
              </div>
              <!-- Attachment -->
              <div class="col-span-full"></div>
            </div>
            <!-- Actions -->
            <div class="flex items-center justify-end gap-md pt-4">
              <button
                class="px-6 py-2.5 font-label-lg text-label-lg text-primary border border-primary rounded-lg hover:bg-surface-container-low transition-all"
                type="button"
              >
                Cancel
              </button>
              <button
                class="px-8 py-2.5 font-label-lg text-label-lg bg-primary text-white rounded-lg shadow-lg hover:shadow-xl active:scale-95 transition-all"
                type="submit"
              >
                Save Transaction
              </button>
            </div>
          </form>
        </div>
      </div>
      <!-- Mini Insights Sidebar (Bento Pattern) -->
      <div
        class="fixed right-8 top-24 w-80 space-y-gutter hidden xl:block"
      ></div>
    </main>
    <script>
      function setType(type) {
        const expenseBtn = document.getElementById("type-expense");
        const incomeBtn = document.getElementById("type-income");

        if (type === "expense") {
          expenseBtn.className =
            "px-8 py-2 rounded-md font-label-lg text-label-lg transition-all bg-secondary text-on-secondary shadow-sm";
          incomeBtn.className =
            "px-8 py-2 rounded-md font-label-lg text-label-lg transition-all text-on-surface-variant hover:text-primary";
        } else {
          incomeBtn.className =
            "px-8 py-2 rounded-md font-label-lg text-label-lg transition-all bg-primary-container text-on-primary-container shadow-sm";
          expenseBtn.className =
            "px-8 py-2 rounded-md font-label-lg text-label-lg transition-all text-on-surface-variant hover:text-primary";
        }
      }

      // Micro-interaction for form focus
      document.querySelectorAll("input, select, textarea").forEach((el) => {
        el.addEventListener("focus", () => {
          el.parentElement.classList.add("scale-[1.01]");
          el.parentElement.style.transition = "transform 0.2s ease";
        });
        el.addEventListener("blur", () => {
          el.parentElement.classList.remove("scale-[1.01]");
        });
      });
    </script>
  </body>
</html>
