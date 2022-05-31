<%-- 
    Document   : javascript
    Created on : Jul 21, 2021, 4:27:15 PM
    Author     : hungp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="/Fontend/views/fontend/assets/js/jquery-3.3.1.min.js"></script>
<script src="/Fontend/views/fontend/assets/js/bootstrap.min.js"></script>
<script src="/Fontend/views/fontend/assets/js/jquery.nice-select.min.js"></script>
<script src="/Fontend/views/fontend/assets/js/jquery.nicescroll.min.js"></script>
<script src="/Fontend/views/fontend/assets/js/jquery.magnific-popup.min.js"></script>
<script src="/Fontend/views/fontend/assets/js/jquery.countdown.min.js"></script>
<script src="/Fontend/views/fontend/assets/js/jquery.slicknav.js"></script>
<script src="/Fontend/views/fontend/assets/js/mixitup.min.js"></script>
<script src="/Fontend/views/fontend/assets/js/owl.carousel.min.js"></script>
<script src="/Fontend/views/fontend/assets/js/main.js"></script>
<script src="/Fontend/views/fontend/assets/js/toastr.min.js"></script>

<script>
    function validate() {
        var fullname = document.getElementById("fullname").value;
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var phone = document.getElementById("phone").value;
        var email = document.getElementById("email").value;
        var address = document.getElementById("address").value;
        var pattern = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;


        if (fullname != "" && username != "" && password != "" && phone != "" && email != "" && address != "" && pattern.test(email) == true) {
            return true;

        } else {
            if (fullname == "") {
                alert("Bạn phải nhập họ tên.");
                document.getElementById("name").focus();
                return false;
            }
            if (username == "") {
                alert("Bạn phải nhập tên đăng nhập.");
                document.getElementById("username").focus();
                return false;
            }
            if (password == "") {
                alert("Bạn phải nhập mật khẩu.");
                document.getElementById("password").focus();
                return false;
            }
            if (phone == "") {
                alert("Bạn phải nhập số điện thoại.");
                document.getElementById("phone").focus();
                return false;
            }
            if (email == "") {
                alert("Bạn phải nhập email.");
                document.getElementById("email").focus();
                return false;
            } else {

                if (!pattern.test(email)) {
                    alert("Bạn nhập sai định dạng email. Mời bạn nhập lại.");
                    document.getElementById("email").focus();
                    return false;
                }
            }
            if (address == "") {
                alert("Bạn phải nhập địa chỉ.");
                document.getElementById("address").focus();
                return false;
            }
        }
    }
    $(document).on("click", ".click__img", function () {
        $(".hide-img").hide();
    });
    $(document).on("click", ".login_customer", function () {
        var error = document.getElementById("error");
        var url = 'login.htm';
        var username_login = $("#username_login").val();
        var password_login = $("#password_login").val();
        if (username_login === '') {
            error_username.innerHTML = "<small><span style='color: red;'>" + "Username not empty!!</span></small>";
        }else if(password_login === ''){
            error_password.innerHTML = "<small><span style='color: red;'>" + "Password not empty!!</span></small>";
        }else {
            error.innerHTML = "<small><span style='color: green;'>" + "ok!!</span></small>";
            $.ajax({
                url: url,
                type: "POST",
                data: {'username_login': username_login, 'password_login': password_login},
                success: function (data) {
                    if (data === 'true') {
                        error.innerHTML = "<small><span style='color: green;'>" + " Login successfully!</span></small>";
                        console.log(url);
//                        location.reload();
                        $('#logInModal').modal('toggle');
                        $( "#loadCus" ).load(window.location.href+" #loadCus");
                        toastr.success('Login successfully.', 'Success');
                    } else {
                        toastr.error('Username or password not valid!', 'Error');
                        error.innerHTML = "<small><span style='color: red;'>" + " Username or password not valid!</span></small>";
                    }
                }
            });
        }
    });
    $(document).on("click", ".register_customer", function () {
        var phone_pattern = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
        var username_pattern = /^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$/;
        var testEmail = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
        var error = document.getElementById("error");
        var name_create = $("#name_create").val();
        var username_create = $("#username_create").val();
        var password_create = $("#password_create").val();
        var repassword_create = $("#repassword_create").val();
        var phone_create = $("#phone_create").val();
        var address_create = $("#address_create").val();
        var email_create = $("#email_create").val();
        
        if (name_create === '') {
            toastr.error('Full name not empty!', 'Error');
        }else if(!username_pattern.test(username_create)){
            toastr.error('Username not valid!', 'Error');
        }else if(password_create === ''){
            toastr.error('Password not empty!', 'Error');
        }else if(!password_create.match(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/)){
            toastr.error('Password >=8 characters, uppercase, lowercase, number', 'Error');
        }else if(password_create !== repassword_create){
            toastr.error('Password not same!', 'Error');
        }else if(!phone_pattern.test(phone_create)){
            toastr.error('Phone not valid!', 'Error');
        }else if(address_create === ''){
            toastr.error('Address not empty!', 'Error');
        }else if(email_create === ''){
            toastr.error('Email not empty!', 'Error');
        }else if(!testEmail.test(email_create)){
            toastr.error('Email not valid!!', 'Error');
        }else {
            $.ajax({
                url: 'resgiter.htm',
                type: "POST",
                data: { 'name_create': name_create,
                        'username_create': username_create,
                        'password_create':password_create,
                        'phone_create':phone_create,
                        'address_create':address_create,
                        'email_create':email_create
                },
                success: function (data) {
                    if(data === 'true') {
                        error_create.innerHTML = "<small><span style='color: green;'>" + " Register successfully! Please check your email!</span></small>";
                        toastr.success('Register successfully! Please check your email!', 'Success');
                        $('#registernModal').modal('toggle');
                    }else if(data === 'username_already_exists'){
                        toastr.error('Username already exists!', 'Error');
                        error_username_cre.innerHTML = "<small><span style='color: red;'>" + " Username already exists!</span></small>";
                    }else if(data === 'email_already_exists'){
                        toastr.error('Email already exists!', 'Error');
                        error_email_cre.innerHTML = "<small><span style='color: red;'>" + " Email already exists!</span></small>";
                    }else if(data === 'phone_already_exists'){
                        toastr.error('Phone already exists!', 'Error');
                        error_phone_cre.innerHTML = "<small><span style='color: red;'>" + " Phone already exists!</span></small>";
                    }else {
                        toastr.error('Register not valid!', 'Error');
                        error_create.innerHTML = "<small><span style='color: red;'>" + " Register not valid!!</span></small>";
                    }
                }
            });
        }
    });
</script>