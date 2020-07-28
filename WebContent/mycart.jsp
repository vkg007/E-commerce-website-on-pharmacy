<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.medicine.model.Customer"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="style.jsp" %>
<%@include file="headerLogout.jsp" %>
<%@page import="java.util.*" %>
<script>
  
  // delete items from cart
  function delCart1(itemId)
  {
 
	  document.delcartForm.itemId.value = itemId; 
	  document.delcartForm.action = "DelCartController";
	  document.delcartForm.submit(); 
 
		  
  }
 
  // submit form to checkout
  function checkOut()
  {
	   
	  document.cartForm2.submit();  
	  
  } 
  
  // move form to add quantity
  function modifyOrder(orderId, quantity, mode)
  {
 
	  var form = document.cartForm2;
	  
	  form.cartId.value = orderId; 
	  form.quantity.value= quantity;
	  form.mode.value = mode;
	  form.submit(); 
  
  }

  // move form to delete order
  function delOrder(orderId)
  {
 
	  var form = document.cartForm;
	  form.orderId.value = orderId;
	  form.mode.value = "del";
	  form.submit(); 
 
		  
  }
  
  </script>
  
</head>
<body>
<%
 	Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(1000000);
 %>

<!-- =====  CONTAINER START  ===== -->
<%
	//Session check
	HttpSession session3 = request.getSession();

	synchronized (session3) {

		String userType = (String) session3.getAttribute("userType");

		if (session.getAttribute("customer") == null ) {
%>

<jsp:forward page="login.jsp" />
<%
	} 

	} 
%>


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
          <div class="left_banner left-sidebar-widget mb_50 mt_30"> <a href="#"><img src="images/left1.jpg" alt="Left Banner" class="img-responsive" /></a> </div>
          <div class="left-special left-sidebar-widget mb_50">
            <div class="heading-part mb_20 ">
              <h2 class="main_title">Top Products</h2>
            </div>
            <div id="left-special" class="owl-carousel">
              <ul class="row ">
                <li class="item product-layout-left mb_20">
                  <div class="product-list col-xs-4">
                    <div class="product-thumb">
                      <div class="image product-imageblock"> <a href="product_detail_page.html"> <img class="img-responsive" title="iPod Classic" alt="iPod Classic" src="images/product/product9.jpg"> <img class="img-responsive" title="iPod Classic" alt="iPod Classic" src="images/product/product9-1.jpg"> </a> </div>
                    </div>
                  </div>
                  <div class="col-xs-8">
                    <div class="caption product-detail">
                      <h6 class="product-name"><a href="#">Latin literature from 45 BC, making it over old.</a></h6>
                      <div class="rating">
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span>
                      </div>
                      <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                      </span>
                    </div>
                  </div>
                </li>
              
                
              </ul>
              <ul class="row ">
                <li class="item product-layout-left mb_20">
                  <div class="product-list col-xs-4">
                    <div class="product-thumb">
                      <div class="image product-imageblock"> <a href="product_detail_page.html"> <img class="img-responsive" title="iPod Classic" alt="iPod Classic" src="images/product/product2.jpg"> <img class="img-responsive" title="iPod Classic" alt="iPod Classic" src="images/product/product2-1.jpg"> </a> </div>
                    </div>
                  </div>
                  <div class="col-xs-8">
                    <div class="caption product-detail">
                      <h6 class="product-name"><a href="#">Latin literature from 45 BC, making it over old.</a></h6>
                      <div class="rating">
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span>
                      </div>
                      <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                      </span>
                    </div>
                  </div>
                </li>
                
              
              </ul>
              <ul class="row ">
                <li class="item product-layout-left mb_20">
                  <div class="product-list col-xs-4">
                    <div class="product-thumb">
                      <div class="image product-imageblock"> <a href="product_detail_page.html"> <img class="img-responsive" title="iPod Classic" alt="iPod Classic" src="images/product/product5.jpg"> <img class="img-responsive" title="iPod Classic" alt="iPod Classic" src="images/product/product5-1.jpg"> </a> </div>
                    </div>
                  </div>
                  <div class="col-xs-8">
                    <div class="caption product-detail">
                      <h6 class="product-name"><a href="#">Latin literature from 45 BC, making it over old.</a></h6>
                      <div class="rating">
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span>
                      </div>
                      <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                      </span>
                    </div>
                  </div>
                </li>
             
               
              </ul>
              <ul class="row ">
                <li class="item product-layout-left mb_20">
                  <div class="product-list col-xs-4">
                    <div class="product-thumb">
                      <div class="image product-imageblock"> <a href="product_detail_page.html"> <img class="img-responsive" title="iPod Classic" alt="iPod Classic" src="images/product/product8.jpg"> <img class="img-responsive" title="iPod Classic" alt="iPod Classic" src="images/product/product8-1.jpg"> </a> </div>
                    </div>
                  </div>
                  <div class="col-xs-8">
                    <div class="caption product-detail">
                      <h6 class="product-name"><a href="#">Latin literature from 45 BC, making it over old.</a></h6>
                      <div class="rating">
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span>
                      </div>
                      <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                      </span>
                    </div>
                  </div>
                </li>
               
              </ul>
            </div>
          </div>
        </div>
        <div class="col-sm-8 col-md-8 col-lg-9 mtb_30">
          <!-- =====  BANNER STRAT  ===== -->
          <div class="breadcrumb ptb_20">
            <h1>Shopping Cart</h1>
            <ul>
              <li><a href="index.html">Home</a></li>
              <li class="active">Shopping Cart</li>
            </ul>
          </div>
          <!-- =====  BREADCRUMB END===== -->
       <c:choose>
		<c:when test="${!empty cartList }"> 
		   <c:set var="total" value="${0}"/>
		     <c:set var="totalPrice" value="${0}"/>
		       <c:set var="totalDiscount" value="${0}"/>
          <form enctype="multipart/form-data" method="post" action="#">
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <td class="text-center">Image</td>
                    <td class="text-left">Product Name</td>
                    <td class="text-left">price/Unit</td>
                    <td class="text-left">Quantity</td>
                    <td class="text-right">Discount/Unit</td>
                    <td class="text-right">Total</td>
                  </tr>
                </thead>
                	
                <c:forEach var="cart" items="${requestScope.cartList}" begin="0" step="1" varStatus="status">
				<!-- total price for all items -->
				<c:set var="total" value="${total + cart.price-cart.discount}" />
				<c:set var="totalDiscount" value="${totalDiscount + cart.cart_quantity*cart.discount}" />
				<c:set var="totalPrice" value="${totalPrice + cart.price}" />
				<c:if test = "${status.end == 0}">
			  	Your cart is empty
			  	</c:if>
			  
                    
                    <!-- --structue start--------------------------------------- -->
                <tbody>
                  <tr>
                    <td class="text-center"><a href="ProductDetailController?id=${cart.cart_med_id}"><img src="get_image.jsp?id=${cart.cart_med_id}"height="99px" width="65px" ></a></td>
                    <td class="text-left"><a href="product.html">${cart.cart_med_name}</a></td>
                    <td class="text-left"><fmt:formatNumber type="number" maxIntegerDigits="4" value="${(cart.price/cart.cart_quantity) }" /></td>
                    <td class="text-left">
                      <div style="max-width: 200px;" class="input-group btn-block">
                        <input type="text" class="form-control quantity" size="1" value="${cart.cart_quantity}" name="quantity">
                        <span class="input-group-btn">
                         <button  class="btn btn-danger" title="" onClick="javascript:modifyOrder('${cart.cart_id}','${cart.cart_quantity-1}', 'down');" data-toggle="tooltip" type="button" data-original-title="Decrement"><span class="glyphicon glyphicon-minus"></span></button>
                           <button  class="btn btn-danger" title="" onClick="javascript:modifyOrder('${cart.cart_id}','${cart.cart_quantity+1}', 'add');" data-toggle="tooltip" type="button" data-original-title="Increment"><span class="glyphicon glyphicon-plus"></span></button>
                        
                         
                    <!--  <button class="btn" title="" data-toggle="tooltip" type="submit" data-original-title="Update"><i class="fa fa-refresh"></i></button>-->
                    <button  class="btn btn-danger" title="" onclick="javascript:delCart1('${cart.cart_med_id}');" data-toggle="tooltip" type="button" data-original-title="Remove"><i class="fa fa-times-circle"></i></button>
                    </span></div>
                    </td>
                    <td class="text-right">${cart.discount}</td>
                    <td class="text-right"><sup>&#8377;</sup><fmt:formatNumber type="number" maxIntegerDigits="4" value="${cart.price -(cart.cart_quantity*cart.discount) }" /></td>
                  </tr>
                </tbody>
                </c:forEach>
                <!-- ---End------------------------------------------------------------- -->
              </table>
            </div>
          </form>
            <!-- form for cart --> 
		<form action="DelCartController" method="post" name="delcartForm"> 
		 	<input type="hidden" value="" name="itemId">
		 	<input type="hidden" value="${sessionScope.customer.customerId }" name="customerId">
		 </form> 
		 <form action="MyCartController" method="post" name="cartForm2"> 
		 	<input type="hidden" value="" name="cartId">
		 	<input type="hidden" value="" name="mode">
		 	<input type="hidden" value="" name="quantity"> 
		</form> 
		
          <h3 class="mtb_10">What would you like to do next?</h3>
          <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
          <div class="panel-group mt_20" id="accordion">
            <div class="panel panel-default pull-left">
              <div class="panel-heading">
                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Use Coupon Code <i class="fa fa-caret-down"></i></a></h4>
              </div>
              <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
                  <label for="input-coupon" class="col-sm-4 control-label">Enter your coupon here</label>
                  <div class="input-group">
                    <input type="text" class="form-control" id="input-coupon" placeholder="Enter your coupon here" value="" name="coupon">
                    <span class="input-group-btn">
                <input type="button" class="btn" data-loading-text="Loading..." id="button-coupon" value="Apply Coupon">
                </span>
                  </div>
                </div>
              </div>
            </div>
            <div class="panel panel-default pull-left">
              <div class="panel-heading">
                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Use Gift Voucher <i class="fa fa-caret-down"></i></a> </h4>
              </div>
              <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">
                  <label for="input-voucher" class="col-sm-4 control-label">Enter your gift voucher code here</label>
                  <div class="input-group">
                    <input type="text" class="form-control" id="input-voucher" placeholder="Enter your gift voucher code here" value="" name="voucher">
                    <span class="input-group-btn">
                <input type="button" class="btn" data-loading-text="Loading..." id="button-voucher" value="Apply Voucher">
                </span>
                  </div>
                </div>
              </div>
            </div>
            <div class="panel panel-default pull-left">
              <div class="panel-heading">
                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Estimate Shipping &amp; Taxes <i class="fa fa-caret-down"></i></a> </h4>
              </div>
              <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body">
                  <p>Enter your destination to get a shipping estimate.</p>
                  <form class="form-horizontal">
                    <div class="form-group required">
                      <label for="input-country" class="col-sm-2 control-label">Country</label>
                      <div class="col-sm-10">
                        <select class="form-control" id="input-country" name="country_id">
                          <option value=""> --- Please Select --- </option>
                          
                         
                  
                        
                          <option value="99">India</option>
                         
                        </select>
                      </div>
                    </div>
                    
                    <div class="form-group required">
                      <label for="input-postcode" class="col-sm-2 control-label">Post Code</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="input-postcode" placeholder="Post Code" value="" name="postcode">
                      </div>
                    </div>
                    <input type="button" class="btn pull-right" data-loading-text="Loading..." id="button-quote" value="Get Quotes">
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4 col-sm-offset-8">
            
            <!-- ------Total billing cost -->
              <table class="table table-bordered">
                <tbody>
                  <tr>
                    <td class="text-right"><strong>Sub-Total:</strong></td>
                    <td class="text-right"><sup>&#8377;</sup><fmt:formatNumber type="number" maxIntegerDigits="4" value="${totalPrice}" /></td>
                  </tr>
                  <tr>
                    <td class="text-right"><strong>Discount</strong></td>
                    <td class="text-right"><sup>&#8377;</sup><fmt:formatNumber type="number" maxIntegerDigits="4"  value="${totalDiscount} " /></td>
                  </tr>
                  <tr>
                    <td class="text-right"><strong>Shipping Charge</strong></td>
                    <td class="text-right"><sup>&#8377;</sup>0.00</td>
                  </tr>
                  <tr>
                    <td class="text-right"><strong>Total:</strong></td>
                    	
                    <td class="text-right"><sup>&#8377;</sup><fmt:formatNumber  type="number" minFractionDigits="2" maxFractionDigits="2"  value="${totalPrice-totalDiscount }" /></td>
                  </tr>
                </tbody>
              </table>
              <!-- ----END-------------------------------------------------------- -->
            </div>
          </div>
          <form action="home.jsp">
            <input class="btn pull-left mt_30" type="submit" value="Continue Shopping" />
          </form>
          
         <c:set var="Final"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalPrice-totalDiscount }" /></c:set>
           <form action="pgRedirect.jsp" method="post">
                    <input type="hidden" id="CUST_ID" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="${customer.customerId }">
                    <input  type="hidden" id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail">
                    <input  type="hidden" id="ORDER_ID" tabindex="1" maxlength="20" size="20" name="ORDER_ID" autocomplete="off" value="ORDS_<%= randomInt %>">
                    <input   type="hidden" id="CHANNEL_ID" tabindex="4" maxlength="12" size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
                    <input   type="hidden" title="TXN_AMOUNT" step=".01" tabindex="10" type="text" name="TXN_AMOUNT" value="${Final }">
                    <input class="btn pull-right mt_30" type="submit" value="Checkout" />
                 
                    </form>
           
        </div>
      </div>
       </c:when>
		 
		<c:otherwise>
			<h3>  No Items </h3><br>
		</c:otherwise>
	</c:choose>
      <div id="brand_carouse" class="ptb_30 text-center">
        <div class="type-01">
          <div class="heading-part mb_20 ">
            <h2 class="main_title">Brand Logo</h2>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <div class="brand owl-carousel ptb_20">
                <div class="item text-center"> <a href="#"><img src="images/brand/brand1.png" alt="Disney" class="img-responsive" /></a> </div>
                <div class="item text-center"> <a href="#"><img src="images/brand/brand2.png" alt="Dell" class="img-responsive" /></a> </div>
                <div class="item text-center"> <a href="#"><img src="images/brand/brand3.png" alt="Harley" class="img-responsive" /></a> </div>
                <div class="item text-center"> <a href="#"><img src="images/brand/brand4.png" alt="Canon" class="img-responsive" /></a> </div>
                <div class="item text-center"> <a href="#"><img src="images/brand/brand5.png" alt="Canon" class="img-responsive" /></a> </div>
                <div class="item text-center"> <a href="#"><img src="images/brand/brand6.png" alt="Canon" class="img-responsive" /></a> </div>
                <div class="item text-center"> <a href="#"><img src="images/brand/brand7.png" alt="Canon" class="img-responsive" /></a> </div>
                <div class="item text-center"> <a href="#"><img src="images/brand/brand8.png" alt="Canon" class="img-responsive" /></a> </div>
                <div class="item text-center"> <a href="#"><img src="images/brand/brand9.png" alt="Canon" class="img-responsive" /></a> </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
   
    <!-- =====  CONTAINER END  ===== -->
     
   
<%@include file="footer.jsp" %>