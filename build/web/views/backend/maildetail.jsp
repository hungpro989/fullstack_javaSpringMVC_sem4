<%-- 
    Document   : listmessage
    Created on : Aug 29, 2021, 1:37:25 PM
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
                <!--**********************************
                Content body start
            ***********************************-->
                <div class="content-body">

                    <div class="row page-titles mx-0">
                        <div class="col p-md-0">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                                <li class="breadcrumb-item active"><a href="javascript:void(0)">Mail Detail</a></li>
                            </ol>
                        </div>
                    </div>
                    <!-- row -->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Mail Detail</h4>
                                        <div class="container-fluid row">
                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label>Title:</label>
                                                    <input type="text" class="form-control input-rounded" name="" value="${mail.title}">
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="form-group">
                                                    <label>Count Mail:</label>
                                                    <input type="text" class="form-control input-rounded" name="" value="${mail.countMail}">
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="form-group">
                                                    <label>Count Mail Success:</label>
                                                    <input type="text" class="form-control input-rounded" name="" value="${mail.countMailSuccess}">
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label>Customer:</label>
                                                    <textarea type="text" class="form-control input-rounded" name="">${mail.customer}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label>Content:</label>
                                                    <textarea type="text" class="form-control" rows="10" name="">${mail.content}</textarea>
                                                </div>
                                            </div> 
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
    </body>
</html>

</html>
