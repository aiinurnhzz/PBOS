<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.petboss.model.Order" %>

<%
    String staffId = (String) session.getAttribute("staffId");
    String role = (String) session.getAttribute("role");

    if (staffId == null || role == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    List<Order> orderList = (List<Order>) request.getAttribute("orderList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Orders</title>

<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
html, body {
    height: 100%;
    margin: 0;
    background-color: #fdf8e9;
}
th {
    background-color: #e6f4ea;
    border: 1px solid #009a49;
}
td {
    border: 1px solid #009a49;
    text-align: center;
    font-size: 0.85rem;
    padding: 8px;
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

<!-- ===== MAIN ===== -->
<main class="flex-1 p-8 overflow-y-auto">
<div class="bg-white p-8 rounded-3xl border-2 border-green-600">

<!-- TITLE -->
<div class="flex justify-between items-center mb-6">
    <h2 class="text-3xl font-black">Orders</h2>

    <a href="<%=request.getContextPath()%>/order?action=create"
       class="bg-green-600 text-white px-6 py-3 rounded-full font-semibold">
        + Create Order
    </a>
</div>

<!-- SEARCH + FILTER (SAME DESIGN AS PRODUCT.JSP) -->
<form id="orderForm"
      method="get"
      action="<%=request.getContextPath()%>/order"
      class="flex items-center gap-4 mb-6">

    <!-- SEARCH -->
    <div class="relative flex-1">
        <input
            id="orderSearch"
            name="keyword"
            type="text"
            value="<%= request.getAttribute("keyword") != null
                    ? request.getAttribute("keyword") : "" %>"
            placeholder="Search Order ID, Supplier, Staff"
            class="w-full border-2 border-[#009a49]
                   rounded-lg px-4 py-2 outline-none
                   focus:ring-2 focus:ring-green-200 pr-10">

        <i class="fas fa-search absolute right-3 top-2.5
                  text-[#009a49] text-lg pointer-events-none"></i>
    </div>

    <!-- FILTER : STATUS -->
    <div class="relative w-64">
        <div class="flex items-center border-2 border-[#009a49]
                    rounded-lg overflow-hidden bg-white h-full">

            <div class="px-3 border-r-2 border-[#009a49]">
                <i class="fas fa-filter text-[#009a49]"></i>
            </div>

            <select id="statusFilter"
                    name="status"
                    class="w-full px-4 py-2 outline-none bg-white appearance-none">
                <option value="">All Status</option>
                <option value="SUBMITTED">Submitted</option>
                <option value="PARTIALLY RECEIVED">Partially Received</option>
                <option value="COMPLETED">Completed</option>
            </select>

            <i class="fas fa-caret-down absolute right-3 top-3
                      pointer-events-none text-gray-500"></i>
        </div>
    </div>
</form>

<!-- STATUS LEGEND -->
<div class="flex items-center gap-6 mb-6 text-sm">
    <div class="flex items-center gap-2">
        <span class="w-3 h-3 rounded-full bg-blue-600 inline-block"></span>
        <span>Submitted</span>
    </div>

    <div class="flex items-center gap-2">
        <span class="w-3 h-3 rounded-full bg-yellow-500 inline-block"></span>
        <span>Partially Received</span>
    </div>

    <div class="flex items-center gap-2">
        <span class="w-3 h-3 rounded-full bg-green-600 inline-block"></span>
        <span>Completed</span>
    </div>
</div>

<!-- TABLE -->
<div class="overflow-x-auto">
<table class="w-full border-collapse">
<thead>
<tr>
    <th>Order ID</th>
    <th>Supplier</th>
    <th>Order By</th>
    <th>Order Date</th>
    <th>Status</th>
    <th>Total (RM)</th>
    <th>Action</th>
</tr>
</thead>

<tbody id="orderTableBody">
<%
    if (orderList == null || orderList.isEmpty()) {
%>
<tr>
    <td colspan="7" class="text-center text-gray-500 p-6">
        No orders found
    </td>
</tr>
<%
    } else {
        for (Order o : orderList) {
            String status = o.getStatus();
            String statusClass = "bg-blue-600";

            if ("COMPLETED".equalsIgnoreCase(status))
                statusClass = "bg-green-600";
            else if ("PARTIALLY RECEIVED".equalsIgnoreCase(status))
                statusClass = "bg-yellow-500";
%>
<tr>
    <td><%= o.getOrderId() %></td>
    <td><%= o.getSupplierName() %></td>
    <td><%= o.getStaffName() %></td>
    <td><%= o.getOrderDate() %></td>

    <td>
        <span class="px-3 py-1 rounded-full text-white text-xs <%=statusClass%>">
            <%= status %>
        </span>
    </td>

    <td>RM <%= String.format("%.2f", o.getTotal()) %></td>

    <!-- VIEW ONLY -->
    <td>
        <a href="<%=request.getContextPath()%>/order?action=view&id=<%=o.getOrderId()%>"
           class="inline-flex items-center justify-center
                  bg-gray-200 hover:bg-gray-300
                  text-gray-700 px-4 py-1 rounded-full text-sm">
            View
        </a>
    </td>
</tr>
<%
        }
    }
%>
</tbody>
</table>
</div>

</div>
</main>
</div>

<script>
/* ===============================
   AJAX LIVE SEARCH (ORDER)
   SAME PATTERN AS PRODUCT.JSP
================================ */

const orderSearch = document.getElementById("orderSearch");
const statusFilter = document.getElementById("statusFilter");
const orderTableBody = document.getElementById("orderTableBody");

let typingTimer;
const contextPath = "<%=request.getContextPath()%>";

function loadOrders() {

    const keyword = orderSearch.value || "";
    const status = statusFilter.value || "";

    fetch(
        contextPath + "/order?ajax=true"
        + "&keyword=" + encodeURIComponent(keyword)
        + "&status=" + encodeURIComponent(status)
    )
    .then(res => res.json())
    .then(data => {

        orderTableBody.innerHTML = "";

        if (!data || data.length === 0) {
            orderTableBody.innerHTML =
                "<tr>" +
                    "<td colspan='7' class='text-center text-gray-500 p-6'>" +
                        "No orders found" +
                    "</td>" +
                "</tr>";
            return;
        }

        data.forEach(o => {

            let statusClass = "bg-blue-600";
            if (o.status === "COMPLETED") {
                statusClass = "bg-green-600";
            } else if (o.status === "PARTIALLY RECEIVED") {
                statusClass = "bg-yellow-500";
            }

            const row =
                "<tr>" +

                    "<td>" + o.orderId + "</td>" +
                    "<td>" + o.supplierName + "</td>" +
                    "<td>" + o.staffName + "</td>" +
                    "<td>" + o.orderDate + "</td>" +

                    "<td>" +
                        "<span class='px-3 py-1 rounded-full text-white text-xs " + statusClass + "'>" +
                            o.status +
                        "</span>" +
                    "</td>" +

                    "<td>RM " + Number(o.total).toFixed(2) + "</td>" +

                    "<td>" +
                        "<a href='" + contextPath +
                        "/order?action=view&id=" + o.orderId + "' " +
                        "class='inline-flex items-center justify-center " +
                               "bg-gray-200 hover:bg-gray-300 " +
                               "text-gray-700 px-4 py-1 rounded-full text-sm'>" +
                            "View" +
                        "</a>" +
                    "</td>" +

                "</tr>";

            orderTableBody.insertAdjacentHTML("beforeend", row);
        });
    })
    .catch(err => {
        console.error("Failed to load orders:", err);
    });
}

/* ===== LIVE SEARCH (typing) ===== */
orderSearch.addEventListener("input", () => {
    clearTimeout(typingTimer);
    typingTimer = setTimeout(loadOrders, 400);
});

/* ===== STATUS FILTER ===== */
statusFilter.addEventListener("change", loadOrders);
</script>

</body>
</html>

