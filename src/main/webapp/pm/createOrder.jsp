<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.petboss.model.Supplier" %>

<%
    String staffId = (String) session.getAttribute("staffId");
    List<Supplier> supplierList =
        (List<Supplier>) request.getAttribute("supplierList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Order</title>

<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

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

<!-- ================= MAIN ================= -->
<main class="flex-1 overflow-auto p-6">

<form action="<%=request.getContextPath()%>/pm/createOrder" method="post">

<!-- ===== WHITE CONTAINER ===== -->
<div class="bg-white p-8 rounded-2xl border-2 border-green-600 max-w-7xl mx-auto">

<!-- ================= TOP SECTION ================= -->
<div class="grid grid-cols-3 gap-6 mb-8">

<!-- ===== LEFT : ORDER INFO ===== -->
<div class="col-span-2 border-2 border-green-600 rounded-xl p-6">

<div class="flex items-center gap-4 mb-6">
    <a href="<%=request.getContextPath()%>/order" class="text-2xl font-bold">&larr;</a>
    <h2 class="text-3xl font-bold">Create Order</h2>
</div>

<div class="grid grid-cols-4 gap-6">

<div>
<label>Supplier</label>
<select name="supplierId" required class="w-full border p-2 rounded">
<option value="">Select Supplier</option>
<% for (Supplier s : supplierList) { %>
<option value="<%=s.getSupplierId()%>"><%=s.getName()%></option>
<% } %>
</select>
</div>

<div>
<label>Order By</label>
<input type="text" value="<%=staffId%>" readonly class="w-full border p-2 bg-gray-100">
<input type="hidden" name="staffId" value="<%=staffId%>">
</div>

<div>
<label>Order Date</label>
<input type="date" name="orderDate" required class="w-full border p-2">
</div>

<div>
<label>Status</label>
<input type="text" value="SUBMITTED" readonly class="w-full border p-2 bg-gray-100">
</div>

</div>
</div>

<!-- ===== RIGHT : ORDER SUMMARY ===== -->
<div class="border-2 border-green-600 rounded-xl p-6 h-fit">

<h3 class="text-xl font-bold mb-4">Order Summary</h3>

<div class="space-y-2 text-sm">
<div class="flex justify-between"><span>Items</span><span id="sumItems">0</span></div>
<div class="flex justify-between"><span>Total Quantity</span><span id="sumQty">0</span></div>
<div class="flex justify-between"><span>Subtotal (RM)</span><span id="sumSubtotal">0.00</span></div>
<div class="flex justify-between"><span>Tax (6%)</span><span id="sumTax">0.00</span></div>
<hr>
<div class="flex justify-between font-bold text-green-700">
<span>Grand Total (RM)</span><span id="sumGrand">0.00</span>
</div>
</div>

</div>
</div>

<!-- ================= BOTTOM FULL WIDTH ================= -->
<div class="border-2 border-green-600 rounded-xl p-6">

<button type="button" onclick="openModal()"
        class="bg-green-600 text-white px-6 py-2 rounded mb-4">
+ Add Product
</button>

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

<tbody id="orderBody">
<tr>
<td colspan="6" class="py-6 text-gray-500 italic">No product added</td>
</tr>
</tbody>
</table>

<div class="flex justify-end gap-4">
<a href="<%=request.getContextPath()%>/order"
   class="bg-gray-500 text-white px-6 py-2 rounded">Cancel</a>

<button type="submit"
        class="bg-green-600 text-white px-6 py-2 rounded">
Submit Order
</button>
</div>

<input type="hidden" name="productId[]" id="productIds">
<input type="hidden" name="quantity[]" id="quantities">
<input type="hidden" name="unitPrice[]" id="unitPrices">
<input type="hidden" name="total[]" id="totals">

</div>
</div>
</form>
</main>
</div>

<!-- ADD PRODUCT MODAL -->
<div id="addProductModal"
     class="fixed inset-0 bg-black bg-opacity-40 flex items-center justify-center z-50 hidden">

    <div class="bg-white w-[400px] p-6 rounded-xl border-2 border-green-600">

        <h3 class="text-xl font-bold mb-4">Add Product</h3>

        <div class="space-y-3">

            <div>
                <label>Product</label>
                <select id="productSelect"
                        onchange="onProductChange()"
                        class="w-full border p-2 rounded">
                    <option value="">Select product</option>
                </select>
            </div>

            <div>
                <label>Product ID</label>
                <input id="productId" readonly
                       class="w-full border p-2 bg-gray-100">
            </div>

            <div>
                <label>Quantity</label>
                <input id="quantity" type="number" min="1" value="1"
                       oninput="calculateTotal()"
                       class="w-full border p-2">
            </div>

            <div>
                <label>Unit Price (RM)</label>
                <input id="unitPrice" readonly
                       class="w-full border p-2 bg-gray-100">
            </div>

            <div>
                <label>Total (RM)</label>
                <input id="total" readonly
                       class="w-full border p-2 bg-gray-100">
            </div>

        </div>

        <div class="flex justify-end gap-3 mt-6">
            <button type="button"
                    onclick="closeModal()"
                    class="bg-gray-400 text-white px-4 py-2 rounded">
                Cancel
            </button>

            <button type="button"
                    onclick="saveItem()"
                    class="bg-green-600 text-white px-4 py-2 rounded">
                Save
            </button>
        </div>

    </div>
</div>


<script>
let orderItems = [];

function openModal() {
    fetch("<%=request.getContextPath()%>/api/products")
        .then(res => res.json())
        .then(data => {
            const select = document.getElementById("productSelect");
            select.innerHTML = "<option value=''>Select product</option>";
            data.forEach(p => {
                select.innerHTML +=
                    "<option value='" + p.id + "' data-price='" + p.price + "'>" +
                        p.name +
                    "</option>";
            });
        });

    document.getElementById("addProductModal").classList.remove("hidden");
}

function closeModal() {
    document.getElementById("addProductModal").classList.add("hidden");
}

function onProductChange() {
    const sel = productSelect.options[productSelect.selectedIndex];
    productId.value = sel.value || "";
    unitPrice.value = sel.dataset.price || 0;
    calculateTotal();
}

function calculateTotal() {
    total.value = (quantity.value * unitPrice.value).toFixed(2);
}

function saveItem() {
    orderItems.push({
        productId: productId.value,
        quantity: quantity.value,
        unitPrice: unitPrice.value,
        total: total.value
    });

    renderTable();
    updateHidden();
    closeModal();
}

function renderTable() {
    const body = document.getElementById("orderBody");
    body.innerHTML = "";

    orderItems.forEach(function (i, index) {
        body.innerHTML +=
            "<tr>" +
                "<td>" + i.productId + "</td>" +
                "<td>-</td>" +
                "<td>" + i.quantity + "</td>" +
                "<td>" + Number(i.unitPrice).toFixed(2) + "</td>" +
                "<td>" + Number(i.total).toFixed(2) + "</td>" +

                "<td class='text-center'>" +
                    "<div class='inline-flex gap-4'>" +

                        /* ✏️ EDIT */
                        "<div class='relative group flex flex-col items-center'>" +
                            "<i class='fas fa-pencil-alt text-black text-lg cursor-pointer " +
                               "hover:scale-150 transition' " +
                               "onclick='editItem(" + index + ")'></i>" +
                            "<span class='absolute bottom-full left-1/2 -translate-x-1/2 mb-2 " +
                                  "hidden group-hover:block bg-black text-white text-[10px] " +
                                  "py-1 px-2 rounded shadow-lg whitespace-nowrap z-50'>" +
                                "Update" +
                            "</span>" +
                        "</div>" +

                        /* 🗑️ DELETE */
                        "<div class='relative group flex flex-col items-center'>" +
                            "<i class='fas fa-trash text-black text-lg cursor-pointer " +
                               "hover:scale-150 transition' " +
                               "onclick='deleteItem(" + index + ")'></i>" +
                            "<span class='absolute bottom-full left-1/2 -translate-x-1/2 mb-2 " +
                                  "hidden group-hover:block bg-black text-white text-[10px] " +
                                  "py-1 px-2 rounded shadow-lg whitespace-nowrap z-50'>" +
                                "Delete" +
                            "</span>" +
                        "</div>" +

                    "</div>" +
                "</td>" +
            "</tr>";
    });
}


function deleteItem(index) {
    if (!confirm("Remove this item from order?")) return;

    orderItems.splice(index, 1);
    renderTable();
    updateHidden();
}

function updateHidden() {
    productIds.value = orderItems.map(i => i.productId).join(",");
    quantities.value = orderItems.map(i => i.quantity).join(",");
    unitPrices.value = orderItems.map(i => i.unitPrice).join(",");
    totals.value = orderItems.map(i => i.total).join(",");
}

/* =========================
   ORDER SUMMARY (SAFE HOOK)
========================= */
function updateSummary() {
    let items = orderItems.length;
    let qty = 0;
    let subtotal = 0;

    orderItems.forEach(i => {
        qty += Number(i.quantity);
        subtotal += Number(i.total);
    });

    let tax = subtotal * 0.06;
    let grand = subtotal + tax;

    document.getElementById("sumItems").innerText = items;
    document.getElementById("sumQty").innerText = qty;
    document.getElementById("sumSubtotal").innerText = subtotal.toFixed(2);
    document.getElementById("sumTax").innerText = tax.toFixed(2);
    document.getElementById("sumGrand").innerText = grand.toFixed(2);
}

/* 🔗 Hook into existing renderTable without modifying it */
const originalRenderTable = renderTable;
renderTable = function () {
    originalRenderTable();
    updateSummary();
};
</script>
</body>
</html>
