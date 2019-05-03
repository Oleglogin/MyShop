<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                    <form method="get" action="/search" class="header-search-form">
                        <input type="text" placeholder="Search on divisima ...."  name="searchString" >
                        <button type="submit"><i  class="flaticon-search"></i></button>
                    </form>
                </div>

                <div class="col-xl-6 col-lg-5">
                    <div class="user-panel">
                        <div class="up-item">
                            <div class="shopping-card">
                                <i class="flaticon-bag"></i>
                                <span>${countProductInBasket}</span>
                            </div>
                            <a href="/cart">Shopping Cart</a>
                        </div>
                        <div class="up-item">
                            <i class="flaticon-profile"></i>
                            <a href="/login">Sign In/Up</a>
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
                <li><a href="/sortByCategory/men">Men's</a></li>
                <li><a href="/sortByCategory/women">Women's</a></li>

                <li><a href="/sortByCategory/kid">Kid's
                    <span class="new">New</span>
                </a></li>
                <li><a href="/sortByCategory/accessories">Accessories</a>
                <li><a href="#">Pages</a>
                    <ul class="sub-menu">
                        <li><a href="/contact">Contact Page</a></li>
                        <c:if test="${currentUser.authority == 'ROLE_ADMIN'}">
                            <li><a href="/admin">Admin Page</a></li>
                            <li><a href="/adminOrder">Admin Order</a></li>
                        </c:if>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
<!-- Header section end -->
<!-- Page info -->
<div class="page-top-info">
    <div class="container">
        <h4>CheckOut</h4>
        <div class="site-pagination">
            <a href="/welcome">Home</a> /
            <a href="">CheckOut</a>
        </div>
    </div>
</div>
<!-- Page info end -->


<!-- checkout section  -->
<section class="checkout-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 order-2 order-lg-1">
                <div class="cf-title">Billing Address</div>
                <div class="row">

                    <c:if test="${!empty account}">
                        <div class="col-md-5">
                            <a href="<c:url value='/regularAddress/${account.id}'/>">
                                <p>Use my regular address</p>
                            </a>
                        </div>
                    </c:if>
                </div>

                <c:url value="/successOrder" var="addUserAdd"/>
                <form:form action="${addUserAdd}" modelAttribute="emptyAccount" class="checkout-form">

                    <div class="row address-inputs">
                        <div class="col-md-12">
                            <form:input path="street" type="text" placeholder="Street"/>
                            <form:input path="city" type="text" placeholder="City"/>
                            <form:input path="country" type="text" placeholder="Country"/>
                            <form:input path="building" type="text" placeholder="Building"/>
                            <form:input path="flat" type="text" placeholder="Flat"/>
                        </div>
                        <div class="col-md-4">
                            <form:input path="postIndex" type="text" placeholder="Zip code"/>
                        </div>
                        <div class="col-md-4">
                            <form:input path="phone" type="text" placeholder="Phone no."/>
                        </div>
                        <div class="col-md-4">
                            <div class="cf-radio-btns address-rb">
                                <div class="cfr-item">
                                    <form:radiobutton  path="regular"  value="1" id="one"/>
                                    <label for="one">Make my regular address</label>
                                </div>
                                <div class="cfr-item">
                                    <form:radiobutton  path="regular"  value="0" id="two"/>
                                    <label for="two">Different address</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cf-title">Payment</div>
                    <ul class="payment-list">
                        <li>Paypal<a href="#"><img src="../../resources/img/paypal.png" alt=""></a></li>
                        <li>Credit / Debit card<a href="#"><img src="../../resources/img/mastercart.png" alt=""></a></li>
                        <li>Pay when you get the package</li>
                    </ul>
                    <%--<a href="<c:url value='/success/${currentUser.id}"'/>" class="site-btn">Place order</a>--%>

                    <form:input type="hidden" path="id" readonly="true"/>
                    <input type="submit" value="Place order" class="site-btn">

                </form:form>
            </div>

            <div class="col-lg-4 order-1 order-lg-2">
                <div class="checkout-cart">
                    <h3>Your Cart</h3>
                    <ul class="product-list">
                        <c:forEach items="${productListInCurt}" var="purchase">
                            <c:if test="${purchase.successOrder == false}">
                                <li>
                                    <div class="pl-thumb"><img src="${purchase.product.productImg}" alt=""></div>
                                    <h6>${purchase.product.productBrand}</h6>
                                    <h6>${purchase.product.productModel} - ${purchase.product.price} $ * ${purchase.count}</h6>
                                    <%--<p>$ ${purchase.product.price} | count ${purchase.count}</p>--%>
                                </li>
                            </c:if>

                        </c:forEach>
                    </ul>
                    <ul class="price-list">
                        <li>Total<span>$ ${amountPrice}</span></li>
                        <li>Shipping<span>free</span></li>
                        <li class="total">Total<span>$ ${amountPrice}</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- checkout section end -->

<!-- Footer section -->
<section class="footer-section">
    <div class="container">
        <div class="footer-logo text-center">
            <a href="/welcome"><img src="../../resources/img/logo.png" alt=""></a>
        </div>
        <div class="row mt40">
            <div class="col-md-12 text-center">
                <p>
                    <small>&copy; 2019 <a href="https://google.com/" target="_blank">ProLogin:Format</a>. All Rights Reserved. <br> Designed &amp; Developed by <a href="https://www.facebook.com/profile.php?id=100000592606026&ref=bookmarks" target="_blank">ProLogin.com</a> Demo Images: Unsplash</small><br>
                    <a href="#" class="js-backtotop">Back to top</a>
                </p>
            </div>
        </div>
    </div>
    <div class="social-links-warp">
        <div class="container">
            <div class="social-links">
                <a href="" class="instagram"><i class="fa fa-instagram"></i><span>instagram</span></a>
                <a href="" class="google-plus"><i class="fa fa-google-plus"></i><span>g+plus</span></a>
                <a href="" class="pinterest"><i class="fa fa-pinterest"></i><span>pinterest</span></a>
                <a href="https://www.facebook.com/profile.php?id=100000592606026&ref=bookmarks" class="facebook"><i class="fa fa-facebook"></i><span>facebook</span></a>
                <a href="" class="twitter"><i class="fa fa-twitter"></i><span>twitter</span></a>
                <a href="" class="youtube"><i class="fa fa-youtube"></i><span>youtube</span></a>
                <a href="" class="tumblr"><i class="fa fa-tumblr-square"></i><span>tumblr</span></a>
            </div>

            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            <p class="text-white text-center mt-5">Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Login</a></p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

        </div>
    </div>
</section>
<!-- Footer section end -->
<%@include file="tmp/footer.jsp" %>