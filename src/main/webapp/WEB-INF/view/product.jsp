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
                        <%--<c:if test="${countProductInBasket != 0}">--%>
                        <div class="up-item">
                            <div class="shopping-card">
                                <i class="flaticon-bag"></i>
                                <span>${countProductInBasket}</span>
                            </div>
                            <a href="/cart">Shopping Cart</a>
                        </div>
                        <%--</c:if>--%>
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
        <h4>Product Page</h4>
        <div class="site-pagination">
            <a href="/welcome">Home</a> /
            <a href="/welcome">Shop</a>
        </div>
    </div>
</div>
<!-- Page info end -->


<!-- product section -->
<section class="product-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="product-pic-zoom">
                    <img class="product-big-img" src="${product.productImg}" alt="">
                </div>
                <div class="product-thumbs" tabindex="1" style="overflow: hidden; outline: none;">
                    <div class="product-thumbs-track">
                        <div class="pt active" data-imgbigurl="${product.productImg}"><img src="${product.productImg}"alt=""></div>
                        <c:forEach items="${elsePhoto}" var="preview">
                            <div class="pt active" data-imgbigurl="${preview.previewImg}"><img src="${preview.previewImg}"alt=""></div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 product-details">
                <h2 class="p-title">${product.productBrand}</h2>
                <h2 class="p-title">${product.productModel}</h2>
                <h3 class="p-price">$${product.price}</h3>
                <h4 class="p-title">
                    <c:if test="${currentUser != null && product.user.id != currentUser.id}">
                        <a href="<c:url value='/addLike/${currentUser.id}/${product.id}"'/>">
                            <i class="flaticon-heart">${product.toLike} </i>
                        </a>
                    </c:if>
                    <c:if test="${currentUser.id == product.user.id}">
                        <i class="flaticon-heart">${product.toLike} </i>
                    </c:if>
                </h4>

                <h4 class="p-stock">Available: <span>${product.available}</span></h4>
                <div class="p-rating">
                    <i class="fa fa-star-o"></i>
                    <i class="fa fa-star-o"></i>
                    <i class="fa fa-star-o"></i>
                    <i class="fa fa-star-o"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <form:form action="/purchaseAdd/${product.id}/${currentUser.id}" modelAttribute="emptyPurchase">
                    <div class="fw-size-choose">
                        <p>Size</p>
                        <div class="promo-qty">
                            <form:select class="js-select2"  path="bikeSize">
                                <option>s</option>
                                <option>m</option>
                                <option>l</option>
                            </form:select>
                        </div>
                    </div>
                    <div class="quantity">
                        <p>Quantity</p>
                        <div class="pro-qty"><form:input path="count"  type="text" value="1"/></div>
                    </div>
                    <input type="submit" value="add in curt" class="site-btn">
                </form:form>

                <div id="accordion" class="accordion-area">
                    <div class="panel">
                        <div class="panel-header" id="headingOne">
                            <button class="panel-link active" data-toggle="collapse" data-target="#collapse1" aria-expanded="true" aria-controls="collapse1">information</button>
                        </div>
                        <div id="collapse1" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                            <div class="panel-body">
                                <p>${product.description}</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-header" id="headingTwo">
                            <button class="panel-link" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapse2">care details </button>
                        </div>
                        <div id="collapse2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                            <div class="panel-body">
                                <img src="../../resources/img/cards.png" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-header" id="headingThree">
                            <button class="panel-link" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3">shipping & Returns</button>
                        </div>
                        <div id="collapse3" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                            <div class="panel-body">
                                <h4>7 Days Returns</h4>
                                <p>Cash on Delivery Available<br>Home Delivery <span>3 - 4 days</span></p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra tempor so dales. Phasellus sagittis auctor gravida. Integer bibendum sodales arcu id te mpus. Ut consectetur lacus leo, non scelerisque nulla euismod nec.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="social-sharing">
                    <a href=""><i class="fa fa-google-plus"></i></a>
                    <a href=""><i class="fa fa-pinterest"></i></a>
                    <a href="https://www.facebook.com/profile.php?id=100000592606026&ref=bookmarks"><i class="fa fa-facebook"></i></a>
                    <a href=""><i class="fa fa-twitter"></i></a>
                    <a href=""><i class="fa fa-youtube"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- product section end -->


<!-- RELATED PRODUCTS section -->
<section class="related-product-section">
    <div class="container">
        <div class="section-title">
            <h2>RELATED PRODUCTS</h2>
        </div>
        <div class="product-slider owl-carousel">
            <c:forEach items="${productSortList}" var="product">
                <div class="product-item">
                    <div class="pi-pic">
                        <a href="productData/${product.id}"><img src="${product.productImg}" alt=""></a>
                    </div>
                    <div class="pi-text">
                        <h6>$${product.price}</h6>

                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- RELATED PRODUCTS section end -->

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

