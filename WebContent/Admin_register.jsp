<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

 <%@include file="style1.jsp" %>
 
<meta charset="ISO-8859-1">

</head>
<script>
	function openUser(option) {
		document.getElementById("custInfo").style.display = option;
	}

	function MsgLoginValid() {
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

	
</script>
<body>






<main id="contents" class="site-contnts">
   
    <!--Blogs-->
    <section class="row checkout-section">
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <form  action="" class="row checkout-form" name="RegistForm">
                        <h2 class="cb-title"> <strong>Admin Registration</strong></h2>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                 <label for="email">First Name*</label>
                                <input class="form-control" type="text" name="firstName" id="firstName"  placeholder="First Name"/>
                            </div>
                            <div class="form-group col-sm-6">
                             <label for="email">Last Name*</label>
                              <input type="text" class="form-control"name="lastName" id="lastName"   placeholder="Last Name"/>
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="email">Email</label>
                                <input type="email"class="form-control" name="email" id="email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group col-sm-6">
                                <label >Phone Numbers:*</label>
                                <input type="text" class="form-control">
                            </div>
                             <input type="hidden" name="action1" id="action1" value="admin"  />
                            <div class="form-group col-sm-12">
                              <label for="email">Password</label>
                                <input type="password"class="form-control" name="pwd" id="pwd" value="" placeholder="Password"/>
                            </div>
                           
                           
                           </div>
                           
                             <div class="form-group form-button" id="b1" >
                                <input type="submit" class="btn btn-primary"name="register" id="reg" onclick="javascript:MsgLoginValid();"  class="form-submit" value="Save"/>
                            </div>
                      </form>
</div>
</div>
</div>




  </section>
	    </main>
</body>
</html>






















