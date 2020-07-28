
<%@include file="Admin_header.jsp" %>
  <%@include file="style.jsp" %>
   
<main id="contents" class="site-contnts">
   
    <!--Blogs-->
    <section class="row checkout-section">
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <form action="AddProductController?mode=addMF" class="row checkout-form" method="post">
                        
                        <div class="row">
                            <div class="form-group col-sm-12">
                                  <label for="email">License No*</label><br>
                               <input type="text" name="mf_id" id="mf_id" placeholder="Manufacturer License No."  />
                            </div>
                            <div class="form-group col-sm-12">
                              
                                 <label for="email">Manufacturer Name*</label><br>
                                 <input type="text" name="mf_name" id="mf_name" placeholder="Manufacturer name" />
                            </div>
                            <div class="form-group col-sm-12">
                              
                                 <label for="email">Address*</label><br>
                            <textarea name="mf_address"  placeholder="Manufacturer Address" ></textarea>
                            </div>
                            
                            
                             <div class="form-group form-button" id="b1" >
                                <input type="submit" class="btn btn-primary"name="ADD" id="reg"  class="form-submit" value="submit"/>
                            </div>
                            </div>
                      </form>
                            
                      </div>
                       </div> 
                       </div>
                       </section>
                       </main>
                           









    <!-- JS -->
   
   <%@include file="Admin_footer.jsp" %>
   
</body>
</html>