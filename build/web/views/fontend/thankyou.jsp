<%-- 
    Document   : thankyou
    Created on : Jul 23, 2021, 2:36:53 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="layout/link.jsp" flush="true"></jsp:include>
        </head>
        <body>
        <jsp:include page="layout/header.jsp" flush="true"></jsp:include>
        <jsp:include page="layout/menu.jsp" flush="true"></jsp:include>
        <div class="jumbotron text-center" style="height: 500px">
            <h1 class="display-3">Thank You!</h1>
            <p class="lead"><strong>Please check your email.</strong> We have sent information orders.</p>
            <hr>
            <p class="lead">
                <a class="btn btn-primary btn-sm" href="home.htm" role="button">Continue to home</a>
            </p>
        </div>
        <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
        </body>
    <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
</html>
