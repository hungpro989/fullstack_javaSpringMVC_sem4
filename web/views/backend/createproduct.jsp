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
            <div class="content-body" id="">
                    <div class="row page-titles mx-0">
                        <div class="col p-md-0">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                                <li class="breadcrumb-item active"><a href="javascript:void(0)">Product detail</a></li>
                            </ol>
                        </div>
                    </div>
                    <div class="container-fluid reload">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="container-fluid row">
                                            <div class="col-4 text-center">
                                                <!--<img src="/Fontend/views/images/product/aaa.jpg" alt="" style="width: 400px; height: auto">-->
                                                <div class="form-group">
                                                    <label for="exampleFormControlFile1">Avatar: </label>
                                                    <input type="file" class="form-control input-rounded" name="product_images" id="product_images" >
                                                </div>
                                            </div>
                                            <div class="col-8">
                                                <div class="form-group">
                                                    <label>Product Name: </label>
                                                    <input type="text" class="form-control input-rounded" name="product_name" value="">
                                                </div>
                                                <div class="container-fluid row">
                                                    <div class="col-6">
                                                        <div class="container-fluid row">
                                                            <div class="col-6">
                                                                <div class="form-group">
                                                                    <label>Quantity:</label>
                                                                    <input type="text" class="form-control input-rounded" name="product_quantity" value="0">
                                                                </div>
                                                            </div>
                                                            <div class="col-6">
                                                                <div class="form-group">
                                                                    
                                                                    <label>Price In: $</label>
                                                                    <input type="text" class="form-control input-rounded" name="product_priceinput" value="0">
                                                                </div>
                                                            </div>
                                                            <div class="col-6">
                                                                <div class="form-group">
                                                                    <label>Price Out: $</label>
                                                                    <input type="text" class="form-control input-rounded" name="product_priceoutput" value="0">
                                                                </div>
                                                            </div> 
                                                            <div class="col-6">
                                                                <div class="form-group">
                                                                    <label>Discount: $</label>
                                                                    <input type="text" class="form-control input-rounded" name="product_discount" value="0">
                                                                </div>
                                                            </div> 
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label>Category:</label>
                                                            <select class="form-control" id="product_category" style="border-radius:20px" name="product_category">
                                                                <c:forEach items="${listCategory}" var="category" >
                                                                    <option value="${category.categoryId}" >${category.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Provider:</label>
                                                            <select class="form-control" id="product_provider" style="border-radius:20px" name="product_provider">
                                                                <c:forEach items="${listProvider}" var="provider">
                                                                <option value="${provider.providerId}">${provider.providerName}</option>
                                                                </c:forEach>
                                                            </select>
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
                                                    <textarea class="form-control h-150px" name="product_contentdetail" rows="6" id="content"></textarea>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center card card-body">
                                <div class="button-icon ">
                                    <button type="submit" class="btn mb-1 btn-primary insert_product">Update <span class="btn-icon-right"><i class="fa fa-upload"></i></span></button>
                                </div>
                            </div>
                        
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
        <script>
                $(document).on("click", ".insert_product", function () {
                    
                    var url = 'create-product-process.htm';
                    var name = $("input[name=product_name]").val();
                    var content = $("textarea[name=product_contentdetail]").val();
                    var images = $('input[name=product_images]').val();
                    var quantity = $("input[name=product_quantity]").val();
                    var priceinput = $("input[name=product_priceinput]").val();
                    var priceoutput = $("input[name=product_priceoutput]").val();
                    var discount = $("input[name=product_discount]").val();
                    var categoryId = $('select#product_category option:selected').val();
                    var providerId = $('select#product_provider option:selected').val();
                    if(name===''){
                        toastr.error('Product name not empty!', 'Error');
                    }else if(content===''){
                        toastr.error('Content detail not empty!', 'Error');
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
                    }else{
                        alert(name);
                        $.ajax({
                            url: url,
                            type: "POST",
                            data: { 'name': name,
                                    'content': content,
                                    'images': images,
                                    'quantity': quantity,
                                    'priceinput': priceinput,
                                    'priceoutput':priceoutput,
                                    'discount':discount,
                                    'categoryId': categoryId,
                                    'providerId': providerId
                                },
                            success: function (data) {
                                if(data==='true'){
                                    console.log(url);
                                    $( ".reload" ).load(window.location.href+" .reload");
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
