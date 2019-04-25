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


<!-- admin section end -->
<section class="cart-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="cart-table">
                    <h3>Your Product</h3>
                    <div class="cart-table-warp">
                        <table>
                            <thead>
                                <tr>
                                    <th class="product-th">Product</th>
                                    <th class="product-th">Model</th>
                                    <th class="size-th">Category</th>
                                    <th class="size-th">Category-2</th>
                                    <th class="total-th">Edit</th>
                                    <th class="total-th">Delete</th>
                                </tr>
                            </thead>
                            <c:forEach items="${productList}" var="product">
                                <tbody>
                                    <tr>
                                        <td class="product-col">
                                            <a href="admin2/${product.id}"><img src="${product.productImg}" alt="Product"></a>
                                            <div class="pc-title">
                                                <h4>${product.productBrand}</h4>
                                                <p>$ ${product.price}</p>
                                            </div>
                                        </td>
                                        <td class="size-col"><h4>${product.productModel}</h4></td>
                                        <td class="size-col"><h4>${product.category}</h4></td>
                                        <td class="size-col"><h4>${product.subCategory}</h4></td>
                                        <td class="column-6"><a href="<c:url value='/productEdit/${product.id}'/> ">Edit</a></td>
                                        <td class="column-7"><a href="<c:url value='/productRemove/${product.id}'/> ">Delete</a></td>
                                    </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="total-cost">
                        <h6>Total <span></span></h6>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 card-right">
                <c:url value="/product/add" var="addProduct"/>
                <form:form action="${addProduct}" modelAttribute="emptyProduct" enctype="multipart/form-data" class="contact-form">
                    <div class="promo-code-form">
                        <form:input  path="productBrand" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="state" placeholder="Brand"/>
                    </div>
                    <div class="promo-code-form">
                        <form:input  path="productModel" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="state" placeholder="Model"/>
                    </div>
                    <div class="promo-code-form">
                        <form:textarea path="description" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="description"/>
                    </div>
                    <div class="promo-code-form">
                        <form:input path="price" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="price"/>
                    </div>
                    <div class="promo-code-form">
                        <input type="file" name="productImg" class="promo-code-form" formenctype="multipart/form-data" id="exampleformControlFile1">
                    </div>
                    <div class="promo-code-form">
                        <form:select class="js-select2" name="time" path="category">
                            <option>men</option>
                            <option>women</option>
                            <option>kid</option>
                            <option>accessories</option>
                        </form:select>

                        <form:select class="js-select2" name="time" path="subCategory">
                            <option>hardTail</option>
                            <option>roadBike</option>
                            <option>CityBike</option>
                            <option>Enduro</option>
                        </form:select>
                        <form:select path="available" class="s-select2" name="available">
                            <option>true</option>
                            <option>false</option>
                        </form:select>
                    </div>

                    <form:input type="hidden" path="id" readonly="true"/>
                    <input type="submit" value="add product" class="site-btn">
                </form:form>
            </div>
        </div>
    </div>
</section>
<!-- admin section end -->

<!-- admin section end -->
<section class="cart-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="cart-table">
                    <h3>Your Preview</h3>
                    <div class="cart-table-warp">
                        <table>
                            <thead>
                            <tr>
                                <th class="product-th">Img</th>
                                <th class="size-th">Category</th>
                                <th class="total-th">Edit</th>
                                <th class="total-th">Delete</th>
                            </tr>
                            </thead>
                            <c:forEach items="${previewList}" var="preview">
                                <tbody>
                                <tr>
                                    <td class="product-col">
                                        <img src="${preview.previewImg}" alt="Product">
                                        <div class="pc-title">
                                            <h4>${preview.previewTitle}</h4>
                                            <p>$ ${preview.previewPrice}</p>
                                        </div>
                                    </td>

                                    <td class="size-col"><h4>${preview.previewCategory}</h4></td>
                                    <td class="column-6"><a href="<c:url value='/productEdit/${product.id}'/> ">Edit</a></td>
                                    <td class="column-7"><a href="<c:url value='/previewRemove/${preview.id}'/> ">Delete</a></td>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="total-cost">
                        <h6>Total <span></span></h6>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 card-right">
                <c:url value="/add/preview" var="addPreview"/>
                <form:form action="${addPreview}" modelAttribute="emptyPreview" enctype="multipart/form-data" class="contact-form">
                    <div class="promo-code-form">
                        <form:input  path="previewTitle" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="state" placeholder="Name"/>
                    </div>

                    <div class="promo-code-form">
                        <form:input path="previewPrice" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="price"/>
                    </div>


                    <div class="promo-code-form">
                        <form:textarea path="previewDescription" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="description"/>
                    </div>
                    <div class="promo-code-form">
                        <input type="file" name="previewImg" class="promo-code-form" formenctype="multipart/form-data" id="exampleformControlFile1">
                    </div>
                    <div class="promo-code-form">
                        <form:select class="js-select2" name="time" path="previewCategory">
                            <option>main</option>
                            <option>subMain</option>
                            <option>baner</option>
                        </form:select>
                    </div>

                    <input type="submit" value="add preview" class="site-btn">
                </form:form>
            </div>
        </div>
    </div>
</section>
<!-- admin section end -->


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