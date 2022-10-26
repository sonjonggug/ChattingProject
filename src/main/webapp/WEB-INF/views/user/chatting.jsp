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

    <title>SB Admin 2 - Dashboard</title>
    <link rel='stylesheet' type='text/css' href='resources/css/chatt1.css'>
    <!-- Custom fonts for this template-->
    <link href="resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/bootstrap/css/sb-admin-2.css" rel="stylesheet">
    <!-- 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
			<link rel="stylesheet" href="/resources/css/all.css">
	 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
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

                        <!-- Content Column -->
                        <div class="col-xl-12 col-lg-9">
                           <!-- DataTales Example -->
                    <div class="card shadow mb-10" >
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">사용자 목록</h6>
                        </div>                                     		
												
                       <div class="card-chatt" id='talk'></div>
						<textarea class='card-send' id='msg' name='msg' ></textarea>
						<input type='hidden' value='전송' id='btnSend'>						
						<input type='hidden' value='${sessionScope.id} 님이 입장하셨습니다.' id='alram1' name='alram1'>
						<input type='hidden' value='${sessionScope.id} 님이 퇴장하셨습니다.' id='exitAlram'>
						<input type='hidden' id="channel" name="channel" value='${sessionScope.channel}'>
						    <input type='hidden' id='mid' name="mid" value='${sessionScope.id}' readonly>
							<input type='hidden' value='로그인' id='btnLogin' >
							<button type="button" onclick="Session();">${sessionScope.Count}</buttion>
								
                        
                    </div>
                    </div>
                </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
          <jsp:include page="/WEB-INF/views/include/footer.jsp" />
            <!-- End of Footer -->

        </div>      
    </div>
    

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

	<script src='resources/js/chatt1.js'></script>
	<script src='resources/js/api.js'></script>
</body>

</html>