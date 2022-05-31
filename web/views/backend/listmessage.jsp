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
                                <li class="breadcrumb-item active"><a href="javascript:void(0)">Message</a></li>
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
                                                        <th>Message</th>
                                                        <th>Create</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listMessage}" var="message">
                                                    <tr class="${message.status=='true'?"font-weight-bold":""}">
                                                        <td>
                                                            ${message.messageId}.
                                                            <span><i class="fa ${message.status=='true'?"fa-envelope-o font-weight-bold":"fa-envelope-open-o"}" aria-hidden="true"></i></span>
                                                        </td>
                                                        <td>
                                                            <p>${message.name}</p>
                                                            <p>${message.phone}</p>
                                                            <p>${message.email}</p>
                                                        </td>
                                                        
                                                        <c:set var="shortDesc" value="${fn:substring(message.messageDescription, 0, 200)}" />
                                                        <td><p >${shortDesc}</p></td>
                                                        <td>
                                                            ${message.created}
                                                        </td>
                                                        <td>    
                                                            <table>
                                                                <tbody>
                                                                <td><span><a href="message-detail.htm?Id=${message.messageId}"><i class="fa fa-eye" style="color:green"></i></a></span></td>
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
    </body>
</html>

</html>
