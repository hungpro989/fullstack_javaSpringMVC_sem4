<%-- 
    Document   : productdetail
    Created on : Jul 25, 2021, 2:06:28 PM
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
                <div class="content-body">
                    <div class="row page-titles mx-0">
                        <div class="col p-md-0">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                                <li class="breadcrumb-item active"><a href="javascript:void(0)">Creat employee</a></li>
                            </ol>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="container-fluid row">
                                            <div class="col-3 input-group-sm">
                                                <img src="/Fontend/views/images/users/user.jpg" alt="" style="width: 300px; height: auto"><br><br>
                                                <input type="file" class="form-control input-group-sm input-rounded" name="user_image" id="">
                                            </div>
                                            <div class="col-9">
                                                <div class="container-fluid row">
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label>Name:</label>
                                                            <input type="text" class="form-control input-rounded" name="user_name" value="">
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label>Username:</label>
                                                            <input type="text" class="form-control input-rounded" name="user_username" value="">
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label>Password:</label>
                                                            <input type="text" class="form-control input-rounded" name="user_password" value="">
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label>Re-Password:</label>
                                                            <input type="text" class="form-control input-rounded" name="user_repassword" value="">
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label>Phone:</label>
                                                            <input type="text" class="form-control input-rounded" name="user_phone" value="">
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label>Email:</label>
                                                            <input type="text" class="form-control input-rounded" name="user_email" value="">
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label>Address:</label>
                                                            <input type="text" class="form-control input-rounded" name="user_address" value="">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><br>
                                        <div class="button-icon text-center">
                                            <button type="submit" class="btn btn-lg mb-1 btn-primary create_user">Create <span class="btn-icon-right"><i class="fa fa-upload"></i></span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
        <script>
                $(document).on("click", ".create_user", function () {
                    var phone_pattern = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
                    var username_pattern = /^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$/;
                    var testEmail = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
                    
                    var url = 'create-user-process.htm';
                    var image = $("input[name=user_image]").val();
                    var name = $("input[name=user_name]").val();
                    var username = $("input[name=user_username]").val();
                    var password = $('input[name=user_password]').val();
                    var repassword = $('input[name=user_repassword]').val();
                    var phone = $("input[name=user_phone]").val();
                    var email = $("input[name=user_email]").val();
                    var address = $("input[name=user_address]").val();
                    if(name===''){
                        toastr.error('Your name not empty!', 'Error');
                    }else if(username===''){
                        toastr.error('Username not empty!', 'Error');
                    }else if(!password.match(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/)){
                        toastr.error('Password not valid!', 'Error');
                    }else if(password !== repassword){
                        toastr.error('Re-Password not same!', 'Error');
                    }else if(!phone_pattern.test(phone)){
                        toastr.error('Phone not valid!', 'Error');
                    }else if(!testEmail.test(email)){
                        toastr.error('Email not empty!', 'Error');
                    }else if(address===''){
                        toastr.error('Address not empty!', 'Error');
                    }else{
                        $.ajax({
                            url: url,
                            type: "POST",
                            data: { 'name': name,
                                    'username': username,
                                    'password': password,
                                    'phone':phone ,
                                    'email':email ,
                                    'address': address
                                },
                            success: function (data) {
                                if(data==='false_username'){
                                    console.log(url);
                                    toastr.error('Username already exist!', 'Error');
                                }else if(data==='false_email'){
                                    console.log(url);
                                    toastr.error('Email already exist!', 'Error');
                                }else if(data==='false_phone'){
                                    console.log(url);
                                    toastr.error('Phone already exist!', 'Error');
                                }else if(data==='false'){
                                    console.log(url);
                                    toastr.error('Error! An error occurred. Please try again later!', 'Error');
                                }else{
                                    console.log(url);
                                    toastr.success('Create user success!', 'Success');
//                                    location.reload();
                                }    
                            }
                        });
                    }                       
                });
        </script>
    </body>
</html>
