
<%@include file="Admin_header.jsp" %>
  <%@include file="style.jsp" %>
   
<main id="contents" class="site-contnts">
   
    <!--Blogs-->
    <section class="row checkout-section">
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <form action="AddProductController?mode=addSEG" class="row checkout-form" method="post">
                        
                        <div class="row">
                            <div class="form-group col-sm-12">
                                  <label for="email">Name*</label>
                                <input class="form-control"  width="100" type="text" name="seg2"  placeholder="Like ayurvedic,generic...."/>
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