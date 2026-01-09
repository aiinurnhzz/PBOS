<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.petboss.model.Product" %>

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Products</title>

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

/* Style for the table header to match the green theme */
        th { 
        background-color: #e6f4ea; 
        color: #000; 
        font-weight: bold; 
        border: 1px solid #009a49 !important; }
        
        td { border: 1px solid #009a49 !important; 
        text-align: center; 
        font-size: 0.85rem; 
        padding: 8px; }
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
           class="mx-auto w-[85%] h-11 bg-[#009a49] hover:bg-[#009a49] text-white
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

<!-- ===== MAIN ===== -->
<main class="flex-1 p-8 overflow-y-auto">
<div class="bg-white p-8 rounded-3xl border-2 border-green-600">

<!-- TITLE -->
<div class="flex justify-between items-center mb-6">
    <h2 class="text-3xl font-black">Products</h2>

    <a href="<%=request.getContextPath()%>/pm/addProduct"
       class="bg-green-600 text-white px-6 py-3 rounded-full font-semibold">
        + Add Product
    </a>
</div>

<!-- SEARCH + FILTER (SERVER-SIDE) -->
<form id="productForm"
      method="get"
      action="<%=request.getContextPath()%>/product"
      class="flex items-center gap-4 mb-6">

    <!-- SEARCH -->
    <div class="relative flex-1">
        <input
            id="productSearch"
            name="keyword"
            type="text"
            value="<%= request.getAttribute("keyword") != null
                    ? request.getAttribute("keyword") : "" %>"
            placeholder="Search Product ID, Name, Brand, Category"
            class="w-full border-2 border-[#009a49]
                   rounded-lg px-4 py-2 outline-none
                   focus:ring-2 focus:ring-green-200 pr-10">

        <i class="fas fa-search absolute right-3 top-2.5
                  text-[#009a49] text-lg pointer-events-none"></i>
    </div>

    <!-- FILTER -->
    <div class="relative w-64">
        <div class="flex items-center border-2 border-[#009a49]
                    rounded-lg overflow-hidden bg-white h-full">

            <div class="px-3 border-r-2 border-[#009a49]">
                <i class="fas fa-filter text-[#009a49]"></i>
            </div>

            <select id="categoryFilter"
			        name="category"
			        class="w-full px-4 py-2 outline-none bg-white appearance-none">
			
			    <option value="">All Category</option>
			
			    <option value="PET_FOOD"
			        <%= "PET_FOOD".equals(request.getAttribute("category")) ? "selected" : "" %>>
			        Pet Food
			    </option>
			
			    <option value="PET_MEDICINE"
			        <%= "PET_MEDICINE".equals(request.getAttribute("category")) ? "selected" : "" %>>
			        Pet Medicine
			    </option>
			
			    <option value="PET_CARE"
			        <%= "PET_CARE".equals(request.getAttribute("category")) ? "selected" : "" %>>
			        Pet Care
			    </option>
			
			    <option value="PET_ACCESSORY"
			        <%= "PET_ACCESSORY".equals(request.getAttribute("category")) ? "selected" : "" %>>
			        Pet Accessory
			    </option>
			</select>
			
            <i class="fas fa-caret-down absolute right-3 top-3
                      pointer-events-none text-gray-500"></i>
        </div>
    </div>
</form>

<!-- TABLE -->
<div class="overflow-x-auto">
<table class="w-full border-collapse">
<thead>
<tr>
    <th class="border p-2">Image</th>
    <th class="border p-2">ID</th>
    <th class="border p-2">Name</th>
    <th class="border p-2">Current Quantity</th>
    <th class="border p-2">Category</th>
    <th class="border p-2">Brand</th>
    <th class="border p-2">Selling Price (RM)</th>
    <th class="border p-2">Purchase Price (RM)</th>
    <th class="border p-2">Action</th>
</tr>
</thead>

<tbody>
<% for (Product p : products) { %>
<tr class="product-row">

<td class="border p-2 text-center">
    <% if (p.getImage() != null) { %>
        <img src="<%=request.getContextPath()%>/product-image?file=<%=p.getImage()%>"
             class="h-10 mx-auto">
    <% } else { %> — <% } %>
</td>

<td class="border p-2"><%=p.getProductId()%></td>

<td class="border p-2">
    <span class="text-blue-600 underline cursor-pointer inline-block"
          onclick="openViewModal(
			  '<%=p.getProductId()%>',
			  '<%=p.getName()%>',
			  '<%=p.getCategory()%>',
			  '<%=p.getBrand()%>',
			  <%=p.getQuantity()%>,
			  <%=p.getMinQuantity()%>,
			  <%=p.getPurchasePrice()%>,
			  <%=p.getSellingPrice()%>,
			  '<%=p.getImage()%>'
		)">
        <%=p.getName()%>
    </span>
</td>


<td class="border p-2 text-center"><%=p.getQuantity()%></td>
<td class="border p-2"><%=p.getCategory()%></td>
<td class="border p-2"><%=p.getBrand()%></td>
<td class="border p-2 text-center"><%=p.getSellingPrice()%></td>
<td class="border p-2 text-center"><%=p.getPurchasePrice()%></td>

<td class="border p-2 text-center">
    <div class="flex justify-center items-center gap-4">
        <!-- ✏️ EDIT -->
        <div class="relative group flex flex-col items-center">
        <i class="fas fa-pencil-alt text-black hover:scale-150 transition text-lg cursor-pointer"
           onclick="openEditModal(
               '<%=p.getProductId()%>',
               '<%=p.getName()%>',
               '<%=p.getCategory()%>',
               '<%=p.getBrand()%>',
               <%=p.getQuantity()%>,
               <%=p.getMinQuantity()%>,
               <%=p.getPurchasePrice()%>,
               <%=p.getSellingPrice()%>,
               '<%=p.getImage()%>'
           )"></i>
           <span
				class="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 hidden group-hover:block 
				bg-black text-white text-[10px] py-1 px-2 rounded shadow-lg whitespace-nowrap z-50">Update
			</span>
        </div>

        <!-- 🗑️ DELETE -->
        <div class="relative group flex flex-col items-center">
        <a href="<%=request.getContextPath()%>/pm/deleteProduct?id=<%=p.getProductId()%>"
           onclick="return confirm('Delete this product?')">
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
<% } %>
</tbody>
</table>
</div>
</div>
</main>
</div>

<!-- ===== VIEW PRODUCT MODAL ===== -->
<div id="viewModal"
     class="fixed inset-0 bg-black bg-opacity-50 z-[110] hidden
            flex items-center justify-center p-4">

<div class="bg-white w-full max-w-3xl rounded-3xl
            border-2 border-[#009a49] shadow-2xl
            overflow-hidden flex flex-col md:flex-row">

    <!-- ===== LEFT : PRODUCT PREVIEW ===== -->
    <div class="w-full md:w-1/3 bg-white p-6 border-r border-gray-200">
        <div class="border-2 border-[#009a49] rounded-xl p-4 h-full flex flex-col">

            <h3 class="text-sm font-bold text-gray-700 mb-4">
                Product Preview
            </h3>

            <div class="w-full aspect-square bg-gray-50 rounded-lg mb-4
                        flex items-center justify-center overflow-hidden
                        border border-gray-100">
                <img id="viewImg"
                     class="max-w-full max-h-full object-contain">
            </div>

            <div class="space-y-3 flex-grow">
                <div>
                    <label class="text-[10px] font-bold text-gray-500 uppercase">
                        Product Name
                    </label>
                    <input id="viewName"
                           class="w-full text-xs border border-[#009a49]
                                  rounded px-2 py-1.5 bg-gray-100"
                           readonly>
                </div>

                <div>
                    <label class="text-[10px] font-bold text-gray-500 uppercase">
                        Category
                    </label>
                    <input id="viewCategory"
                           class="w-full text-xs border border-[#009a49]
                                  rounded px-2 py-1.5 bg-gray-100"
                           readonly>
                </div>

                <div>
                    <label class="text-[10px] font-bold text-gray-500 uppercase">
                        Product Brand
                    </label>
                    <input id="viewBrand"
                           class="w-full text-xs border border-[#009a49]
                                  rounded px-2 py-1.5 bg-gray-100"
                           readonly>
                </div>

                <div>
                    <label class="text-[10px] font-bold text-gray-500 uppercase">
                        SKU / Code / ID
                    </label>
                    <input id="viewId"
                           class="w-full text-xs border border-[#009a49]
                                  rounded px-2 py-1.5 bg-gray-100"
                           readonly>
                </div>
            </div>
        </div>
    </div>

    <!-- ===== RIGHT : DETAILS ===== -->
    <div class="w-full md:w-2/3 p-8 flex flex-col h-full">

        <div class="flex-grow space-y-8">

            <!-- STOCK -->
            <div>
                <h4 class="text-green-700 font-bold mb-4
                           border-b border-green-200 pb-1">
                    Stock Details
                </h4>

                <div class="grid grid-cols-2 gap-x-12 gap-y-4">
                    <div>
                        <label class="text-xs font-bold text-gray-600">
                            Current Quantity
                        </label>
                        <input id="viewQty"
                               class="w-full border border-[#009a49]
                                      rounded-lg px-3 py-1.5 bg-gray-100"
                               readonly>
                    </div>

                    <div>
                        <label class="text-xs font-bold text-gray-600">
                            Minimum Quantity
                        </label>
                        <input id="viewMin"
                               class="w-full border border-[#009a49]
                                      rounded-lg px-3 py-1.5 bg-gray-100"
                               readonly>
                    </div>
                </div>
            </div>

            <!-- PRICING -->
            <div>
                <h4 class="text-green-700 font-bold mb-4
                           border-b border-green-200 pb-1">
                    Pricing
                </h4>

                <div class="grid grid-cols-2 gap-x-12 gap-y-4">
                    <div>
                        <label class="text-xs font-bold text-gray-600">
                            Purchase Price (RM)
                        </label>
                        <input id="viewBuy"
                               class="w-full border border-[#009a49]
                                      rounded-lg px-3 py-1.5 bg-gray-100"
                               readonly>
                    </div>

                    <div>
                        <label class="text-xs font-bold text-gray-600">
                            Selling Price (RM)
                        </label>
                        <input id="viewSell"
                               class="w-full border border-[#009a49]
                                      rounded-lg px-3 py-1.5 bg-gray-100"
                               readonly>
                    </div>
                </div>
            </div>
        </div>

        <!-- ===== ACTION ===== -->
        <div class="flex justify-end gap-6 mt-auto pt-10">
            <button type="button"
                    onclick="closeViewModal()"
                    class="bg-red-500 hover:bg-red-600
                           text-white font-bold py-2 px-12
                           rounded-2xl shadow-lg">
                Close
            </button>
        </div>
    </div>

</div>
</div>

<!-- ===== EDIT PRODUCT MODAL ===== -->
<div id="editModal"
     class="fixed inset-0 bg-black bg-opacity-50 z-[110] hidden
            flex items-center justify-center p-4">

<form action="<%=request.getContextPath()%>/editProduct"
      method="post"
      class="bg-white w-full max-w-3xl rounded-3xl
             border-2 border-[#009a49] shadow-2xl
             overflow-hidden flex flex-col md:flex-row">

    <!-- LEFT : PRODUCT PREVIEW -->
    <div class="w-full md:w-1/3 bg-white p-6 border-r border-gray-200">
        <div class="border-2 border-[#009a49] rounded-xl p-4 h-full flex flex-col">
            <h3 class="text-sm font-bold text-gray-700 mb-4">Product Preview</h3>

            <div class="w-full aspect-square bg-gray-50 rounded-lg mb-4
                        flex items-center justify-center overflow-hidden
                        border border-gray-100">
                <img id="editImg"
                     class="max-w-full max-h-full object-contain">
            </div>

            <div class="space-y-3 flex-grow">
                <div>
                    <label class="text-[10px] font-bold text-gray-500 uppercase">
                        Product Name
                    </label>
                    <input name="productName" id="editName"
                           class="w-full text-xs border border-[#009a49]
                                  rounded px-2 py-1.5 bg-gray-100"
                           readonly>
                </div>

                <div>
                    <label class="text-[10px] font-bold text-gray-500 uppercase">
                        Category
                    </label>
                    <input name="category" id="editCategory"
                           class="w-full text-xs border border-[#009a49]
                                  rounded px-2 py-1.5 bg-gray-100"
                           readonly>
                </div>

                <div>
                    <label class="text-[10px] font-bold text-gray-500 uppercase">
                        Product Brand
                    </label>
                    <input name="productBrand" id="editBrand"
                           class="w-full text-xs border border-[#009a49]
                                  rounded px-2 py-1.5 bg-gray-100"
                           readonly>
                </div>

                <div>
                    <label class="text-[10px] font-bold text-gray-500 uppercase">
                        SKU / Code / ID
                    </label>
                    <input name="productId" id="editID"
                           class="w-full text-xs border border-[#009a49]
                                  rounded px-2 py-1.5 bg-gray-100"
                           readonly>
                </div>
            </div>
        </div>
    </div>

    <!-- RIGHT : EDITABLE DETAILS -->
    <div class="w-full md:w-2/3 p-8 flex flex-col h-full">

        <div class="flex-grow space-y-8">

            <!-- STOCK -->
            <div>
                <h4 class="text-green-700 font-bold mb-4
                           border-b border-green-200 pb-1">
                    Stock Details
                </h4>

                <div class="grid grid-cols-2 gap-x-12 gap-y-4">
                    <div>
                        <label class="text-xs font-bold text-gray-600">
                            Current Quantity
                        </label>
                        <input name="quantity" id="editQty" type="number"
                               class="w-full border border-[#009a49]
                                      rounded-lg px-3 py-1.5 outline-none">
                    </div>

                    <div>
                        <label class="text-xs font-bold text-gray-600">
                            Minimum Quantity
                        </label>
                        <input name="minQuantity" id="editMin" type="number"
                               class="w-full border border-[#009a49]
                                      rounded-lg px-3 py-1.5 outline-none">
                    </div>
                </div>
            </div>

            <!-- PRICING -->
            <div>
                <h4 class="text-green-700 font-bold mb-4
                           border-b border-green-200 pb-1">
                    Pricing
                </h4>

                <div class="grid grid-cols-2 gap-x-12 gap-y-4">
                    <div>
                        <label class="text-xs font-bold text-gray-600">
                            Purchase Price (RM)
                        </label>
                        <input name="purchasePrice" id="editBuy"
                               class="w-full border border-[#009a49]
                                      rounded-lg px-3 py-1.5 outline-none">
                    </div>

                    <div>
                        <label class="text-xs font-bold text-gray-600">
                            Selling Price (RM)
                        </label>
                        <input name="sellingPrice" id="editSell"
                               class="w-full border border-[#009a49]
                                      rounded-lg px-3 py-1.5 outline-none">
                    </div>
                </div>
            </div>
        </div>
        
        <!-- ACTIONS -->
        <button
		    id="btnViewCategory"
		    class="bg-green-600 text-white px-4 py-2 rounded"
		    onclick="openCategoryDetails()">
		    View Category Details
		</button>
		
        <div class="flex justify-end gap-6 mt-auto pt-10">
            <button type="button"
                    onclick="closeEditModal()"
                    class="bg-gray-500 hover:bg-gray-600
                           text-white font-bold py-2 px-10
                           rounded-2xl shadow-lg">
                Cancel
            </button>

            <button type="submit"
                    class="bg-[#009a49] hover:bg-green-700
                           text-white font-bold py-2 px-10
                           rounded-2xl shadow-lg">
                Save Product
            </button>
        </div>
    </div>
</form>
</div>

<!-- CATEGORY DETAILS MODAL -->
<div id="categoryModal" class="fixed inset-0 bg-black bg-opacity-40 hidden flex items-center justify-center z-50">
    <div class="bg-white rounded-xl w-[500px] p-6 relative">

        <h2 class="text-lg font-bold mb-4">Category Details</h2>

        <!-- PET FOOD -->
        <div id="cat-food" class="hidden">
            <p><b>Weight:</b> <span id="foodWeight"></span></p>
            <p><b>Expiry Date:</b> <span id="foodExpiry"></span></p>
        </div>

        <!-- PET MEDICINE -->
        <div id="cat-medicine" class="hidden">
            <p><b>Dosage:</b> <span id="medDosage"></span></p>
            <p><b>Prescription:</b> <span id="medPrescription"></span></p>
            <p><b>Expiry Date:</b> <span id="medExpiry"></span></p>
        </div>

        <!-- PET CARE -->
        <div id="cat-care" class="hidden">
            <p><b>Type:</b> <span id="careType"></span></p>
            <p><b>Expiry Date:</b> <span id="careExpiry"></span></p>
        </div>

        <!-- PET ACCESSORY -->
        <div id="cat-accessory" class="hidden">
            <p><b>Material:</b> <span id="accMaterial"></span></p>
        </div>

        <div class="mt-6 text-right">
            <button class="bg-red-500 text-white px-4 py-2 rounded"
                    onclick="closeCategoryModal()">Close</button>
        </div>
    </div>
</div>
		

<script>
/* ===== VIEW ===== */
function openViewModal(id, name, cat, brand, qty, min, buy, sell, img) {

    document.getElementById("viewId").value = id;
    document.getElementById("viewName").value = name;
    document.getElementById("viewCategory").value = cat;
    document.getElementById("viewBrand").value = brand;
    document.getElementById("viewQty").value = qty;
    document.getElementById("viewMin").value = min;
    document.getElementById("viewBuy").value = buy;
    document.getElementById("viewSell").value = sell;

    document.getElementById("viewImg").src = img
        ? "<%=request.getContextPath()%>/product-image?file=" + img
        : "<%=request.getContextPath()%>/images/default-product.png";

    document.getElementById("viewModal").classList.remove("hidden");
}


function closeViewModal(){
    document.getElementById("viewModal").classList.add("hidden");
}

/* ===== EDIT ===== */
function openEditModal(id, name, cat, brand, qty, min, buy, sell, img) {

    document.getElementById("editID").value = id;
    document.getElementById("editName").value = name;
    document.getElementById("editCategory").value = cat;
    document.getElementById("editBrand").value = brand;
    document.getElementById("editQty").value = qty;
    document.getElementById("editMin").value = min;
    document.getElementById("editBuy").value = buy;
    document.getElementById("editSell").value = sell;

    document.getElementById("editImg").src = img
        ? "<%=request.getContextPath()%>/product-image?file=" + img
        : "<%=request.getContextPath()%>/images/default-product.png";

    document.getElementById("editModal").classList.remove("hidden");
}


function closeEditModal(){
    document.getElementById("editModal").classList.add("hidden");
}

/* ===============================
   SEARCH + FILTER (AJAX)
   =============================== */

const searchInput = document.getElementById("productSearch");
const categoryFilter = document.getElementById("categoryFilter");
const tableBody = document.querySelector("tbody");

let typingTimer;
const contextPath = "<%= request.getContextPath() %>";

function loadProducts() {

    const keyword = searchInput.value || "";
    const category = categoryFilter.value || "";

    fetch(
        contextPath + "/product?ajax=true"
        + "&keyword=" + encodeURIComponent(keyword)
        + "&category=" + encodeURIComponent(category)
    )
    .then(res => res.json())
    .then(data => {

        tableBody.innerHTML = "";

        if (!data || data.length === 0) {
            tableBody.innerHTML =
                "<tr>" +
                    "<td colspan='9' class='text-center text-gray-500 p-4'>" +
                        "No product found" +
                    "</td>" +
                "</tr>";
            return;
        }

        data.forEach(p => {

            /* ===== IMAGE ===== */
            let imgHtml = "-";
            if (p.img) {
                imgHtml =
                    "<img src='" + contextPath +
                    "/product-image?file=" + p.img +
                    "' class='h-10 mx-auto'>";
            }

            /* ===== ROW (MATCH TABLE HEADER ORDER) ===== */
            const row =
                "<tr class='border border-green-600'>" +

                    // Image
                    "<td class='border p-2 text-center'>" + imgHtml + "</td>" +

                    // ID
                    "<td class='border p-2'>" + p.id + "</td>" +

                    // Name
                    "<td class='border p-2 text-blue-600 underline cursor-pointer'>" +
                        p.name +
                    "</td>" +

                    // Current Quantity
                    "<td class='border p-2'>" + p.qty + "</td>" +

                    // Category
                    "<td class='border p-2'>" + p.category + "</td>" +

                    // Brand
                    "<td class='border p-2'>" + p.brand + "</td>" +

                    // Selling Price
                    "<td class='border p-2'>RM " + Number(p.sell).toFixed(2) + "</td>" +

                    // Purchase Price
                    "<td class='border p-2'>RM " + Number(p.buy).toFixed(2) + "</td>" +

                    // Action
                    "<td class='border p-2 text-center'>" +
                        "<div class='relative flex items-center justify-center gap-4'>" +

                            // UPDATE
                            "<div class='relative group'>" +
                                "<i class='fas fa-pencil-alt text-black hover:scale-150 transition text-lg cursor-pointer' " +
                                "onclick=\"openEditModal('" +
                                    p.id + "','" +
                                    p.name + "','" +
                                    p.category + "','" +
                                    p.brand + "','" +
                                    p.qty + "','" +
                                    (p.min || 0) + "','" +
                                    p.buy + "','" +
                                    p.sell + "','" +
                                    (p.img || '') +
                                "')\"></i>" +
                                "<span class='absolute bottom-full left-1/2 -translate-x-1/2 mb-2 hidden group-hover:block " +
                                      "bg-black text-white text-[10px] py-1 px-2 rounded shadow-lg whitespace-nowrap z-50'>" +
                                      "Update</span>" +
                            "</div>" +

                            // DELETE
                            "<div class='relative group'>" +
                                "<a href='" + contextPath + "/pm/deleteProduct?id=" + p.id + "' " +
                                   "onclick=\"return confirm('Delete this product?')\">" +
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
    })
    .catch(err => {
        console.error("Failed to load products:", err);
    });
}

/* ===== LIVE SEARCH ===== */
searchInput.addEventListener("input", () => {
    clearTimeout(typingTimer);
    typingTimer = setTimeout(loadProducts, 400);
});

/* ===== CATEGORY FILTER ===== */
categoryFilter.addEventListener("change", loadProducts);
</script>

</body>
</html>
