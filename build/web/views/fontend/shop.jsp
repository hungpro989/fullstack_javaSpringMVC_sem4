<%-- 
    Document   : home
    Created on : Jul 21, 2021, 4:18:47 PM
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
        <jsp:include page="layout/header.jsp" flush="true"></jsp:include>
        <jsp:include page="layout/menu.jsp" flush="true"></jsp:include>
        <%--<jsp:include page="main/shop.jsp" flush="true"></jsp:include>--%>
        <!-- Shop Section Begin -->
        <section class="shop spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="shop__sidebar">
                            <div class="shop__sidebar__search">
                                <form action="#">
                                    <input type="text" placeholder="Search...">
                                    <button type="submit"><span class="icon_search"></span></button>
                                </form>
                            </div>
                            <div class="shop__sidebar__accordion">
                                <div class="accordion" id="accordionExample">
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                        </div>
                                        <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="shop__sidebar__categories">
                                                    <ul class="nice-scroll">
                                                        <c:forEach items="${listCategory}" var="category">
                                                            <li><a href="searchproductbycategory.htm?Id=${category.categoryId}">${category.name}</a></li>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseTwo">Branding</a>
                                        </div>
                                        <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="shop__sidebar__brand">
                                                    <ul>
                                                        <c:forEach items="${listProvider}" var="provider">
                                                            <li><a href="search-product-by-provider.htm?Id=${provider.providerId}">${provider.providerName}</a></li>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="shop__product__option">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="shop__product__option__left">
                                        <p>Total ${productTotal} items</p>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="shop__product__option__right">
                                        <p>Sort by Price:</p>
                                        <select onchange="location = this.value;">
                                            <option value="product-most-view.htm">Most View</option>
                                            <option value="product-best-seller.htm">Best Seller</option>
                                            <option value="product-price-low-to-high.htm">Low To High</option>
                                            <option value="product-price-high-to-low.htm">Hight To Low</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <c:forEach items="${listProduct}" var="product">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <a href="shopdetail.htm?Id=${product.productId}">
                                            <div class="product__item__pic set-bg" data-setbg="">
                                                <img src="/Fontend/views/images/product/${product.images}" alt="">
                                                <c:choose>
                                                    <c:when test="${product.discount != 0}">
                                                        <span class="label" style="background: #f06616">New & Sale</span>
                                                    </c:when>
                                                </c:choose>
                                                <ul class="product__hover">
                                                    <li><a href="shopdetail.htm?Id=${product.productId}"><img src="/Fontend/views/images/icon/search.png" alt=""></a></li>
                                                </ul>
                                            </div>
                                        </a>
                                        <div class="product__item__text text-center">
                                            <h6>${product.name}</h6>
                                            <c:choose>
                                                <c:when test="${product.discount== 0}">
                                                    <h5>$${product.priceOutput}</h5>
                                                </c:when>
                                                <c:otherwise>
                                                    <h5>$${product.discount}</h5>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="product__color__select">
                                                <span><small><i class="fa fa-eye" aria-hidden="true">${product.view}</i></small></span>
                                                <span><small><i class="fa fa-shopping-cart" aria-hidden="true">${product.buyItem}</i></small></span>
                                            </div>
                                            <a href="shopdetail.htm?Id=${product.productId}" class="add-cart btn ">Buy Now</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="product__pagination">
                                    ${url}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop Section End -->
        <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
        </body>
    <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
</html>
