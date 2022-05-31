<%-- 
    Document   : login
    Created on : Aug 18, 2021, 5:37:18 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/Backend/views/assets/images/favicon.png">
    <link href="/Backend/views/assets/css/style.css" rel="stylesheet">
    <link href="/Fontend/views/backend/assets/plugins/toastr/css/toastr.min.css" rel="stylesheet">
</head>

<body class="h-100">
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->
    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center" href="index.html"> <h4>Furniture Store</h4></a>
                                    <div class="form-group">
                                        <span id="error"></span>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="username_login" >
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="password_login" >
                                    </div>
                                    <button type="submit" class="btn login-form__btn submit w-100 login_user">Sign In</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--**********************************
        Scripts
    ***********************************-->
    <script src="/Backend/views/assets/plugins/common/common.min.js"></script>
    <script src="/Backend/views/assets/js/custom.min.js"></script>
    <script src="/Backend/views/assets/js/settings.js"></script>
    <script src="/Backend/views/assets/js/gleek.js"></script>
    <script src="/Backend/views/assets/js/styleSwitcher.js"></script>
    <script src="/Fontend/views/backend/assets/plugins/toastr/js/toastr.min.js"></script>
    <script src="/Fontend/views/backend/assets/plugins/toastr/js/toastr.init.js"></script>
    <script>
        $(document).on("click", ".login_user", function () {
            var error = document.getElementById("error");
            var url = 'processlogin.htm';
            var username_login = $("#username_login").val();
            var password_login = $("#password_login").val();
            
            if (username_login === '') {
                error.innerHTML = "<small><span style='color: red;'>" + "Username not empty!!</span></small>";
            }else if(password_login === ''){
                error.innerHTML = "<small><span style='color: red;'>" + "Password not empty!!</span></small>";
            }else {
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {'username_login': username_login, 'password_login': password_login},
                    success: function (data) {
                        if (data === 'true') {
                            console.log(url);
                            window.location.replace("home.htm");
                            toastr.success('Login successfully.', 'Success');
                        } else {
                            console.log(url);
                            toastr.error('Username or password not valid!', 'Error');
                            error.innerHTML = "<small><span style='color: red;'>" + " Username or password not valid!</span></small>";
                        }
                    }
                });
            }
        });
    </script>
</body>
</html>






