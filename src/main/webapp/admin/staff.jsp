<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.petboss.model.Staff" %>

<%
    List<Staff> staffList = (List<Staff>) request.getAttribute("staffList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Staff</title>

<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
    background-color: #fdf8e9;
}
</style>
</head>

<body class="font-sans flex flex-col h-screen">

<!-- ===== HEADER ===== -->
<header class="w-full bg-[#266b8b] flex justify-between items-center px-6 py-3">
    <h1 class="text-white text-2xl font-bold">
        Pet Boss Centre Cash and Carry
    </h1>

    <form action="<%=request.getContextPath()%>/logout" method="post">
        <button
            class="bg-[#f2711c] text-white px-4 py-1.5 rounded-xl
                   flex items-center gap-2 font-semibold text-sm">
            <i class="fas fa-sign-out-alt"></i> Logout
        </button>
    </form>
</header>

<div class="flex flex-1 overflow-hidden">

<!-- ===== SIDEBAR ===== -->
		<aside class="w-48 bg-[#266b8b] p-6 flex flex-col relative">
			<nav class="w-full space-y-4">

				<a href="<%=request.getContextPath()%>/dashboard"
					class="w-full bg-[#f2711c] hover:bg-[#009a49] text-white py-2 px-4
              rounded-full flex items-center gap-3 border-2 border-white shadow-md">
					<i class="fas fa-home"></i> Home
				</a> 
				
				<a href="<%=request.getContextPath()%>/profile"
					class="w-full bg-[#f2711c] hover:bg-[#009a49] text-white py-2 px-4
              rounded-full flex items-center gap-3 border-2 border-white shadow-md">
					<i class="fas fa-user-circle"></i> Profile
				</a> 
				
				<a href="<%=request.getContextPath()%>/staff"
					class="w-full bg-[#009a49] hover:bg-[#009a49] text-white py-2 px-4
              rounded-full flex items-center gap-3 border-2 border-white shadow-md">
					<i class="fas fa-users"></i> Staff
				</a> 
				
				<a href="<%=request.getContextPath()%>/product"
					class="w-full bg-[#f2711c] hover:bg-[#009a49] text-white py-2 px-4
              rounded-full flex items-center gap-3 border-2 border-white shadow-md">
					<i class="fas fa-box"></i> Product
				</a> 
				
				<a href="<%=request.getContextPath()%>/supplier"
					class="w-full bg-[#f2711c] hover:bg-[#009a49] text-white py-2 px-4
              rounded-full flex items-center gap-3 border-2 border-white shadow-md">
					<i class="fas fa-truck"></i> Supplier
				</a>

			</nav>
			<img src="<%=request.getContextPath()%>/images/logo_PetBoss.png"
				class="absolute bottom-6 left-1/2 -translate-x-1/2 w-64 opacity-70">
		</aside>

<!-- ===== MAIN CONTENT ===== -->
<main class="flex-1 p-10 overflow-y-auto">

<!-- ===== STAFF CARD ===== -->
<div class="bg-white border-2 border-[#009a49] rounded-3xl shadow-xl relative">

    <!-- STAFF TAB (FLUSH LEFT) -->
    <div class="bg-[#009a49] text-white px-12 py-3
                rounded-br-3xl rounded-tl-3xl
                text-2xl font-bold tracking-widest inline-block">
        STAFF
    </div>

    <!-- REGISTER BUTTON -->
    <a href="<%=request.getContextPath()%>/registerStaff"
       class="absolute top-4 right-6 bg-[#f2711c] text-white
              px-8 py-2 rounded-full font-bold shadow-md">
        Register Staff
    </a>

    <!-- CONTENT -->
    <div class="p-6">

        <!-- SEARCH + FILTER -->
        <div class="flex gap-4 mb-6">

            <!-- SEARCH -->
            <div class="relative flex-1">
                <input id="searchInput" type="text"
                       placeholder="Search staff name or ID"
                       class="w-full border-2 border-[#009a49]
                              rounded-full px-5 py-2 pr-10 outline-none">
                <i class="fas fa-search absolute right-4 top-3
                          text-[#009a49]"></i>
            </div>

            <!-- FILTER -->
            <div class="relative w-52">
                <select id="roleFilter"
                        class="w-full border-2 border-[#009a49]
                               rounded-full px-5 py-2 appearance-none">
                    <option value="">All Roles</option>
                    <option>Admin</option>
                    <option>Purchasing Manager</option>
                    <option>Staff</option>
                </select>
                <i class="fas fa-caret-down absolute right-4 top-3
                          text-gray-500"></i>
            </div>

        </div>

        <!-- TABLE -->
        <div class="border-2 border-[#009a49] rounded-2xl overflow-hidden">

            <div class="max-h-[420px] overflow-y-auto">
                <table class="w-full text-left">

                    <thead class="bg-white border-b-2 border-[#009a49]">
                        <tr>
                            <th class="p-4 text-center">Name</th>
                            <th class="p-4 text-center">Staff ID</th>
                            <th class="p-4 text-center">Role</th>
                            <th class="p-4 text-center">Action</th>
                        </tr>
                    </thead>

                    <tbody id="staffTable">
                    <%
                        if (staffList != null && !staffList.isEmpty()) {
                            for (Staff s : staffList) {
                    %>
                        <tr class="staff-row border-b">
                            <td class="p-4"><%= s.getFullName() %></td>
                            <td class="p-4 text-center staff-id"><%= s.getStaffId() %></td>
                            <td class="p-4 text-center staff-role"><%= s.getRole() %></td>
                            
                            <td class="px-4 py-2 text-center">
							  <div class="flex justify-center items-center gap-4">
							
							    <!-- VIEW STAFF -->
							    <div class="relative group flex flex-col items-center">
							      <a href="<%=request.getContextPath()%>/viewStaff?staffId=<%= s.getStaffId() %>"
							         class="text-black hover:scale-150 transition-transform">
							        <i class="fas fa-eye"></i>
							      </a>
							
							      <span
							        class="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 hidden
							               group-hover:block bg-black text-white text-[10px]
							               py-1 px-2 rounded shadow-lg whitespace-nowrap z-50">
							        View
							      </span>
							    </div>
							
							    <!-- UPDATE STAFF -->
							    <div class="relative group flex flex-col items-center">
							      <a href="<%=request.getContextPath()%>/updateStaff?staffId=<%= s.getStaffId() %>"
							         class="text-black hover:scale-150 transition-transform">
							        <i class="fas fa-pencil-alt"></i>
							      </a>
							
							      <span
							        class="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 hidden
							               group-hover:block bg-black text-white text-[10px]
							               py-1 px-2 rounded shadow-lg whitespace-nowrap z-50">
							        Update
							      </span>
							    </div>
							
							  </div>
							</td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="4" class="text-center py-10 text-gray-500">
                                No staff found
                            </td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>

                </table>
            </div>
        </div>

    </div>
</div>

</main>
</div>

<!-- ===== SEARCH + FILTER SCRIPT ===== -->
<script>
const searchInput = document.getElementById("searchInput");
const roleFilter = document.getElementById("roleFilter");
const rows = document.querySelectorAll(".staff-row");

function filterStaff() {
    const search = searchInput.value.toLowerCase();
    const role = roleFilter.value.toLowerCase();

    rows.forEach(row => {
        const name = row.innerText.toLowerCase();
        const rowRole = row.querySelector(".staff-role").innerText.toLowerCase();

        row.style.display =
            name.includes(search) &&
            (role === "" || rowRole === role)
            ? "" : "none";
    });
}

searchInput.addEventListener("keyup", filterStaff);
roleFilter.addEventListener("change", filterStaff);
</script>

</body>
</html>
