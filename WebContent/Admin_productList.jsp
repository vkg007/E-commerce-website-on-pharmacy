<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<%@include file="Admin_header.jsp" %>
<script>
function modifyInfo(customerId, mode)
{

	  var form = document.cartForm;
	   
	  form.itemId.value= customerId;
	  form.mode.value = mode;
	  form.submit(); 

		  
}


// move form to delete order
function delOrder(orderId)
{

	  var form = document.cartForm;
	  form.itemId.value = orderId;
	  form.mode.value = "del";
	  form.submit(); 

		  
}

</script>



 <main>
                    <div class="container-fluid">
                    
                     <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>All Product List</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                
                                <c:choose>
		<c:when test="${!empty medList }"> 
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                            <th>S.no</th>
                                                <th>id</th>
                                                <th>Name</th>
                                                 <th>Price</th>
                                                <th>Discount</th>
                                                 <th>Mf date</th>
                                                <th>Expiry</th>
                                                <th>Drug Name</th>
                                                <th>type Name</th>
                                                <th>action</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                            <th>S.no</th>
                                            <th>Product id</th>
                                                <th>Name</th>
                                                 <th>Price</th>
                                                <th>Discount</th>
                                                 <th>Manufacture date</th>
                                                <th>Expiry</th>
                                                <th>Drug Name</th>
                                                <th>type Name</th>
                                                 <th>action</th>
                                                                                               
                                            </tr>
                                        </tfoot>
                                        <tbody>
          <c:forEach var="med" items="${requestScope.medList}" begin="0" step="1" varStatus="status">
				
				<!-- total price for all items -->
			
			   
				  	<c:if test = "${status.end == 0}">
				  	No List
				  	</c:if>
                                            <tr>
				        <td>${status.count}</td>
				        <td>${med.id}</td>
				         <td>${med.name}</td>
				         <td>${med.price}</td>
				         <td>${med.dis}</td>
				         <td>${med.mf_date}</td>
				         <td>${med.expiry}</td>
				         <td>${med.drug_name}</td>
				         <td>${med.type_name}</td>
				         
				         

				        <td class="active"> 
					       
					  		<button type="button" class="btn btn-warning btn-sm" onClick="javascript:modifyInfo('${med.id}', 'search');">Edit</button>
					  		<button type="button" class="btn btn-danger btn-sm" onClick="javascript:modifyInfo('${med.id}', 'del');">delete</button>
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
        <form action="AdminproductlistController" method="post" name="cartForm"> 
		 	<input type="hidden" value="" name="itemId">
		 	<input type="hidden" value="" name="mode"> 
		</form> 
		 
		
                </main>
               
            <!-- -content end -->
            
        <%@ include file="Admin_footer.jsp" %>