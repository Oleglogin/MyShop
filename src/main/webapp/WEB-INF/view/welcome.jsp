<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tmp/header.jsp"%>
<%--<!-- Page Preloder -->--%>

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
                        <c:if test="${countProductInBasket != 0}">
                            <div class="up-item">
                                <div class="shopping-card">
                                    <i class="flaticon-bag"></i>
                                    <span>${countProductInBasket}</span>
                                </div>
                                <a href="/cart">Shopping Cart</a>
                            </div>
                        </c:if>
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
                            <div class="pi-links">
                                <div>
                                    <c:if test="${currentUser != null && product.user.id != currentUser.id}">
                                        <a href="<c:url value='/addLike/${currentUser.id}/${product.id}"'/>" class="wishlist-btn">
                                            <i class="flaticon-heart"></i>
                                            <span>${countLike}</span>
                                        </a>
                                    </c:if>

                                    <c:if test="${currentUser != null && product.user.id != currentUser.id}">
                                        <a href="<c:url value='/addDisLike/${currentUser.id}/${product.id}'/>" class="wishlist-btn">
                                            <i class="flaticon-dislike"></i>
                                        </a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="pi-text">
                            <h6>$${product.price}</h6>
                            <p>${product.productTitle}</p>
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
            <li><a href="/sortBySubCategory/tops">TOPS</a></li>
            <li><a href="/sortBySubCategory/jeans">JEANS</a></li>
            <li><a href="/sortBySubCategory/dresses">DRESSES</a></li>
            <li><a href="/sortBySubCategory/coats">COATS</a></li>
            <li><a href="/sortBySubCategory/jumpers">JUMPERS</a></li>
            <li><a href="/sortBySubCategory/leggings">LEGGINGS</a></li>
        </ul>
        <div class="row">
            <c:forEach items="${productList}" var="product">
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <a href="/productData/${product.id}"><img src="${product.productImg}" alt=""></a>
                            <div class="pi-links">
                                <div>
                                    <c:if test="${currentUser != null && product.user.id != currentUser.id}">
                                        <a href="<c:url value='/addLike/${currentUser.id}/${product.id}"'/>" class="wishlist-btn">
                                            <i class="flaticon-heart"></i>
                                        </a>
                                    </c:if>

                                    <c:if test="${currentUser != null && product.user.id != currentUser.id}">
                                        <a href="<c:url value='/addDisLike/${currentUser.id}/${product.id}'/>" class="wishlist-btn">
                                            <i class="flaticon-dislike"></i>
                                        </a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="pi-text">
                            <h6>$${product.price}</h6>
                            <p>${product.productTitle} </p>
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
        <div class="banner set-bg" data-setbg="img/banner-bg.jpg">
            <div class="tag-new">NEW</div>
            <span>New Arrivals</span>
            <h2>STRIPED SHIRTS</h2>
            <a href="#" class="site-btn">SHOP NOW</a>
        </div>
    </div>
</section>
<!-- Banner section end  -->


<!-- Footer section -->
<section class="footer-section">
    <div class="container">
        <div class="footer-logo text-center">
            <a href="index.html"><img src="../../resources/img/logo-light.png" alt=""></a>
        </div>
        <div class="row">
            <div class="col-lg-3 col-sm-6">
                <div class="footer-widget about-widget">
                    <h2>About</h2>
                    <p>Donec vitae purus nunc. Morbi faucibus erat sit amet congue mattis. Nullam frin-gilla faucibus urna, id dapibus erat iaculis ut. Integer ac sem.</p>
                    <img src="img/cards.png" alt="">
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="footer-widget about-widget">
                    <h2>Questions</h2>
                    <ul>
                        <li><a href="">About Us</a></li>
                        <li><a href="">Track Orders</a></li>
                        <li><a href="">Returns</a></li>
                        <li><a href="">Jobs</a></li>
                        <li><a href="">Shipping</a></li>
                        <li><a href="">Blog</a></li>
                    </ul>
                    <ul>
                        <li><a href="">Partners</a></li>
                        <li><a href="">Bloggers</a></li>
                        <li><a href="">Support</a></li>
                        <li><a href="">Terms of Use</a></li>
                        <li><a href="">Press</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="footer-widget about-widget">
                    <h2>Questions</h2>
                    <div class="fw-latest-post-widget">
                        <div class="lp-item">
                            <div class="lp-thumb set-bg" data-setbg="img/blog-thumbs/1.jpg"></div>
                            <div class="lp-content">
                                <h6>what shoes to wear</h6>
                                <span>Oct 21, 2018</span>
                                <a href="#" class="readmore">Read More</a>
                            </div>
                        </div>
                        <div class="lp-item">
                            <div class="lp-thumb set-bg" data-setbg="img/blog-thumbs/2.jpg"></div>
                            <div class="lp-content">
                                <h6>trends this year</h6>
                                <span>Oct 21, 2018</span>
                                <a href="#" class="readmore">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="footer-widget contact-widget">
                    <h2>Questions</h2>
                    <div class="con-info">
                        <span>C.</span>
                        <p>Your Company Ltd </p>
                    </div>
                    <div class="con-info">
                        <span>B.</span>
                        <p>1481 Creekside Lane  Avila Beach, CA 93424, P.O. BOX 68 </p>
                    </div>
                    <div class="con-info">
                        <span>T.</span>
                        <p>+53 345 7953 32453</p>
                    </div>
                    <div class="con-info">
                        <span>E.</span>
                        <p>office@youremail.com</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="social-links-warp">
        <div class="container">
            <div class="social-links">
                <a href="" class="instagram"><i class="fa fa-instagram"></i><span>instagram</span></a>
                <a href="" class="google-plus"><i class="fa fa-google-plus"></i><span>g+plus</span></a>
                <a href="" class="pinterest"><i class="fa fa-pinterest"></i><span>pinterest</span></a>
                <a href="" class="facebook"><i class="fa fa-facebook"></i><span>facebook</span></a>
                <a href="" class="twitter"><i class="fa fa-twitter"></i><span>twitter</span></a>
                <a href="" class="youtube"><i class="fa fa-youtube"></i><span>youtube</span></a>
                <a href="" class="tumblr"><i class="fa fa-tumblr-square"></i><span>tumblr</span></a>
            </div>

            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            <p class="text-white text-center mt-5">Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

        </div>
    </div>
</section>
<!-- Footer section end -->
<%@include file="tmp/footer.jsp"%>
