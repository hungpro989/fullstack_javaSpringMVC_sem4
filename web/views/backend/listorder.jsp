<%-- 
    Document   : listproduct
    Created on : Jul 25, 2021, 2:03:00 PM
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
            <link href="/Backend/views/assets/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
        </head>
        <body>
            <div class="wrapper">
            <jsp:include page="layout/header.jsp" flush="true"></jsp:include>
            <jsp:include page="layout/menu.jsp" flush="true"></jsp:include>
                <!--**********************************
                Content body start
            ***********************************-->
                <div class="content-body">
                    <!-- row -->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">List Order</h4>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered zero-configuration">
                                                <thead class="bg-primary" style="color: white">
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Receiver</th>
                                                        
                                                        <th>Total Payment</th>
                                                        <th>Customer</th>
                                                        <th style="width: 15%">Description</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listOrder}" var="order">
                                                    <tr>
                                                        <td>
                                                            <span>${order.orderId}</span><br><br>
                                                            <span class="label ${order.statusId == 1 ? "label-primary":"label-success"} ">${order.statusName}</span><br><br>
                                                        </td>
                                                        <td>
                                                            <div class="text-center">
                                                                <div class="text-bold"><h5>${order.name}</h5></div>
                                                                <span class=""><small class="text-muted">${order.phone}<br> ${order.email}</small></span><br>
                                                                <span class=""><small class="text-muted">${order.address}</small></span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="card-header">
                                                                <div >
                                                                    <span  style="font-size: 12px">Total Price: </span>
                                                                    <span class="font-weight-bold float-right badge badge-success">$${order.totalPrice}</span>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <span style="font-size: 12px">Fee COD:</span>
                                                                <span class="font-weight-bold float-right">$${order.cod}</span><br>
                                                            </div>
                                                            <div>
                                                                <span style="font-size: 12px">Discount:</span>
                                                                <span class="font-weight-bold float-right">$${order.discount}</span>
                                                            </div>
                                                            <div>
                                                                <span style="font-size: 12px">Sub Price</span>
                                                                <span class="font-weight-bold float-right">$${order.subPrice}</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="text-center">
                                                                <button type="button" class="btn btn-info btn-xs" data-toggle="popover" data-placement="top" title="" data-content="0886860224, 31/486 Xuân Đỉnh, Bắc Từ Liêm, Hà Nội" data-original-title="Nguyễn Thái Hưng" aria-describedby="popover445473">${order.customerName}</button><br><br>
                                                                <div>WEBSITE</div>
                                                                <div>${order.payName}</div>
                                                                <div class="badge badge-danger">${order.deliveryName}</div>
                                                            </div>
                                                        </td>
                                                        <td>${order.description}</td>
                                                        <td>
                                                            <div class="text-center">
                                                                <span><a href="orderdetail.htm?Id=${order.orderId}"><i class="fa fa-eye" style="color:green"></i></a></span><br><br>
                                                                <a type="button" class="btn mb-1 btn-success text-white ${order.statusId != 1 ?"disabled":""}" data-toggle="modal" data-orderid="${order.orderId}" data-target="#SendOrderModal${order.orderId}">SEND</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                <div id="SendOrderModal${order.orderId}" class="modal fade" role="dialog">
                                                    <div class="modal-dialog">
                                                        <!-- Modal content-->
                                                        <div class="modal-content">
                                                            <div class="modal-header text-center">
                                                                <h4 class="modal-title w-100 ">Choose Delivery</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <select class="form-control form-control-lg " id="aioConceptName${order.orderId}">
                                                                    <c:forEach items="${listDelivery}" var="delivery">
                                                                        <option value="${delivery.deliveryId}">${delivery.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                                <div class="modal-footer">
                                                                    <a class="btn btn-primary btn-lg text-white sendorder_modal" data-orderid="${order.orderId}">Send To Delivery</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #/ container -->
            </div>

            <!--**********************************
                Content body end
            ***********************************-->
            <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
            </div>
        <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
<!--        <script src="/Backend/views/assets/plugins/tables/js/jquery.dataTables.min.js"></script>
        <script src="/Backend/views/assets/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
        <script src="/Backend/views/assets/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>-->
        <script>
            $(document).on("click", ".sendorder_modal", function () {
                var url = 'sendOrder.htm';
                var orderId = $(this).data('orderid');
                var deliveryId = $('#aioConceptName' + $(this).data('orderid')).find(":selected").val();
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
