<%-- 
    Document   : listsreachorder
    Created on : Aug 8, 2021, 11:34:13 AM
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
                                <span>Search Order By Phone</span>
                            </div>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-12 card">
                            <div class="card-header text-center"><h3>List Order</h3></div>
                            <div class="card-body">
                                <table class="table-hover table-striped table">
                                    <thead class="bg-secondary">
                                        <th style="width: 15%">Bill Code</th>
                                        <th style="width: 15%">Order Time</th>
                                        <th style="width: 20%">Receiver Information</th>
                                        <th style="width: 10%">Delivery</th>
                                        <th style="width: 10%">Status</th>
                                        <th style="width: 10%">Action</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listOrder}" var="order">
                                        <tr>
                                            <td><p>${order.orderId}</p></td>
                                            <td><p>${order.created}</p></td>
                                            <td><strong>${order.name}</strong></td>
                                            <td>
                                                <span class="btn ${order.deliveryId == 1?"btn-default":"btn-info"}">${order.deliveryId == 1?"":order.deliveryName}</span>
                                            </td>
                                            <td>
                                                <span class="btn ${order.statusId == 1?"btn-default":"btn-success"}">${order.statusName}</span>
                                            </td>
                                            <td></td>
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
