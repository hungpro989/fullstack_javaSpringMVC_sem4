<%-- 
    Document   : listproduct
    Created on : Jul 25, 2021, 2:03:00 PM
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
                                            <a href="create-product.htm" class="btn mb-1 btn-rounded btn-primary">Add Product</a>
                                            <a href="list-category-product.htm" class="btn mb-1 btn-rounded btn-primary">Category</a>
                                        </div>
                                        <div class="table-responsive">
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
                                                <c:forEach items="${listAllProduct}" var="product">
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
                                                                        <td><span class="delete_product" data-productid="${product.productId}" onclick="return confirm('Do you want to delete?')" style="cursor:pointer"><i class="fa fa-trash " style="color:red"></i></span></td>
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
                <!-- #/ container -->
            </div>
            <!--**********************************
                Content body end
            ***********************************-->
            <div class="modal fade modal-add-product" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add Product</h5>
                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid row">
                                <div class="col-lg-6 col-sm-12">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Name</label>
                                        <input type="text" class="form-control" id="recipient-name">
                                    </div>
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Category:</label>
                                        <input type="text" class="form-control" id="recipient-name">
                                    </div>
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Provider:</label>
                                        <input type="text" class="form-control" id="recipient-name">
                                    </div>
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Content:</label>
                                        <input type="text" class="form-control" id="recipient-name">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-12">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Image:</label>
                                        <input type="file" name="images[]" multiple="" class="form-control" accept="images/*">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">Create</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade modal-add-product-detail" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add Product Detail</h5>
                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid row">
                                <div class="col-6 col-sm-12">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Name</label>
                                        <input type="text" class="form-control" id="recipient-name">
                                    </div>
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Category:</label>
                                        <input type="text" class="form-control" id="recipient-name">
                                    </div>
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Provider:</label>
                                        <input type="text" class="form-control" id="recipient-name">
                                    </div>
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Content:</label>
                                        <input type="text" class="form-control" id="recipient-name">
                                    </div>
                                </div>
                                <div class="col-6 col-sm-12">
                                    <div class="form-group">
                                        <input type="file" name="images[]" multiple="" class="form-control" accept="images/*">
                                    </div>
                                </div>
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
                $(document).on("click", ".delete_product", function () {
                    var url = 'delete-product.htm';
                    var productid = $(this).data('productid');
                        $.ajax({
                            url: url,
                            type: "POST",
                            data: { 'productid': productid},
                            success: function (data) {
                                if(data ==='true'){
                                    toastr.success('Delete Success!', 'Success');
                                    console.log(url);
                                    location.reload();
                                }else{
                                    console.log(url);
                                    toastr.error('Delete Error!', 'Error');
                                }    
                            }
                        });                      
                });
        </script>
    </body>
</html>
