<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <%@include file="style.jsp" %>
 <%@include file="headerLogout.jsp" %>

<meta charset="ISO-8859-1">
<title>Online Pharmacy</title>
<script>
  
  // move form to add quantity
  function modifyOrder(orderId, quantity, mode)
  {
 
	  var form = document.cartForm;
	  
	  form.orderId.value = orderId; 
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


<main id="contents" class="site-contnts">

<section class="row shopping-cart">
        
        <div class="container">
 <h2 style="color:blue" >My Orders List<h2>
              
			<c:choose>
		<c:when test="${!empty ordersList }"> 
			
            <div class="table-responsive cart-table-responsive">
                <table class="table cart-table">
                    <thead>
                        <tr>
                            <th>Item Description</th>
                            <th>Price</th>
                             <th>Quantity</th>
                            <th>Discount</th>
                            <th>Total</th>
                             <th>Order Date</th>
                            <th>order Status</th>
                             <th>Cancel </th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    
      

		<!-- /////////////    Order List Start  : forEach  /////////////// -->
		 
			<c:set var="total" value="${0}"/>
			
			<c:forEach var="orders" items="${requestScope.ordersList}" begin="0" step="1" varStatus="status">
				
				<!-- total price for all items -->
				<c:set var="total" value="${total + orders.price}" />
			  
				  
				  	 
				  	<c:if test = "${status.end == 0}">
				  	No List
				  	</c:if>
			  
                    
                    <!-- --structue start--------------------------------------- -->
                        <tr class="alert" role="alert">
                            <td class="media">
                                <div class="media-left"><a href="product-details.html" class="media-object">${status.count}&nbsp;<img src="get_image.jsp?id=${orders.itemId}" height="500" width="200"alt=""></a></div>
                                <div class="media-body media-middle">${orders.itemName}</div>
                            </td>
                            <td><sup>&#8377;</sup><fmt:formatNumber type="number" maxIntegerDigits="4" value="${orders.price/orders.quantity}" /></td>
                            <td>
                                <div class="input-group number-spinner">
                                   
                                    <input type="text" class="form-control text-center" value=" ${orders.quantity}">
                                    
                                </div>
                            </td>
                            <td>${orders.discount}</td>
                            <td><sup>&#8377;</sup><fmt:formatNumber type="number" maxIntegerDigits="4" value="${orders.price -orders.quantity*orders.discount }" /></td>
                            <td>${orders.date }</td>
                            <td>${orders.orderStatus}</td>
                             <td>
                                <button type="button"  onClick="javascript:delOrder('${orders.orderId}');"class="close" data-dismiss="alert" aria-label="Close">Remove</button>
                            </td>
                        </tr>
                      <!-- --structue end--------------------------------------- -->
                   </c:forEach>   
                      
             
                      
                      
                    </tbody>
                </table>
            </div>
            
           <br>
           <br>
            <div class="row">                
                <div class="col-sm-6 pull-right cart-total-box">
                 <h4>shipping Address:</h4>
                 <div class="cart-infos">
                  <b>Address :</b>  
                       ${sessionScope.customer.address}	 
	  	 
	  	             <br> 
		           <b>City :</b>  

		             ${sessionScope.customer.city}	<br>
		 
		               <b>Postal Code :</b>  
		 
	  	                  ${sessionScope.customer.postalCode} <br><br>
	  	               </div>
	  	                 <p class="text-right"><a href="EditProfile.jsp" class="btn btn-primary">Change Address</a></p>
                    <h4> Total Cost</h4>
                    <div class="cart-infos">
                       <p>Sub Total <span class="pull-right price-span"><sup>&#8377;</sup><fmt:formatNumber type="number" maxIntegerDigits="4" value="${total }" /></span></p>
                        <p>Shipping <span class="pull-right"><sup>&#8377;</sup> 0</span></p>
                        <p>Order Total <span class="pull-right price-span"><sup>&#8377;</sup><fmt:formatNumber type="number" maxIntegerDigits="4" value="${total }" /></span></p>
                    </div>
                   
                </div>
                </div>
                </c:when>
		 
		<c:otherwise>
			<h3>  No Items </h3><br>
		</c:otherwise>
	</c:choose>
            </div>
         <!-- form to edit and delete --> 
		<form action="MyOrderController" method="post" name="cartForm"> 
		 	<input type="hidden" value="" name="orderId">
		 	<input type="hidden" value="" name="mode">
		 	<input type="hidden" value="" name="quantity"> 
		</form> 
        F
        
    
    </section>
           
    
            
	
    
</main>

</body>
 <%@include file="footer.jsp" %>  
</html>