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

                    <div class="row page-titles mx-0">
                        <div class="col p-md-0">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                                <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                            </ol>
                        </div>
                    </div>
                    <!-- row -->

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Data Table</h4>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered zero-configuration">
                                                <thead class="bg-primary text-white">
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Name</th>
                                                        <th>Username</th>
                                                        <th>Email</th>
                                                        <th>Phone</th>
                                                        <th>Address</th>
                                                        <th>Created</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listCustomer}" var="customer">
                                                    <tr>
                                                        <td>${customer.customerId}
                                                        </td>
                                                        <td>${customer.name}</td>
                                                        <td>${customer.userName}</td>
                                                        <td>${customer.email}</td>
                                                        <td>${customer.phone}</td>
                                                        <td>${customer.address}</td>
                                                        <td>${customer.created}</td>
                                                        <td>
                                                            <span><a href="customer-detail.htm?Id=${customer.customerId}"><i class="fa fa-eye ${customer.status == true?"text-success":"text-danger"} " ></i></a></span>
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
                    <!-- #/ container -->
                </div>
                <!--**********************************
                    Content body end
                ***********************************-->
            <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
            </div>
        <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
        <script src="/Backend/views/assets/plugins/tables/js/jquery.dataTables.min.js"></script>
        <script src="/Backend/views/assets/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
        <script src="/Backend/views/assets/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
    </body>
</html>
