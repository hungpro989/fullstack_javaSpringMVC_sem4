<%-- 
    Document   : shopdetail
    Created on : Jul 23, 2021, 1:49:20 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <%--<jsp:include page="main/shopdetail.jsp" flush="true"></jsp:include>--%>
        <!-- Shop Details Section Begin -->
        <section class="shop-details">
            <div class="product__details__pic">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__details__breadcrumb">
                                <a href="home.htm">Home</a>
                                <a href="shop.htm">Shop</a>
                                <span>Product Details</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3">
                            <ul class="nav nav-tabs" role="tablist" style="overflow: scroll;overflow-x: hidden; height: 500px;width: 150px">
                                <c:forEach items="${listImage}" var="img">
                                    <li class="nav-item">
                                        <a class="nav-link click__img" data-toggle="tab" href="#tabs-${img.imageLinkId}" role="tab">
                                            <div class="product__thumb__pic set-bg" data-setbg="/Fontend/views/images/product/${img.imageLinkName}">
                                            </div>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="col-lg-6 col-md-9">
                            <div class="tab-content" >
                                <div class="hide-img">
                                    <img src="/Fontend/views/images/product/${product.images}" alt="">
                                </div>
                                <c:forEach items="${listImage}" var="img">
                                    <div class="tab-pane" id="tabs-${img.imageLinkId}" role="tabpanel" >
                                        <div class="product__details__pic__item" >
                                            <img src="/Fontend/views/images/product/${img.imageLinkName}" alt="">
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product__details__content">
                <div class="container">
                    <div class="row d-flex justify-content-center">
                        <div class="col-lg-8">
                            <div class="product__details__text">
                                <form action="<%=request.getContextPath()%>/fontend/addcart.htm" enctype="multipart/form-data" class="product-form product-actions">
                                    <script>
                                        $(window).load(function () {
                                            $('.selector-wrapper:eq(0)').hide();
                                        });
                                    </script>
                                    <h4>${product.name}</h4>
                                    <c:choose>
                                        <c:when test="${product.discount == 0}">
                                            <h3>$${product.priceOutput}</h3>
                                        </c:when>
                                        <c:otherwise>
                                            <h3>$${product.discount}<span>${product.priceOutput}</span></h3>
                                        </c:otherwise>
                                    </c:choose>
                                    <p>${product.contentDetail}</p>
                                    <div class="product__details__cart__option">
                                        <div class="quantity">
                                            <div class="">
                                                <input class="font-weight-bold text-center" name ="quantity" id="quantity" min="1" type="number" value="1" style="width: 80px">
                                                <input type="hidden" name ="Id" id="Id" min="1" value="${product.productId}" >
                                            </div>
                                        </div>
                                        <button  type="submit" class="primary-btn">add to cart</button>
                                    </div>
                                </form>
                                <div class="product__details__last__option">
                                    <h5><span>Guaranteed Safe Checkout</span></h5>
<!--                                    <img src="/Fontend/views/images/shop-details/details-payment.png" alt="">-->
                                    <ul>
                                        <li><span>Quantity:</span> ${product.quantity}<small>pcs</small></li>
                                        <li><span>SKU:</span> ${product.productId}</li>
                                        <li><span>Categories:</span> ${category.name}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__details__tab">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#tabs-5" role="tab">Description</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">Terms & Policy</a>
                                    </li>
                                </ul>
                                <div class="tab-content ">
                                    <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                        <div class="product__details__tab__content">
                                            <div class="product__details__tab__content__item">
                                                <h5>Products Infomation</h5>
                                                <p>${product.contentDetail}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tabs-6" role="tabpanel">
                                        <div class="product__details__tab__content">
                                            <div class="product__details__tab__content__item">
                                                <h5>Products Infomation</h5>
                                                <p>This policy applies only to information collected on the websites.
                                                    We collect two types of information from visitors to our websites: (1) Personal data and (2) Non-personal data. 
                                                    “Personal data” is information that identifies you personally and that you provide to
                                                    us, such as your name, address, telephone number, email address, and sometimes your Internet Protocol (IP) address.</p>
                                                <p>As is the case with any new technology product, the cost of a Pocket PC
                                                    was substantial during it’s early release. For approximately $700.00,
                                                    consumers could purchase one of top-of-the-line Pocket PCs in 2003.
                                                    These days, customers are finding that prices have become much more
                                                    reasonable now that the newness is wearing off. For approximately
                                                    $350.00, a new Pocket PC can now be purchased.</p>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop Details Section End -->

        <!-- Related Section Begin -->
        <section class="related spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="related-title">Related Product</h3>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${listRefe}" var="refe">
                        <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="/Fontend/views/images/product/${refe.images}">
                                    <span class="label">Hot</span>
                                    <ul class="product__hover">
                                        <li><a href="shopdetail.htm?Id=${refe.productId}"><img src="/Fontend/views/images/icon/search.png" alt=""></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6>${refe.name}</h6>
                                    <a href="shopdetail.htm?Id=${refe.productId}" class="add-cart">Buy Now</a>
                                    <h5>$${refe.priceOutput}</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Related Section End -->
        <!-- Related Section End -->
        <jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
        </body>
    <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
</html>
