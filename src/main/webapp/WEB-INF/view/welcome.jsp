<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tmp/header.jsp"%>
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
    <div class="container-fluid">
            <c:forEach items="${previewList}" var="preview">
                <c:if test="${preview.previewCategory == 'main'}">
                    <div class="product-item ">
                        <div class="pi-pic">
                            <img src="${preview.previewImg}"/>
                            <div class="pi-links">
                                <div>
                                    <h2>${preview.previewTitle}</h2>
                                    <p>${preview.previewDescription}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
    </div>


<!-- Page info -->
<div class="page-top-info">
    <div class="container">
        <h4>Welcome</h4>
        <div class="site-pagination">
            <a href="">Home</a> /
            <a href="">Shop</a>
        </div>
    </div>
</div>
<!-- Page info end -->

<!-- letest product section -->
<section class="top-letest-product-section">
    <div class="container">

        <div class="section-title">
            <h2>LATEST PRODUCTS</h2>
        </div>
        <div class="product-slider owl-carousel">
            <c:forEach items="${productSortList}" var="product">
                    <div class="product-item">
                        <div class="pi-pic">
                            <a href="productData/${product.id}"><img src="${product.productImg}" alt=""></a>
                                    <%--<c:if test="${currentUser != null && product.user.id != currentUser.id}">--%>
                                        <%--<a href="<c:url value='/addLike/${currentUser.id}/${product.id}"'/>">--%>
                                            <%--<i class="flaticon-heart">${product.toLike} </i>--%>
                                        <%--</a>--%>
                                    <%--</c:if>--%>
                        </div>
                        <div class="pi-text">
                            <h6>$ ${product.price}</h6>
                            <p>
                                <a href="/sortByName/${product.productBrand}">${product.productBrand}</a> ${product.productModel}
                                    <c:if test="${currentUser != null && product.user.id != currentUser.id}">
                                        <a href="<c:url value='/addLike/${currentUser.id}/${product.id}"'/>">
                                            <i class="flaticon-heart">${product.toLike} </i>
                                        </a>
                                    </c:if>
                                    <c:if test="${currentUser.id == product.user.id}">
                                        <i class="flaticon-heart">${product.toLike} </i>
                                    </c:if>
                            </p>

                        </div>
                    </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- letest product section end -->



<!-- Product filter section -->
<section class="product-filter-section">
        <div class="container">
            <div class="section-title">
                <h2>BROWSE TOP SELLING PRODUCTS</h2>
            </div>
                <ul class="product-filter-menu">
                    <li><a href="/sortBySubCategory/hardTail">Hard Tail</a></li>
                    <li><a href="/sortBySubCategory/roadBike">Road Bike</a></li>
                    <li><a href="/sortBySubCategory/cityBike">City Bike & Urban</a></li>
                    <li><a href="/sortBySubCategory/enduro">Enduro</a></li>
                            <li><a href="/expensive">Expensive</a></li>
                            <li><a href="/poor">Poor</a></li>
                            <li><a href="/popular">Popular</a></li>
                </ul>
        </div>
    <div class="container">
        <div class="row">
            <c:forEach items="${productList}" var="product">
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <a href="/productData/${product.id}"><img src="${product.productImg}" alt=""></a>
                        </div>
                        <div class="pi-text">
                            <h6>$${product.price}</h6>
                            <p>
                                <a href="/sortByName/${product.productBrand}">${product.productBrand}</a> ${product.productModel}

                                <c:if test="${currentUser != null && product.user.id != currentUser.id}">
                                    <a href="<c:url value='/addLike/${currentUser.id}/${product.id}"'/>">
                                        <i class="flaticon-heart">${product.toLike} </i>
                                    </a>
                                </c:if>
                                <c:if test="${currentUser.id == product.user.id}">
                                    ${product.toLike}
                                </c:if>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="text-center pt-5">
            <button class="site-btn sb-line sb-dark">LOAD MORE</button>
        </div>
    </div>
</section>
<!-- Product filter section end -->


<!-- Banner section -->
<section class="banner-section">
    <div class="container">
        <c:forEach items="${previewList}" var="preview">
            <c:if test="${preview.previewCategory == 'baner'}">
                <div class="product-item">
                    <div class="pi-pic">
                        <img src="${preview.previewImg}"/>
                        <div class="pi-links">
                            <div>
                                <h2>${preview.previewTitle}</h2>
                                <p>${preview.previewDescription}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>

    </div>
</section>
<!-- Banner section end  -->

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
<%@include file="tmp/footer.jsp"%>
