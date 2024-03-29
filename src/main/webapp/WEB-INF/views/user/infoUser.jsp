<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

          <!-- Sidebar -->
        <jsp:include page="/WEB-INF/views/include/sideBar.jsp" />
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <jsp:include page="/WEB-INF/views/include/topBar.jsp" />
				 <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
   
                    <!-- Content Row -->
                    <div class="row">

                        <!-- Grow In Utility -->
                        <!-- Fade In Utility -->
                        <div class="col-lg-5">

                            <div class="card position-relative">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">사용자 정보</h6>
                                </div>
                                <div class="card-body">
                                
                                	   
								                                                             
                                    <div class="form-inline form-group" >
								      <label for="phone_num" class="col-sm-2 control-label">아이디 : </label>
								      <div class="col-sm-10">
								       <input type="text" class="form-control" id="phone_num" name="phone_num" value="${selectUser.userid }" readonly>
								      </div>
								     </div>
								     
								     <div class="form-inline form-group" >
								      <label for="phone_num" class="col-sm-2 control-label">이름 : </label>
								      <div class="col-sm-10">
								       <input type="text" class="form-control" id="phone_num" name="phone_num" value="${selectUser.userName }" readonly>
								      </div>
								     </div>
								     
								      <div class="form-inline form-group" >
								      <label for="phone_num" class="col-sm-2 control-label">권한 : </label>
								      <div class="col-sm-10">
								       <input type="text" class="form-control" id="phone_num" name="phone_num" value="${selectUser.userAuth }" readonly>
								      </div>
								     </div>
								     
								     <div class="form-inline form-group" >
								      <label for="phone_num" class="col-sm-2 control-label">성별 : </label>
								      <div class="col-sm-10">
								       <input type="text" class="form-control" id="phone_num" name="phone_num" value="${selectUser.userSex }" readonly>
								      </div>
								     </div>
								     
								     <div class="form-inline form-group" >
								      <label for="phone_num" class="col-sm-2 control-label">가입 : </label>
								      <div class="col-sm-10">
								       <input type="text" class="form-control" id="phone_num" name="phone_num" value="${selectUser.joinDate }" readonly>
								      </div>
								     </div>
								     <div class="form-inline form-group" >
								      <label for="phone_num" class="col-sm-2 control-label">로그인 : </label>
								      <div class="col-sm-10">
								       <input type="text" class="form-control" id="phone_num" name="phone_num" value="${selectUser.loginDate }" readonly>
								      </div>
								     </div>
                                    
                                    
<!--                                     <div class="small mb-1">Dropdown Button Example:</div> -->
<!--                                     <div class="dropdown mb-4"> -->
<!--                                         <button class="btn btn-primary dropdown-toggle" type="button" -->
<!--                                             id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" -->
<!--                                             aria-expanded="false"> -->
<!--                                             Dropdown -->
<!--                                         </button> -->
<!--                                         <div class="dropdown-menu animated--fade-in" -->
<!--                                             aria-labelledby="dropdownMenuButton"> -->
<!--                                             <a class="dropdown-item" href="#">Action</a> -->
<!--                                             <a class="dropdown-item" href="#">Another action</a> -->
<!--                                             <a class="dropdown-item" href="#">Something else here</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <p class="mb-0 small">Note: This utility animates the CSS opacity property, meaning -->
<!--                                         it will override any existing opacity on an element being animated!</p> -->
                                </div>
                            </div>

                        </div>

                        <!-- Fade In Utility -->
                        <div class="col-lg-7">

                            <div class="card position-relative">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">채팅 정보</h6>
                                </div>
                                <div class="card-body">                                                                    
                                   <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>                                        	                                            
                                            <th style="text-align: center;">아이디</th>
                                            <th style="text-align: center;">메시지</th>
                                            <th style="text-align: center;">보낸 시간</th>
                                            <th style="text-align: center;">답변</th>
                                            <th style="text-align: center;">답변 시간</th>                                            
                                        </tr>
                                    </thead>                                 
                                   
                                    
                                    <%--<c:if test="${chattLog.size() == 0 }">
										<tfoot>
											<tr>
										     <td colspan="3">채팅내역이 없습니다.</td>
											</tr>
										</tfoot>
									</c:if>--%>
									 
									<tbody>
									
										<c:forEach var="chattingLog" items="${chattingLog}" varStatus="status">
											<tr>											    												
												<td style="text-align: center;"><c:out value="${chattingLog.userid }"/></td>
												<td style="text-align: center;"><c:out value="${chattingLog.userMsg }"/></td>
												<td style="text-align: center;"><c:out value="${chattingLog.userSendDate }"/></td>
												<td style="text-align: center;"><c:out value="${chattingLog.result }"/></td>
												<td style="text-align: center;"><c:out value="${chattingLog.sendDate }"/></td>
											</tr>
										</c:forEach>
										
									</tbody>
								                                                                                                     
                                </table>                                                          
                            </div>
<!-- 								      <div class="small mb-1">Dropdown Button Example:</div> -->
<!--                                     <div class="dropdown mb-4"> -->
<!--                                         <button class="btn btn-primary dropdown-toggle" type="button" -->
<!--                                             id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" -->
<!--                                             aria-expanded="false"> -->
<!--                                             Dropdown -->
<!--                                         </button> -->
<!--                                         <div class="dropdown-menu animated--fade-in" -->
<!--                                             aria-labelledby="dropdownMenuButton"> -->
<!--                                             <a class="dropdown-item" href="#">Action</a> -->
<!--                                             <a class="dropdown-item" href="#">Another action</a> -->
<!--                                             <a class="dropdown-item" href="#">Something else here</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <p class="mb-0 small">Note: This utility animates the CSS opacity property, meaning -->
<!--                                         it will override any existing opacity on an element being animated!</p> -->

                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

     </script>
 <!-- Bootstrap core JavaScript-->
    <script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/bootstrap/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
<!--     <script src="resources/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script> -->
<!--     <script src="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script> -->

    <!-- Page level custom scripts -->
     <!-- datatables -->
    <script src="resources/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>
     <script src="resources/bootstrap/js/demo/datatables-demo.js"></script>
</body>

</html>