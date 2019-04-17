<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp" %>
<!-- Header section -->
<header class="header-section">
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 text-center text-lg-left">
                    <!-- logo -->
                    <a href="/welcome" class="site-logo">
                        <img src="../../resources/img/logo.png" alt="">
                    </a>
                </div>
                <div class="col-xl-4 col-lg-4">
                    <form class="header-search-form">
                        <input type="text" placeholder="Search on divisima ....">
                        <button><i class="flaticon-search"></i></button>
                    </form>
                </div>
                <div class="col-xl-6 col-lg-5">
                    <div class="user-panel">
                        <div class="up-item">
                            <div class="shopping-card">
                                <i class="flaticon-bag"></i>
                                <%--<c:if test="${countProductInBasket != 0}">--%>
                                <span>${countProductInBasket}</span>
                                <%--</c:if>--%>
                            </div>
                            <a href="/cart">Shopping Cart</a>
                        </div>
                        <div class="up-item">
                            <i class="flaticon-profile"></i>
                            <a href="/registration">Create Acc</a>
                        </div>
                        <div class="up-item">
                            <i class="flaticon-profile"></i>
                            <a href="/login">Sign In</a>
                        </div>
                        <div class="up-item">
                            <i class="flaticon-profile"></i>
                            <a href="/logout">${currentUser.username} Exit</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <nav class="main-navbar">
        <div class="container">
            <!-- menu -->
            <ul class="main-menu">
                <li><a href="/welcome">Home</a></li>
                <li><a href="/sortByCategory/women">Women</a></li>
                <li><a href="/sortByCategory/men">Men</a></li>
                <li><a href="/sortByCategory/jewelry">Jewelry
                    <span class="new">New</span>
                </a></li>
                <li><a href="/sortByCategory/shoes">Shoes</a>
                </li>
                <li><a href="#">Pages</a>
                    <ul class="sub-menu">
                        <li><a href="/cart">Cart Page</a></li>
                        <li><a href="/contact">Contact Page</a></li>
                    </ul>
                </li>
                <li><a href="/blog">Blog</a></li>
            </ul>
        </div>
    </nav>
</header>
<!-- Header section end -->

<!-- Page info -->
<div class="page-top-info">
    <div class="container">
        <h4>Sign-In</h4>
        <div class="site-pagination">
            <a href="/welcome">Home</a>
        </div>
    </div>
</div>
<!-- Page info end -->
<div class="container-fluid">

    <div class="bg0 p-t-23 p-b-140">
        <div class="container">
            <div class="row">
                <h4 class="mtext-105 cl2 js-name-detail p-b-14">
                    Registration
                </h4>
                <!--  -->
                <div class="p-t-33">
                    <form method="POST" action="${contextPath}/login">
                        <div class="container">
                            <div class="flex-w flex-r-m p-b-10">
                                <div class="size-203 flex-c-m respon6">
                                    Username
                                </div>

                                <div class="size-204 respon6-next">
                                    <div class="rs1-select2 bor8 bg0">
                                        <input name="username" type="text" placeholder="Enter login"/>
                                        <div class="dropDownSelect2"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="flex-w flex-r-m p-b-10">
                                <div class="size-203 flex-c-m respon6">
                                    Password
                                </div>

                                <div class="size-204 respon6-next">
                                    <div class="rs1-select2 bor8 bg0">
                                        <input name="password" type="password"  placeholder="Password"/>
                                        <div class="dropDownSelect2"></div>
                                    </div>
                                </div>
                            </div>
                            <input type="submit" cclass="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>






<%@include file="tmp/footer.jsp" %>