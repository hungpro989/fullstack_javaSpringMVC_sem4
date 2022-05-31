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
                <!--**********************************
                Content body start
            ***********************************-->
                <div class="content-body">
                    <div class="row page-titles mx-0">
                        <div class="col p-md-0">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                                <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                            </ol>
                        </div>
                    </div>
                    <div class="card-body">
                        <a class="btn btn-primary text-white ${order.statusId != 1 ?"disabled":""}" data-toggle="modal" data-target="#SendOrderModal" >Send Order To Delivery</a>
                        <span class="btn ${order.statusId == 1 ? "btn-primary":"btn-success"} text-white">${order.statusName}</span>
                    </div>
                    <!-- row -->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Information Receiver</h4>
                                        <div class="basic-form">
                                            <div class="form-group">
                                                <input type="text" class="form-control input-default" placeholder="Input Default" value="${order.name}">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control input-rounded" placeholder="Phone" value="${order.phone}">
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control input-rounded" placeholder="Email" value="${order.email}">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control input-rounded" placeholder="Address" value="${order.address}">
                                        </div>
                                        <div class="form-group">
                                            <label>Description:</label>
                                            <textarea class="form-control h-150px" rows="6" id="comment">"${order.description}"</textarea>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Information Customer</h4>
                                    <div class="basic-form">
                                        <div class="form-group">
                                            <input type="text" class="form-control input-rounded" placeholder="Name" value="${cus.name}">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control input-rounded" placeholder="Phone" value="${cus.phone}">
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control input-rounded" placeholder="Email" value="${cus.email}">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control input-rounded" placeholder="Address" value="${cus.address}">
                                        </div>
                                    </div><br><br><br>
                                    <h4 class="card-title">Information Billing</h4>
                                    <div class="basic-form row">
                                        <div class="col-6 form-group">
                                            <label>Payment Method</label>
                                            <select class="form-control form-control-lg" disabled>
                                                <c:forEach items="${listPaymentType}" var="payment">
                                                    <option value="${payment.paymentTypeId}" ${payment.paymentTypeId==order.paymentTypeId? "selected":""}>${payment.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class=" col-6 form-group">
                                            <label>Delivery Method</label>
                                            <select class="form-control form-control-lg" disabled>
                                                <c:forEach items="${listDelivery}" var="delivery">
                                                    <option value="${delivery.deliveryId}" ${delivery.deliveryId==order.deliveryId? "selected":""}>${delivery.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Order Items</h4>
                                    </p>
                                    <div class="basic-form row">
                                        <div class="col-lg-9">
                                            <table class="table table-striped table-bordered zero-configuration">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 15%">No.</th>
                                                        <th>Items</th>
                                                        <th>Quantity</th>
                                                        <th>Price</th>
                                                        <th>Total Price</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listOrderDetail}" var="orderDetail">
                                                        <tr>
                                                            <td>${orderDetail.orderDetailId}</td>
                                                            <td>
                                                                <img src="/Fontend/views/images/product/${orderDetail.images}" alt="" style="width: 100px">
                                                                ${orderDetail.productName}
                                                            </td>
                                                            <td>${orderDetail.quantity}</td>
                                                            <td>${orderDetail.price}</td>
                                                            <td>${orderDetail.price*orderDetail.quantity}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-lg-3">
                                            <table class="table table-striped table-bordered zero-configuration">
                                                <tbody>
                                                    <tr>
                                                        <td>Sub Price:</td>
                                                        <td>$${order.subPrice}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>COD:</td>
                                                        <td>$${order.cod}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Discount:</td>
                                                        <td>$${order.discount}</td>
                                                    </tr>
                                                    <tr>

                                                        <td><strong>Total Price:</strong></td>
                                                        <td><strong>$${order.totalPrice}</strong></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #/ container -->
            </div>
        </div>        <!--**********************************
            Content body end
        ***********************************-->
        <div id="SendOrderModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h4 class="modal-title w-100 ">Choose Delivery</h4>
                    </div>
                    <div class="modal-body">
                        <select class="form-control form-control-lg " id="aioConceptName">
                            <c:forEach items="${listDelivery}" var="delivery">
                                <option value="${delivery.deliveryId}">${delivery.name}</option>
                            </c:forEach>
                        </select>
                        <div class="modal-footer">
                            <a class="btn btn-primary btn-lg text-white sendorder_modal">Send To Delivery</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
            <script>
                $(document).on("click", ".sendorder_modal", function () {
                    var url = 'sendOrder.htm';
                    var deliveryId = $('#aioConceptName').find(":selected").val();
                    var orderId = ${order.orderId};
                    alert(deliveryId);
                    $.ajax({
                        url: url,
                        type: "POST",
                        data: {'deliveryId': deliveryId, 'orderId': orderId},
                        success: function (data) {
                            console.log(url);
                            location.reload();
                        }
                    });
                });
        </script>
    </body>
</html>
