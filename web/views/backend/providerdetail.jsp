<%-- 
    Document   : productdetail
    Created on : Jul 25, 2021, 2:06:28 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                                                <input type="text" class="form-control input-rounded" name="product_quantity" value="${provider.providerName}">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Phone:</label>
                                                <input type="text" class="form-control input-rounded" name="product_buyitem" value="${provider.phone}">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Address: </label>
                                                <input type="text" class="form-control input-rounded" name="product_buyitem" value="${provider.address}">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Email: </label>
                                                <input type="text" class="form-control input-rounded" name="product_buyitem" value="${provider.email}">
                                            </div>
                                        </div>
                                        
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Status:</label>
                                                <div class="form-group">
                                                    <label class="radio-inline mr-3"><input type="radio" value="true" id="product_status" name="product_status" ${provider.status==true?"checked":""}> Show</label>
                                                    <label class="radio-inline mr-3"><input type="radio" value="false" id="product_status" name="product_status" ${provider.status==false?"checked":""}> Hidden</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">List Product By Provider</h4>
                                        <table class="table table-striped table-bordered zero-configuration">
                                                <thead class="bg-primary" style="color: white">
                                                    <tr>
                                                        <th >NO.</th>
                                                        <th >Product</th>
                                                        <th >Price</th>
                                                        <th >Quantity</th>
                                                        <th >Buy Items</th>
                                                        <th >Views</th>
                                                        <th >Description</th>
                                                        <th >Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listProduct}" var="product">
                                                    <tr>
                                                        <td>
                                                            <strong>${product.productId}.</strong>
                                                        </td>
                                                        <td class="text-center" style="width:5%">
                                                            <span class="font-weight-bold">${product.name}</span>
                                                            <div class="d-inline">
                                                                <img style="width:100px" src="/Fontend/views/images/product/${product.images}">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <table>
                                                                <tbody>
                                                                <td><span class="badge badge-default">$${product.priceInput}</span> </td>
                                                                <td><span class="badge badge-primary">$${product.priceOutput}</span></td>
                                                                <c:choose>
                                                                    <c:when test="${product.discount != 0}">
                                                                        <td><span class="badge badge-success">$${product.discount}</span><small style="font-size: 8px">Discount</small></td>
                                                                    </c:when>
                                                                </c:choose>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td>
                                                            <span class="btn-success btn-xs">${product.quantity}pcs</span>
                                                        </td>
                                                        <td>
                                                            <span class="btn btn-default btn-xs">${product.buyItem}</span>
                                                        </td>
                                                        <td>
                                                            <span class="btn btn-default btn-xs">${product.view}</span>
                                                        </td>
                                                        <td>
                                                            <c:set var="shortDesc" value="${fn:substring(product.contentDetail, 0, 40)}" />
                                                            ${shortDesc}...
                                                        </td>
                                                        <td>
                                                            <table>
                                                                <tbody>
                                                                    <tr>
                                                                        <td><span><a href="productdetail.htm?Id=${product.productId}"><i class="fa fa-eye" style="color:green"></i></a></span></td>
                                                                        <c:choose>
                                                                            <c:when test="${product.showHome == true}">
                                                                                <td><span><a href="google.com"><i class="fa fa-home" style="color: green"></i></a></span></td>
                                                                            </c:when>
                                                                        </c:choose>    
                                                                    </tr>
                                                                </tbody>
                                                            </table>
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
