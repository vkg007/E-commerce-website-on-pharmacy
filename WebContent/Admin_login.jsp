<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ADMIN-Login in</title>
 <%@include file="style.jsp" %>
 <%@include file="headerLogout.jsp" %>
    <!-- Font Icon -->
   

    <!-- Main css -->
    
    
    
    <script>
	// show modal to validate null value 
	function MsgLoginValid() {

		// validate null value 
		if (document.getElementById("email").value == ""
				|| document.getElementById("pwd").value == "") {
		alert("please enter email and password");
			return;
		} else {
			// submit form  
			var form = document.LoginForm;

				form.action = "LoginController";
			

			form.submit();
		}

	}

	
</script>
</head>
<body>
	

          <%
				// Fail to login
				try {
					String getMsg = (String) request.getAttribute("loginMsg");

					if (getMsg.equals("fail")) {
			%>
			<h1 style="color:red;">
				The email or password you entered is incorrect.
		</h1>

			<%
				}
				} catch (Exception e) {

				}
			%>
<main id="contents" class="site-contnts">
   
    <!--Blogs-->
    <section class="row checkout-section">
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <form action="#" class="row checkout-form" name="LoginForm">
                        <h2 class="cb-title"><strong>ADMIN Login In</strong><div id="ip" style="display:none">The email or password you entered is incorrect.</div> </h2>
                        <div class="row">
                            <div class="form-group col-sm-12">
                                  <label for="email">Email*</label>
                                <input class="form-control"  width="100" type="email" name="email"id="email"  placeholder="Your Email"/>
                            </div>
                            <div class="form-group col-sm-12">
                              
                                 <label for="email">Password*</label>
                                <input  class="form-control"type="password" name="pwd" id="pwd" placeholder="Password"/>
                            </div>
                           
                           
                             <input type="hidden" name="userType" id="user" value="admin"  />
                            </div>
                             <div class="form-group form-button" id="b1" >
                                <input type="submit" class="btn btn-primary"name="login" id="reg" onclick="javascript:MsgLoginValid();" class="form-submit" value="Login"/>
                            </div>
                      </form>
                            
                      </div>
                       </div> 
                       </div>
                       </section>
                       </main>
                           









    <!-- JS -->
   
    <%@include file="footer.jsp" %>
   
</body>
</html>