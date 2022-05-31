<%-- 
    Document   : header
    Created on : Jul 21, 2021, 1:49:47 AM
    Author     : hungp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="nav-header">
    <div class="brand-logo">
        <a href="home.htm">
            <b class="logo-abbr"><img src="/Fontend/views/backend/assets/images/logo.png" alt=""> </b>
            <span class="logo-compact"><img src="/Fontend/views/backend/assets/images/logo-compact.png" alt=""></span>
            <span class="brand-title">
                <img src="/Fontend/views/backend/assets/images/logo-text.png" alt="">
            </span>
        </a>
    </div>
</div>

<div class="header">    
    <div class="header-content clearfix">
        <div class="nav-control">
            <div class="hamburger">
                <span class="toggle-icon"><i class="icon-menu"></i></span>
            </div>
        </div>
        <div class="header-left">
            <div class="input-group icons">

<!--                <input type="search" class="form-control" placeholder="Search order..." aria-label="Search Dashboard">
                <div class="drop-down animated flipInX d-md-none">
                    <form action="#">
                        <input type="text" class="form-control" placeholder="Search">
                    </form>
                </div>-->
            </div>
        </div>

        <div class="header-right">
            <ul class="clearfix">
                <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                        Hi <%=session.getAttribute("username")%>
                    </a>
                </li>
                <li class="icons dropdown">
                    <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                        <span class="active"></span>
                        <img src="/Fontend/views/images/users/<%=session.getAttribute("image")%>" height="40" width="40" alt="">
                    </div>
                    <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                        <div class="dropdown-content-body">
                            <ul>
                                <li>
                                    <a href="profile.htm"><i class="icon-user"></i> <span>Profile</span></a>
                                </li>
                                <hr class="my-2">
                                <li><a href="logout-admin.htm"><i class="icon-key"></i> <span>Logout</span></a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
