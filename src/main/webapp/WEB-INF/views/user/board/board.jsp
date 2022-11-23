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
                        <div class="col-lg-12">
                            <div class="card shadow mb-10">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">자유 게시판
                                        <a href="boardWrite" style="float:right">글쓰기 &nbsp;&nbsp;&nbsp;</a></h6>

                                </div>
                                <div class="card-body">

                                <table class="table" style="border: 1px">
                                    <thead>
                                    <tr>
                                        <th width="200px">글 번호</th>
                                        <th width="400px">제목</th>
                                        <th width="150px">작성자</th>
                                        <th width="150px">작성 일자</th>
                                        <th width="150px">조회 수</th>
                                        <th width="100px">좋아요</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="boardList" items="${boardList}" varStatus="status">
                                        <tr>
                                            <td style="text-align: center;"><c:out value="${boardList.boardId }"/></td>
                                            <td style="text-align: center;"><c:out value="${boardList.title }"/></td>
                                            <td style="text-align: center;"><c:out value="${boardList.writer }"/></td>
                                            <td style="text-align: center;"><c:out value="${boardList.regDate }"/></td>
                                            <td style="text-align: center;"><c:out value="${boardList.updateDate }"/></td>
                                            <td style="text-align: center;"><c:out value="${boardList.deleteDate }"/></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>




                                </table>
                                    

                                </div>
                            </div>

                        </div>

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