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
                            <div class="card-title"><h4 class="card-title text-center font-weight-bold">MY PROFILE <%=session.getAttribute("customer")%></h4></div><br><br><br>
                        <div class="basic-form">
                            <f:form accept-charset='UTF-8' action="#" id='customer_register' commandName="profile">
                                <input name='FormType' type='hidden' value='customer_register' />
                                <input name='utf8' type='hidden' value='true' />
                                <f:input type="hidden"  class="form-control form-control-lg" name="customerId" id="customerId" path="customerId" />
                                <f:input type="hidden"  class="form-control form-control-lg" name="email1" id="email1" path="email" />
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label col-form-label-lg">Customer Name:</label>
                                    <div class="col-sm-8">
                                        <f:input type="text" class="form-control form-control-lg" placeholder="col-form-label-lg" name="name" id="name" path="name"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label col-form-label-lg">Username:</label>
                                    <div class="col-sm-8">
                                        <f:input type="text" class="form-control form-control-lg" placeholder="col-form-label-lg" name="userName" id="userName" path="userName" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label col-form-label-lg">Email:</label>
                                    <div class="col-sm-8">
                                        <f:input type="email" class="form-control form-control-lg" placeholder="col-form-label-lg" name="email" id="email" path="email" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label col-form-label-lg">Address:</label>
                                    <div class="col-sm-8">
                                        <f:input type="text" class="form-control form-control-lg" placeholder="col-form-label-lg" name="address" id="address" path="address" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label col-form-label-lg">Phone:</label>
                                    <div class="col-sm-8">
                                        <f:input type="text" class="form-control form-control-lg" placeholder="col-form-label-lg" name="phone" id="phone" path="phone" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label col-form-label-lg">Created</label>
                                    <div class="col-sm-8">
                                        <f:input type="text" class="form-control form-control-lg" placeholder="col-form-label-lg" name="address" id="address" path="address" />
                                    </div>
                                </div>
                                <br><br>
                                <hr>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-lg btn-success">Update</button>
                                    <a href="listOrder.htm" class="btn btn-lg btn-success">List Order</a>
                                    <a data-toggle="modal" data-target="#changePasswordModal" class="btn btn-lg btn-success">Change Password</a>
                                </div>
                                <br><br>
                            </f:form>
                        </div>
                    </div>
                </div>
            </div>
        </div><div class="col-4"></div>
        <!-- Modal Change -->
        <div id="changePasswordModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h4 class="modal-title w-100 ">Change Password</h4>
                    </div>
                    <div class="text-center">
                        <span id="error"></span>
                    </div>
                    <div class="modal-body">
                        <div class="form-group" id="password_new>
                             <label for="password">Password-New:</label>
                            <input type="password" class="form-control" id="password_new" name="password_new"/>
                        </div>
                        <div class="form-group" id="re_password_new>
                             <label for="password">Confirm Password-New:</label>
                            <input type="password" class="form-control" id="re_password_new" name="re_password_new"/>
                        </div>
                        <button type="button" class="btn btn-success btn-lg change_password" id="change_password">Change Password</button>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>

        </body>
    <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
    <script language="JavaScript" type="text/javascript">
        $(document).on("click", ".change_password", function () {
            var error = document.getElementById("error")
            var url = 'change-password-customer.htm';
            var name = $("#name").val();
            var email = $("#email1").val();
            var pass_new = $("#password_new").val();
            var re_password_new = $("#re_password_new").val();
            var customerId = $("#customerId").val();
            if (re_password_new === '' || pass_new === '') {
                error.innerHTML = "<small><span style='color: red;'>"+ " Not be empty</span></small>"
            }else if(re_password_new != pass_new){
                error.innerHTML = "<small><span style='color: red;'>"+ " Password is not the same</span></small>"
            }else{
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {'pass_new': pass_new, 'customerId': customerId, 'email': email, 'name': name},
                    success: function (data) {
                        if($.trim(data)){
                          console.log(url);
                          sessionStorage.clear();
                          window.location.replace("home.htm");
                        }else{
                          error.innerHTML = "<small><span style='color: red;'>"+ " Alert error!!</span></small>"
                        }
                    }
                });
            }
        });
    </script>
</html>
