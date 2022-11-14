<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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

    <!-- Custom fonts for this template-->
    <link href="resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">
<input type="hidden" id='sex_man' value='<c:out value="${sex_man}"/>'>
<input type="hidden" id='sex_woman' value='<c:out value="${sex_woman}"/>'>
<input type="hidden" id='Jan' value='<c:out value="${Userincrease.Jan}"/>'>
<input type="hidden" id='Feb' value='<c:out value="${Userincrease.Feb}"/>'>
<input type="hidden" id='Mar' value='<c:out value="${Userincrease.Mar}"/>'>
<input type="hidden" id='Apr' value='<c:out value="${Userincrease.Apr}"/>'>
<input type="hidden" id='May' value='<c:out value="${Userincrease.May}"/>'>
<input type="hidden" id='Jun' value='<c:out value="${Userincrease.Jun}"/>'>
<input type="hidden" id='Jul' value='<c:out value="${Userincrease.Jul}"/>'>
<input type="hidden" id='Aug' value='<c:out value="${Userincrease.Aug}"/>'>
<input type="hidden" id='Sep' value='<c:out value="${Userincrease.Sep}"/>'>
<input type="hidden" id='Oct' value='<c:out value="${Userincrease.Oct}"/>'>
<input type="hidden" id='nov' value='<c:out value="${Userincrease.nov}"/>'>
<input type="hidden" id='Dece' value='<c:out value="${Userincrease.Dece}"/>'>

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/include/sideBar.jsp"/>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <jsp:include page="/WEB-INF/views/include/topBar.jsp"/>

            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">


                <!-- Content Row -->
                <div class="row">

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                            접속자 수
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="sumCnt"><c:out
                                                value="${sumCnt}"/>명
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-comments fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            가입자 수
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${user}"/>명
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">서버 임계치
                                        </div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">1</div>
                                            </div>
                                            <div class="col">
                                                <div class="progress progress-sm mr-2">
                                                    <div class="progress-bar bg-info" role="progressbar"
                                                         style="width: ${sumCnt}%" aria-valuenow="${sumCnt}"
                                                         aria-valuemin="0"
                                                         aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">100</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pending Requests Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                            가장 활발한 채팅방
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out
                                                value="${channel_name}"/></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-comments fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Content Row -->

                <div class="row">

                    <!-- Area Chart -->
                    <div class="col-xl-8 col-lg-7">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">사용자 수 추이</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                         aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">Dropdown Header:</div>
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-area">
                                    <canvas id="myAreaChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pie Chart -->
                    <div class="col-xl-4 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">남녀 비율</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                         aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">Dropdown Header:</div>
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-pie pt-4 pb-2">
                                    <canvas id="myPieChart"></canvas>
                                </div>
                                <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> 남
                                        </span>
                                    <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> 녀
                                        </span>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Content Row -->
                <div class="row">

                    <!-- Content Column -->
                    <div class="col-xl-12 col-lg-9">
                        <!-- DataTales Example -->
                        <div class="card shadow mb-10">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">사용자 목록</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th style="text-align: center;">번호</th>
                                            <th style="text-align: center;">사용자 이름</th>
                                            <th style="text-align: center;">사용자 아이디</th>
                                            <th style="text-align: center;">성별</th>
                                            <th style="text-align: center;">권한</th>
                                            <th style="text-align: center;">로그인 날짜</th>
                                            <th style="text-align: center;">가입 날짜</th>
                                            <th style="text-align: center;">사용자 정보</th>
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

                                        <c:forEach var="showUser" items="${showUser}" varStatus="status">
                                            <tr>
                                                <td style="text-align: center;"><c:out
                                                        value="${showUser.userNum }"/></td>
                                                <td style="text-align: center;"><c:out
                                                        value="${showUser.userName }"/></td>
                                                <td style="text-align: center;"><c:out
                                                        value="${showUser.userid }"/></td>
                                                <td style="text-align: center;"><c:out
                                                        value="${showUser.userSex }"/></td>
                                                <td style="text-align: center;"><c:out
                                                        value="${showUser.userAuth }"/></td>
                                                <td style="text-align: center;"><c:out
                                                        value="${showUser.loginDate }"/></td>
                                                <td style="text-align: center;"><c:out
                                                        value="${showUser.joinDate }"/></td>
                                                <td style="text-align: center;">
                                                    <button class="btn btn-dark btn-sm"
                                                            onclick="infoUser('<c:out value="${showUser.userNum }"/>','' +
                                                                    ' <c:out value="${showUser.userid }"/>');">정보

                                                    </button>
                                                    <button class="btn btn-dark btn-sm" onclick="selectUser('<c:out
                                                            value="${showUser.userNum }"/>');">수정
                                                    </button>
                                                </td>

                                            </tr>
                                        </c:forEach>

                                        </tbody>

                                    </table>
                                    <form action="selectUser" method="post" target="blank" id="frm" name="frm">
                                        <input type="hidden" id="userNum" name="userNum" value="">
                                        <input type="hidden" id="userid" name="userid" value="">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    </form>
                                </div>
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
                        <span>Copyright &copy; Your Website 2021</span>
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
        function selectUser(id) {
            $('input[name=userNum]').attr('value', id);
            document.frm.action = "selectUser";
            document.getElementById('frm').submit();

        }

        function infoUser(userNum, userid) {

            $('input[name=userNum]').attr('value', userNum);
            $('input[name=userid]').attr('value', userid);

            document.frm.action = "infoUser";
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
    <script src="resources/bootstrap/vendor/chart.js/Chart.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/bootstrap/js/demo/chart-area-demo.js"></script>
    <script src="resources/bootstrap/js/demo/chart-pie-demo.js"></script>

    <!-- datatables -->
    <!--     <script src="resources/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script> -->
    <!--     <script src="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script> -->
    <!--      <script src="resources/bootstrap/js/demo/datatables-demo.js"></script> -->


</body>

</html>