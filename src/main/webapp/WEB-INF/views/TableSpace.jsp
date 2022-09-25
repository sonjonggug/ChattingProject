<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>bookmark test</title>
		<link rel="stylesheet" href="/resources/css/adminlte.css">
		<link rel="stylesheet" href="/resources/css/all.css">
		<link rel="stylesheet" href="/resources/css/eom.css">
		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/adminlte.min.js"></script>
		<script src="/resources/js/bootstrap.bundle.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
		
<script>
window.onload = function(){

	const name = new Array();
	const usepercent = new Array();
	const freespace = new Array();
	<c:forEach var= "space" items= "${TableSpace}" > 
	name.push("${space.TABLESPACE}");
	usepercent.push("${space.USEPERCENT}");
// 	arr.push({ TABLESPACE :"${space.TABLESPACE}"
//     	       ,USEPERCENT : "${space.USEPERCENT}"
//                ,FREESPACE : "${space.FREESPACE}"});
   </c:forEach>	

const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
	
    type: 'bar',
    data: {
        labels: [name[0],name[1],name[2],name[3],name[4]],
        datasets: [{
            label: '테이블 스페이스 사용률',
            fill: true,
            data: [usepercent[0],usepercent[1],usepercent[2],usepercent[3],usepercent[4]],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',               
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',              
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
})};
function show(){
	document.getElementById("bb").style.display = ''; // show
};
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
	<body class="hold-transition layout-top-nav">
	
    

		<div class="wrapper">
			<!-- header -->
			<nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
				<div class="container">
					
					
				</div>
			</nav>

			<!-- body -->
			<div class="content-wrapper">
				<div class="content-header"></div>
				<div class="content">
					<div class="container">
						<div class="row">
							<div class="col-12 col-sm-12">
								<div class="card card-primary card-tabs">
									<div class="card-header p-0 pt-1">
										
									</div>
									
									<div class="card-body">
										<div class="tab-content" id="custom-tabs-one-tabContent">
										<!-- 1차 -->
											<div class="tab-pane fade show active" id="custom-tabs-one-home" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4><c:out value="${name}"></c:out></h4>
														</div>													
													</div>
													
													 <canvas id="myChart" width="400" height="200"></canvas>
													  <h4 class="text-center"  onclick="show();">상세 보기</h4>	
													<table class="table projects"  style="display:none" id="bb">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																		<th style="width: 250px">데이터 베이스</th>
																<th style="width: 180px">최대 용량</th>
																<th style="width: 140px">사용량</th>
																<th style="width: 130px">남은 용량</th>
																<th style="width: 200px">사용률</th>
																
															</tr>
														</thead>													
																											 													
														<tbody>												  
														 <c:forEach  var="space" items="${TableSpace}">
															<tr class="text-center">
															<td>${space.TABLESPACE}(MB)</td>
													          <td>${space.TOTALSPACE}(MB)</td>
													          <td>${space.USESPACE}(MB)</td>
													          <td>${space.FREESPACE}(MB)</td>
													          <td>${space.USEPERCENT}%</td>
													          
															</tr>
														  </c:forEach>
															
														</tbody>
													</table>
												</div>
											
												</div>
											</div>

	        </div></div></div></div></div></div></div></div>
			
		
	</body>
</html>
