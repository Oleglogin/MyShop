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
                                    <th class="size-th">Category</th>
                                    <th class="size-th">subCategory</th>
                                    <th class="total-th">Edit</th>
                                    <th class="total-th">Delete</th>
                                </tr>
                            </thead>
                            <c:forEach items="${productList}" var="product">
                                <tbody>
                                    <tr>
                                        <td class="product-col">
                                            <img src="${product.productImg}" alt="Product">
                                            <div class="pc-title">
                                                <h4>${product.productTitle}</h4>
                                                <p>$ ${product.price}</p>
                                            </div>
                                        </td>

                                        <td class="size-col"><h4>${product.category}</h4></td>
                                        <td class="total-col"><h4>${product.subCategory}</h4></td>
                                        <td class="column-6"><a href="<c:url value='/productEdit/${product.id}'/> ">Edit</a></td>
                                        <td class="column-7"><a href="<c:url value='/productRemove/${product.id}'/> ">Delete</a></td>
                                    </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="total-cost">
                        <h6>Total <span>$99.90</span></h6>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 card-right">
                <c:url value="/product/add" var="addProduct"/>
                <form:form action="${addProduct}" modelAttribute="emptyProduct" enctype="multipart/form-data">
                    <div class="promo-code-form">
                        <form:input  path="productTitle" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="state" placeholder="Name"/>
                    </div>
                    <div class="promo-code-form">
                        <form:input path="description" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="description"/>
                    </div>
                    <div class="promo-code-form">
                        <form:input path="price" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="price"/>
                    </div>
                    <div class="promo-code-form">
                        <form:input path="rate" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="rate"/>
                    </div>
                    <div class="promo-code-form">
                        <form:input path="size" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="size"/>
                    </div>
                    <div class="promo-code-form">
                        <input type="file" name="productImg" class="promo-code-form" formenctype="multipart/form-data" id="exampleformControlFile1">
                    </div>
                    <div class="promo-code-form">
                        <form:select class="js-select2" name="time" path="category">
                            <option>preview</option>
                            <option>men</option>
                            <option>women</option>
                            <option>shoe</option>
                        </form:select>

                        <form:select class="js-select2" name="time" path="subCategory">
                            <option>tops</option>
                            <option>jeans</option>
                            <option>coats</option>
                            <option>dresses</option>
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
                        <h6>Total <span>$99.90</span></h6>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 card-right">
                <c:url value="/add/preview" var="addPreview"/>
                <form:form action="${addPreview}" modelAttribute="emptyPreview" enctype="multipart/form-data">
                    <div class="promo-code-form">
                        <form:input  path="previewTitle" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="state" placeholder="Name"/>
                    </div>

                    <div class="promo-code-form">
                        <form:input path="previewPrice" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="price"/>
                    </div>


                    <div class="promo-code-form">
                        <input type="file" name="previewImg" class="promo-code-form" formenctype="multipart/form-data" id="exampleformControlFile1">
                    </div>
                    <div class="promo-code-form">
                        <form:select class="js-select2" name="time" path="previewCategory">
                            <option>main</option>
                            <option>subMain</option>
                        </form:select>
                    </div>

                    <input type="submit" value="add preview" class="site-btn">
                </form:form>
            </div>
        </div>
    </div>
</section>
<!-- admin section end -->



<%@include file="tmp/footer.jsp" %>