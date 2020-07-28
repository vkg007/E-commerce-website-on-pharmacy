<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<%@include file="Admin_header.jsp" %>
<script>
function modifyOrder(orderId, orderStatus)
{

	  var form = document.cartForm;
	  
	  form.orderId.value = orderId; 
	  form.orderStatus.value= orderStatus;
	  form.mode.value = "status";
	  form.submit(); 

		  
}
function delOrder(orderId)
{

	  var form = document.cartForm;
	  form.orderId.value = orderId;
	  form.mode.value = "del";
	  form.submit(); 

		  
}


</script>



 <main>
                    <div class="container-fluid">
                    
                     <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>All Orders List</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                
                                <c:choose>
		<c:when test="${!empty ordersList }"> 
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                            <th>S.no</th>
                                                <th>Order id</th>
                                               <th>Product name</th>
                                                 <th>Product Price</th>
                                                <th>quantity</th>
                                                 <th>Customer id</th>
                                                <th>Order status</th>
                                                <th>OrderDate</th>
                                                <th>action</th>
                                                
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                            <th>S.no</th>
                                                 <th>Order id</th>
                                               <th>Product name</th>
                                                 <th>Product Price</th>
                                                <th>quantity</th>
                                                 <th>Customer id</th>
                                                <th>Order status</th>
                                                <th>OrderDate</th>
                                                <th>action</th>
                                                
                                            </tr>
                                        </tfoot>
                                        <tbody>
          <c:forEach var="orders" items="${requestScope.ordersList}" begin="0" step="1" varStatus="status">
				
				<!-- total price for all items -->
			
			   
				  	<c:if test = "${status.end == 0}">
				  	No List
				  	</c:if>
                                            <tr>
				        <td>${status.count}</td>
				        <td>${orders.orderId}</td>
				         <td>${orders.itemName}</td>
				         <td><sup>&#8377;</sup>${orders.price}</td>
				         <td>${orders.quantity }</td>
				         <td>${orders.customerId}</td>
				        <td>${orders.orderStatus}</td>
				         <td>${orders.date}</td>

				        <td class="active"> 
					        <button type="button" class="btn btn-info btn-sm" onClick="javascript:modifyOrder('${orders.orderId}', 'In-Process');">In-Process</button>
					  		<button type="button" class="btn btn-warning btn-sm" onClick="javascript:modifyOrder('${orders.orderId}', 'Delivered');">Delivered</button>
					  		<button type="button" class="btn btn-danger btn-sm" onClick="javascript:delOrder('${orders.orderId}');">delete</button>
					    </td>
				      </tr> 
				      	</c:forEach>
                                            
                                        </tbody>
                                    </table>
                                    	</c:when>
		 
		<c:otherwise>
			<h3>  No Items </h3><br>
		</c:otherwise>
	</c:choose>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                        <!-- form to edit and delete --> 
		<form action="AdminOrdersController" method="post" name="cartForm"> 
		 	<input type="hidden" value="" name="orderId">
		 	<input type="hidden" value="" name="mode">
		 	<input type="hidden" value="" name="quantity"> 
		 	<input type="hidden" value="" name="orderStatus"> 
		</form> 
		
                </main>
               
            <!-- -content end -->
            
        <%@ include file="Admin_footer.jsp" %>