<%-- 
    Document   : home
    Created on : Jul 21, 2021, 4:18:47 PM
    Author     : hungp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="layout/link.jsp" flush="true"></jsp:include>
        </head>
        <body>
        <jsp:include page="layout/header.jsp" flush="true"></jsp:include>
        <jsp:include page="layout/menu.jsp" flush="true"></jsp:include>
        <div class="message">${message}</div>
        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="hero__slider owl-carousel">
                <c:forEach items="${listBanner}" var="banner">
                <div class="hero__items set-bg" data-setbg="/Fontend/views/images/hero/${banner.image}">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-5 col-lg-7 col-md-8">
                                <div class="hero__text">
                                    <h6>${banner.title}</h6>
                                    <h2>${banner.titleMain}</h2>
                                    <p>${banner.content}</p>
                                    <a href="${banner.path}" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                    <div class="hero__social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-pinterest"></i></a>
                                        <a href="#"><i class="fa fa-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Banner Section Begin -->
        <section class="" style="padding-top: 80px; padding-bottom: 80px">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 offset-lg-4">
                        <div class="banner__item">
                            <div class="banner__item__pic">
                                <img src="/Fontend/views/fontend/assets/img/product/GUEST_ecf4c239-f0fb-4133-a15c-475715f32e7c.jpg" alt="" style="width: 470px; height: 470px">
                            </div>
                            <div class="banner__item__text">
                                <h2>Kitchen</h2>
                                <a href="searchproductbycategory.htm?Id=2">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="banner__item banner__item--middle">
                            <div class="banner__item__pic">
                                <img src="/Fontend/views/fontend/assets/img/product/2015-K153A.jpg" alt="">
                            </div>
                            <div class="banner__item__text">
                                <h2>Bedroom</h2>
                                <a href="searchproductbycategory.htm?Id=3">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="banner__item banner__item--last">
                            <div class="banner__item__pic">
                                <img src="/Fontend/views/fontend/assets/img/product/GUEST_e11a51d2-91cd-45f0-b8f3-b5a6a119f267.jpg" alt="" style="width: 470px; height: 470px">
                            </div>
                            <div class="banner__item__text">
                                <h2>Living Room 2021</h2>
                                <a href="searchproductbycategory.htm?Id=1">Shop now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section
        <!-- Banner Section End -->

        <!-- Product Section Begin -->
        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="filter__controls">
                            <li class="active" data-filter="*">Best Sellers</li>
                            <li data-filter=".new-arrivals">New Arrivals</li>
                            <li data-filter=".hot-sales">Hot Sales</li>
                        </ul>
                    </div>
                </div>
                <div class="row product__filter">
                    <c:forEach items="${listProductHot}" var="new">
                        <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                            <div class="product__item">
                                <a href="shopdetail.htm?Id=${new.productId}">
                                    <div class="product__item__pic set-bg" data-setbg="/Fontend/views/fontend/assets/img/product/${new.images}">
                                        <img src="/Fontend/views/fontend/assets/img/product/${new.images}" alt="">
                                        <c:choose>
                                            <c:when test="${new.discount== 0}">
                                                <span class="label">New</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="label" style="background: #f06616">New & Sale</span>
                                            </c:otherwise>
                                        </c:choose>
                                        <ul class="product__hover">
                                            <li><a href="shopdetail.htm?Id=${new.productId}"><img src="/Fontend/views/fontend/assets/img/icon/search.png" alt=""></a></li>
                                        </ul>
                                    </div>
                                </a>
                                <div class="product__item__text">
                                    <h6>${new.name}</h6>
                                    <a href="shopdetail.htm?Id=${new.productId}" class="add-cart">Buy Now</a>

                                    <c:choose>
                                        <c:when test="${new.discount== 0}">
                                            <h5>${new.priceOutput}$</h5>
                                        </c:when>
                                        <c:otherwise>
                                            <h5>${new.discount}$</h5>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="product__color__select">
                                        <span><small><i class="fa fa-eye" aria-hidden="true">${new.view}</i></small></span>
                                        <span><small><i class="fa fa-shopping-cart" aria-hidden="true">${new.buyItem}</i></small></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Product Section End -->

        <!-- Categories Section Begin -->
        <c:choose>
            <c:when test="${productDiscount.name != null}">
                <section class="categories spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="categories__text">
                                    <h2>Kitchen Dinner <br /> <span>Chair Collection</span> <br /> Table Design</h2>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="categories__hot__deal">
                                    <img src="/Fontend/views/images/product/${productDiscount.images}" alt="" style="width: 350px; height: 305px">
                                    <div class="hot__deal__sticker">
                                        <span>Sale Of</span>
                                        <h5>$${productDiscount.discount}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 offset-lg-1">
                                <div class="categories__deal__countdown">
                                    <span>Deal Of The Week</span>
                                    <h2>${productDiscount.name}</h2>
                                    <div class="categories__deal__countdown__timer" id="countdown">
                                        <div class="cd-item">
                                            <span>3</span>
                                            <p>Days</p>
                                        </div>
                                        <div class="cd-item">
                                            <span>1</span>
                                            <p>Hours</p>
                                        </div>
                                        <div class="cd-item">
                                            <span>50</span>
                                            <p>Minutes</p>
                                        </div>
                                        <div class="cd-item">
                                            <span>18</span>
                                            <p>Seconds</p>
                                        </div>
                                    </div>
                                    <a href="shopdetail.htm?Id=${productDiscount.productId}" class="primary-btn">Shop now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </c:when>
        </c:choose>
        <!-- Categories Section End -->

        <!-- Instagram Section Begin -->
        <section class="instagram spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="instagram__pic">
                            <div class="instagram__pic__item set-bg" data-setbg="/Fontend/views/fontend/assets/img/instagram/instagram-1.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="/Fontend/views/fontend/assets/img/instagram/instagram-2.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="/Fontend/views/fontend/assets/img/instagram/instagram-3.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="/Fontend/views/fontend/assets/img/instagram/instagram-4.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="/Fontend/views/fontend/assets/img/instagram/instagram-5.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="/Fontend/views/fontend/assets/img/instagram/instagram-6.jpg"></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="instagram__text">
                            <h2>Instagram</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                                labore et dolore magna aliqua.</p>
                            <h3>#Furniture_Store</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Instagram Section End -->

        <!-- Latest Blog Section Begin -->
        <section class="latest spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <span>Latest News</span>
                            <h2>Furniture New Trends</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${listBlogs}" var="blog">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <a href="blogdetail.htm?Id=${blog.blogId}"><div class="blog__item__pic set-bg" data-setbg="/Fontend/views/images/blog/${blog.images}"></div></a>
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
        <!-- Latest Blog Section End -->
        <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
        </body>
    <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
</html>
