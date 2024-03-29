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

    <link href="resources/bootstrap/css/sb-admin-2.css" rel="stylesheet">
    <!-- Custom styles for this page -->
    <link href="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<style>
    #writeHeader {
        border-bottom: 2px solid;
        margin-bottom: 20px;
    }

</style>
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
            <div id="contents">

                <!-- Topbar -->
                <jsp:include page="/WEB-INF/views/include/topBar.jsp" />
				 <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
   
                    <!-- Content Row -->
                    <div class="row">

                        <!-- Grow In Utility -->
                        <!-- Fade In Utility -->

                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-2  justify-content-between">
                                    <h5>제목 : ${boardMember.title}</h5>
                                    작성자 : ${boardMember.writer.userid}

                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area" style="border-bottom:solid 1px" >
                                        ${boardMember.content}
                                    </div>
                                    <div style="padding-top: 20px">
                                       <h6>댓글</h6>

                                <c:forEach var="replyResult" items="${replyResult}" varStatus="status">
                                    <div id="reply" style="border-bottom: solid 1px; margin-bottom: 20px;">
                                        <P style="color: black"><i class="fa-sharp fa-solid fa-user fa-lg" style="padding-right: 15px"></i><c:out value="${replyResult.writer }"/></P>
                                        <P style="color: black"><c:out value="${replyResult.content }"/></P>
                                        <P id="pid" style="font-size: 12px;" onclick="reply(reply(this));">답글 쓰기</P>
                                        <c:if test="${replyResult.replyMapping != 0}">
                                            <c:if test="${replyResult.replyMapping == replyResult.replyId}">
                                                이게맞다
                                            </c:if>
                                        </c:if>
                                        <div id="boardMember-reply-text" style="display: none">
                                        <input type="hidden"  value="<c:out value="${replyResult.replyId}"/>"/>
                                        <textarea class="boardMember-reply"  placeholder="답글을 남겨보세요.">zz</textarea>
                                        <div style="margin-top: 5px; float:right; margin-bottom: 5px;">
                                            <button type="button" class="btn btn-success btn-sm" onclick="callSave(this);">등록</button>
                                        </div>
                                        </div>
                                     </div>
                                </c:forEach>
                                        <form action="boardReply" method="post">
                                            <input type="hidden" id="writer" name="writer" value="${sessionScope.id}"/>
                                            <input type="hidden" id="boardId" name="boardId" value="${boardMember.boardId}"/>
                                        <textarea class="board-reply" id="content" name="content" placeholder="댓글을 남겨보세요."></textarea>
                                        <div style="margin-top: 5px; float:right;">
                                        <button type="submit" class="btn btn-success btn-sm">등록</button>
                                        </div>
                                        </form>


                                        <form action="boardReply" method="post" id="saved">
                                            <input type="hidden" id="writer" name="writer" value="${sessionScope.id}"/>
                                            <input type="hidden" id="boardId" name="boardId" value="${boardMember.boardId}"/>
                                            <input type="hidden" id="content" name="content" />
                                            <input type="hidden" id="replyMapping" name="replyMapping" />
                                        </form>

                                        </div>
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

     <script>
         function reply(event){
             /*event.nextElementSibling.style.display="block";*/
             if (event.nextElementSibling.style.display=="block"){
                 event.nextElementSibling.style.display="none";
             } else if (event.nextElementSibling.style.display=="none"){
                 event.nextElementSibling.style.display="block";
             }
         }
         function callSave(event){
             let content = event.parentElement.previousElementSibling.value;
             let reply = event.parentElement.previousElementSibling.previousElementSibling.value;
             alert(reply);
                 document.getElementById('replyMapping').value=reply;
                 document.getElementById('replyMapping').previousElementSibling.value=content;
             document.getElementById('saved').submit();

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
     <!-- datatables -->
    <script src="resources/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>
     <script src="resources/bootstrap/js/demo/datatables-demo.js"></script>
</body>

</html>