<%-- 
    Document   : home3
    Created on : May 16, 2023, 3:00:06 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page errorPage="errorPage.jsp" %> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html
    lang="en"
    class="light-style layout-menu-fixed"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="assets/"
    data-template="vertical-menu-template-free"
    >
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Betrolimex</title>
        <link rel="icon" href="img/favicon.png" />   
        <meta name="description" content="" />

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
            />

        <!-- Icons. Uncomment required icon fonts -->
        <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="assets/css/demo.css" />
        <link rel="stylesheet" href="css/input.css" />
        <!-- Vendors CSS -->
        <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

        <link rel="stylesheet" href="assets/vendor/libs/apex-charts/apex-charts.css" />

        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="assets/js/config.js"></script>
    </head>

    <body>
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->

                <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                    <div class="app-brand demo">
                        <a href="statistic.jsp" class="app-brand-link">
                            <span class="app-brand-text demo menu-text fw-bolder ms-2"><img style="width: 1.5em; margin-left: 0px;" src="img/favicon.png">
                                Betrolimex</span>

                        </a>

                        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                            <i class="bx bx-chevron-left bx-sm align-middle"></i>
                        </a>
                    </div>

                    <div class="menu-inner-shadow"></div>

                    <ul class="menu-inner py-1">
                        <!-- Dashboard -->
                        <li class="menu-item">
                            <a href="statistic" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                                <div data-i18n="Analytics">Dashboard</div>
                            </a>
                        </li>
                        <li class="menu-item">

                            <a href="javascript:void(0);" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-layout"></i>
                                <div data-i18n="Layouts">Menu Layouts</div>
                            </a>
                            <ul class="menu-sub">

                                <li class="menu-item active open">

                                    <ul class="menu-sub">
                                        <c:forEach items="${sessionScope.Navigation}" var="c">
                                            <li class="menu-item<c:if test="${not empty requestScope.News}">
                                                    <c:forEach items="${requestScope.News}" var="n">
                                                        <c:if test="${n.navigationID == c.navigationID}"> active</c:if>
                                                    </c:forEach>
                                                </c:if>">
                                                <a href="changedirection?change=${c.navigationID}" class="menu-link">
                                                    <div data-i18n="Without navbar">${c.navigationName}</div>
                                                </a>
                                            </li>
                                        </c:forEach>

                                    </ul>
                                </li>

                            </ul>
                        </li>
                        <!-- Components -->
                        <li class="menu-header small text-uppercase"><span class="menu-header-text">Product Management</span></li>
                        <!-- Cards -->
                        <li class="menu-item">
                            <a href="javascript:void(0)" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-box"></i>
                                <div data-i18n="User interface">Stock</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item">
                                    <a href="<%=request.getContextPath()%>/stock" class="menu-link">
                                        <div data-i18n="AllCategory">All category</div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item active">
                            <a href="<%=request.getContextPath()%>/addproduct" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-collection"></i>
                                <div data-i18n="Basic">Add Product</div>
                            </a>
                        </li>

                        <c:if test="${account.role eq 'Admin'}">
                            <li class="menu-item">
                                <a href="<%=request.getContextPath()%>/adddiscount" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-collection"></i>
                                    <div data-i18n="Basic">Add Discount</div>
                                </a>
                            </li>
                        </c:if>
                        <li class="menu-item">
                            <a href="javascript:void(0);" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-collection"></i>
                                <div data-i18n="Form Layouts">Manufacturer</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item ">
                                    <a href="allmanufacturer" class="menu-link">
                                        <div data-i18n="Vertical Form">Manufacturer List</div>
                                    </a>
                                </li>
                                <li class="menu-item ">
                                    <a href="addmanufacturer" class="menu-link">
                                        <div data-i18n="Horizontal Form">Add Manufacturer</div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item">
                            <a href="<%=request.getContextPath()%>/allcategory" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-collection"></i>
                                <div data-i18n="Basic">Add Category</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="javascript:void(0);" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-detail"></i>
                                <div data-i18n="Form Layouts">Warranty</div>
                            </a>
                            <ul class="menu-sub">

                                <li class="menu-item">
                                    <a href="checkwarranty" class="menu-link">
                                        <div data-i18n="Horizontal Form">Warranty list</div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-header small text-uppercase"><span class="menu-header-text">Order</span></li>
                        <li class="menu-item ">
                            <a href="<%=request.getContextPath()%>/checkorder" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-collection"></i>
                                <div data-i18n="Basic">Check Order</div>
                            </a>
                        </li>
                        <li class="menu-header small text-uppercase"><span class="menu-header-text">News Management</span></li>
                        <li class="menu-item ">
                            <a href="javascript:void(0);" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-detail"></i>
                                <div data-i18n="Form Layouts">News</div>
                            </a>

                            <ul class="menu-sub">
                                <li class="menu-item ">
                                    <a href="addnews" class="menu-link">
                                        <div data-i18n="Vertical Form">Add News</div>
                                    </a>
                                </li>
                                <c:if test="${account.role eq 'Admin'}">
                                    <li class="menu-item">
                                        <a href="newsmanagement" class="menu-link">
                                            <div data-i18n="Without navbar">News Management</div>
                                        </a>
                                    </li>
                                </ul>

                            </li>
                        </c:if>

                        <!-- Forms & Tables -->

                        <!-- Tables -->
                        <c:if test="${account.role eq 'Admin'}">
                            <li class="menu-header small text-uppercase"><span class="menu-header-text">User management</span></li>
                            <li class="menu-item ">
                                <a href="javascript:void(0);" class="menu-link menu-toggle">
                                    <i class="menu-icon tf-icons bx bx-detail"></i>
                                    <div data-i18n="Form Layouts">Employees</div>
                                </a>
                                <ul class="menu-sub">
                                    <li class="menu-item">
                                        <a href="listemployee" class="menu-link">
                                            <div data-i18n="Vertical Form">Employee List</div>
                                        </a>
                                    </li>
                                    <li class="menu-item ">
                                        <a href="addemployee" class="menu-link">
                                            <div data-i18n="Horizontal Form">Add Employee</div>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="menu-item">
                                <a href="<%=request.getContextPath()%>/listcustomer" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-detail"></i>
                                    <div data-i18n="Basic">Customer</div>
                                </a>
                            </li>
                            <li class="menu-header small text-uppercase"><span class="menu-header-text">Statistic</span></li><!-- comment -->
                            <li class="menu-item ">
                                <a href="<%=request.getContextPath()%>/customerstatistic" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-detail"></i>
                                    <div data-i18n="Basic">Customer Statistic</div>
                                </a>
                            </li>
                            <li class="menu-item">
                                <a href="<%=request.getContextPath()%>/employeestatistic" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-detail"></i>
                                    <div data-i18n="Basic">Employee Statistic</div>
                                </a>
                            </li>
                        </c:if>
                        <li class="menu-header small text-uppercase"><span class="menu-header-text">Misc</span></li>
                        <li class="menu-item">
                            <a href="<%=request.getContextPath()%>/employeechat" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-support"></i>
                                <div data-i18n="Support">Support</div>
                            </a>
                        </li>
                    </ul>
                </aside>
                <!-- / Menu -->

                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Navbar -->

                    <nav
                        class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                        id="layout-navbar"
                        >
                        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                            <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                                <i class="bx bx-menu bx-sm"></i>
                            </a>
                        </div>

                        <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                            <!-- Search -->
                            <div class="navbar-nav align-items-center">
                                <div class="nav-item d-flex align-items-center">
                                    <i class="bx bx-search fs-4 lh-0"></i>
                                    <input
                                        type="text"
                                        class="form-control border-0 shadow-none"
                                        placeholder="Search..."
                                        aria-label="Search..."
                                        />
                                </div>
                            </div>
                            <!-- /Search -->

                            <ul class="navbar-nav flex-row align-items-center ms-auto">
                                <!-- Place this tag where you want the button to render. -->
                                <li class="nav-item lh-1 me-3">
                                    <a
                                        class="github-button"
                                        href="https://github.com/themeselection/sneat-html-admin-template-free"
                                        data-icon="octicon-star"
                                        data-size="large"
                                        data-show-count="true"
                                        aria-label="Star themeselection/sneat-html-admin-template-free on GitHub"
                                        >Star</a
                                    >
                                </li>

                                <!-- User -->
                                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                    <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                        <div class="avatar avatar-online">
                                            <img src="data:image/jpeg/png/jpg;base64,${account.encodedImage}" alt class="w-px-40 h-auto rounded-circle" />
                                        </div>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                            <a class="dropdown-item" href="employeeprofile">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0 me-3">
                                                        <div class="avatar avatar-online">
                                                            <img src="data:image/jpeg/png/jpg;base64,${account.encodedImage}" alt class="w-px-40 h-auto rounded-circle" />
                                                        </div>
                                                    </div>
                                                    <div class="flex-grow-1">
                                                        <span class="fw-semibold d-block">${account.firstname} ${account.lastname}</span>
                                                        <small class="text-muted">${account.role}</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="dropdown-divider"></div>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="employeeprofile">
                                                <i class="bx bx-user me-2"></i>
                                                <span class="align-middle">My Profile</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <i class="bx bx-cog me-2"></i>
                                                <span class="align-middle">Settings</span>
                                            </a>
                                        </li>
                                        
                                        <li>
                                            <div class="dropdown-divider"></div>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="logout">
                                                <i class="bx bx-power-off me-2"></i>
                                                <span class="align-middle">Log Out</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <!--/ User -->
                            </ul>
                        </div>
                    </nav>

                    <!-- / Navbar -->

                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->
                        <div class="container-xxl flex-grow-1 container-p-y">
                            <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Stock /</span> All Product</h4>
                            <c:if test="${ not empty sessionScope.status1}">
                                <div class="alert alert-success alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                    ${sessionScope.status1}
                                </div>
                            </c:if>

                            <div class="card">
                                <h5 class="card-header">Add Product</h5>
                                <form id="productForm" onsubmit="return validateForm()" enctype="multipart/form-data" method="post" action="addproduct">
                                    <div class="container">
                                        <div class="input-margin form-group row">
                                            <div class="col-md-3 col-lg-3">
                                                <label for="productName">Product Name:</label>
                                            </div>
                                            <div class="col-md-9 col-lg-9">
                                                <input type="text" class="form-control" id="productName" name="productName" required>
                                            </div>
                                        </div>
                                        <div class="input-margin form-group row">
                                            <div class="col-md-3 col-lg-3">
                                                <label for="categoryID">Category:</label>
                                            </div>
                                            <div class="col-md-3 col-lg-3">
                                                <select class="form-control" id="categoryID" name="categoryID">
                                                    <c:forEach items="${requestScope.listCategory}" var="c" varStatus="index">
                                                        <option value="${c.categoryID}">${c.categoryName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-3 col-lg-3">
                                                <label for="manufacturerID">Manufacturer:</label>
                                            </div>
                                            <div class="col-md-3 col-lg-3">
                                                <select class="form-control" id="manufacturerID" name="manufacturerID">
                                                    <c:forEach items="${requestScope.listManufacturer}" var="c" varStatus="index">
                                                        <option value="${c.manufacturerID}">${c.manufacturerName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="input-margin form-group row">
                                            <div class="col-md-3 col-lg-3">
                                                <label for="type">Type:</label>
                                            </div>
                                            <div class="col-md-9 col-lg-9 " >
                                                <select class="form-control" id="type" name="type">
                                                    <option value="">Select an option</option>
                                                    <option value="Bếp ga âm">Bếp ga âm</option>
                                                    <option value="Bếp ga đơn">Bếp ga đơn</option>
                                                    <option value="Bếp ga đôi">Bếp ga đôi</option>
                                                    <option value="Bếp ga Mini">Bếp ga Mini</option>
                                                    <option value="Bếp ga công nghiệp">Bếp ga Công nghiệp</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="input-margin form-group row">
                                            <div class="col-md-3 col-lg-3">
                                                <label for="price">Price:</label>
                                            </div>
                                            <div class="col-md-3 col-lg-3">
                                                <input type="number" class="form-control" id="price" name="price"  required>
                                            </div>

                                            <div class="col-md-3 col-lg-3">
                                                <label for="stockQuantity">Stock Quantity:</label>
                                            </div>
                                            <div class="col-md-3 col-lg-3">
                                                <input type="number" class="form-control" id="stockQuantity" name="stockQuantity" required>
                                            </div>
                                        </div>
                                        <div class="input-margin form-group row">
                                            <div class="col-md-3 col-lg-3">
                                                <label for="warrantyPeriod">Historical Price:</label>
                                            </div>
                                            <div class="col-md-9 col-lg-9">
                                                <input type="number" class="form-control" id="historicalCost" name="historicalCost" required>
                                            </div>
                                        </div>
                                        <div class="input-margin form-group row">
                                            <div class="col-md-3 col-lg-3">
                                                <label for="warrantyPeriod">Warranty Period:</label>
                                            </div>
                                            <div class="col-md-9 col-lg-9">
                                                <input type="number" class="form-control" id="warrantyPeriod" name="warrantyPeriod" required>
                                            </div>
                                        </div>
                                        <div class="input-margin form-group row">
                                            <div class="col-md-3 col-lg-3">
                                                <label for="manufacturinngDate">Manufacturing Date:</label>
                                            </div>
                                            <div class="col-md-3 col-lg-3">
                                                <input type="date" class="form-control" id="manufacturinngDate" name="manufacturinngDate">
                                            </div>

                                            <div class="col-md-3 col-lg-2">
                                                <label for="expiryDate">Expiry Date:</label>
                                            </div>
                                            <div class="col-md-4 col-lg-4">
                                                <input type="date" class="form-control" id="expiryDate" name="expiryDate">
                                            </div>
                                        </div>
                                        <div class="input-margin form-group row">
                                            <div class="col-md-3 col-lg-3">
                                                <label for="productCapacity">Product Capacity:</label>
                                            </div>
                                            <div class="col-md-9 col-lg-9">
                                                <input type="text" class="form-control" id="productCapacity" name="productCapacity" pattern="\d+L">
                                            </div>
                                        </div>
                                        <div class="input-margin form-group row">
                                            <div class="col-md-3 col-lg-3">
                                                <label for="productStatus">Product Status:</label>
                                            </div>
                                            <div class="col-md-9 col-lg-9">
                                                <select class="form-control" id="productStatus" name="productStatus">
                                                    <option value="Good">Good</option>
                                                    <option value="Poor">Poor</option>
                                                    <option value="Excellent">Excellent</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="input-margin form-group row">
                                            <div class="col-md-3 col-lg-3">
                                                <label for="productImage">Product Image:</label>
                                            </div>
                                            <div class="col-md-9 col-lg-9">
                                                <input type="file" class="form-control-file" id="productImage" name="productImage">
                                            </div>
                                        </div>

                                        <div class="input-margin form-group row">
                                            <div class="col-md-3 col-lg-3">
                                                <label for="productSizedImage">Product Description Image:</label>
                                            </div>
                                            <div class="col-md-9 col-lg-9">
                                                <input type="file" class="form-control-file" multiple id="productSizedImage" name="productSizedImage">
                                            </div>
                                        </div>
                                        <div class="input-margin form-group row">
                                            <div class="col-md-3 col-lg-3">
                                                <label for="description">Description:</label>
                                            </div>
                                            <div class="col-md-9 col-lg-9">
                                                <textarea class="form-control" id="editor" name="description" rows="3"></textarea>
                                            </div>
                                        </div>
                                        <div class="input-margin form-group row">
                                            <div class="col-md-3"></div>
                                            <div class="col-md-3">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                            <div class="col-md-3">
                                                <button type="button" class="btn btn-primary" style="background-color: #F26F21" onclick="resetForm()">Reset</button>
                                            </div>
                                        </div>

                                    </div>
                                </form>
                                <%
        String success = (String)request.getAttribute("success");
        if(success!=null){
                                %>
                                <div style="color: #e53637"><%=success%></div>
                                <%}
                                %>

                            </div>

                        </div>   
                        <div class="content-backdrop fade"></div>


                    </div>
                    <!-- Content wrapper -->
                </div>
                <!-- / Layout page -->
            </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
            <script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/classic/ckeditor.js"></script>
            <script>
                                                    ClassicEditor
                                                            .create(document.querySelector('#editor'))
                                                            .then(editor => {
                                                                console.log(editor);
                                                            })
                                                            .catch(error => {
                                                                console.error(error);
                                                            });
            </script>
            <script>
                var numberElements = document.getElementsByClassName("prices");

                for (var i = 0; i < numberElements.length; i++) {
                    var numberElement = numberElements[i];
                    var number = parseFloat(numberElement.innerHTML);
                    numberElement.innerHTML = number.toLocaleString() + " đồng";
                }
            </script>
            <script>
                function resetForm() {
                    if (confirm("Are you sure you want to delete this item?")) {
                        var element = document.getElementById("productForm");
                        element.reset();
                    }
                }
            </script>
            <script>
                function validateForm() {
                    var historicalCost = parseFloat(document.getElementById('historicalCost').value);
                    var price = parseFloat(document.getElementById('price').value);

                    if (historicalCost >= price) {
                        alert("Historical cost must be less than the price!");
                        return false; // Prevent form submission
                    }

                    // Form is valid, allow submission
                    return true;
                }
            </script>


            <!-- Core JS -->
            <!-- build:js assets/vendor/js/core.js -->
            <script src="assets/vendor/libs/jquery/jquery.js"></script>
            <script src="assets/vendor/libs/popper/popper.js"></script>
            <script src="assets/vendor/js/bootstrap.js"></script>
            <script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

            <script src="assets/vendor/js/menu.js"></script>
            <!-- endbuild -->

            <!-- Vendors JS -->
            <script src="assets/vendor/libs/apex-charts/apexcharts.js"></script>

            <!-- Main JS -->
            <script src="assets/js/main.js"></script>

            <!-- Page JS -->
            <script src="assets/js/dashboards-analytics.js"></script>

            <!-- Place this tag in your head or just before your close body tag. -->
            <script async defer src="https://buttons.github.io/buttons.js"></script>
    </body>
</html>

