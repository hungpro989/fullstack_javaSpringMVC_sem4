<%-- 
    Document   : productdetail
    Created on : Jul 25, 2021, 2:06:28 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="layout/link.jsp" flush="true"></jsp:include>
        </head>
        <body>
            <div class="wrapper">
            <jsp:include page="layout/header.jsp" flush="true"></jsp:include>
            <jsp:include page="layout/menu.jsp" flush="true"></jsp:include>
                <div class="content-body">
                    <div class="row page-titles mx-0">
                        <div class="col p-md-0">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                                <li class="breadcrumb-item active"><a href="javascript:void(0)">Product detail</a></li>
                            </ol>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body container-fluid row">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Name:</label>
                                                <input type="text" class="form-control input-rounded" name="product_quantity" value="${customer.name}">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Phone:</label>
                                                <input type="text" class="form-control input-rounded" name="product_buyitem" value="${customer.phone}">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Username:</label>
                                                <input type="text" class="form-control input-rounded" name="product_buyitem" value="${customer.userName}">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Email:</label>
                                                <input type="text" class="form-control input-rounded" name="product_buyitem" value="${customer.email}">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Created date:</label>
                                                <input type="text" class="form-control input-rounded" name="product_buyitem" value="${customer.created}" disabled="">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Status:</label>
                                                <div class="form-group">
                                                    <label class="radio-inline mr-3"><input type="radio" value="true" id="product_status" name="product_status" ${customer.status==true?"checked":""}> Show</label>
                                                    <label class="radio-inline mr-3"><input type="radio" value="false" id="product_status" name="product_status" ${customer.status==false?"checked":""}> Hidden</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">List Order</h4>
                                        <table class="table-hover table-striped table">
                                            <thead class="bg-secondary text-white">
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
                    </div>
                </div>
            </div>
        <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
    </body>
</html>
