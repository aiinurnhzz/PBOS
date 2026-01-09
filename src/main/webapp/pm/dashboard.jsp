<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="true"%>

<%
String staffId = (String) session.getAttribute("staffId");
String role = (String) session.getAttribute("role");

if (staffId == null || role == null) {
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
}

String staffName = (String) session.getAttribute("staffName");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PM Dashboard</title>

<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
html, body {
	height: 100%;
	margin: 0;
	overflow: hidden;
	background-color: #fdf8e9;
}
</style>
</head>

<body class="font-sans flex flex-col h-screen">

	<!-- ===== HEADER (SAME AS ADMIN) ===== -->
	<header
		class="w-full bg-[#266b8b] flex justify-between items-center px-6 py-3">
		<h1 class="text-white text-2xl font-bold">Pet Boss Centre Cash
			and Carry</h1>

		<form action="<%=request.getContextPath()%>/logout" method="post">
			<button
				class="text-white font-semibold text-sm">
				<i class="fas fa-sign-out-alt"></i> Logout
			</button>
		</form>
	</header>

	<div class="flex flex-1 overflow-hidden">

		<!-- ===== SIDEBAR (NO SCROLL, BALANCED VERSION) ===== -->
<aside class="w-60 bg-[#266b8b] px-5 py-4 flex flex-col h-full">

    <!-- ===== NAVIGATION ===== -->
    <nav class="flex-1 space-y-5">

        <a href="<%=request.getContextPath()%>/dashboard"
           class="mx-auto w-[85%] h-11 bg-[#009a49] hover:bg-[#009a49] text-white
                  px-4 rounded-full flex items-center gap-3
                  border-2 border-white shadow-md text-sm font-semibold">
            <i class="fas fa-home w-5 text-center"></i>
            <span>Home</span>
        </a>

        <a href="<%=request.getContextPath()%>/profile"
           class="mx-auto w-[85%] h-11 bg-[#f2711c] hover:bg-[#009a49] text-white
                  px-4 rounded-full flex items-center gap-3
                  border-2 border-white shadow-md text-sm font-semibold">
            <i class="fas fa-user-circle w-5 text-center"></i>
            <span>Profile</span>
        </a>

        <a href="<%=request.getContextPath()%>/product"
           class="mx-auto w-[85%] h-11 bg-[#f2711c] hover:bg-[#009a49] text-white
                  px-4 rounded-full flex items-center gap-3
                  border-2 border-white shadow-md text-sm font-semibold">
            <i class="fas fa-box w-5 text-center"></i>
            <span>Product</span>
        </a>

        <a href="<%=request.getContextPath()%>/supplier"
           class="mx-auto w-[85%] h-11 bg-[#f2711c] hover:bg-[#009a49] text-white
                  px-4 rounded-full flex items-center gap-3
                  border-2 border-white shadow-md text-sm font-semibold">
            <i class="fas fa-truck w-5 text-center"></i>
            <span>Supplier</span>
        </a>

        <a href="<%=request.getContextPath()%>/order"
           class="mx-auto w-[85%] h-11 bg-[#f2711c] hover:bg-[#009a49] text-white
                  px-4 rounded-full flex items-center gap-3
                  border-2 border-white shadow-md text-sm font-semibold">
            <i class="fas fa-file-invoice w-5 text-center"></i>
            <span>Order</span>
        </a>

        <a href="<%=request.getContextPath()%>/receive-product"
           class="mx-auto w-[85%] h-11 bg-[#f2711c] hover:bg-[#009a49] text-white
                  px-4 rounded-full flex items-center gap-3
                  border-2 border-white shadow-md text-sm font-semibold">
            <i class="fas fa-box-open w-5 text-center"></i>
            <span>Receive Product</span>
        </a>

        <a href="<%=request.getContextPath()%>/product-qc"
           class="mx-auto w-[85%] h-11 bg-[#f2711c] hover:bg-[#009a49] text-white
                  px-4 rounded-full flex items-center gap-3
                  border-2 border-white shadow-md text-sm font-semibold">
            <i class="fas fa-check-circle w-5 text-center"></i>
            <span>Product QC</span>
        </a>

    </nav>

   <!-- ===== LOGO (SAFE FOR SMALL SCREEN) ===== -->
	<div class="flex justify-center mt-auto pb-4">
	    <img src="<%=request.getContextPath()%>/images/logo_PetBoss.png"
	    	class="w-36 sm:w-40 md:w-44 opacity-100">
	</div>

</aside>

		<!-- ===== CONTENT (SAME GRID STYLE AS ADMIN) ===== -->
		<main class="flex-1 p-8 overflow-y-auto">

			<div class="mb-6">
			    <h2 class="text-4xl font-black text-cyan-900 uppercase">
			        Welcome,
			        <%= staffName != null ? staffName : "Staff" %>
			    </h2>
			    <p id="current-date" class="text-gray-700 font-bold mt-1"></p>
			</div>

			<div class="grid grid-cols-4 gap-6 mb-8">

				<div
					class="bg-cyan-400 text-white p-6 rounded-lg text-center shadow-md">
					<i class="fas fa-boxes text-3xl mb-2"></i>
					<h3 class="font-bold text-lg">Total Products</h3>
					<p class="text-5xl font-bold mt-2">—</p>
				</div>

				<div
					class="bg-orange-500 text-white p-6 rounded-lg text-center shadow-md">
					<i class="fas fa-users text-3xl mb-2"></i>
					<h3 class="font-bold text-lg">Total Staff</h3>
					<p class="text-5xl font-bold mt-2">
						<%= request.getAttribute("totalStaff") %>
					</p>
				</div>

				<div
					class="bg-sky-800 text-white p-6 rounded-lg text-center shadow-md">
					<i class="fas fa-truck-loading text-3xl mb-2"></i>
					<h3 class="font-bold text-lg">Suppliers</h3>
					<p class="text-5xl font-bold mt-2">—</p>
				</div>

				<div
					class="bg-red-500 text-white p-6 rounded-lg text-center shadow-md">
					<i class="fas fa-exclamation-triangle text-3xl mb-2"></i>
					<h3 class="font-bold text-lg">Low Stock</h3>
					<p class="text-5xl font-bold mt-2">—</p>
				</div>

			</div>

		</main>
	</div>

	<script>
const date = new Date().toLocaleDateString('en-GB', {
    day: 'numeric',
    month: 'long',
    year: 'numeric'
});
document.getElementById("current-date").innerText = "Today: " + date;
</script>

</body>
</html>
