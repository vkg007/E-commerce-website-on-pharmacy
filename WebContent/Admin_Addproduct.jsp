<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<%@include file="style1.jsp" %>
</head>
<style>
* {
  box-sizing: border-box;
}

body {
  background-color: #f1f1f1;
}

#regForm {
  background-color: #ffffff;
  margin: 100 auto;
  font-family: Raleway;
  padding: 40px;
  width: 40%;
  min-width: 100px;
}

h1 {
  text-align: center;  
}

input {
  padding: 10px;
  width: 100%;
  font-size: 25px;
  font-family: Raleway;
  border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
  background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
  display: none;
}

button {
  background-color: #4CAF50;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  font-size: 17px;
  font-family: Raleway;
  cursor: pointer;
}

button:hover {
  opacity: 0.8;
}

#prevBtn {
  background-color: #bbbbbb;
}

/* Make circles that indicate the steps of the form: */
.step {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbbbbb;
  border: none;  
  border-radius: 50%;
  display: inline-block;
  opacity: 0.5;
}

.step.active {
  opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
  background-color: #4CAF50;
}
</style>
<script>
function MsgLoginValid() {

	// validate null value 
	if (document.getElementById("name").value == ""
			|| document.getElementById("price").value == ""
				|| document.getElementById("discount").value == "") {
	alert("please enter all details");
		return;
	} else {
		// submit form  
		var form = document.regForm;

			form.action = "AddProductController";
		

		form.submit();
	}

}
</script>
<%@include file="Admin_header.jsp" %>
<main>
  <div class="container-fluid">

<form id="formADD" action="AddProductController?mode=addtype" method="POST"></form>
<form id="formCAT" action="AddProductController?mode=addCAT" method="POST"></form>
<form id="formSEG" action="AddProductController?mode=addSEG" method="POST"></form>
<form id="formDRUG" action="AddProductController?mode=addDRUG" method="POST"></form>
<form id="formMF" action="AddProductController?mode=addMF" method="POST"></form>
<br>
<br>
<h1>ADD PRODUCT </h1>
<form method="post" action="AddProductController" enctype="multipart/form-data" id="regForm">
 
  <!-- One "tab" for each step in the form: -->
  
  <div class="tab">
   <h1>Details</h1>
          <div class="form-select">
                            <label for="country" class="form-label">Product Type</label><br>
                            <select name="type" id="type"onchange="showDiv1('target', this)">
                            <option value="" >select Type</option>    
                           <c:forEach var="med" items="${requestScope.medtype}" begin="0" step="1" varStatus="status"> 
                            <c:if test = "${status.end == 0}">
	  	                    <h1> No list</h1>
	                           	</c:if>
	                           		  
                                <option value="${med.type_id}">${med.type_name}</option>
                             </c:forEach>
                             <option value="-1">Add new</option>
                            </select><br><br>
                         
            </div>
      
       <div id="target" style="display: none"  >
                            <br>
                           
                            <input type="text" name="type_name"  placeholder="type name"  form="formADD" /><br>
                            <br>
                            <input type="submit" name="button1" value="ADD" form="formADD" />
                           
                        </div>
      
       <div class="form-select">
                            <label for="category" class="form-label">category</label><br>
                            <select name="category" id="category"  onchange="showDiv2('target2', this)">
                          	<option value="" >select category</option>      
                             <c:forEach var="med" items="${requestScope.medcat}" begin="0" step="1" varStatus="status"> 
                            <c:if test = "${status.end == 0}">
	  	                    <h1> No list</h1>
	                           	</c:if>
                                <option value="${med.cat_id}">${med.cat_name}</option>
                                 </c:forEach>
                             <option value="-1">Add new</option>
                            </select><br><br>
           
                        </div>
                            <div id="target2" style="display: none" >
                            <br><br>
                            
                            <input type="text" name="cat"  placeholder="Like alimentary,respiratory..." form="formCAT"/><br>
                             <input type="submit" name="button1" value="ADD" form="formCAT" />
                        </div>
      
      <div class="form-select">
                            <label for="segment" class="form-label">Segment</label><br>
                            <select name="segment" id="segment"  onchange="showDiv4('target4', this)">
                             <option value="" >select segment name</option>   
                             <c:forEach var="med" items="${requestScope.medseg}" begin="0" step="1" varStatus="status"> 
                            <c:if test = "${status.end == 0}">
	  	                    <h1> No list</h1>
	                           	</c:if> 
                                <option value="${med.seg_id}">${med.seg_id}-${med.seg_name}</option>
                                 </c:forEach>
                             <option value="-1">Add new</option>
                            </select><br><br>
                        </div>
                            <div id="target4" style="display: none" >
                            <br><br>
                            
                            <input type="text" name="seg2"  placeholder="Like ayurvedic,generic...." form="formSEG" /><br>
                           <input type="submit" name="button1" value="ADD" form="formSEG" />
                        </div>
      
  </div>
  <div class="tab">
   <h1>Details</h1>
      <div class="form-select">
                            <label for="drug" class="form-label">Drug Name</label>
                            <select name="drug" id=""  onchange="showDiv3('target3', this)">
                            	<option value="" >select Drug Name</option>  
                             <c:forEach var="med" items="${requestScope.meddrug}" begin="0" step="1" varStatus="status"> 
                            <c:if test = "${status.end == 0}">
	  	                    <h1> No list</h1>
	                           	</c:if>    
                                <option value="${med.drug_id}">${med.drug_name}</option>
                                 </c:forEach>
                             <option value="-1">Add new</option>
                            </select><br><br>
                        </div>
    <div id="target3" style="display: none" >
                              
                            <div>
                          <br>
                            <input type="text" name="drug_name" id="drug_name" placeholder="Like Hydroxycholoroquine..."form="formDRUG" />
                            </div>
                                
                                 <div class="form-textarea">
                           <br>
                            <textarea name="desc"  placeholder="Enter Drug Description" form="formDRUG" ></textarea>
                              </div>
                                <br>
                                <input type="submit" name="button1" value="ADD" form="formDRUG"  />
                                
   </div>
      
      
      <div class="form-select">
                            <label for="mf" class="form-label">Manufacturer Name</label>
                            
                            <select name="mf" id="category"  onchange="showDiv5('target5', this)">
                             <option value="" >select Manufacturer</option>   
                             <c:forEach var="med" items="${requestScope.medmf}" begin="0" step="1" varStatus="status"> 
                            <c:if test = "${status.end == 0}">
	  	                    <h1> No list</h1>
	  	                    
	                           	</c:if> 	 
                                <option value="${med.mf_id}">${med.mf_name}</option>
                                 </c:forEach>
                             <option value="-1">Add new</option>
                            </select>
                        </div>
    <div id="target5" style="display: none" >
                                
                           <div>
                          <br>
                            <input type="text" name="mf_id" id="mf_id" placeholder="Manufacturer License No." form="formMF" />
                           
                            </div>
                            <div>
                          <br>
                            <input type="text" name="mf_name" id="mf_name" placeholder="Manufacturer name" form="formMF"/>
                            </div>
                                
                                 <div class="form-textarea">
                           <br>
                            <textarea name="mf_address"  placeholder="Manufacturer Address" form="formMF"></textarea>
                              </div>
                                <br>
                                <input type="submit" name="button1" value="ADD" form="formMF" />
                                
   </div>
      
      
     
      
  </div>
  <div class="tab">
   <h1>Product Info</h1>
                <div class="form-group">
                  <label for="focusedInput"> Name : </label><br>
                  <input class="form-control" type="text" id="itemName" size="50" placeholder="Enter  name (50 characters)" name="name"  maxlength="50"> 
                  </div> 
      
            <div class="form-group">
                            <label for="price" class="form-label">MRP</label> <br>
                            <input class="form-control" type="number" name="price"  id="price" placeholder="price" />
                              <input type="hidden" name="mode"  value="insert"  />
                            </div>
      
       <div class="form-group">
                            <label for="discount" class="form-label">Discount</label> <br>
                            <input class="form-control"type="number" name="discount" id="discount" placeholder="discount price" />
                        </div>
      
            <div class="form-group">
                            <label for="mf-date" class="form-label">Manufacturing Date</label> <br>
                            <input class="form-control" type="date" name="mf_date" id="mf_date" placeholder="Date of Manufacturing" />
                        </div>
       <div class="form-group">
                            <label for="expiry_date" class="form-label">Expiry Date</label> <br>
                            <input class="form-control" type="date" name="expiry_date" id="expiry_date" placeholder="Date of expiry" />
                        </div>
                         <br>
                <div class="form-group">
                            <label for="your_avatar" class="form-label">Upload Image</label> <br>
                            <div class="form-file">
                                <input type="file" name="image" id="image" class="custom-file-input" />
                                <span id='val'></span>
                                <span id='button'>Select image</span>
                            </div>
                    </div>
                      
  </div>
 
  <div style="overflow:auto;">
    <div style="float:right;">
      <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
      <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
    </div>
  </div>
  <!-- Circles which indicates the steps of the form: -->
  <div style="text-align:center;margin-top:40px;">
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
   
  </div>
</form>

<script>
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Submit";
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    document.getElementById("regForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
 
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}
 function showDiv1(target, element)
{
    document.getElementById(target).style.display = element.value == -1 ? 'block' : 'none';
}
function showDiv2(target2, element)
{
    document.getElementById(target2).style.display = element.value == -1 ? 'block' : 'none';
}
function showDiv3(target3, element)
{
    document.getElementById(target3).style.display = element.value == -1 ? 'block' : 'none';
}
function showDiv4(target4, element)
{
    document.getElementById(target4).style.display = element.value == -1 ? 'block' : 'none';
}
    function showDiv5(target5, element)
{
    document.getElementById(target5).style.display = element.value == -1 ? 'block' : 'none';
}
    
    
    
</script>
</div>
</main>
<%@include file="Admin_footer.jsp" %>
