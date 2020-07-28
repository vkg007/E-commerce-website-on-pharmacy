<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.medicine.model.Customer"%>
<%@include file="style.jsp" %>
<%@include file="headerLogout.jsp" %>

<script>
  
 // show modal window to confirm to add shoes to their cart
  function addCart(itemId,itemName,price,discount)
  {
	  
	  
	  document.cartForm.itemId.value = itemId;
	  document.cartForm.itemName.value = itemName;
	  document.cartForm.price.value = price;
	  document.cartForm.discount.value = discount;
	  submitCart();
	
	  //return;
	 	  
  }
  
  // close modal and then form submit
  function submitCart()
  {
	  
		  document.cartForm.submit(); 
	 
  }
  

	
  </script>
 <!-- =====  CONTAINER START  ===== -->
  <c:choose>
    <c:when test="${empty medList }">		 
			<h1> Sorry We don't have it. </h1><br>
</c:when>   	
            <c:otherwise> 
 
  <!-- =====  sale product  ===== -->
          <div id="sale-product">
            <div class="heading-part mb_20 ">
              <h2 class="main_title">Search Result</h2>
            </div>
            <div class="Specials owl-carousel">
            <!-- -JSTL START -->
               <c:forEach var="med" items="${requestScope.medList}" begin="0" step="1" varStatus="status">   
                            <c:if test = "${status.end == 0}">
	  	                    <h1>No Record Found.</h1>
	                           	</c:if>  
                    <!-- ---structure start -->
              <div class="item product-layout product-list">
               <div class="product-thumb">
                 <div class="image product-imageblock"> <a href="ProductDetailController?id=${med.id}"> <img data-name="product_image" src="get_image.jsp?id=${med.id}" alt="iPod Classic" title="iPod Classic" class="img-responsive"><img data-name="product_image" src="get_image.jsp?id=${med.id}" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a></div>
                        <div class="caption product-detail text-left">
                          <h6 data-name="product_name" class="product-name mt_20"><a href="ProductDetailController?id=${med.id}" title="Casual Shirt With Ruffle Hem">${med.name} </a></h6>
                    <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                    <span class="price"><span class="amount"><sup>&#8377;</sup>${med.price }</span>
                    </span>
                  
                    <div class="timer mt_80" >
                      <div class="days"></div>
                      <div class="hours"></div>
                      <div class="minutes"></div>
                      <div class="seconds"></div>
                    </div>
                    <div class="button-group text-center">
                      <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                      <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                      <div class="compare"><a href="#"><span>Compare</span></a></div>
                      <a  href="javascript:addCart('${med.id}','${med.name}','${med.price }','${med.dis }');" ><i class="add-to-cart"></i></a>
                    </div>
                  </div>
                </div>
               
                  
              </div>
               <!-- --JSTL end -->
               </c:forEach>
              </c:otherwise>
             </c:choose>
              
            </div>
          </div>
          <!-- =====  sale product end ===== -->
              <!---------------------- the modal to add cart item ----------------------------------------------------------------------------------> 
                 
                 
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button> 
          <div id="modal_item_title" class="modal-title"></div> 
        </div>
        <div class="modal-body">
          <p>Do you want to add this item?</p>
        </div>
         <!-- form for cart --> 
		<form action="cartController" method="post" name="cartForm">
		 	<input type="hidden" name="category" value="${category}">
		 	<input type="hidden" value="" name="itemId">
		 	<input type="hidden" value="" name="itemName">
		 	<input type="hidden" value="" name="price">
		 	<input type="hidden" value="" name="discount">
		 	<input type="hidden" value="${sessionScope.customer.customerId}" name="customerId">
		 </form> 
        <div class="modal-footer">
        <!-- data-dismiss="modal"  -->
          <button type="button" class="btn btn-default" onClick="javascript:submitCart();">Add to Cart </button>
        </div>
      </div>
    </div>
  </div>
 <!---------------------- END of modal to add cart item ---------------------------------------------------------------------------------->  
 
 <%@include file="footer.jsp" %>