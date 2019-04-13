<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp"%>

<div class="container-fluid">

    <div class="bg0 p-t-23 p-b-140">
        <div class="container">
            <div class="row">
                <h4 class="mtext-105 cl2 js-name-detail p-b-14">
                    Registration
                </h4>
                <!--  -->
                <div class="p-t-33">
                    <form:form action="saveUserSpringForm" method="post" modelAttribute="emptyUser">
                        <div class="container">
                            <div class="flex-w flex-r-m p-b-10">
                                <div class="size-203 flex-c-m respon6">
                                    Email
                                </div>

                                <div class="size-204 respon6-next">
                                    <div class="rs1-select2 bor8 bg0">
                                        <form:input path="email" type="email" placeholder="Enter email"/>
                                        <div class="dropDownSelect2"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="flex-w flex-r-m p-b-10">
                                <div class="size-203 flex-c-m respon6">
                                    Username
                                </div>

                                <div class="size-204 respon6-next">
                                    <div class="rs1-select2 bor8 bg0 ${status.error ? 'has-error' : ''}">
                                        <form:input path="username" type="text" placeholder="Enter login"/>
                                        <form:errors path="username" class="cs"/>
                                        <div class="dropDownSelect2"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="flex-w flex-r-m p-b-10">
                                <div class="size-203 flex-c-m respon6">
                                    Password
                                </div>

                                <div class="size-204 respon6-next">
                                    <div class="rs1-select2 bor8 bg0 ${status.error ? 'has-error' : ''}">
                                        <form:input path="password" type="password" placeholder="Enter password"/>
                                        <form:errors path="password" class="cs"/>
                                        <div class="dropDownSelect2"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="flex-w flex-r-m p-b-10">
                                <div class="size-203 flex-c-m respon6">
                                    Password
                                </div>

                                <div class="size-204 respon6-next">
                                    <div class="rs1-select2 bor8 bg0 ${status.error ? 'has-error' : ''}">
                                        <form:input path="confirmPassword" type="password" placeholder="Confirm password"/>
                                        <form:errors path="confirmPassword" class="cs"/>
                                        <div class="dropDownSelect2"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <br>
                        <input type="submit" cclass="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
                    </form:form>
                </div>
            </div>
        </div>
    </div>

</div>


<%@include file="tmp/footer.jsp" %>