<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- cart section end -->
<section class="cart-section spad">
    <div class="container-fluid">
        <div class="row">

            <div class="col-lg-6">
                <div class="cart-table">
                    <h3>success User</h3>
                    <div class="cart-table-warp">
                        <table>
                            <thead>
                            <tr>
                                <th class="product-th">Product</th>
                                <th class="product-th">Model</th>
                                <th class="quy-th">Quantity</th>
                                <th class="size-th">SizeSize</th>
                                <th class="total-th">Price</th>
                                <th class="total-th">User</th>
                                <th class="total-th">Check</th>
                                <th class="total-th">Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${purchaseList}" var="purchase">
                                <c:if test="${purchase.successOrder == true and purchase.checkOrder == false}">
                                    <tr>
                                        <td class="product-col">
                                            <img src="${purchase.product.productImg}" alt="">
                                            <div class="pc-title">
                                                <h4>${purchase.product.productBrand}</h4>
                                                <p>$${purchase.product.price}</p>
                                            </div>
                                        </td>
                                        <td class="size-col"><h4>${purchase.product.productModel}</h4></td>
                                        <td class="size-col"><h4>${purchase.count}</h4></td>
                                        <td class="size-col"><h4>${purchase.bikeSize}</h4></td>
                                        <td class="total-col"><h4>$${purchase.amount}</h4></td>
                                        <td class="total-col"><h4><a href="<c:url value='/user/${purchase.user.id}'/> ">${purchase.user.id}</a></h4></td>
                                        <td class="total-col"><h4><a href="<c:url value='/purchaseCheck/${purchase.id}'/> ">Check</a></h4></td>
                                        <td class="total-col"><h4><a href="<c:url value='/purchaseRemoveFromAdmin/${purchase.id}'/> ">Delete</a></h4></td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <c:if test="${accounts != null}">
                <div class="col-lg-6">
                    <div class="cart-table">
                        <h3>User and Order info</h3>
                        <div class="cart-table-warp">
                            <table>
                                <thead>
                                <tr>
                                    <th class="product-th">User Id</th>
                                    <th class="product-th">Building</th>
                                    <th class="product-th">Flat</th>
                                    <th class="quy-th">street</th>
                                    <th class="quy-th">city</th>
                                    <th class="size-th">country</th>
                                    <th class="total-th">Index</th>
                                    <th class="total-th">Phone</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${accounts}" var="account">
                                    <tr>
                                        <td class="size-col"><h4>${account.user.id}</h4></td>
                                        <td class="size-col"><h4>${account.building}</h4></td>
                                        <td class="size-col"><h4>${account.flat}</h4></td>
                                        <td class="size-col"><h4>${account.street}</h4></td>
                                        <td class="size-col"><h4>${account.city}</h4></td>
                                        <td class="size-col"><h4>${account.country}</h4></td>
                                        <td class="size-col"><h4>${account.postIndex}</h4></td>
                                        <td class="total-col"><h4>${account.phone}</h4></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="total-cost">

                        </div>
                    </div>
                </div>
            </c:if>


        </div>
    </div>
</section>
<!-- cart section end -->
<section class="cart-section spad">
    <div class="container-fluid">
        <div class="row">

            <div class="col-lg-7">
                <div class="cart-table">
                    <h3>send product</h3>
                    <div class="cart-table-warp">
                        <table>
                            <thead>
                            <tr>
                                <th class="product-th">Product</th>
                                <th class="product-th">Model</th>
                                <th class="quy-th">Quantity</th>
                                <th class="size-th">SizeSize</th>
                                <th class="total-th">Price</th>
                                <th class="total-th">User</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${purchaseList}" var="purchase">
                                <c:if test="${purchase.successOrder == true and purchase.checkOrder == true}">
                                    <tr>
                                        <td class="product-col">
                                            <img src="${purchase.product.productImg}" alt="">
                                            <div class="pc-title">
                                                <h4>${purchase.product.productBrand}</h4>
                                                <p>$${purchase.product.price}</p>
                                            </div>
                                        </td>
                                        <td class="size-col"><h4>${purchase.product.productModel}</h4></td>
                                        <td class="size-col"><h4>${purchase.count}</h4></td>
                                        <td class="size-col"><h4>${purchase.bikeSize}</h4></td>
                                        <td class="total-col"><h4>$${purchase.amount}</h4></td>
                                        <td class="total-col"><h4><a href="<c:url value='/user/${purchase.user.id}'/> ">${purchase.user.id}</a></h4></td></tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="total-cost">
                        <%--<h6>Total <span>$ ${amountPrice}</span></h6>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- cart section end -->
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