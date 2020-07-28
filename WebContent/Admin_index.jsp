<%-- 
    Document   : admin_index
    Created on : 13 Feb, 2020, 11:39:42 AM
    Author     : vivek
--%>
<%@include file="Admin_header.jsp" %>



            <!-- ----------------------content -->
          
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Add New Products</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="AddProductController">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">All Orders List</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="AdminOrdersController">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">All Customers List</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="AdminCustomerController">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">All Product List</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="AdminproductlistController">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>Recent Orders received</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Order id</th>
                                                <th>Customer Name</th>
                                                <th>Product name</th>
                                                <th>Product id</th>
                                                <th>Postal code</th>
                                                <th>Date</th>
                                                
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Order id</th>
                                                <th>Customer Name</th>
                                                <th>Product name</th>
                                                <th>Product id</th>
                                                <th>Postal code</th>
                                                <th>Date</th>
                                                
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <tr>
                                                <td>16663</td>
                                                <td>vkg0072012@gmail.com</td>
                                                <td>disprine</td>
                                                <td>11104</td>
                                                <td>814112</td>
                                                <td>24-05-2020</td>
                                            </tr>
                                            <tr>
                                               <td>16663</td>
                                                <td>vkg0072012@gmail.com</td>
                                                <td>Augmentin 625mg</td>
                                                <td>11104</td>
                                                <td>814112</td>
                                                <td>24-05-2020</td>
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
               
            <!-- -content end -->
            
        <%@ include file="Admin_footer.jsp" %>
            
  

