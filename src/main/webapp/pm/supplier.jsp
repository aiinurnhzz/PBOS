<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.petboss.model.Supplier" %>

<%
    List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Pet Boss - Suppliers</title>

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
th {
    background-color: #e6f4ea;
    color: #000;
    font-weight: bold;
    border: 1px solid #009a49 !important;
}
td {
    border: 1px solid #009a49 !important;
    text-align: center;
    font-size: 0.85rem;
    padding: 8px;
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
           class="mx-auto w-[85%] h-11 bg-[#009a49] hover:bg-[#009a49] text-white
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

<!-- MAIN -->
<main class="flex-1 p-8 overflow-y-auto">
<div class="bg-white p-8 rounded-3xl border-2 border-green-600">

<!-- TITLE -->
<div class="flex justify-between items-center mb-6">
    <h2 class="text-3xl font-black">Suppliers</h2>

    <a href="<%=request.getContextPath()%>/pm/addSupplier"
       class="bg-green-600 text-white px-6 py-3 rounded-full font-semibold">
        + Add Supplier
    </a>
</div>

<!-- SEARCH -->
<div class="relative mb-6">
    <input id="supplierSearch" type="text" placeholder="Search"
           class="w-full border-2 border-[#009a49] rounded-lg px-4 py-2 pr-10">
    <i class="fas fa-search absolute right-3 top-2.5 text-[#009a49]"></i>
</div>

<!-- TABLE -->
<div class="overflow-x-auto">
<table class="w-full border-collapse">

<thead>
<tr>
    <th class="border p-2">Supplier ID</th>
    <th class="border p-2">Supplier Name</th>
    <th class="border p-2">Email</th>
    <th class="border p-2">Phone</th>
    <th class="border p-2">Address</th>
    <th class="border p-2">Action</th>
</tr>
</thead>

<tbody>
<%
    if (suppliers != null && !suppliers.isEmpty()) {
        for (Supplier s : suppliers) {
%>
<tr>
    <td><%= s.getSupplierId() %></td>

    <td class="text-blue-600 underline cursor-pointer"
        data-id="<%= s.getSupplierId() %>"
        data-name="<%= s.getName() %>"
        data-email="<%= s.getEmail() %>"
        data-phone="<%= s.getPhone() %>"
        data-address="<%= s.getAddress() %>"
        onclick="openViewSupplierModal(this)">
        <%= s.getName() %>
    </td>

    <td><%= s.getEmail() %></td>
    <td><%= s.getPhone() %></td>
    <td><%= s.getAddress() %></td>

    <td>
        <div class="inline-flex gap-4">
	        <!-- ✏️ EDIT -->
	        <div class="relative group flex flex-col items-center">
	            <i class="fas fa-pencil-alt text-black hover:scale-150 transition text-lg cursor-pointer"
	               data-id="<%= s.getSupplierId() %>"
	               data-name="<%= s.getName() %>"
	               data-email="<%= s.getEmail() %>"
	               data-phone="<%= s.getPhone() %>"
	               data-address="<%= s.getAddress() %>"
	               onclick="openEditSupplierModal(this)"></i>
	            <span
					class="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 hidden group-hover:block 
					bg-black text-white text-[10px] py-1 px-2 rounded shadow-lg whitespace-nowrap z-50">Update
				</span>
	        </div>
	
			<!-- 🗑️ DELETE -->
	        <div class="relative group flex flex-col items-center">
	            <a href="<%=request.getContextPath()%>/deleteSupplier?id=<%=s.getSupplierId()%>"
	               onclick="return confirm('Delete this supplier?')">
	               <i class="fas fa-trash text-black hover:scale-150 transition text-lg cursor-pointer"></i>
	            </a>
	           	<span
					class="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 hidden group-hover:block 
					bg-black text-white text-[10px] py-1 px-2 rounded shadow-lg whitespace-nowrap z-50">Delete
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
    <td colspan="6" class="text-center py-6 text-gray-500">
        No suppliers found
    </td>
</tr>
<%
    }
%>
</tbody>

</table>


</div>
</div>
</main>
</div>

<!-- ===== VIEW SUPPLIER MODAL ===== -->
<div id="viewSupplierModal"
     class="fixed inset-0 bg-black bg-opacity-50 hidden
            flex items-center justify-center z-50">

<div class="bg-white rounded-2xl border-2 border-[#009a49]
            w-[800px] p-8">

    <h3 class="text-green-700 font-bold mb-4">
        COMPANY INFORMATION
    </h3>

    <div class="grid grid-cols-2 gap-6 mb-6">
        <div>
            <label>Supplier Name</label>
            <input id="viewSupplierName" class="w-full border p-2" readonly>
        </div>

        <div>
            <label>Supplier ID</label>
            <input id="viewSupplierId" class="w-full border p-2 bg-gray-200" readonly>
        </div>
    </div>

    <h3 class="text-green-700 font-bold mb-2">
        CONTACT INFORMATION
    </h3>

    <div class="grid grid-cols-2 gap-6 mb-6">
        <div>
            <label>Email</label>
            <input id="viewSupplierEmail" class="w-full border p-2" readonly>
        </div>

        <div>
            <label>Phone Number</label>
            <input id="viewSupplierPhone" class="w-full border p-2" readonly>
        </div>
    </div>

    <h3 class="text-green-700 font-bold mb-2">
        BUSINESS ADDRESS
    </h3>

    <textarea id="viewSupplierAddress"
              class="w-full border p-3 h-24"
              readonly></textarea>

    <div class="flex justify-end mt-6">
        <button onclick="closeViewSupplierModal()"
                class="bg-red-500 text-white px-8 py-2 rounded-full">
            Close
        </button>
    </div>
</div>
</div>

<!-- ===== EDIT SUPPLIER MODAL ===== -->
<div id="editSupplierModal"
     class="fixed inset-0 bg-black bg-opacity-50 hidden
            flex items-center justify-center z-50">

<form action="<%=request.getContextPath()%>/updateSupplier"
      method="post"
      class="bg-white rounded-2xl border-2 border-[#009a49]
             w-[800px] p-8">

    <h3 class="text-green-700 font-bold mb-4">
        COMPANY INFORMATION
    </h3>

    <div class="grid grid-cols-2 gap-6 mb-6">
        <div>
            <label>Supplier Name</label>
            <input name="supplierName" id="editSupplierName"
                   class="w-full border p-2">
        </div>

        <div>
            <label>Supplier ID</label>
            <input name="supplierId" id="editSupplierId"
                   class="w-full border p-2 bg-gray-200" readonly>
        </div>
    </div>

    <h3 class="text-green-700 font-bold mb-2">
        CONTACT INFORMATION
    </h3>

    <div class="grid grid-cols-2 gap-6 mb-6">
        <div>
            <label>Email</label>
            <input name="email" id="editSupplierEmail"
                   class="w-full border p-2">
        </div>

        <div>
            <label>Phone Number</label>
            <input name="phone" id="editSupplierPhone"
                   class="w-full border p-2">
        </div>
    </div>

    <h3 class="text-green-700 font-bold mb-2">
        BUSINESS ADDRESS
    </h3>

    <textarea name="address" id="editSupplierAddress"
              class="w-full border p-3 h-24"></textarea>

    <div class="flex justify-end gap-4 mt-6">
        <button type="button"
                onclick="closeEditSupplierModal()"
                class="bg-gray-500 text-white px-8 py-2 rounded-full">
            Cancel
        </button>

        <button type="submit"
                class="bg-[#009a49] text-white px-8 py-2 rounded-full">
            Save Supplier
        </button>
    </div>
</form>
</div>

<script>
function openViewSupplierModal(el) {
    document.getElementById('viewSupplierId').value = el.dataset.id;
    document.getElementById('viewSupplierName').value = el.dataset.name;
    document.getElementById('viewSupplierEmail').value = el.dataset.email;
    document.getElementById('viewSupplierPhone').value = el.dataset.phone;
    document.getElementById('viewSupplierAddress').value = el.dataset.address;

    document.getElementById('viewSupplierModal').classList.remove('hidden');
}

function closeViewSupplierModal() {
    document.getElementById('viewSupplierModal').classList.add('hidden');
}

function openEditSupplierModal(el) {
    document.getElementById('editSupplierId').value = el.dataset.id;
    document.getElementById('editSupplierName').value = el.dataset.name;
    document.getElementById('editSupplierEmail').value = el.dataset.email;
    document.getElementById('editSupplierPhone').value = el.dataset.phone;
    document.getElementById('editSupplierAddress').value = el.dataset.address;

    document.getElementById('editSupplierModal').classList.remove('hidden');
}

function closeEditSupplierModal() {
    document.getElementById('editSupplierModal').classList.add('hidden');
}
</script>
<script>
const supplierSearch = document.getElementById("supplierSearch");
const tableBody = document.querySelector("tbody");
const contextPath = "<%= request.getContextPath() %>";

let typingTimer;

/* ===============================
   AJAX LOAD SUPPLIERS
   =============================== */
function loadSuppliers() {

    const keyword = supplierSearch.value;

    fetch(
        contextPath + "/supplier?ajax=true&keyword=" +
        encodeURIComponent(keyword)
    )
    .then(res => res.json())
    .then(data => {

        tableBody.innerHTML = "";

        if (data.length === 0) {
            tableBody.innerHTML =
                "<tr>" +
                "<td colspan='6' class='text-center py-6 text-gray-500'>" +
                "No suppliers found" +
                "</td></tr>";
            return;
        }

        data.forEach(s => {

            const row =
                "<tr>" +

                "<td>" + s.id + "</td>" +

                "<td class='text-blue-600 underline cursor-pointer' " +
                "data-id='" + s.id + "' " +
                "data-name='" + s.name + "' " +
                "data-email='" + s.email + "' " +
                "data-phone='" + s.phone + "' " +
                "data-address='" + s.address + "' " +
                "onclick='openViewSupplierModal(this)'>" +
                s.name + "</td>" +

                "<td>" + s.email + "</td>" +
                "<td>" + s.phone + "</td>" +
                "<td>" + s.address + "</td>" +

                "<td>" +

                    "<div class='inline-flex gap-4'>" +

                        // ✏️ UPDATE
                        "<div class='relative group flex flex-col items-center'>" +
                            "<i class='fas fa-pencil-alt text-black hover:scale-150 transition text-lg cursor-pointer' " +
                            "data-id='" + s.id + "' " +
                            "data-name='" + s.name + "' " +
                            "data-email='" + s.email + "' " +
                            "data-phone='" + s.phone + "' " +
                            "data-address='" + s.address + "' " +
                            "onclick='openEditSupplierModal(this)'></i>" +
                            "<span class='absolute bottom-full left-1/2 -translate-x-1/2 mb-2 hidden group-hover:block " +
                                  "bg-black text-white text-[10px] py-1 px-2 rounded shadow-lg whitespace-nowrap z-50'>" +
                                  "Update</span>" +
                        "</div>" +

                        // 🗑️ DELETE
                        "<div class='relative group flex flex-col items-center'>" +
                            "<a href='" + contextPath + "/deleteSupplier?id=" + s.id + "' " +
                               "onclick=\"return confirm('Delete this supplier?')\">" +
                                "<i class='fas fa-trash text-black hover:scale-150 transition text-lg cursor-pointer'></i>" +
                            "</a>" +
                            "<span class='absolute bottom-full left-1/2 -translate-x-1/2 mb-2 hidden group-hover:block " +
                                  "bg-black text-white text-[10px] py-1 px-2 rounded shadow-lg whitespace-nowrap z-50'>" +
                                  "Delete</span>" +
                        "</div>" +

                    "</div>" +

                "</td>" +
                "</tr>";

            tableBody.insertAdjacentHTML("beforeend", row);
        });
    });
}

/* ===============================
   LIVE SEARCH LISTENER
   =============================== */
supplierSearch.addEventListener("input", () => {
    clearTimeout(typingTimer);
    typingTimer = setTimeout(loadSuppliers, 400);
});
</script>

</body>
</html>
