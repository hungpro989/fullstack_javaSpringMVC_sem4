<%-- 
    Document   : home
    Created on : Jul 21, 2021, 1:30:36 AM
    Author     : hungp
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
        </head>
        <body>
            <div class="wrapper">
            <jsp:include page="layout/header.jsp" flush="true"></jsp:include>
            <jsp:include page="layout/menu.jsp" flush="true"></jsp:include>
                <div class="container-fluid row">
                    <div class="col-4"></div>
                    <div class="col-4"><br>
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title"><h4 class="card-title text-center font-weight-bold">MY PROFILE</h4></div><br><br><br>
                            <div class="basic-form">
                                <f:form accept-charset='UTF-8' action="#" id='customer_register' commandName="profile">
                                    <input name='FormType' type='hidden' value='customer_register' />
                                    <input name='utf8' type='hidden' value='true' />
                                    <f:input type="hidden"  class="form-control form-control-lg" name="customerId" id="userId" path="userId" />
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label col-form-label-lg">Full Name:</label>
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
                                    </div>
                                    <br><br>
                                </f:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div><div class="col-4"></div> 
        </div>
        <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
    </body>
</html>
