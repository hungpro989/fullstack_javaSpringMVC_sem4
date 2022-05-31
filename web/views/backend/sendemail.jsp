<%-- 
    Document   : home
    Created on : Jul 21, 2021, 1:30:36 AM
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
        <div class="wrapper">
                <jsp:include page="layout/header.jsp" flush="true"></jsp:include>
                <jsp:include page="layout/menu.jsp" flush="true"></jsp:include>
                <div class="content-body load_cus">
                    <div class="container-fluid mt-3">
                            
                            <div class="row">
                                <div class="col-lg-10 col-md-10">
                                    
                                    <div class="card card-widget">
                                        <div class="card-body">
                                            <h5 class="text-muted"></h5>
                                            <div class="form-group">
                                                <label>Title: </label><span id="error"></span>
                                                <input class="form-control " name="title" id="title">
                                            </div>
                                            <div class="form-group">
                                                <label>Content:</label><span id="error"></span>
                                                <textarea class="form-control h-150px" rows="10" name="content" id="content"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-2">
                                    <div class="card card-widget">
                                        <div class="card-body">
                                            <button type="submit" class="btn btn-lg btn-success" id="sendEmailNow">Send Now</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="text-muted">Customer</h5>
                                            <div class="active-member">
                                                <div class="table-responsive">
                                                    <table class="table table-xs mb-0 table-triped">
                                                        <thead>
                                                            <tr>
                                                                <th><input type="checkbox" id="check-all"></th>
                                                                <th>Name</th>
                                                                <th>Username</th>
                                                                <th>Email</th>
                                                                <th>Phone</th>
                                                                <th>Address</th>
                                                                <th>Status</th>
                                                                <th>Created</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${listCustomer}" var="customer">
                                                            <tr>
                                                                <td><input type="checkbox" class="role-item" name="listEmailSelected[]" id="checkboxmail" value="${customer.email}"></td>
                                                                <td>${customer.name}</td>
                                                                <td>${customer.userName}</td>
                                                                <td>${customer.email}</td>
                                                                <td>${customer.phone}</td>
                                                                <td>${customer.address}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${customer.status != true}">
                                                                            <span style="color:red">Hidden</span>
                                                                        </c:when>
                                                                        <c:otherwise> 
                                                                            <span style="color:green">Show</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                                <td>${customer.created}</td>
                                                            </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                        
                                </div>
                            </div>
                       
                    </div>                
                </div>
        </div>
        <jsp:include page="layout/javascript.jsp" flush="true"></jsp:include>
        <script type="text/javascript">
            $('#check-all').click(function(){
                $('.role-item').not(this).prop('checked',this.checked);
            });
            $('#sendEmailNow').click(function(){
                var url = 'send-email-process.htm';
                var title = $("input#title").val();
                var content = $("textarea#content").val();
                var listemail = [];
                $('#checkboxmail:checked').each(function(i){
                    listemail[i] = $(this).val();
                });
                if(listemail==''){
                    toastr.error('Email not empty!', 'Error');
                }else if(title==''||content==''){
                    toastr.error('Title or content not empty!', 'Error');
                }else{
                    $.ajax({
                        type : "POST",
                        url : url,
                        data : {'listemail': listemail,'content':content,'title':title },
                        success : function(data) {
                            if (data === 'false') {
                               toastr.error('There was a small problem that needed to be fixed!', 'Error');
                            } else {
                                toastr.success('Successfully. '+data+' emails have been sent', 'Success');
                                console.log(url);
                            }
                        }
                    });
                }
            });
            
        </script>
    </body>
</html>
