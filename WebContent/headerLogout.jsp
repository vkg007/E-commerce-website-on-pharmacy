<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="com.medicine.model.Customer"%>
<script>
function delCart(itemId)
{

	  document.cartForm1.itemId.value = itemId; 
	  document.cartForm1.action = "DelCartController";
	  document.cartForm1.submit(); 

		  
}
</script>

<!-- =====  HEADER START  ===== -->
    <header id="header">
      <div class="header-top">
        <div class="container">
          <div class="row">
            <div class="col-sm-6">
             
            </div>
            <div class="col-sm-6">
              <ul class="header-top-right text-right">
              <!-- -------------checking sesssion---------------------------------------------------------------------------- -->
 <%
	//Session check
	HttpSession session2 = request.getSession();

	synchronized (session2) {

		String userType = (String) session2.getAttribute("userType");

		if (session.getAttribute("customer") == null ) {
%>
   <li class="account"><a href="Admin_login.jsp">Admin Login</a></li>
 <li class="account"><a href="login.jsp">Log in/Sign up</a></li>
<%
		}
		else
		{
			
%>
<c:import url="/MyCartHeader" />
 <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Hi ${sessionScope.customer.firstName} </a>
                  <ul class="dropdown-menu">
                    <li> <a  href="EditProfile.jsp">My Profile</a></li>
                    <li> <a href="MyOrderController">My Orders</a></li>
                    <li> <a href="#">My Wishlist</a></li>
                    <li> <a href="mycart.jsp">My Cart</a></li>
                    <li> <a href="Logout">Logout</a></li>
                  </ul>
                </li>
			
			   <li class="cart"><a href="mycart.jsp">My Cart</a></li>
			       <li> <a href="Logout">Logout</a></li>
			
	<%
		
		}
	}
	
		%>




<!-- ------------- end checking sesssion---------------------------------------------------------------------------- -->
             
              
             
               
               
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="header">
        <div class="container">
          <nav class="navbar">
            <div class="navbar-header mtb_20"> <a class="navbar-brand" href="home.jsp"> <img alt="HealthCared" src="images/logo1.png" width="100" height="400"> </a> </div>
            <div class="header-right pull-right mtb_50">
              <button class="navbar-toggle pull-left" type="button" data-toggle="collapse" data-target=".js-navbar-collapse"> <span class="i-bar"><i class="fa fa-bars"></i></span></button>
            
              <div class="shopping-icon">
                <div class="cart-item " data-target="#cart-dropdown" data-toggle="collapse" aria-expanded="true" role="button">Item's : <span class="cart-qty">${status.count}</span>${fn:length(requestScope.cartList)}</div>
                <div id="cart-dropdown" class="cart-menu collapse">
                  <ul>
                     <c:choose>
		<c:when test="${!empty cartList }"> 
                    <li>
                    
                      <table class="table table-striped">
                        <tbody>
                   
                        
                         <c:forEach var="cart" items="${requestScope.cartList}" begin="0" step="1" varStatus="status">
				<!-- total price for all items -->
				<c:set var="total" value="${total + cart.price-cart.discount}" />
				<c:set var="totalDiscount" value="${totalDiscount + cart.cart_quantity*cart.discount}" />
				<c:set var="totalPrice" value="${totalPrice + cart.price}" />
				<c:if test = "${status.end == 0}">
			  	Your cart is empty
			  	</c:if>
                        
                        
                          <tr>
                            <td class="text-center"><a href="ProductDetailController?id=${cart.cart_med_id}"><img src="get_image.jsp?id=${cart.cart_med_id}"height="15px" width="15px" ></a></td>
                            <td class="text-left product-name"><a href="#">${cart.cart_med_name}</a>
                              <span class="text-left price"><sup>&#8377;</sup><fmt:formatNumber type="number"  maxIntegerDigits="4" value="${(cart.price/cart.cart_quantity) }" /></span>
                              <input class="cart-qty" name="product_quantity" min="1" value="${cart.cart_quantity}" type="number">
                            </td>
                            <td class="text-center"><a  onclick="javascript:delCart('${cart.cart_med_id}');" class="close-cart"><i class="fa fa-times-circle"></i></a></td>
                          </tr>
                          
                            </c:forEach>
                            
                         
                        </tbody>
                      </table>
                    </li>
                    <li>
                      <table class="table">
                        <tbody>
                          <tr>
                            <td class="text-right"><strong>Sub-Total</strong></td>
                            <td class="text-right"><sup>&#8377;</sup><fmt:formatNumber  type="number" minFractionDigits="2" maxFractionDigits="2"  value="${totalPrice}" /></td>
                          </tr>
                         
                          <tr>
                            <td class="text-right"><strong>Shipping</strong></td>
                            <td class="text-right"><sup>&#8377;</sup>0.00</td>
                          </tr>
                          <tr>
                            <td class="text-right"><strong>Total</strong></td>
                            <td class="text-right"><sup>&#8377;</sup><fmt:formatNumber  type="number" minFractionDigits="2" maxFractionDigits="2"  value="${totalPrice-totalDiscount }" /></td>
                          </tr>
                        </tbody>
                      </table>
                      
                      
                    </li>
                       </c:when>
		 
		<c:otherwise>
			<h3>  No Items </h3><br>
		</c:otherwise>
	</c:choose>
                    <li>
                      <form action="mycart.jsp">
                        <input class="btn pull-left mt_10" value="View cart" type="submit">
                      </form>
                      <form action="mycart.jsp">
                        <input class="btn pull-right mt_10" value="Checkout" type="submit">
                      </form>
                    </li>
                  </ul>
                </div>
                  <!-- form for cart --> 
		<form action="DelCartController" method="post" name="cartForm1"> 
		 	<input type="hidden" value="" name="itemId">
		 	<input type="hidden" value="${sessionScope.customer.customerId }" name="customerId">
		 </form> 
               
              </div>
              <div class="main-search pull-right">
                <div class="search-overlay">
                  <!-- Close Icon -->
                  <a href="javascript:void(0)" class="search-overlay-close"></a>
                  <!-- End Close Icon -->
                  <div class="container">
                    <!-- Search Form -->
                   <form action="SearchController" method="post" class="form-inline my-2 my-lg-0">
                                <input class="form-control mr-sm-2" name="medname"  type="text" placeholder="How can we help you today?"  aria-label="Search">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit"> <span class="fa fa-search" style="font-size:10px" > </span></button>
                             </form>
                    <!-- End Search Form -->
                  </div>
                </div>
                <div class="header-search"> <a id="search-overlay-btn"></a> </div>
              </div>
            </div>
            <div class="collapse navbar-collapse js-navbar-collapse pull-right">
              <ul id="menu" class="nav navbar-nav">
                <li> <a href="home.jsp">Home</a></li>
                <li> <a href="CategoryController?catname=Anti Allergic">Fitness</a></li>
                <li> <a href="CategoryController?catname=personal care">Personal Care</a></li>
                <li class="dropdown mega-dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Collection</a>
                  <ul class="dropdown-menu mega-dropdown-menu row">
                    <li class="col-md-3">
                      <ul>
                        <li class="dropdown-header">Ayurveda</li>
                        <li><a href="CategoryController?segname=ayurveda?catname=Anti Allergic">Personal Care</a></li>
                        <li><a href="#">Immunity booster</a></li>
                        <li><a href="#">Suppliments</a></li>
                        <li><a href="#">Herbal Juice </a></li>
                         <li><a href="#">All  medicine </a></li>
                      </ul>
                    </li>
                    <li class="col-md-3">
                      <ul>
                        <li class="dropdown-header">Allopathy</li>
                       <li><a href="CategoryController?segname=Allopathy">Vitamins</a></li>
                        <li><a href="#">Immunity booster</a></li>
                        <li><a href="#">Suppliments</a></li>
                        <li><a href="#">Pain Killers </a></li>
                        <li><a href="#">All  medicine </a></li>
                        
                      </ul>
                    </li>
                    <li class="col-md-3">
                      <ul>
                        <li class="dropdown-header">Generic</li>
                        <li><a href="#">Vitamins</a></li>
                        <li><a href="#">Antibiotics</a></li>
                        <li><a href="#">Anti fungal</a></li>
                        <li><a href="#">Allergic </a></li>
                        <li><a href="#">All  medicine </a></li>
                      </ul>
                    </li>
                    <li class="col-md-3">
                      <ul>
                        <li id="myCarousel" class="carousel slide" data-ride="carousel">
                          <div class="carousel-inner">
                            <div class="item active"> <a href="#"><img src="images/banner1.jpg" class="img-responsive" alt="Banner1"></a></div>
                            <!-- End Item -->
                            <div class="item"> <a href="#"><img src="images/menu-banner2.jpg" class="img-responsive" alt="Banner1"></a></div>
                            <!-- End Item -->
                            <div class="item"> <a href="#"><img src="images/menu-banner3.jpg" class="img-responsive" alt="Banner1"></a></div>
                            <!-- End Item -->
                          </div>
                          <!-- End Carousel Inner -->
                        </li>
                        <!-- /.carousel -->
                      </ul>
                    </li>
                  </ul>
                </li>
                <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages </a>
                  <ul class="dropdown-menu">
                    <li> <a href="contact_us.html">Contact us</a></li>
                    <li> <a href="cart_page.html">Cart</a></li>
                    <li> <a href="checkout_page.html">Checkout</a></li>
                    <li> <a href="product_detail_page.html">Product Detail Page</a></li>
                    <li> <a href="single_blog.html">Single Post</a></li>
                  </ul>
                </li>
                <li> <a href="about.jsp">About us</a></li>
              </ul>
            </div>
            <!-- /.nav-collapse -->
          </nav>
        </div>
      </div>
      <div class="header-bottom">
        <div class="container">
          <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-3">
              <div class="category">
                <div class="menu-bar" data-target="#category-menu,#category-menu-responsive" data-toggle="collapse" aria-expanded="false" role="button">
                  <h4 class="category_text">Top category</h4>
                  <span class="i-bar"><i class="fa fa-bars"></i></span></div>
              </div>
              <div id="category-menu-responsive" class="navbar collapse " aria-expanded="false" style="" role="button">
                <div class="nav-responsive">
                  <ul class="nav  main-navigation collapse in">
                    <li><a href="#">Pharmacy</a></li> 
                    <li><a href="#">Vitamins</a></li>
                    <li><a href="#">Sweating</a></li>
                    <li><a href="#">Coughs & Colds</a></li>
                    <li><a href="#">Hair Loss</a></li>
                    <li><a href="#">Weight Loss</a></li>
                    <li><a href="#">Antifungals</a></li>
                    <li><a href="#">Pain Relief</a></li>
                  
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-9">
              <div class="header-bottom-right offers">
              	<div class="marquee"><span><i class="fa fa-circle" aria-hidden="true"></i>It's Covid Essential Time !</span>
                  <span><i class="fa fa-circle" aria-hidden="true"></i>Our 5 Tips for a Healthy Rainy season</span>
                  <span><i class="fa fa-circle" aria-hidden="true"></i>Sugar health at risk?</span>
                  <span><i class="fa fa-circle" aria-hidden="true"></i>The Olay Ranges - What do they do?</span>
                  <span><i class="fa fa-circle" aria-hidden="true"></i>Body fat - what is it and why do we need it?</span>
                  <span><i class="fa fa-circle" aria-hidden="true"></i>Can a pillow help you to lose weight?</span></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- =====  HEADER END  ===== -->