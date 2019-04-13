<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp"%>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header section -->
<header class="header-section">
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 text-center text-lg-left">
                    <!-- logo -->
                    <a href="welcome" class="site-logo">
                        <img src="../../resources/img/logo.png" alt="">
                    </a>
                </div>
                <div class="col-xl-6 col-lg-5">
                    <form class="header-search-form">
                        <input type="text" placeholder="Search on divisima ....">
                        <button><i class="flaticon-search"></i></button>
                    </form>
                </div>
                <div class="col-xl-4 col-lg-5">
                    <div class="user-panel">
                        <div class="up-item">
                            <i class="flaticon-profile"></i>
                            <a href="#">Sign</a> In or <a href="#">Create Account</a>
                        </div>
                        <div class="up-item">
                            <div class="shopping-card">
                                <i class="flaticon-bag"></i>
                                <span>0</span>
                            </div>
                            <a href="#">Shopping Cart</a>
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
                <li><a href="#">Home</a></li>
                <li><a href="#">Women</a></li>
                <li><a href="#">Men</a></li>
                <li><a href="#">Jewelry
                    <span class="new">New</span>
                </a></li>
                <li><a href="#">Shoes</a>
                    <ul class="sub-menu">
                        <li><a href="#">Sneakers</a></li>
                        <li><a href="#">Sandals</a></li>
                        <li><a href="#">Formal Shoes</a></li>
                        <li><a href="#">Boots</a></li>
                        <li><a href="#">Flip Flops</a></li>
                    </ul>
                </li>
                <li><a href="#">Pages</a>
                    <ul class="sub-menu">
                        <li><a href="./product.html">Product Page</a></li>
                        <li><a href="./category.html">Category Page</a></li>
                        <li><a href="./cart.html">Cart Page</a></li>
                        <li><a href="./checkout.html">Checkout Page</a></li>
                        <li><a href="./contact.html">Contact Page</a></li>
                    </ul>
                </li>
                <li><a href="#">Blog</a></li>
            </ul>
        </div>
    </nav>
</header>
<!-- Header section end -->



<section class="sec-product-detail bg0 p-t-65 p-b-60">
    <div class="container">
        <div class="row">

            <div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
                <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">

                    <h4 class="mtext-109 cl2 p-b-30">Add Product</h4>

                    <div class="flex-w flex-t bor12 p-t-15 p-b-30">

                        <div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
                            <div class="p-t-15">
                                <c:url value="/product/add" var="addProduct"/>
                                <form:form action="${addProduct}" modelAttribute="emptyProduct" enctype="multipart/form-data">
                                    <div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9">
                                        <form:select class="js-select2" name="time" path="category">
                                            <option>men</option>
                                            <option>women</option>
                                            <option>shoe</option>
                                        </form:select>
                                        <div class="dropDownSelect2"></div>
                                    </div>

                                    <div class="bor8 bg0 m-b-12">
                                        <form:input  path="productTitle" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="state" placeholder="Name"/>
                                    </div>

                                    <div class="bor8 bg0 m-b-22">
                                        <form:input path="description" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="description"/>
                                    </div>

                                    <div class="bor8 bg0 m-b-22">
                                        <form:input path="price" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="price"/>
                                    </div>

                                    <div class="bor8 bg0 m-b-22">
                                        <form:input path="rate" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="rate"/>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <input type="file" name="productImg" class="form-control-file" formenctype="multipart/form-data" id="exampleformControlFile1">
                                    </div>
                                    <form:input type="hidden" path="id" readonly="true"/>

                                    <input type="submit" value="add product" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
                                </form:form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>




<%@include file="tmp/footer.jsp" %>