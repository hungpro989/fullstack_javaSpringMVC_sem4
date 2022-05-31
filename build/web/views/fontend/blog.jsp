<%-- 
    Document   : blog
    Created on : Jul 23, 2021, 2:03:19 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <%--<jsp:include page="main/blog.jsp" flush="true"></jsp:include>--%>
        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-blog set-bg" data-setbg="/Fontend/views/images/breadcrumb-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Our Blog</h2>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Blog Section Begin -->
        <section class="blog spad">
            <div class="container">
                <div class="row">
                    <c:forEach items="${listBlog}" var="blog">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="/Fontend/views/images/blog/${blog.images}"></div>
                            <div class="blog__item__text">
                                <span><img src="/Fontend/views/fontend/assets/img/icon/calendar.png" alt=""> ${blog.created}</span>
                                <h5>${blog.title}</h5>
                                <a href="blogdetail.htm?Id=${blog.blogId}">Read More</a>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Blog Section End -->
        <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
        </body>
    <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
</html>
