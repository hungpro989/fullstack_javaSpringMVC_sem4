<%-- 
    Document   : listorder
    Created on : Aug 7, 2021, 4:32:48 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <section>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__details__breadcrumb text-center">
                                <a href="home.htm">Home</a>
                                <a href="shop.htm">Shop</a>
                                <span>Product Details</span>
                            </div>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-12 card">
                            <div class="card-header text-center"><h3>List Order</h3></div>
                            <div class="card-body">
                                <table class="table-hover table-striped table">
                                    <thead class="bg-secondary">
                                    <th style="width: 15%">No.</th>
                                        <th style="width: 20%">Receiver Information</th>
                                        <th style="width: 25%">Total Price</th>
                                        <th style="width: 20%">Descripton</th>
                                        <th style="width: 10%">Status</th>
                                        <th style="width: 10%">Action</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listOrder}" var="order">
                                        <tr>
                                            <td>
                                                <p>${order.orderId}.</p>
                                                <p>2021-08-07</p>
                                            </td>
                                            <td>
                                                <strong>${order.name}</strong>
                                                <p>${order.phone}, ${order.address}</p>
                                                <p>${order.email}</p>
                                            </td>
                                            <td>
                                                <p>SubPrice: $${order.subPrice}</p>
                                                <p>Discount: $${order.discount}</p>
                                                <p>Cod: $${order.cod}</p>
                                                <strong>Total: $${order.totalPrice}</strong>
                                            </td>
                                            <td>
                                                <p>Fee Cod: ${order.description}</p>
                                            </td>
                                            <td><p>${order.statusName}</p></td>
                                            <td>
                                                <span><a href="orderdetail.htm?Id=${order.orderId}"><i class="fa fa-eye"></i></a></span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
        </body>
    <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
</html>
