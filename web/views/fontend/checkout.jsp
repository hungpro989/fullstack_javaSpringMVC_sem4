<%-- 
    Document   : checkout
    Created on : Jul 23, 2021, 2:05:03 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="layout/link.jsp" flush="true"></jsp:include>
        </head>
        <body>
        <jsp:include page="layout/header.jsp" flush="true"></jsp:include>
        <jsp:include page="layout/menu.jsp" flush="true"></jsp:include>
        <%--<jsp:include page="main/checkout.jsp" flush="true"></jsp:include>--%>
        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Check Out</h4>
                            <div class="breadcrumb__links">
                                <a href="home.htm">Home</a>
                                <a href="shop.htm">Shop</a>
                                <span>Check Out</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Checkout Section Begin -->
        <section class="checkout spad">
            <div class="container">
                <div class="checkout__form">
                    <form action="placeOrder.htm" enctype="multipart/form-data" method="get">
                        <div class="row">
                            <div class="col-lg-7 col-md-6">
                                <h6 class="coupon__code"><span class="icon_tag_alt"></span> Have a great shopping day! </h6>
                                <h6 class="checkout__title">Billing Details</h6>
                                <input type="hidden" name="total" value="${totalCod}"path="total" />
                                <input type="hidden" name="cod" value="${cod}" path="cod"/>
                                <input type="hidden" name="subPrice" value="${subPrice}" path="subPrice"/>
                                <input type="hidden" name="discount" value="${discount}" path="discount"/>
                                
                                <div class="checkout__input">
                                    <p>Your Name<span>*</span></p>
                                    <input type="text" name="name" style="color:black" value="${cus.name}" path="name"/>
                                </div>
                                <div class="checkout__input">
                                    <p>Address<span>*</span></p>
                                    <input type="text" name="address" style="color:black" value="${cus.address}" path="address"/>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Phone<span>*</span></p>
                                            <input type="text" name="phone" style="color:black" value="${cus.phone}" path="phone"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Email<span>*</span></p>
                                            <input type="email" name="email" style="color:black" value="${cus.email}" path="email"/>
                                        </div>
                                    </div>
                                </div>
                               <% if (session.getAttribute("customer") == null) { %>
                                <div class="checkout__input__checkbox">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="checkbox_create" name="checkbox_create"/>
                                        <label class="form-check-label" for="checkbox_create">
                                            Create account?
                                        </label>
                                    </div>        
                                    <p>Create an account by entering the information below. If you are a returning customer
                                        please login at the top of the page</p>
                                </div>
                                <div class="checkout__input">
                                    <p>Account Password<span>*</span></p>
                                    <input type="password" name="password" path="password"/>
                                </div>
                                <% }%>
                                <div class="checkout__input">
                                    <p>Note about your order, e.g, special note for delivery</p>
                                    <input type="text" name="description" style="color:black" placeholder="Your note..." path="description"/>
                                </div>
                            </div>
                            <div class="col-lg-5 col-md-6">
                                <div class="checkout__order">
                                    <h4 class="order__title">Your order</h4>
                                    <div class="checkout__order__products">Product <span>Total</span></div>
                                    <ul class="checkout__total__products">
                                        <c:choose>
                                            <c:when test="${listCart == null}">
                                                <div class="text-center">
                                                    <h4>There are no products in your cart</h4><br>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${listCart}" var="cart">
                                                    <li> ${cart.product.name} [${cart.quantity}]
                                                        <c:choose>
                                                            <c:when test="${cart.product.discount != 0}">
                                                                <span>$${cart.product.discount*cart.quantity} <small><del>${cart.product.priceOutput*cart.quantity}</del></small></span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span>$${cart.product.priceOutput*cart.quantity}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                    <ul class="checkout__total__all">
                                        <!--<li>Subtotal <span>$750.99</span></li>-->
                                        <li>Sub Price <span>$${subPrice}</span></li>
                                        <li>Discount <span>$${discount}</span></li>
                                        <li>COD(5% Total order) <span>$${cod}</span></li>
                                        <li>Total <span>$${totalCod}</span></li>
                                    </ul>
                                    <p>Free exchange within 1 month, if there are manufacturing defects. Give a discount voucher to all customers who buy for the first time.</p>
                                    <c:forEach items="${listPaymentType}" var="paymentType">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="paymentTypeId" path="paymentTypeId" id="${paymentType.paymentTypeId}" value="${paymentType.paymentTypeId}"/>
                                            <label class="form-check-label" for="${paymentType.paymentTypeId}">
                                                ${paymentType.name}
                                            </label>
                                        </div>
                                    </c:forEach>
                                    <button type="submit" class="site-btn">PLACE ORDER</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- Checkout Section End -->
        <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
        </body>
    <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
</html>
