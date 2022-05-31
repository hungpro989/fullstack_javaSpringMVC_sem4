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
                                                        <th>Images Title</th>
                                                        <th>Title</th>
                                                        <th>Content</th>
                                                        <!--<th>Display Number</th>-->
                                                        <th>Poster</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listPost}" var="post">
                                                    <tr>
                                                        <td>${post.blogId}.
                                                            <p>${post.created}</p>
                                                        </td>
                                                        <td><img style="width:100px" src="/Fontend/views/images/blog/${post.images}"></td>
                                                        <td>
                                                            <p><strong>${post.title}...</strong></p>
                                                            
                                                        </td>
                                                        <c:set var="shortDesc" value="${fn:substring(post.content, 0, 50)}" />
                                                        <td><p>${shortDesc}</p></td>
                                                        <!--<td>${post.displayNumber}</td>-->
                                                        <td>${post.userName}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${post.status != true}">
                                                                    <span style="color:red">Hidden</span>
                                                                </c:when>
                                                                <c:otherwise> 
                                                                    <span style="color:green">Show</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>    
                                                            <table>
                                                                <tbody>
                                                                <td><span class="delete_post" data-postid="${post.blogId}" onclick="return confirm('Do you want to delete?')" style="cursor:pointer"><i class="fa fa-trash " style="color:red"></i></span></td>
                                                                <td><span><a href="google.com"><i class="fa fa-eye" style="color:green"></i></a></span></td>
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
            <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
            </div>
        <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
        <script src="/Backend/views/assets/plugins/tables/js/jquery.dataTables.min.js"></script>
        <script src="/Backend/views/assets/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
        <script src="/Backend/views/assets/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
        <script>
                $(document).on("click", ".delete_post", function () {
                    var url = 'delete-post.htm';
                    var postid = $(this).data('postid');
                        $.ajax({
                            url: url,
                            type: "POST",
                            data: { 'postid': postid},
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
