 <%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.medicine.model.Customer"%>
<%@include file="style.jsp" %>
<%@include file="headerLogout.jsp" %>
 <script>
	// show modal to validate null value 
	function MsgLoginValid() {

		// validate null value 
		if (document.getElementById("emailid").value == ""
				|| document.getElementById("pwdid").value == "") {
		alert("please enter email and password");
			return;
		} else {
			// submit form  
			var form = document.LoginForm;

				form.action = "LoginController";
			

			form.submit();
		}

	}
	function openUser(option) {
		document.getElementById("custInfo").style.display = option;
	}

	function MsgLoginValid1() {
		var form = document.RegistForm;

		// validate null value 
		if (document.getElementById("email").value == ""
				|| document.getElementById("pwd").value == ""
				|| document.getElementById("firstName").value == ""
				|| document.getElementById("lastName").value == "") {
			 alert("Please enter your email, password, and your name.");
			return;
		} else {

			form.action = "RegisterController";

			form.submit();
		}

	}

	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').trigger('focus')
	})

	
</script>
<!-- =====  CONTAINER START  ===== -->
    <div class="container">
      <div class="row ">
        <div id="column-left" class="col-sm-4 col-md-4 col-lg-3 hidden-xs">
          <div id="category-menu" class="navbar collapse in  mb_40" aria-expanded="true" style="" role="button">
            <div class="nav-responsive">
              <ul class="nav  main-navigation collapse in">
                <li><a href="#">Pharmacy</a></li>
                <li><a href="#">Health</a></li>
                <li><a href="#">Beauty</a></li>
                <li><a href="#">Vitamins</a></li>
                <li><a href="#">Sweating</a></li>
                <li><a href="#">Coughs & Colds</a></li>
                <li><a href="#">Hair Loss</a></li>
                <li><a href="#">Weight Loss</a></li>
                <li><a href="#">Antifungals</a></li>
                <li><a href="#">Pain Relief</a></li>
                <li><a href="#">Stop Smoking</a></li>
                <li><a href="#">Skin Conditions</a></li>
                <li><a href="#">Top Brands</a></li>
              </ul>
            </div>
          </div>
          <div class="left_banner left-sidebar-widget mt_30 mb_40"> <a href="#"><img src="images/left1.jpg" alt="Left Banner" class="img-responsive" /></a> </div>
        </div>
        <div class="col-sm-8 col-md-8 col-lg-9 mtb_30">
           <%
				// Fail to login
				try {
					String getMsg = (String) request.getAttribute("loginMsg");

					if (getMsg.equals("fail")) {
			%>
			
				The email or password you entered is incorrect.<br>
			

			<%
				}
				} catch (Exception e) {

				}
			%>
			<%
				// Msg from Controller : Fail to Register
				try {
					String getMsg = (String) request.getAttribute("Msg");

					if (getMsg.equals("email")) {
			%>
			<div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Email ID or Mobile Number Already exists!</strong> Better check For New one or click on Login.
</div>
<%
				} else if (getMsg.equals("fail")) {
			%>
			<div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Failed to Register.</strong> Try again.
</div>
			
			<%
				} else if (getMsg.equals("fail")) {
			%>
			<div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Failed to Register.</strong> Try again.
</div>
			
			<%
				}
				} catch (Exception e) {

				}
			%>
          <!-- contact  -->
          <div class="row">
            <div class="col-md-6 col-md-offset-3">
              <div class="panel-login">
                <div class="panel-heading">
                  <div class="row mb_20">
                    <div class="col-xs-6">
                      <a href="#" class="active" id="login-form-link">Login</a>
                    </div>
                    <div class="col-xs-6">
                      <a href="#" id="register-form-link">Register</a>
                    </div>
                  </div>
                  <hr>
                </div>
                <div class="panel-body">
                  <div class="row">
                    <div class="col-lg-12">
                    
                    
                    <!-- -Login Form ---------------------------------------------- -->
                      <form id="login-form" action="#" method="post"name="LoginForm">
                        <div class="form-group">
                          <input type="text" name="email" id="emailid" tabindex="1" class="form-control" placeholder="Username" >
                        </div>
                        <div class="form-group">
                          <input type="password" name="pwd" id="pwdid" tabindex="2" class="form-control" placeholder="Password">
                        </div>
                        <input type="hidden" name="userType" id="user" value="user"  />
                        <div class="form-group text-center">
                          <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                          <label for="remember"> Remember Me</label>
                        </div>
                        <div class="form-group">
                          <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                              <input type="submit" name="login-submit" id="login-submit" tabindex="4" onclick="javascript:MsgLoginValid();" class="form-control btn btn-login" value="Log In">
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="row">
                            <div class="col-lg-12">
                              <div class="text-center">
                                <a href="#" tabindex="5" class="forgot-password">Forgot Password?</a>
                              </div>
                            </div>
                          </div>
                        </div>
                      </form>
                      
                      <!-- ----Registration Form---------------------------------------------------------------------- -->
                      
                      
                      <form id="register-form" action="#" method="post"name="RegistForm" onSubmit="return false;">
                       <input type="hidden" name="category" id="category" value="Customers">
                        <div class="form-group">
                          <input type="text" name="firstName" id="firstName" tabindex="1" class="form-control" placeholder="Firstname" >
                        </div>
                          <div class="form-group">
                          <input type="text" name="lastName" id="lastName" tabindex="1" class="form-control" placeholder="Lastname">
                        </div>
                         <input type="hidden" name="action1" id="action1" value="register"  />
                        <div class="form-group">
                          <input type="email" name="email" id="email"tabindex="1" class="form-control" placeholder="Email Address" >
                        </div>
                        <div class="form-group">
                          <input type="text"name="mob" id="mob"  tabindex="1" class="form-control" placeholder="mobile no">
                        </div>
                        <div class="form-group">
                          <input type="password" name="pwd" id="pwd"  tabindex="2" class="form-control" placeholder="Password">
                        </div>
                        <div class="form-group">
                          <input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
                        </div>
                         <div class="form-group">
                          <input type="text"  name="address" id="address" placeholder="Address" tabindex="2" class="form-control" >
                        </div>
                         <div class="form-group">
                          <input type="text" name="city" id="city" placeholder="City" tabindex="2" class="form-control" >
                        </div>
                         <div class="form-group">
                          <input type="text" name="postalCode" id="pc" placeholder="Enter PinCode" tabindex="2" class="form-control">
                        </div>
                        <div class="form-group">
                          <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                              <input type="submit"name="register" id="reg" onclick="javascript:MsgLoginValid1();" tabindex="4" class="form-control btn btn-register" value="Register Now">
                            </div>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  
  <div  style="display:none" class="modal fade" id="myModal" role="dialog">
			
      <div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Wrong Password</strong> Enter correct Email and Password.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

		</div>
  <!-- Single Blog  -->
  <!-- End Blog   -->
  <!-- =====  CONTAINER END  ===== -->
  
  
<%@include file="footer.jsp" %>