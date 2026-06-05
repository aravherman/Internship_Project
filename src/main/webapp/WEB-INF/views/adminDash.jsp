<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>User Management - WealthWise</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            colors: {
              "primary-fixed-dim": "#8bd6b6", "secondary-fixed": "#ffdad8",
              background: "#f9f9ff", primary: "#004532",
              "on-secondary-container": "#720b17", "surface-container-high": "#e2e8f8",
              "on-primary-fixed-variant": "#00513b", "on-primary-fixed": "#002116",
              "on-secondary-fixed": "#410006", "on-surface": "#151c27",
              "surface-container": "#e7eefe", "on-secondary": "#ffffff",
              "on-tertiary": "#ffffff", "on-background": "#151c27",
              "surface-bright": "#f9f9ff", "surface-container-lowest": "#ffffff",
              "on-primary": "#ffffff", "surface-tint": "#1b6b51",
              "on-primary-container": "#8bd6b7", "tertiary-fixed": "#d8e2ff",
              "tertiary-container": "#004fac", error: "#ba1a1a",
              "inverse-primary": "#8bd6b6", "tertiary-fixed-dim": "#adc6ff",
              "inverse-on-surface": "#ebf1ff", "surface-variant": "#dce2f3",
              outline: "#6f7973", "on-tertiary-fixed-variant": "#004395",
              "on-error-container": "#93000a", "primary-fixed": "#a6f2d1",
              "on-tertiary-fixed": "#001a42", secondary: "#a83639",
              "surface-dim": "#d3daea", "inverse-surface": "#2a313d",
              "surface-container-highest": "#dce2f3", "primary-container": "#065f46",
              tertiary: "#003980", "on-error": "#ffffff",
              "surface-container-low": "#f0f3ff", surface: "#f9f9ff",
              "error-container": "#ffdad6", "on-tertiary-container": "#aec7ff",
              "on-surface-variant": "#3f4944", "secondary-container": "#fe7676",
              "secondary-fixed-dim": "#ffb3b0", "outline-variant": "#bec9c2",
            },
            borderRadius: { DEFAULT: "0.25rem", lg: "0.5rem", xl: "0.75rem", full: "9999px" },
            spacing: {
              "margin-mobile": "16px", md: "24px", lg: "40px", xs: "4px",
              base: "8px", "margin-desktop": "48px", xl: "64px", sm: "12px", gutter: "24px",
            },
            fontFamily: {
              "headline-lg": ["Inter"], "label-md": ["Inter"], "label-sm": ["Inter"],
              "headline-md": ["Inter"], "body-md": ["Inter"], "label-lg": ["Inter"],
              "headline-sm": ["Inter"], "body-sm": ["Inter"], "body-lg": ["Inter"],
            },
            fontSize: {
              "headline-lg": ["32px", { lineHeight: "40px", letterSpacing: "-0.02em", fontWeight: "700" }],
              "label-md": ["12px", { lineHeight: "16px", letterSpacing: "0.02em", fontWeight: "600" }],
              "label-sm": ["10px", { lineHeight: "12px", fontWeight: "700" }],
              "headline-md": ["24px", { lineHeight: "32px", fontWeight: "600" }],
              "body-md": ["16px", { lineHeight: "24px", fontWeight: "400" }],
              "label-lg": ["14px", { lineHeight: "20px", letterSpacing: "0.01em", fontWeight: "600" }],
              "headline-sm": ["20px", { lineHeight: "28px", fontWeight: "600" }],
              "body-sm": ["14px", { lineHeight: "20px", fontWeight: "400" }],
              "body-lg": ["18px", { lineHeight: "28px", fontWeight: "400" }],
            },
          },
        },
      };
    </script>
    <style>
      body { font-family: "Inter", sans-serif; background-color: #f9f9ff; }
      .material-symbols-outlined { font-variation-settings: "FILL" 0, "wght" 400, "GRAD" 0, "opsz" 24; }
      .hide-scrollbar::-webkit-scrollbar { display: none; }
      .hide-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
    </style>
  </head>
  <body class="bg-background text-on-background min-h-screen flex">

    <%-- ── Admin Sidebar ── --%>
    <aside class="fixed left-0 top-0 h-screen w-64 bg-white border-r border-outline-variant flex flex-col py-md gap-xs z-50">
      <div class="px-6 mb-8">
        <h1 class="font-headline-sm text-headline-sm font-bold text-primary">WealthWise</h1>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Admin Portal</p>
      </div>
      <nav class="flex-1 overflow-y-auto hide-scrollbar">
        <div class="my-4 px-6">
          <span class="font-label-sm text-label-sm uppercase text-outline">Administration</span>
        </div>
        <a class="flex items-center gap-sm bg-primary-container text-on-primary-container rounded-lg px-4 py-3 mx-2 transition-all" href="/admin/dashboard">
          <span class="material-symbols-outlined">group</span>
          <span class="font-label-lg text-label-lg">User Management</span>
        </a>
      </nav>
      <div class="mt-auto px-2">
        <div class="px-4 py-3 mb-2 border-t border-outline-variant">
          <p class="font-label-sm text-label-sm text-on-surface-variant uppercase">Signed in as</p>
          <p class="font-label-lg text-label-lg text-on-surface"><c:out value="${adminName}"/></p>
        </div>
        <a class="flex items-center gap-sm text-on-surface-variant hover:bg-surface-container-low rounded-lg px-4 py-3 transition-all" href="/admin/logout">
          <span class="material-symbols-outlined">logout</span>
          <span class="font-label-lg text-label-lg">Logout</span>
        </a>
      </div>
    </aside>

    <%-- ── Main Canvas ── --%>
    <main class="flex-1 ml-64 min-h-screen">

      <%-- Top Bar with search form --%>
      <header class="flex justify-between items-center w-full h-16 px-gutter bg-surface shadow-sm sticky top-0 z-40">
        <h2 class="font-headline-sm text-headline-sm font-bold text-primary">User Management</h2>
        <div class="flex items-center gap-md">
          <%-- Search — GET form, preserves status filter --%>
          <form action="/admin/dashboard" method="get" class="relative hidden md:block">
            <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant">search</span>
            <input name="search" type="text" value="${search}"
              class="pl-10 pr-4 py-2 bg-surface-container-low border-none rounded-full w-64 focus:ring-2 focus:ring-primary text-body-sm font-body-sm outline-none"
              placeholder="Search users..."/>
            <input type="hidden" name="status" value="${status}"/>
          </form>
        </div>
      </header>

      <div class="p-lg max-w-7xl mx-auto space-y-md">

        <%-- Flash messages --%>
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

        <%-- Summary Cards --%>
        <section class="grid grid-cols-1 md:grid-cols-3 gap-gutter">
          <div class="bg-white border border-outline-variant p-md rounded-xl shadow-sm flex items-center gap-md">
            <div class="w-12 h-12 rounded-full bg-primary-fixed-dim flex items-center justify-center text-primary">
              <span class="material-symbols-outlined">group</span>
            </div>
            <div>
              <p class="font-label-sm text-label-sm text-on-surface-variant uppercase">Total Users</p>
              <p class="font-headline-md text-headline-md text-on-surface">${totalUsers}</p>
            </div>
          </div>
          <div class="bg-white border border-outline-variant p-md rounded-xl shadow-sm flex items-center gap-md">
            <div class="w-12 h-12 rounded-full bg-green-100 flex items-center justify-center text-primary">
              <span class="material-symbols-outlined">person_check</span>
            </div>
            <div>
              <p class="font-label-sm text-label-sm text-on-surface-variant uppercase">Active</p>
              <p class="font-headline-md text-headline-md text-on-surface">${activeUsers}</p>
            </div>
          </div>
          <div class="bg-white border border-outline-variant p-md rounded-xl shadow-sm flex items-center gap-md">
            <div class="w-12 h-12 rounded-full bg-error-container flex items-center justify-center text-error">
              <span class="material-symbols-outlined">person_off</span>
            </div>
            <div>
              <p class="font-label-sm text-label-sm text-on-surface-variant uppercase">Inactive</p>
              <p class="font-headline-md text-headline-md text-on-surface">${inactiveUsers}</p>
            </div>
          </div>
        </section>

        <%-- Table Card --%>
        <div class="bg-white border border-outline-variant p-md rounded-xl shadow-sm">

          <%-- Filter bar --%>
          <form action="/admin/dashboard" method="get"
            class="flex flex-col md:flex-row justify-between items-start md:items-center gap-md mb-md">
            <input type="hidden" name="search" value="${search}"/>
            <div class="flex flex-wrap gap-sm">
              <div class="relative">
                <select name="status" onchange="this.form.submit()"
                  class="appearance-none pl-4 pr-10 py-2 bg-white border border-outline-variant rounded-lg text-body-sm font-body-sm focus:ring-primary focus:border-primary">
                  <option value="all"      ${status == 'all'      ? 'selected' : ''}>Status: Any</option>
                  <option value="active"   ${status == 'active'   ? 'selected' : ''}>Active</option>
                  <option value="inactive" ${status == 'inactive' ? 'selected' : ''}>Inactive</option>
                </select>
                <span class="material-symbols-outlined absolute right-2 top-1/2 -translate-y-1/2 pointer-events-none text-on-surface-variant">expand_more</span>
              </div>
            </div>
            <%-- Page size --%>
            <div class="flex items-center gap-sm">
              <span class="font-body-sm text-on-surface-variant">Rows:</span>
              <div class="relative">
                <select name="size" onchange="this.form.submit()"
                  class="appearance-none pl-4 pr-8 py-2 bg-white border border-outline-variant rounded-lg text-body-sm font-body-sm focus:ring-primary focus:border-primary">
                  <option value="10"  ${pageSize == 10  ? 'selected' : ''}>10</option>
                  <option value="25"  ${pageSize == 25  ? 'selected' : ''}>25</option>
                  <option value="50"  ${pageSize == 50  ? 'selected' : ''}>50</option>
                </select>
                <span class="material-symbols-outlined absolute right-1 top-1/2 -translate-y-1/2 pointer-events-none text-on-surface-variant text-sm">expand_more</span>
              </div>
            </div>
          </form>

          <%-- Data Table --%>
          <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
              <thead>
                <tr class="border-b border-outline-variant">
                  <th class="py-4 px-4 font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider">User</th>
                  <th class="py-4 px-4 font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider">Email</th>
                  <th class="py-4 px-4 font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider">Phone</th>
                  <th class="py-4 px-4 font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider">Status</th>
                  <th class="py-4 px-4 font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider">Date Joined</th>
                  <th class="py-4 px-4 font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider text-right">Actions</th>
                </tr>
              </thead>
              <tbody class="divide-y divide-outline-variant">
                <c:choose>
                  <c:when test="${not empty users}">
                    <c:forEach var="u" items="${users}">
                      <%-- Compute initials for avatar fallback --%>
                      <c:set var="initials" value="${u.fullName.substring(0,1).toUpperCase()}"/>
                      <tr class="hover:bg-surface-container-low transition-colors">

                        <%-- Name + initials avatar --%>
                        <td class="py-4 px-4">
                          <div class="flex items-center gap-md">
                            <div class="w-10 h-10 rounded-full bg-primary-container flex items-center justify-center text-white font-bold text-sm flex-shrink-0">
                              <c:out value="${initials}"/>
                            </div>
                            <div>
                              <p class="font-body-md text-body-md text-on-surface font-semibold"><c:out value="${u.fullName}"/></p>
                              <p class="font-label-sm text-label-sm text-on-surface-variant">
                                <c:out value="${u.role != null ? u.role.roleName : 'USER'}"/>
                              </p>
                            </div>
                          </div>
                        </td>

                        <td class="py-4 px-4 font-body-sm text-body-sm text-on-surface-variant">
                          <c:out value="${u.email}"/>
                        </td>

                        <td class="py-4 px-4 font-body-sm text-body-sm text-on-surface-variant">
                          <c:choose>
                            <c:when test="${not empty u.phone}"><c:out value="${u.phone}"/></c:when>
                            <c:otherwise><span class="text-outline">—</span></c:otherwise>
                          </c:choose>
                        </td>

                        <%-- Status badge --%>
                        <td class="py-4 px-4">
                          <c:choose>
                            <c:when test="${u.status == 'ACTIVE'}">
                              <div class="inline-flex items-center gap-xs text-primary">
                                <span class="w-2 h-2 rounded-full bg-primary"></span>
                                <span class="font-label-sm text-label-sm">Active</span>
                              </div>
                            </c:when>
                            <c:otherwise>
                              <div class="inline-flex items-center gap-xs text-secondary">
                                <span class="w-2 h-2 rounded-full bg-secondary"></span>
                                <span class="font-label-sm text-label-sm">Inactive</span>
                              </div>
                            </c:otherwise>
                          </c:choose>
                        </td>

                        <td class="py-4 px-4 font-body-sm text-body-sm text-on-surface-variant">
                          <c:out value="${u.createdAt.toString().substring(0, 10)}"/>
                        </td>

                        <%-- Actions --%>
                        <td class="py-4 px-4 text-right">
                          <div class="flex justify-end gap-sm">
                            <%-- Toggle Active / Inactive --%>
                            <form action="/admin/users/${u.userId}/toggle-status" method="post" style="display:inline">
                              <%-- CSRF --%>
                              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                              <c:choose>
                                <c:when test="${u.status == 'ACTIVE'}">
                                  <button type="submit"
                                    class="p-2 hover:bg-error-container rounded-lg text-error transition-colors"
                                    title="Deactivate user"
                                    onclick="return confirm('Deactivate ${u.fullName}?')">
                                    <span class="material-symbols-outlined">person_off</span>
                                  </button>
                                </c:when>
                                <c:otherwise>
                                  <button type="submit"
                                    class="p-2 hover:bg-green-100 rounded-lg text-primary transition-colors"
                                    title="Activate user"
                                    onclick="return confirm('Activate ${u.fullName}?')">
                                    <span class="material-symbols-outlined">person_check</span>
                                  </button>
                                </c:otherwise>
                              </c:choose>
                            </form>
                          </div>
                        </td>
                      </tr>
                    </c:forEach>
                  </c:when>
                  <c:otherwise>
                    <tr>
                      <td colspan="6" class="py-12 text-center text-on-surface-variant font-body-sm">
                        No users found matching your filters.
                      </td>
                    </tr>
                  </c:otherwise>
                </c:choose>
              </tbody>
            </table>
          </div>

          <%-- Pagination --%>
          <div class="mt-md pt-md border-t border-outline-variant flex flex-col sm:flex-row justify-between items-center gap-sm">
            <p class="font-body-sm text-body-sm text-on-surface-variant">
              Page ${currentPage + 1} of ${totalPages} &nbsp;·&nbsp; ${totalUsers} total users
            </p>
            <div class="flex gap-xs">
              <%-- Prev --%>
              <c:choose>
                <c:when test="${currentPage > 0}">
                  <a href="/admin/dashboard?page=${currentPage - 1}&size=${pageSize}&search=${search}&status=${status}"
                    class="w-10 h-10 rounded-lg flex items-center justify-center hover:bg-surface-container-low text-on-surface-variant transition-colors">
                    <span class="material-symbols-outlined">chevron_left</span>
                  </a>
                </c:when>
                <c:otherwise>
                  <span class="w-10 h-10 rounded-lg flex items-center justify-center text-outline cursor-not-allowed">
                    <span class="material-symbols-outlined">chevron_left</span>
                  </span>
                </c:otherwise>
              </c:choose>

              <%-- Page number buttons (show up to 5 around current) --%>
              <c:if test="${totalPages > 0}">
              <c:forEach begin="0" end="${totalPages - 1}" var="p">
                <c:if test="${p >= currentPage - 2 && p <= currentPage + 2}">
                  <c:choose>
                    <c:when test="${p == currentPage}">
                      <span class="w-10 h-10 rounded-lg flex items-center justify-center bg-primary text-on-primary font-label-md text-label-md">
                        ${p + 1}
                      </span>
                    </c:when>
                    <c:otherwise>
                      <a href="/admin/dashboard?page=${p}&size=${pageSize}&search=${search}&status=${status}"
                        class="w-10 h-10 rounded-lg flex items-center justify-center hover:bg-surface-container-low font-label-md text-label-md text-on-surface transition-colors">
                        ${p + 1}
                      </a>
                    </c:otherwise>
                  </c:choose>
                </c:if>
              </c:forEach>
              </c:if>

              <%-- Next --%>
              <c:choose>
                <c:when test="${currentPage < totalPages - 1}">
                  <a href="/admin/dashboard?page=${currentPage + 1}&size=${pageSize}&search=${search}&status=${status}"
                    class="w-10 h-10 rounded-lg flex items-center justify-center hover:bg-surface-container-low text-on-surface-variant transition-colors">
                    <span class="material-symbols-outlined">chevron_right</span>
                  </a>
                </c:when>
                <c:otherwise>
                  <span class="w-10 h-10 rounded-lg flex items-center justify-center text-outline cursor-not-allowed">
                    <span class="material-symbols-outlined">chevron_right</span>
                  </span>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
      </div>
    </main>

    <script>
      // hover
      document.querySelectorAll("tbody tr").forEach(row => {
        row.addEventListener("mouseenter", () => row.classList.add("shadow-sm"));
        row.addEventListener("mouseleave", () => row.classList.remove("shadow-sm"));
      });
    </script>
  </body>
</html>
