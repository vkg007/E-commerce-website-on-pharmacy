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


<%@include file="headerLogout.jsp" %>





<main id="contents" class="site-contnts">
   
    <!--Blogs-->
    <section class="row checkout-section">
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <form action="#" class="row checkout-form" name="RegistForm">
                        <h2 class="cb-title">${sessionScope.customer.firstName}'s <strong>Profile</strong></h2>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                 <label for="email">First Name*</label>
                                <input class="form-control" type="text" name="firstName" id="firstName" value="${sessionScope.customer.firstName}" placeholder="First Name"/>
                            </div>
                            <div class="form-group col-sm-6">
                             <label for="email">Last Name*</label>
                              <input type="text" class="form-control"name="lastName" id="lastName"  value="${sessionScope.customer.lastName}" placeholder="Last Name"/>
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="email">Email</label>
                                <input type="email"class="form-control" name="email" id="email" value="${sessionScope.customer.customerId}"placeholder="Your Email" disabled/>
                            </div>
                            
                            <div class="form-group col-sm-6">
                              <label for="mob">Mobile</label>
                                <input type="number" minlength="10" maxlength="10" class="form-control" name="mob" id="mob" value="${sessionScope.customer.mob}" placeholder="Password"/>
                            </div>
                           
                             
                              <div class="form-group col-sm-6">
                               <label for="email">Password</label>
                                <input type="password" class="form-control" name="pwd" size="15" id="pwd" value="${sessionScope.customer.userPwd}" placeholder="Password"/>
                           </div>
                          
                            
                             <input type="hidden"class="form-control" name="action1" id="address"value="update">
                            <div class="form-group col-sm-12">
                                <label >Address:*</label>
                                <input type="text"class="form-control" name="address" id="address"value="${sessionScope.customer.address}" placeholder="Address"/>
                            </div>
                            <div class="form-group col-sm-4">
                                <label >Town/City:*</label>
                                <input type="text" class="form-control"name="city" id="city"value="${sessionScope.customer.city}" placeholder="City"/>
                            </div><br>
                            <div class="form-group col-sm-2">
                                <label for="email">Postal Code</label>
                                <input type="text"class="form-control" name="postalCode" id="pc" value="${sessionScope.customer.postalCode}"placeholder="Enter PinCode"/>
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






















