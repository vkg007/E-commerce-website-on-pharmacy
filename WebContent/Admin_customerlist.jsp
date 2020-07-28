<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<%@include file="Admin_header.jsp" %>
<script>
function modifyInfo(customerId, mode)
{

	  var form = document.cartForm;
	   
	  form.customerId.value= customerId;
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



 <main>
                    <div class="container-fluid">
                    
                     <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>All Customer List</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                
                                <c:choose>
		<c:when test="${!empty customerList }"> 
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                            <th>S.no</th>
                                                <th>Customer id</th>
                                                <th>Customer name</th>
                                                 <th>Customer mobile</th>
                                                <th>Customer address</th>
                                                 <th>Customer city</th>
                                                <th>Customer postalcode</th>
                                                <th>action</th>
                                                
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                            <th>S.no</th>
                                                <th>Customer id</th>
                                                <th>Customer name</th>
                                                 <th>Customer mobile</th>
                                                <th>Customer address</th>
                                                 <th>Customer city</th>
                                                <th>Customer postalcode</th>
                                                <th>action</th>                                                
                                            </tr>
                                        </tfoot>
                                        <tbody>
          <c:forEach var="customer" items="${requestScope.customerList}" begin="0" step="1" varStatus="status">
				
				<!-- total price for all items -->
			
			   
				  	<c:if test = "${status.end == 0}">
				  	No List
				  	</c:if>
                                            <tr>
				        <td>${status.count}</td>
				        <td>${customer.customerId}</td>
				         <td>${customer.userName}</td>
				         <td>${customer.mob}</td>
				         <td>${customer.address }</td>
				         <td>${customer.city}</td>
				        <td>${customer.postalCode}</td>
				         

				        <td class="active"> 
					       
					  		<button type="button" class="btn btn-warning btn-sm" onClick="javascript:modifyInfo('${customer.customerId}', 'search');">Edit</button>
					  		<button type="button" class="btn btn-danger btn-sm" onClick="javascript:modifyInfo('${customer.customerId}', 'del');">delete</button>
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
        <form action="AdminCustomerController" method="post" name="cartForm"> 
		 	<input type="hidden" value="" name="customerId">
		 	<input type="hidden" value="" name="mode"> 
		</form> 
		 
		
                </main>
               
            <!-- -content end -->
            
        <%@ include file="Admin_footer.jsp" %>