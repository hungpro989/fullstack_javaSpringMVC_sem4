<%-- 
    Document   : menu
    Created on : Jul 21, 2021, 4:29:30 PM
    Author     : hungp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header Section Begin  - Header 2-->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7">
                    <div class="header__top__left">
                        <p>Free shipping, 30-day return or refund guarantee.</p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-5">
                    <div class="header__top__right">
                        <div class="header__top__links" id="loadCus">
                            <% if (session.getAttribute("customer") != null) {%>
                            <span class="text-white"><a href="profile.htm">Hi <%=session.getAttribute("customer")%></a></span>
                            <span class="text-white"><a href="logout.htm"><i class="fa fa-sign-out" aria-hidden="true"></i></a></span>
                                    <% } else {%>
                            <a data-toggle="modal" data-target="#searchOrderModal" style="cursor: pointer"><i class="fa fa-search"></i> Search Order</a>&nbsp;&nbsp;
                            <a data-toggle="modal" data-target="#logInModal" style="cursor: pointer">Login</a>
                            <a data-toggle="modal" data-target="#registernModal" style="cursor: pointer">Register</a>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <a href="home.htm"><img src="/Fontend/views/images/logo/logo12.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li class=""><a href="home.htm">Home</a></li>
                        <li><a href="about.htm">About Us</a></li>
                        <li><a href="shop.htm">Shop</a></li>
                        <li><a href="blog.htm">Blog</a></li>
                        <li><a href="contact.htm">Contacts</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="header__nav__option">
                    <a href="#" class="search-switch"><img src="/Fontend/views/fontend/assets/img/icon/search.png" alt=""></a>
                    <a href="mycart.htm"><img src="/Fontend/views/fontend/assets/img/icon/cart.png" alt="">
                        <% if (session.getAttribute("listCart") != null) { %>
                        <span style="color: red">${count_quantity}</span>
                        <% } else { %>
                        <span>0</span>
                        <% }%>
                    </a>
                    <% if (session.getAttribute("listCart") != null) { %>
                    <div class="price" style="color: red">$ ${total}</div>
                    <% } else { %>
                    <div class="price">$0.00</div>
                    <% }%>
                </div>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>


</header>
<!-- Header Section End  - Header 2-->
<!-- Modal login -->
<div id="logInModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 ">Login to Furniture Store</h4>
            </div>
            <div class="modal-body">
                <div class="text-center"><span id="error"></span></div>
                <div class="form-group">
                    <label for="username">Username: </label><span id="error_username"></span>
                    <input type="text" class="form-control" id="username_login" name="username_login">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label><span id="error_password"></span>
                    <input type="password" class="form-control" id="password_login" name="password_login">
                </div>
                <a href="forget-password-customer.htm">I don't remember the password</a><br><br>
                <button type="button" class="btn btn-success btn-lg login_customer">Login</button>
            </div>
        </div>
    </div>
</div>
<!--End Modal -->

<!-- Modal regíter-->
<div id="registernModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-center">Register</h4>
            </div>
            
            <div class="modal-body">
                    <div class="form-group text-center"><span id="error_create"></span></div>
                    <div class="form-group">
                        <label for="fullname">Full Name: <span class="required">*</span></label><span id="error_name_cre"></span>
                        <input type="text" class="form-control" id="name_create" name="name_create"  path="name" />
                    </div>
                    <div class="form-group">
                        <label for="username">Username: <span class="required">*</span></label><span id="error_username_cre"></span>
                        <input type="text" class="form-control" id="username_create" name="username_create" path="userName"/> 
                    </div>
                    <div class="form-group">
                        <label for="password">Password: <span class="required">*</span></label><span id="error_password_cre"></span>
                        <input type="password" class="form-control" id="password_create" name="password_create" path="password" />
                    </div>
                    <div class="form-group">
                        <label for="password">Re-Password: <span class="required">*</span></label><span id="error_repassword_cre"></span>
                        <input type="password" class="form-control" id="repassword_create" name="repassword_create" path="password" />
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone <span class="required">*</span></label><span id="error_phone_cre"></span>
                        <input type="text" class="form-control" id="phone_create" name="phone_create" path="phone"/>
                    </div>
                    <div class="form-group">
                        <label for="address">Address <span class="required">*</span></label><span id="error_address_cre"></span>
                        <input type="text" class="form-control" id="address_create" name="address_create" path="address" />
                    </div>
                    <div class="form-group">
                        <label for="email">Email <span class="required">*</span></label><span id="error_email_cre"></span>
                        <input type="text" class="form-control" id="email_create" name="email_create" path="email"/>
                    </div>
                    <button type="submit" class="btn btn-success btn-lg register_customer">Create</button>
            </div>
        </div>
    </div>
</div>
<!--End Modal -->

<!-- Modal search-->
<div id="searchOrderModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-body">
                <f:form accept-charset='UTF-8' action="searchorderbyphone.htm" id='search_order' modelAttribute="o">
                    <div class="form-group">
                        <label for="fullname">Search Order By Phone <span class="required"></span></label>
                        <input type="text" name="phone" class="form-control" id="search_order_by_phone" path="phone"/>
                    </div>
                    <button type="submit" class="btn btn-success btn-lg click-search-order">Search</button>
                </f:form>
            </div>
        </div>
    </div>
</div>
<!--End Modal -->

