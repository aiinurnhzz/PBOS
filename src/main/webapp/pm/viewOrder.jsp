<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.petboss.model.Order" %>
<%@ page import="com.petboss.model.OrderItem" %>

<%
    Order order = (Order) request.getAttribute("order");
    List<OrderItem> orderItems =
        (List<OrderItem>) request.getAttribute("orderItems");

    double subtotal = (double) request.getAttribute("subtotal");
    double tax = (double) request.getAttribute("tax");
    double grandTotal = (double) request.getAttribute("grandTotal");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Order</title>

<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
th {
    background-color: #e6f4ea;
    border: 1px solid #009a49;
}
td {
    border: 1px solid #009a49;
    padding: 8px;
    text-align: center;
}
</style>
</head>

<body class="font-sans h-screen flex flex-col">
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
           class="mx-auto w-[85%] h-11 bg-[#f2711c] hover:bg-[#009a49] text-white
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
           class="mx-auto w-[85%] h-11 bg-[#009a49] hover:bg-[#009a49] text-white
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

<div class="max-w-6xl mx-auto bg-white p-8 rounded-2xl border-2 border-green-600">

<!-- HEADER -->
<div class="flex items-center gap-4 mb-6">
    <a href="<%=request.getContextPath()%>/order"
       class="text-2xl font-bold">&larr;</a>
    <h2 class="text-3xl font-bold">View Order</h2>
</div>

<!-- ORDER INFO -->
<div class="grid grid-cols-4 gap-6 border-2 border-green-600 p-6 rounded-xl mb-6">

<div>
<label class="text-sm">Order ID</label>
<input value="<%=order.getOrderId()%>"
       class="w-full border p-2 bg-gray-100" readonly>
</div>

<div>
<label class="text-sm">Supplier</label>
<input value="<%=order.getSupplierName()%>"
       class="w-full border p-2 bg-gray-100" readonly>
</div>

<div>
<label class="text-sm">Order By</label>
<input value="<%=order.getStaffName()%>"
       class="w-full border p-2 bg-gray-100" readonly>
</div>

<div>
<label class="text-sm">Order Date</label>
<input value="<%=order.getOrderDate()%>"
       class="w-full border p-2 bg-gray-100" readonly>
</div>

</div>

<!-- ITEMS TABLE -->
<table class="w-full mb-6">
<thead>
<tr>
<th>Product ID</th>
<th>Product</th>
<th>Quantity</th>
<th>Unit Price (RM)</th>
<th>Total (RM)</th>
<th>Action</th>
</tr>
</thead>

<tbody>
<%
if (orderItems == null || orderItems.isEmpty()) {
%>
<tr>
<td colspan="6" class="text-gray-500 py-4">No items</td>
</tr>
<%
} else {
    for (OrderItem i : orderItems) {
%>
<tr>
<td><%= i.getProductId() %></td>
<td><%= i.getProductName() %></td>
<td><%= i.getQuantity() %></td>
<td><%= String.format("%.2f", i.getUnitPrice()) %></td>
<td><%= String.format("%.2f", i.getTotal()) %></td>
<td>
<div class="inline-flex gap-4 opacity-40 cursor-not-allowed">
    <i class="fas fa-pencil-alt"></i>
    <i class="fas fa-trash"></i>
</div>
</td>
</tr>
<%
    }
}
%>
</tbody>
</table>

<!-- SUMMARY -->
<div class="space-y-2 text-sm">
    <div class="flex justify-between">
        <span>Subtotal (RM)</span>
        <span><%= String.format("%.2f", subtotal) %></span>
    </div>

    <div class="flex justify-between">
        <span>Tax (6%)</span>
        <span><%= String.format("%.2f", tax) %></span>
    </div>

    <hr>

    <div class="flex justify-between font-bold text-green-700">
        <span>Grand Total (RM)</span>
        <span><%= String.format("%.2f", grandTotal) %></span>
    </div>
</div>

</div>
</div>
</body>
</html>
