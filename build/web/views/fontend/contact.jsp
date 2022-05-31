<%-- 
    Document   : contact
    Created on : Jul 23, 2021, 2:05:28 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <%--<jsp:include page="main/contact.jsp" flush="true"></jsp:include>--%>
        <!-- Contact Section Begin -->
        <section class="contact spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="contact__text">
                            <div class="section-title">
                                <span>Information</span>
                                <h2>Contact Us</h2>
                                <p>As you might expect of a company that began as a high-end interiors contractor, we pay
                                    strict attention.</p>
                            </div>
                            <ul>
                                <li>
                                    <h4>Vietnam</h4>
                                    <p>236B Hoang Quoc Viet<br />+84 886-860-224</p>
                                </li>
                                <li>
                                    <h4>Xuan Dinh</h4>
                                    <p>31/486 Xuan Dinh, Bac Tu Liem, Ha Noi <br />+84 1900-8686</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="contact__form">
                            <f:form accept-charset='UTF-8' action="send-message.htm" id='customer_message' modelAttribute="m">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <f:input type="text" path="name" name="name" placeholder="Name"/>
                                    </div>
                                    <div class="col-lg-6">
                                        <f:input type="text" path="phone" name="phone" placeholder="Phone"/>
                                    </div>
                                    <div class="col-lg-6">
                                        <f:input type="text" path="email" name="email" placeholder="Email"/>
                                    </div>
                                    <div class="col-lg-12">
                                        <f:textarea path="messageDescription" name="messageDescription" placeholder="Message"/>
                                        <button type="submit" class="site-btn">Send Message</button>
                                    </div>
                                </div>
                            </f:form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Contact Section End -->
        <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
        </body>
    <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
</html>
