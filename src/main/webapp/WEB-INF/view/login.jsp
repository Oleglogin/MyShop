<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp" %>
<header header-v4>
    <!-- Header desktop -->
    <div class="container-menu-desktop">
        <%--<div class="wrap-menu-desktop how-shadow1">--%>
        <nav class="limiter-menu-desktop container">

            <!-- Logo desktop -->
            <a href="#" class="logo">
                <img src="../../resources/images/icons/logo-01.png" alt="IMG-LOGO">
            </a>

            <!-- Menu desktop -->
            <div class="menu-desktop">
                <ul class="main-menu">
                    <li>
                        <a href="/welcome">Main page</a>
                    </li>
                </ul>
            </div>

            <!-- Icon header -->
            <div class="wrap-icon-header flex-w flex-r-m">
                <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
                    <i class="zmdi zmdi-search"></i>
                </div>

                <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="${countProductInBascet}">
                    <i class="zmdi zmdi-shopping-cart"></i>
                </div>

                <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
                    <i class="zmdi zmdi-favorite-outline"></i>
                </a>
            </div>

        </nav>
        <%--</div>--%>
    </div>
</header>

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