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

                                

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">사용자 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th width="10%" style="text-align: center;">번호</th>
                                            <th width="20%" style="text-align: center;">사용자 이름</th>
                                            <th width="30%" style="text-align: center;">사용자 아이디</th>
                                            <th width="10%" style="text-align: center;">성별</th>
                                            <th width="20%" style="text-align: center;">권한</th>                                         
                                            <th width="10%" style="text-align: center;">수정</th>
                                        </tr>
                                    </thead>                                 
                                   
                                    
                                    <c:if test="${showUser.size() == 0 }">
										<tfoot>
											<tr>
										     <td colspan="3">현재 데이터가 없습니다.</td>
											</tr>
										</tfoot>
									</c:if>
									 
									<tbody>
									 
											<tr>
											<td width="10%" ><input class="form-control" type="text" id="user_now" value="${selectUser.user_no }" readonly ></td>
											<td width="20%" ><input class="form-control"  type="text" id="user_namew" value="${selectUser.user_name }" readonly onclick='$(this).removeAttr("readonly");'></td>
											<td width="30%"><input class="form-control" type="text" id="useridw" value="${selectUser.userid }" readonly onclick='$(this).removeAttr("readonly");'></td>
											<td width="10%"><input class="form-control" type="text" id="user_sexw" value="${selectUser.user_sex }" readonly onclick='$(this).removeAttr("readonly");'></td>
											<td width="20%"><input class="form-control" type="text" id="user_authw" value="${selectUser.user_auth }" readonly onclick='$(this).removeAttr("readonly");'></td>											
											<td width="10%" style="text-align: center;"><button class="btn btn-dark btn-sm" onclick="updateUser();">수정</button></td>
										
											</tr>
									     
									</tbody>
								                                                                                                     
                                </table>
                                 <form action="updateUser" method="post" id="frm">
                                 				<input type="hidden" id="user_no" name="user_no" value="">
      											<input type="hidden" id="user_name" name="user_name" value="">
      											<input type="hidden" id="userid" name="userid" value="">
      											<input type="hidden" id="user_sex" name="user_sex" value="">
      											<input type="hidden" id="user_auth" name="user_auth" value="">      							
      											  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>     											
										</form>  
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->         
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
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
    
     <script> 
   function updateUser(){
	   
	var user_no = document.getElementById('user_now').value;
	var user_name = document.getElementById('user_namew').value;
	var userid = document.getElementById('useridw').value;
	var user_sex = document.getElementById('user_sexw').value;
	var user_auth = document.getElementById('user_authw').value;
	
	   
		$('input[name=user_no]').attr('value',user_no);
	    $('input[name=user_name]').attr('value',user_name);
        $('input[name=userid]').attr('value',userid);
        $('input[name=user_sex]').attr('value',user_sex);
        $('input[name=user_auth]').attr('value',user_auth);
      
        document.getElementById('frm').submit();

   }
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
    <script src="resources/bootstrap/js/demo/datatables-demo.js"></script>
    
</body>

</html>