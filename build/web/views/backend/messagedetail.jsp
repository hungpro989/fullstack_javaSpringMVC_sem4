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
                                <li class="breadcrumb-item active"><a href="javascript:void(0)">Message Detail</a></li>
                            </ol>
                        </div>
                    </div>
                    <!-- row -->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Message Detail</h4>
                                        <div class="container-fluid row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label>Name:</label>
                                                    <input type="text" class="form-control input-rounded" name="" value="${message.name}">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Phone:</label>
                                                <input type="text" class="form-control input-rounded" name="" value="${message.phone}">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Email:</label>
                                                <input type="text" class="form-control input-rounded" name="" value="${message.email}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>Message:</label>
                                                <textarea type="text" class="form-control" rows=15 value="">${message.messageDescription}</textarea>
                                            </div>
                                        </div> 
                                    </div>

                                </div><br><br>
                                <div class="card-footer text-center">
                                    <div class="form-group">
                                        <h3>Message reply:</h3>
                                        <textarea type="text" class="form-control" id="content" rows=5 placeholder="Message....."></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-lg btn-primary" id="sendEmailNow">Reply</button>
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
            <script type="text/javascript">
                $('#sendEmailNow').click(function () {
                    var url = 'send-each-email.htm';
                    var content = $("textarea#content").val();
                    var email = '${message.email}';
                    if (content === '') {
                        toastr.error('Message not empty!', 'Error');
                    }else {
                        alert('ok');
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: {'email': email, 'content': content},
                            success: function (data) {
                                if (data === 'false') {
                                    toastr.error('There was a small problem that needed to be fixed!', 'Error');
                                } else {
                                    toastr.success('Successfully. ' + data + ' emails have been sent', 'Success');
                                    console.log(url);
                                }
                            }
                        });
                    }
                });

        </script>
    </body>
</html>

</html>
