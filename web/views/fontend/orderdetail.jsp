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
                            <h4>Order Detail</h4>
                            <div class="breadcrumb__links">
                                <a href="profile.htm">Profile</a>
                                <a href="listOrder.htm">List Order</a>
                                <span>Order Detail</span>
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
                    <f:form action="updateOrder.htm" modelAttribute="order" id="update_order" accept-charset='UTF-8'>
                        <input name='FormType' type='hidden' value='update_order' >
                        <input name='utf8' type='hidden' value='true' >
                        <div class="row">
                            <div class="col-lg-7 col-md-6">
                                <h6 class="checkout__title">Billing Details </h6>
                                <div class="checkout__input">
                                    <p>Your Name<span>*</span></p>
                                    <f:input type="text" name="name" style="color:black" value="${order.name}" path="name"/>
                                    <f:input type="hidden" name="orderId" style="color:black" value="${order.orderId}" path="orderId"/>
                                </div>
                                <div class="checkout__input">
                                    <p>Address<span>*</span></p>
                                    <f:input type="text" name="address" style="color:black" value="${order.address}" path="address"/>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Phone<span>*</span></p>
                                            <f:input type="text" name="phone" style="color:black" value="${order.phone}" path="phone"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Email<span>*</span></p>
                                            <f:input type="email" name="email" style="color:black" value="${order.email}" path="email"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="checkout__input">
                                    <p>Note about your order, e.g, special note for delivery</p>
                                    <f:input type="text" name="description" style="color:black" value="${order.description}"  path="description" />
                                </div>
                                <div class="checkout__input">
                                    Status: <span class="btn bg-info">Waitting</span>
                                </div>
                            </div>
                            <div class="col-lg-5 col-md-6">
                                <div class="checkout__order">
                                    <h4 class="order__title">Your order</h4>
                                    <div class="checkout__order__products">Product <span>Total</span></div>
                                    <ul class="checkout__total__products">
                                        <c:forEach items="${listOrderDetail}" var="orderDetail">
                                            <li> ${orderDetail.productName} <input class="border-0" type="number" style="width: 50px" value="${orderDetail.quantity}"/>
                                                <span>${orderDetail.quantity * orderDetail.price}</span>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <ul class="checkout__total__all">
                                        <!--<li>Subtotal <span>$750.99</span></li>-->
                                        <li>Sub Price <span>$${order.subPrice}</span></li>
                                        <li>Discount <span>$${order.discount}</span></li>
                                        <li>COD(5% Total order) <span>$${order.cod}</span></li>
                                        <li>Total <span>$${order.totalPrice}</span></li>
                                    </ul>
                                    <button type="submit" class="site-btn">Update</button>
                                </div>
                            </div>
                        </div>
                    </f:form>
                </div>
            </div>
        </section>
        <!-- Checkout Section End -->
        <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
        </body>
    <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
</html>
