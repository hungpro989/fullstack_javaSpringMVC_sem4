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
                                        <div>
                                            <button type="button" class="btn mb-1 btn-rounded btn-primary" data-toggle="modal" data-target=".modal-add-product">Add Provider</button>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered zero-configuration">
                                                <thead class="bg-primary" style="color: white">
                                                    <tr>
                                                        <th style="width:  10%">NO.</th>
                                                        <th style="width: 20%">Name</th>
                                                        <th style="width: 15%">Phone</th>
                                                        <th style="width: 20%">Address</th>
                                                        <th style="width: 15%">Email</th>
                                                        <th style="width: 10%">Status</th>
                                                        <th style="width: 10%">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listProvider}" var="provider">
                                                    <tr>
                                                        <td>${provider.providerId}</td>
                                                        <td>${provider.providerName}</td>
                                                        <td>${provider.phone}</td>
                                                        <td>${provider.address}</td>
                                                        <td>${provider.email}</td>
                                                        <td style="color: green">
                                                            <c:choose>
                                                                <c:when test="${provider.status != true}">
                                                                    <span style="color:red">Hidden</span>
                                                                </c:when>
                                                                <c:otherwise> 
                                                                    <span style="color:green">Show</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <div class="text-center">
                                                                <span class="delete_provider" data-providerid="${provider.providerId}" onclick="return confirm('Do you want to delete?')" style="cursor:pointer"><i class="fa fa-trash " style="color:red"></i></span>
                                                                <span><a href="provider-detail.htm?Id=${provider.providerId}"><i class="fa fa-eye" style="color:green"></i></a></span>
                                                            </div>
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
            <div class="modal fade modal-add-product" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-default">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add Provider</h5>
                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Name</label>
                                <input type="text" class="form-control" id="recipient-name">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Phone</label>
                                <input type="text" class="form-control" id="recipient-name">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Address</label>
                                <input type="text" class="form-control" id="recipient-name">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Email</label>
                                <input type="email" class="form-control" id="recipient-name">
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
                                <label class="form-check-label" for="flexRadioDefault1">Show</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
                                <label class="form-check-label" for="flexRadioDefault2">Hidden</label>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">Create</button>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
            </div>
        <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
        <script src="/Backend/views/assets/plugins/tables/js/jquery.dataTables.min.js"></script>
        <script src="/Backend/views/assets/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
        <script src="/Backend/views/assets/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
        <script>
                $(document).on("click", ".delete_provider", function () {
                    var url = 'delete-provider.htm';
                    var providerid = $(this).data('providerid');
                        $.ajax({
                            url: url,
                            type: "POST",
                            data: { 'providerid': providerid},
                            success: function (data) {
                                if(data ==='true'){
                                    toastr.success('Delete success!', 'Success');
                                    console.log(url);
                                    location.reload();
                                }else{
                                    console.log(url);
                                    toastr.error('Delete error!', 'Error');
                                }    
                            }
                        });                      
                });
        </script>
    </body>
</html>
