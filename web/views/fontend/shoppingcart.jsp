<%-- 
    Document   : shoppingcart
    Created on : Jul 23, 2021, 1:51:48 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="layout/link.jsp" flush="true"></jsp:include>
        </head>
        <body>
        <jsp:include page="layout/header.jsp" flush="true"></jsp:include>
        <jsp:include page="layout/menu.jsp" flush="true"></jsp:include>
        <%--<jsp:include page="main/shoppingcart.jsp" flush="true"></jsp:include>--%>
        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Shopping Cart</h4>
                            <div class="breadcrumb__links">
                                <a href="home.htm">Home</a>
                                <a href="shop.htm">Shop</a>
                                <span>Shopping Cart</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->
        <!-- Shopping Cart Section Begin -->
        <section class="shopping-cart spad card-body">
            <div class="container">
                
                <div class="row">
                    <div class="col-lg-8">
                        <form action="update.htm" enctype="multipart/form-data">
                            <div class="shopping__cart__table">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${listCart == null}">
                                                <div class="text-center">
                                                    <h4>There are no products in your cart</h4><br>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${listCart}" var="cart">
                                                    <tr>
                                                        <td class="product__cart__item">
                                                            <div class="product__cart__item__pic">
                                                                <img src="/Fontend/views/fontend/assets/img/product/${cart.product.images}" alt="" style="width: 100px">
                                                            </div>
                                                            <div class="product__cart__item__text">
                                                                <h6><a class="text-dark" href="shopdetail.htm?Id=${cart.product.productId}">${cart.product.name}</a></h6>
                                                                <c:choose>
                                                                    <c:when test="${cart.product.discount != 0}">
                                                                        <h5>$${cart.product.discount} <small><del>${cart.product.priceOutput}</del></small></h5>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <h5>$${cart.product.priceOutput}</h5>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </td>
                                                        <td class="quantity__item">
                                                            <div class="quantity">
                                                                <div class="pro-qty-2">
                                                                    <input type="text" value="${cart.quantity}" name="quantity" id="quantity" min="1">
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="cart__price">
                                                            <c:choose>
                                                                <c:when test="${cart.product.discount != 0}">
                                                                    <h5>$${cart.product.discount*cart.quantity} <small><del>${cart.product.priceOutput*cart.quantity}</del></small></h5>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <h5>$${cart.product.priceOutput*cart.quantity}</h5>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td class="cart__close"><a href="<%=request.getContextPath()%>/fontend/remove.htm?Id=${cart.product.productId}"><i class="fa fa-close" ata-toggle="tooltip" data-placement="top" title="Xóa" onclick="return confirm('Bạn muốn xóa?')"></i></a></td>
                                                    </tr>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="continue__btn">
                                        <a href="shop.htm">Continue Shopping</a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <% if (session.getAttribute("listCart") != null) { %>
                                        <div class="continue__btn update__btn">
                                            <button type="submit" class="btn btn-dark btn-lg"><i class="fa fa-spinner"></i> Update cart</button>
                                        </div>
                                    <% } %>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-4">
                        <div class="cart__total">
                            <h6>Cart total</h6>
                            <% if (session.getAttribute("listCart") != null) { %>
                                <ul>
                                    <li>Sub Price <span>$ ${subPrice}</span></li>
                                    <li>Discount <span>$ ${discount}</span></li>
                                    <li>Total <span>$ ${total}</span></li>
                                </ul>
                                <a href="checkout.htm" class="primary-btn">Proceed to checkout</a>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shopping Cart Section End -->
        <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
        </body>
    <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
</html>
