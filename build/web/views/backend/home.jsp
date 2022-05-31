<%-- 
    Document   : home
    Created on : Jul 21, 2021, 1:30:36 AM
    Author     : hungp
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
                    <div class="container-fluid mt-3">
                        <div class="row">
                            <div class="col-lg-3 col-sm-6">
                                <div class="card gradient-1">
                                    <div class="card-body">
                                        <h3 class="card-title text-white">Products Sold</h3>
                                        <div class="d-inline-block">
                                            <h2 class="text-white">${productTotalBuy}<small> pcs</small></h2>
                                        <!--<p class="text-white mb-0">Total</p>-->
                                    </div>
                                    <span class="float-right display-5 opacity-5"><i class="fa fa-shopping-cart"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="card gradient-2">
                                <div class="card-body">
                                    <h3 class="card-title text-white">Net Profit</h3>
                                    <div class="d-inline-block">
                                        <h2 class="text-white">$${totalPrice}</h2>
                                        <!--<p class="text-white mb-0">Jan - March 2019</p>-->
                                    </div>
                                    <span class="float-right display-5 opacity-5"><i class="fa fa-money"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="card gradient-3">
                                <div class="card-body">
                                    <h3 class="card-title text-white">New Customers</h3>
                                    <div class="d-inline-block">
                                        <h2 class="text-white">${totalCustomer}</h2>
                                        <!--<p class="text-white mb-0">Jan - March 2019</p>-->
                                    </div>
                                    <span class="float-right display-5 opacity-5"><i class="fa fa-users"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="card gradient-4">
                                <div class="card-body">
                                    <h3 class="card-title text-white">Total Order</h3>
                                    <div class="d-inline-block">
                                        <h2 class="text-white">${totalOrder}</h2>
                                    </div>
                                    <span class="float-right display-5 opacity-5"><i class="fa fa-heart"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="card card-widget">
                                <div class="card-body">
                                    <h5 class="text-muted">Best Seller</h5>
                                    <h2 class="mt-4">${productTotalBuy}<small> pcs</small></h2>
                                    <span>Total Revenue</span>
                                    <c:forEach items="${listTopProduct}" var="topProduct">
                                        <div class="mt-4">
                                            <h4>${topProduct.buyItem}</h4>
                                            <h6>${topProduct.name}<span class="pull-right"><fmt:formatNumber value="${(topProduct.buyItem/productTotalBuy)*100}" minFractionDigits="0" maxFractionDigits="0"/>%</span></h6>
                                            <div class="progress mb-3" style="height: 7px">
                                                <div class="progress-bar bg-primary" style="width: <fmt:formatNumber value="${(topProduct.buyItem/productTotalBuy)*200}" minFractionDigits="0" maxFractionDigits="0"/>%;" role="progressbar"><span class="sr-only">30% Order</span>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <c:forEach items="${listUser}" var="user">
                            <div class="col-lg-3 col-sm-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="text-center">
                                            <img src="/Fontend/views/images/users/${user.images}" style="width: 100px" class="rounded-circle" alt="">
                                            <h5 class="mt-3 mb-1">${user.name}</h5>
                                            <p class="m-0">${user.levelName}</p>
                                            <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="text-muted">New Orders</h5>
                                    <div class="active-member">
                                        <div class="table-responsive">
                                            <table class="table table-xs mb-0 table-triped">
                                                <thead>
                                                    <tr>
                                                        <th>Customers</th>
                                                        <th>Total Bill</th>
                                                        <th>Information Delivery</th>
                                                        
                                                        <th>Payment Method</th>
                                                        <th>Delivery Method</th>
                                                        <th>Status</th>
                                                        <th>Order Date</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listTopOrder}" var="topOrder">
                                                        <tr>
                                                            <td>${topOrder.customerName}</td>
                                                            <td>$${topOrder.totalPrice}</td>
                                                            <td>
                                                               <span>${topOrder.phone}</span>,
                                                                <smaill><i>${topOrder.address}</i></smaill>
                                                            </td>
                                                            <td><div class="btn-success text-center text-white" style=" font-size: 15px">${topOrder.payName}</div></td>
                                                            <td>
                                                                <div class="text-center" style="">
                                                                <span class=" ${topOrder.statusId!=1?"bg-success":"bg-primary"}   text-white" style=" font-size: 15px; width: 100px">${topOrder.deliveryName}</span>
                                                                </div>
                                                            </td>
                                                            <td><i class="fa fa-circle-o ${topOrder.statusId==3?"text-success":"text-primary"}   mr-2"></i> ${topOrder.statusName}</td>
                                                            <td>
                                                                <span>${topOrder.created}</span>
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

                    <div class="row">
                        <div class="col-lg-3 col-sm-6">
                            <div class="card">
                                <div class="social-graph-wrapper widget-facebook">
                                    <span class="s-icon"><i class="fa fa-facebook"></i></span>
                                </div>
                                <div class="row">
                                    <div class="col-6 border-right">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">89k</h4>
                                            <p class="m-0">Friends</p>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">119k</h4>
                                            <p class="m-0">Followers</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="card">
                                <div class="social-graph-wrapper widget-linkedin">
                                    <span class="s-icon"><i class="fa fa-linkedin"></i></span>
                                </div>
                                <div class="row">
                                    <div class="col-6 border-right">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">89k</h4>
                                            <p class="m-0">Friends</p>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">119k</h4>
                                            <p class="m-0">Followers</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="card">
                                <div class="social-graph-wrapper widget-googleplus">
                                    <span class="s-icon"><i class="fa fa-google-plus"></i></span>
                                </div>
                                <div class="row">
                                    <div class="col-6 border-right">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">89k</h4>
                                            <p class="m-0">Friends</p>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">119k</h4>
                                            <p class="m-0">Followers</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="card">
                                <div class="social-graph-wrapper widget-twitter">
                                    <span class="s-icon"><i class="fa fa-twitter"></i></span>
                                </div>
                                <div class="row">
                                    <div class="col-6 border-right">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">89k</h4>
                                            <p class="m-0">Friends</p>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">119k</h4>
                                            <p class="m-0">Followers</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #/ container -->
            </div>
            </div>
        <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
    </body>
</html>
