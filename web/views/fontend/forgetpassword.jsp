<%-- 
    Document   : about
    Created on : Jul 23, 2021, 2:01:58 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="layout/link.jsp" flush="true"></jsp:include>
        </head>
        <body>
        <jsp:include page="layout/header.jsp" flush="true"></jsp:include>
        <jsp:include page="layout/menu.jsp" flush="true"></jsp:include>
            <div class="container-fluid row">
                <div class="col-4"></div>
                <div class="col-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title"><h4 class="card-title text-center font-weight-bold">Forget password</h4></div><br><br><br>
                            <div class="basic-form">
                                <div class="text-center">
                                    <span id="error"></span>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label col-form-label-lg">Email:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control form-control-lg"  name="email_check" id="email_check">
                                    </div>
                                </div>
                                <br>
                                <div class="text-center">
                                    <button class="btn btn-success bg-success forget_password">Check Email</button>
                                </div><br><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div><div class="col-4"></div>
        <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>

        </body>
    <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
    <script language="JavaScript" type="text/javascript">
        $(document).on("click", ".forget_password", function () {
            var error = document.getElementById("error")
            var url = 'forget-password-continue.htm';
            var email = $("#email_check").val();
            var testEmail = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
            if (email === '') {
                error.innerHTML = "<small><span style='color: red;'>" + "Email not empty!!</span></small>"
            }else if(!testEmail.test(email)){
                error.innerHTML = "<small><span style='color: red;'>" + "Email not valid!!</span></small>"
            }else {
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {'email': email},
                    success: function (data) {
                        if (data == 'true') {
                            console.log(url);
//                            alert(data);
//                            location.reload();
                            error.innerHTML = "<small><span style='color: green;'>" + " Please check your email to reset your password!</span></small>"
                        } else {
                            error.innerHTML = "<small><span style='color: red;'>" + " This email does not exist!</span></small>"
                        }
                    }
                });
            }
        });
    </script>
</html>
