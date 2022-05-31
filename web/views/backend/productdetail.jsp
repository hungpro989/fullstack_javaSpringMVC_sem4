<%-- 
    Document   : productdetail
    Created on : Jul 25, 2021, 2:06:28 PM
    Author     : ADMIN
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
                <div class="content-body">
                    <div class="row page-titles mx-0">
                        <div class="col p-md-0">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                                <li class="breadcrumb-item active"><a href="javascript:void(0)">Product detail</a></li>
                            </ol>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="container-fluid row">
                                            <div class="col-4 text-center">
<!--                                                <label>${product.images}</label>-->
                                                <input type="text" class="form-control input-rounded" id="product_images" name="product_images" value="${product.images}">
                                                <img src="/Fontend/views/images/product/${product.images}" alt="" style="width: 400px; height: auto">
                                                <div class="form-group">
                                                    <label for="exampleFormControlFile1">${product.images}</label>
                                                    <form id="uploadForm">
                                                    <input type="file" class="form-control-file" name="myimage" id="imageid">
                                                    </form>
                                                  </div>
                                            </div>
                                            <input type="hidden" class="form-control input-rounded" name="productId" value="${product.productId}">
                                            <div class="col-8">
                                                <div class="form-group">
                                                    <input type="text" class="form-control input-rounded" name="product_name" value="${product.name}">
                                                </div>
                                                <div class="container-fluid row">
                                                    <div class="col-6">
                                                        <div class="container-fluid row">
                                                            <div class="col-4">
                                                                <div class="form-group">
                                                                    <label>Quantity:</label>
                                                                    <input type="text" class="form-control input-rounded" name="product_quantity" value="${product.quantity}">
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="form-group">
                                                                    <label>BuyItems:</label>
                                                                    <input type="text" class="form-control input-rounded" name="product_buyitem" value="${product.buyItem}">
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="form-group">
                                                                    <label>Views:</label>
                                                                    <input type="text" class="form-control input-rounded" name="product_view" value="${product.view}">
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="form-group">
                                                                    
                                                                    <label>Price In: $</label>
                                                                    <input type="text" class="form-control input-rounded" name="product_priceinput" value="<fmt:formatNumber value="${product.priceInput}" minFractionDigits="0" maxFractionDigits="0"/>">
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="form-group">
                                                                    <label>Price Out: $</label>
                                                                    <input type="text" class="form-control input-rounded" name="product_priceoutput" value="<fmt:formatNumber value="${product.priceOutput}" minFractionDigits="0" maxFractionDigits="0"/>">
                                                                </div>
                                                            </div> 
                                                            <div class="col-4">
                                                                <div class="form-group">
                                                                    <label>Discount: $</label>
                                                                    <input type="text" class="form-control input-rounded" name="product_discount" value="<fmt:formatNumber value="${product.discount}" minFractionDigits="0" maxFractionDigits="0"/>">
                                                                </div>
                                                            </div> 
                                                            <div class="col-12">
                                                                <label>Status:</label>
                                                                <div class="form-group">
                                                                    <label class="radio-inline mr-3"><input type="radio" value="true" id="product_status" name="product_status" ${product.status==true?"checked":""}> Show</label>
                                                                    <label class="radio-inline mr-3"><input type="radio" value="false" id="product_status" name="product_status" ${product.status==false?"checked":""}> Hidden</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-12">
                                                                <label>Home Discount:</label>
                                                                <div class="form-group">
                                                                    <label class="radio-inline mr-3"><input type="radio" value="true" id="product_showhome" name="product_showhome" ${product.showHome==true?"checked":""}> Show</label>
                                                                    <label class="radio-inline mr-3"><input type="radio" value="false" id="product_showhome" name="product_showhome" ${product.showHome==false?"checked":""}> Hidden</label>
                                                                </div>
                                                            </div> 
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label>Category:</label>
                                                            <select class="form-control" id="product_category" style="border-radius:20px" name="product_category">
                                                                <c:forEach items="${listCategory}" var="category" >
                                                                    <option value="${category.categoryId}" ${category.categoryId == product.categoryId? "selected":""}>${category.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Provider:</label>
                                                            <select class="form-control" id="product_provider" style="border-radius:20px" name="product_provider">
                                                                <c:forEach items="${listProvider}" var="provider">
                                                                <option value="${provider.providerId}" ${provider.providerId == product.providerId? "selected":""}>${provider.providerName}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <label>Image other:</label>
                                                        <div class="basic-form container-fluid row">
                                                            <c:forEach items="${listImage}" var="image">
                                                                <div class="col-2">
                                                                    <img src="/Fontend/views/images/product/${image.imageLinkName}" alt="" style="width: 100px; height: auto">
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Content</h4>
                                        <div class="basic-form">
                                            <form>
                                                <div class="form-group">
                                                    <textarea class="form-control h-150px" name="product_contentdetail" rows="6" id="content">${product.contentDetail}</textarea>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center card card-body">
                                <div class="button-icon ">
                                    <button type="submit" class="btn mb-1 btn-primary update_product">Update <span class="btn-icon-right"><i class="fa fa-upload"></i></span></button>
                                </div>
                            </div>
                        
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
        <script>
                $(document).on("click", ".update_product", function () {
                    var url = 'product-update.htm';
                    var productId = ${product.productId};
                    var name = $("input[name=product_name]").val();
                    var content = $("textarea[name=product_contentdetail]").val();
                    var images = $('input[name=product_images]').val();
                    var view = $("input[name=product_view]").val();
                    var buyitem = $("input[name=product_buyitem]").val();
                    var quantity = $("input[name=product_quantity]").val();
                    var priceinput = $("input[name=product_priceinput]").val();
                    var priceoutput = $("input[name=product_priceoutput]").val();
                    var discount = $("input[name=product_discount]").val();
                    var categoryId = $('select#product_category option:selected').val();
                    var providerId = $('select#product_provider option:selected').val();
                    var status = $('#product_status:checked').val();
                    var showhome = $('#product_showhome:checked').val();
                    if(name===''){
                        toastr.error('Product name not empty!', 'Error');
                    }else if(content===''){
                        toastr.error('Content detail not empty!', 'Error');
                    }else if(view===''){
                        toastr.error('View not empty!', 'Error');
                    }else if(buyitem===''){
                        toastr.error('Buy items not empty!', 'Error');
                    }else if(quantity===''){
                        toastr.error('Quantity not empty!', 'Error');
                    }else if(priceinput===''){
                        toastr.error('Price input not empty!', 'Error');
                    }else if(priceoutput===''){
                        toastr.error('Price output not empty!', 'Error');
                    }else if(categoryId===''){
                        toastr.error('Category not select!', 'Error');
                    }else if(providerId===''){
                        toastr.error('Provider not select!', 'Error');
                    }else if(status===''){
                        toastr.error('Status not check!', 'Error');
                    }else if(showhome===''){
                        toastr.error('Show home not check!', 'Error');
                    }else{
                        
                        $.ajax({
                            url: url,
                            type: "POST",
                            data: { 'name': name,
                                    'content': content,
                                    'images': images,
                                    'view':view ,
                                    'buyitem':buyitem ,
                                    'quantity': quantity,
                                    'priceinput': priceinput,
                                    'priceoutput':priceoutput,
                                    'discount':discount,
                                    'categoryId': categoryId,
                                    'providerId': providerId,
                                    'status': status,
                                    'showhome':showhome,
                                    'productId': productId
                                },
                            success: function (data) {
                                if(data==='true'){
                                    console.log(url);
                                    toastr.success('Update Success!', 'Success');
                                }else{
                                    console.log(url);
                                    toastr.error('Update Success!', 'Error');
                                }    
                            }
                        });
                    }                       
                });
        </script>
    </body>
</html>
