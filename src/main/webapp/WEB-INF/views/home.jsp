<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>EnterPrise Operating Manager</title>
		<link rel="stylesheet" href="/resources/css/adminlte.css">
		<link rel="stylesheet" href="/resources/css/all.css">
		<link rel="stylesheet" href="/resources/css/eom.css">
		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/adminlte.min.js"></script>
		<script src="/resources/js/bootstrap.bundle.min.js"></script>
</head>
	<body class="hold-transition layout-top-nav">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
function SSH(obj) {
	var tttt = $(obj).parent().prev();
	var child = $(tttt).find("input[type=radio]:checked");	
	var ip =$(child).attr("data-ip");
	var id =$(child).attr("data-id");
	var pw =$(child).attr("data-pw");
	var port =$(child).attr("data-port");						
	var URL = "nnssh:// -ssh -l"+ " "+ id + " "+ "-pw" + " "+ pw +" "+"-P" + " " + port +" "+ ip;		
	console.log(URL);	
	
	if(URL.indexOf('undefined') > 0){
		alert("계정이 선택되지 않았습니다.")
		return false;
	}
	
	location.href=URL;

}	

function SFTP(obj) {
	var tttt = $(obj).parent().prev();
// 	var child = $(tttt).children("input[type=radio]:checked");
    var child = $(tttt).find("input[type=radio]:checked");	
	var ip =$(child).attr("data-ip");
	var id =$(child).attr("data-id");
	var pw =$(child).attr("data-pw");
	var port =$(child).attr("data-port");						
	var URL = "nnsftp://sftp://" + id + ":"+ pw +"@"+ ip + ":"+port;
	console.log(URL);
	
	if(URL.indexOf('undefined') > 0){
		alert("계정이 선택되지 않았습니다.")
		return false;
	}
	
		location.href=URL;

}

function batDownload() {
	if (confirm("반드시 \"관리자권한\"으로 실행해주시기 바랍니다.")) {
		location.href="/attachFile?fileName=NeonexSoft_v0.2.bat";
	}
}

function popup(url){
      
      var name = "TableSpace";
      var option = "width = 800, height = 800, top = 150, left = 350"
      window.open(url, name, option);
              
}
// window.onload = function(){
//     $.ajax({
//         type : "GET",            // HTTP method type(GET, POST) 형식이다.
//         url : "/TableSpaceJson",      // 컨트롤러에서 대기중인 URL 주소이다.
//         success : function(data){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.           
//              alert(data.TableSpace); 
        
//         $.each(data,function(index, value) { // 값이 여러개 일 때는 반복문 사용
//              	alert(index);
//                 alert(value.TableSpace); 
// //              	alert(value.TableSpace); 
// //                 alert(value.content);
//              }
//         },
//         error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
//             alert("통신 실패.")
//         }
//     });
// }
</script>
		<div class="wrapper">
			<!-- header -->
			<nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
				<div class="container">
					<a href="#" class="navbar-brand">
					<h2><span class="brand-text font-weight-light">Enterprise Operating Manager</span></h2>
					</a>
					<ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
					    
						<li class="nav-item"><button type="button" class="btn btn-block btn-outline-primary btn-xs" onclick="javascript:void(0); batDownload();">BAT 다운로드</button></li>
<!-- 						<li class="nav-item"><button type="button" class="btn btn-block btn-outline-primary btn-xs" onclick="LogConnect('/LogConnect');">로그 접속</button></li> -->
					</ul>
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
										<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
											<!-- <li class="pt-2 px-3"><span>프로젝트 : </span></li> -->
											<li class="nav-item"><a class="nav-link active" id="custom-tabs-one-home-tab" data-toggle="pill" href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home" aria-selected="true">1차팜</a></li>
											<li class="nav-item"><a class="nav-link" id="custom-tabs-one-profile-tab" data-toggle="pill" href="#custom-tabs-one-profile" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false">2차팜(NIA)</a></li>
											<li class="nav-item"><a class="nav-link" id="custom-tabs-one-profile5-tab" data-toggle="pill" href="#custom-tabs-one-profile5" role="tab" aria-controls="custom-tabs-one-profile5" aria-selected="false">2차팜(NIA 5G)</a></li>
											<li class="nav-item"><a class="nav-link" id="custom-tabs-one-messages-tab" data-toggle="pill" href="#custom-tabs-one-messages" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false">3차팜(표준)</a></li>
											<li class="nav-item"><a class="nav-link" id="custom-tabs-one-settings-tab" data-toggle="pill" href="#custom-tabs-one-settings" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="false">디지털 뉴딜</a></li>
											<li class="nav-item"><a class="nav-link" id="custom-tabs-one-server-tab" data-toggle="pill" href="#custom-tabs-one-server" role="tab" aria-controls="custom-tabs-one-server" aria-selected="false">운영 서버</a></li>
											<li class="nav-item"><a class="nav-link" id="custom-tabs-dev-server-tab" data-toggle="pill" href="#custom-tabs-dev-server" role="tab" aria-controls="custom-tabs-dev-server" aria-selected="false">개발 서버</a></li>
											<li class="nav-item"><a class="nav-link" id="custom-tabs-one1-server-tab" data-toggle="pill" href="#custom-tabs-one1-server" role="tab" aria-controls="custom-tabs-one1-server" aria-selected="false">관리 사이트</a></li>
										</ul>
									</div>
									
									<div class="card-body">
										<div class="tab-content" id="custom-tabs-one-tabContent">
										<!-- 1차 -->
											<div class="tab-pane fade show active" id="custom-tabs-one-home" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>NMS-WEB</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://all.nexpector.com/nms/index.neo" target="_blank" >상용서버</a>
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																		<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	NMS-WEB
																</td>
																<td class="text-center">
																	14.49.36.254
																</td>
																<td class="text-center">
																	443
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="customRadio1" name="customRadiogroup1"data-ip="14.49.36.254" data-id="root" data-pw="Iotrkdeornr@2021!" data-port="25422">
																			<label for="customRadio1" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="customRadio2" name="customRadiogroup1" data-ip="14.49.36.254" data-id="neoiot" data-pw="Neonexsoft@2021!" data-port="25422" checked>
																			<label for="customRadio2" class="custom-control-label">neoiot</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="1customRadio3" name="customRadiogroup1" data-ip="14.49.36.254" data-id="nexpector" data-pw="Neonex5001!" data-port="25422" checked>
																			<label for="1customRadio3" class="custom-control-label">nexpector</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm"onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	
																</td>
																<td class="text-center">
																	nexpector에 nms,bms포함																	
																</td>
															</tr>
															
															
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>Radius-WEB</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="http://radius.nexpector.com/login" target="_blank" >상용서버</a>
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	레디우스 웹,인증
																</td>
																<td class="text-center">
																	14.63.174.3
																</td>
																<td class="text-center">
																	443
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="customRadio5" name="customRadiogroup3"data-ip="14.63.174.3" data-id="root" data-pw="Iotrkdeornr@2021!" data-port="60001">
																			<label for="customRadio5" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="customRadio6" name="customRadiogroup3" data-ip="14.63.174.3" data-id="neonex" data-pw="NeoStarting@2021!" data-port="60001" checked>
																			<label for="customRadio6" class="custom-control-label">neonex</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>프록시 서버</h4>
														</div>
														<div style="float: left;margin: 5px;">
															
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
														   <tr>
																<td class="text-center">
																	프록시 서버 -1
																</td>
																<td class="text-center">
																	14.63.169.204
																</td>
																<td class="text-center">
																	20022
																</td>
																<td>														
																   <div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="proxyRadio1" name="proxygroup1"data-ip="14.63.169.204" data-id="root" data-pw="Iotrkdeornr@2021!" data-port="20022">
																			<label for="proxyRadio1" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">          
																			<input class="custom-control-input" type="radio" id="proxyRadio2" name="proxygroup1" data-ip="14.63.169.204" data-id="npauser" data-pw="Iotrkdeornr@2021!" data-port="20022" checked>
																			<label for="proxyRadio2" class="custom-control-label">npauser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	프록시 서버 -2
																</td>
																<td class="text-center">
																	14.63.160.34
																</td>
																<td class="text-center">
																	10022
																</td>
																<td>														
																   <div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="proxyRadio5" name="proxygroup3"data-ip="14.63.160.34" data-id="root" data-pw="Iotrkdeornr@2021!" data-port="10022">
																			<label for="proxyRadio5" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="proxyRadio6" name="proxygroup3" data-ip="14.63.160.34" data-id="npauser" data-pw="NeoStarting@2021!" data-port="10022" checked>
																			<label for="proxyRadio6" class="custom-control-label">npauser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															
															<tr>
																<td class="text-center">
																	프록시 서버 -3
																</td>
																<td class="text-center">
																	14.63.174.3
																</td>
																<td class="text-center">
																	15522
																</td>
																<td>														
																   <div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="proxyRadio10" name="proxygroup6"data-ip="14.63.174.3" data-id="root" data-pw="Iotrkdeornr@2021!" data-port="15522">
																			<label for="proxyRadio10" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="proxyRadio11" name="proxygroup6" data-ip="14.63.174.3" data-id="npauser" data-pw="NeoStarting@2021!" data-port="15522" checked>
																			<label for="proxyRadio11" class="custom-control-label">npauser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>DB</h4>
														</div>
														<div style="float: left;margin: 5px;">														
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
														   		<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	DB
																</td>
																<td class="text-center">
																	14.63.169.204
																</td>
																<td class="text-center">
																	3306
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="customRadio7" name="customRadiogroup4"data-ip="14.63.169.204" data-id="root" data-pw="Iotrkdeornr@2021!" data-port="10022">
																			<label for="customRadio7" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="customRadio8" name="customRadiogroup4" data-ip="14.63.169.204" data-id="oracle" data-pw="Iotrkdeornr@2021!" data-port="10022" checked>
																			<label for="customRadio8" class="custom-control-label">oracle</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	
																</td>
																<td class="text-center">
																	<a class="btn btn-orange btn-sm" name="Connect" id="Connect" onclick="popup('/TableSpace1');">용량</a>
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>기타 서버</h4>
														</div>
														<div style="float: left;margin: 5px;">														
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	 웹 방화벽
																</td>
																<td class="text-center">
																  14.49.36.254
																</td>
																<td class="text-center">
																	5951
																</td>
																<td>														
																
																<div class="form-group" style="margin-bottom: 0px;">
																	<div class="custom-control custom-radio">
																	<input class="custom-control-input" type="radio" id="customRadio9" name="customRadiogroup5"data-ip="14.49.36.254" data-id="root" data-pw="Neonexsoft@2021!" data-port="5951" checked>
																	<label for="customRadio9" class="custom-control-label">root</label>
																</div>																
																</td>
																
																<td class="text-center">
																<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	비밀번호 모름
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
											</div>
											<!-- 2차 NIA -->
											<div class="tab-pane fade" id="custom-tabs-one-profile" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>2차 NMS-WEB</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://mds.publicbuswifi.com/nms/index.neo" target="_blank" >상용서버</a>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://211.252.81.138" target="_blank" >WEB_LB : 443</a>
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
														
															<tr>
																<td class="text-center">
																	 nms 웹 서버 -1
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	7441
																	
																</td> 
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="32customRadio5" name="32customRadiogroup3"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21222">
																			<label for="32customRadio5" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="32customRadio6" name="32customRadiogroup3" data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21222" checked>
																			<label for="32customRadio6" class="custom-control-label">radius</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="https://211.251.238.183:7441/nms/index.neo" target="_blank" >WEB</a>
																</td>
																<td class="text-center">
																	nms / radius 같이 있음
																</td>
															</tr>
															<tr>
																<td class="text-center">
																  nms 웹 서버 -2
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	7442
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="32customRadio7" name="32customRadiogroup4"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21322">
																			<label for="32customRadio7" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="32customRadio8" name="32customRadiogroup4" data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21322" checked>
																			<label for="32customRadio8" class="custom-control-label">radius</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="https://211.251.238.183:7442/nms/index.neo" target="_blank" >WEB</a>
																	
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>2차 Radius-WEB</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://rds.publicbuswifi.com/login" target="_blank" >상용서버</a>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://211.252.81.150/" target="_blank" >WEB_LB : 443</a>
														</div>
													</div>
													
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
														
															<tr>
																<td class="text-center">
																 radius 웹 서버 -1
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	6441
																</td> 
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio5" name="2customRadiogroup3"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21222">
																			<label for="2customRadio5" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio6" name="2customRadiogroup3" data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21222" checked>
																			<label for="2customRadio6" class="custom-control-label">radius</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="https://211.251.238.183:6441" target="_blank" >WEB</a>
																	
																</td>
																<td class="text-center">
																	nms / radius 같이 있음
																</td>
															</tr>
															<tr>
																<td class="text-center">
																  radius 웹 서버 -2
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	6442
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio7" name="2customRadiogroup4"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21322">
																			<label for="2customRadio7" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio8" name="2customRadiogroup4" data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21322" checked>
																			<label for="2customRadio8" class="custom-control-label">radius</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="https://211.251.238.183:6442" target="_blank" >WEB</a>
																	
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															</tbody></table>
															<div>
														<div style="float: left;">
															<h4>2차 Radius-Auth</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<button type="button" class="btn btn-block btn-outline-secondary btn-xs" onclick=''>211.252.81.88:1812 (Access Port)</button>
															
														</div>
														<div style="float: left;margin: 5px;">
															<button type="button" class="btn btn-block btn-outline-secondary btn-xs" onclick=''>211.252.81.88:1813 (Account Port)</button>
														</div>
														<div style="float: left;margin: 5px;">
															<button type="button" class="btn btn-block btn-outline-secondary btn-xs" onclick=''>211.252.81.88:9200 (API Port)</button>
														</div>
													</div>
															<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
														
															<tr>
																<td class="text-center">
																	레디우스 인증 서버 -1
																</td>
																<td class="text-center">
																	211.251.238.11
																</td>
																<td class="text-center">
																	1812<br>
																	1813<br>
																	9200<br>
																	
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio10" name="2customRadiogroup5"data-ip="211.251.238.11" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21822">
																			<label for="2customRadio10" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio11" name="2customRadiogroup5" data-ip="211.251.238.11" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21822" checked>
																			<label for="2customRadio11" class="custom-control-label">radius</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio12" name="2customRadiogroup5" data-ip="211.251.238.11" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21822">
																			<label for="2customRadio12" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	
																	
																</td>
																<td class="text-center">
																	1812 (Access Port)<br>
																	1813 (Account Port)<br>
																	9200 (API Port)<br>
																   
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	레디우스 인증 서버 -2
																</td>
																<td class="text-center">
																	211.251.238.12
																</td>
																<td class="text-center">
																	1812<br>
																	1813<br>
																	9200<br>
																	
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio13" name="2customRadiogroup6"data-ip="211.251.238.12" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21922">
																			<label for="2customRadio13" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio14" name="2customRadiogroup6" data-ip="211.251.238.12" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21922" checked>
																			<label for="2customRadio14" class="custom-control-label">radius</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio15" name="2customRadiogroup6" data-ip="211.251.238.12" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21922">
																			<label for="2customRadio15" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>										
																</td>
																<td class="text-center">
																	1812 (Access Port)<br>
																	1813 (Account Port)<br>
																	9200 (API Port)<br>
																   
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	레디우스 인증 서버 -3
																</td>
																<td class="text-center">
																	211.43.13.25
																</td>
																<td class="text-center">
																	1812<br>
																	1813<br>
																	9200<br>
																	
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio16" name="2customRadiogroup7"data-ip="211.43.13.25" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="22822">
																			<label for="2customRadio16" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio17" name="2customRadiogroup7" data-ip="211.43.13.25" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="22822" checked>
																			<label for="2customRadio17" class="custom-control-label">radius</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio18" name="2customRadiogroup7" data-ip="211.43.13.25" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="22822">
																			<label for="2customRadio18" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	
																	
																</td>
																<td class="text-center">
																	1812 (Access Port)<br>
																	1813 (Account Port)<br>
																	9200 (API Port)<br>
																    
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	레디우스 인증 서버 -4
																</td>
																<td class="text-center">
																	211.43.13.26
																</td>
																<td class="text-center">
																	1812<br>
																	1813<br>
																	9200<br>
																	
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio19" name="2customRadiogroup8"data-ip="211.43.13.26" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="22922">
																			<label for="2customRadio19" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio20" name="2customRadiogroup8" data-ip="211.43.13.26" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="22922" checked>
																			<label for="2customRadio20" class="custom-control-label">radius</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio21" name="2customRadiogroup8" data-ip="211.43.13.26" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="22922">
																			<label for="2customRadio21" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>			
																</td>
																<td class="text-center">
																	1812 (Access Port)<br>
																	1813 (Account Port)<br>
																	9200 (API Port)<br>
																   
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>2차 Captive-WEB</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="http://captive.nexpector.com/auth/view?svccode=NA" target="_blank" >상용서버</a>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="http://211.252.81.122" target="_blank" >WEB_LB : 80</a>
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>						
															<tr>
																<td class="text-center">
																	캡티브 웹 서버 -1
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	80
																</td>
																<td>														
																  <div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio22" name="4customRadiogroup9"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21422">
																			<label for="4customRadio22" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio23" name="4customRadiogroup9"data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21422" checked>
																			<label for="4customRadio23" class="custom-control-label">radius</label>
																		</div>
																		</div>
																</td>
																<td class="text-center">
															      <a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="http://211.251.238.191:6090/auth/view?svccode=NA" target="_blank" >WEB</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	캡티브 웹 서버 -2
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	80
																</td>
																<td>														
																  <div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio24" name="4customRadiogroup10"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21522">
																			<label for="4customRadio24" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio25" name="4customRadiogroup10"data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21522" checked>
																			<label for="4customRadio25" class="custom-control-label">radius</label>
																		</div>
																		</div>
																</td>
																<td class="text-center">
															      <a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="http://211.251.238.192:6090/auth/view?svccode=NA" target="_blank" >WEB</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	캡티브 웹 서버 -3
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	80
																</td>
																<td >														
																  <div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio26" name="4customRadiogroup11"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21622">
																			<label for="4customRadio26" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio27" name="4customRadiogroup11"data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21622" checked>
																			<label for="4customRadio27" class="custom-control-label">radius</label>
																		</div>
																		</div>
																</td>
																<td class="text-center">
															      <a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="http://211.251.238.189:6090/auth/view?svccode=NA" target="_blank" >WEB</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	캡티브 웹 서버 -4
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	80
																</td>
																<td>														
																  <div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio28" name="4customRadiogroup12"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21722">
																			<label for="4customRadio28" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio29" name="4customRadiogroup12"data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21722" checked>
																			<label for="4customRadio29" class="custom-control-label">radius</label>
																		</div>
																		</div>
																</td>
																<td class="text-center">
															      <a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="http://211.251.238.190:6090/auth/view?svccode=NA" target="_blank" >WEB</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>2차 프록시 서버</h4>
														</div>
														<div style="float: left;margin: 5px;">
														<div style="float: left;margin: 5px;">
															<button type="button" class="btn btn-block btn-outline-secondary btn-xs" onclick='#'>Proxy LB 211.252.81.11:5001</button>
														</div>													
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>														
															
															<tr>
																<td class="text-center">
																	프록시 서버 -1
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	5001
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio30" name="4customRadiogroup13"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19622">
																			<label for="4customRadio30" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio31" name="4customRadiogroup13" data-ip="211.251.238.183" data-id="npauser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19622" checked>
																			<label for="4customRadio31" class="custom-control-label">npauser</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio32" name="4customRadiogroup13" data-ip="211.251.238.183" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19622">
																			<label for="4customRadio32" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	프록시 서버 -2
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	5001
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio33" name="4customRadiogroup14"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19722">
																			<label for="4customRadio33" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio34" name="4customRadiogroup14" data-ip="211.251.238.183" data-id="npauser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19722" checked>
																			<label for="4customRadio34" class="custom-control-label">npauser</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio35" name="4customRadiogroup14" data-ip="211.251.238.183" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19722">
																			<label for="4customRadio35" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	프록시 서버 -3
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	5001
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio36" name="4customRadiogroup15"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19822">
																			<label for="4customRadio36" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio37" name="4customRadiogroup15" data-ip="211.251.238.183" data-id="npauser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19822" checked>
																			<label for="4customRadio37" class="custom-control-label">npauser</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio38" name="4customRadiogroup15" data-ip="211.251.238.183" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19822">
																			<label for="4customRadio38" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	프록시 서버 -4
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	5001
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio39" name="4customRadiogroup16"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19922">
																			<label for="4customRadio39" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio40" name="4customRadiogroup16" data-ip="211.251.238.183" data-id="npauser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19922"checked>
																			<label for="4customRadio40" class="custom-control-label">npauser</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio41" name="4customRadiogroup16" data-ip="211.251.238.183" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19922">
																			<label for="4customRadio41" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>2차 DB 서버</h4>
														</div>
														<div style="float: left;margin: 5px;">														
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	 DB 서버
																</td>
																<td class="text-center">
																  211.251.238.183
																</td>
																<td class="text-center">
																	8629
																</td>
																<td>																	
																<div class="form-group" style="margin-bottom: 0px;">
																	<div class="custom-control custom-radio">
																	<input class="custom-control-input" type="radio" id="4customRadio42" name="4customRadiogroup17"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="20522">
																	<label for="4customRadio42" class="custom-control-label">root</label>
																</div>
																    <div class="custom-control custom-radio">
																	<input class="custom-control-input" type="radio" id="4customRadio43" name="4customRadiogroup17"data-ip="211.251.238.183" data-id="tibero" data-pw="Eogksalsrnriotrkdwk!2080" data-port="20522"checked>
																	<label for="4customRadio43" class="custom-control-label">tibero</label>
																</div>
																</div>															
																</td>
																
																<td class="text-center">
																<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																
																</td>
																<td class="text-center">
																	<a class="btn btn-orange btn-sm" onclick="popup('/TableSpace2');">용량</a>
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>2차 기타 서버</h4>
														</div>
														<div style="float: left;margin: 5px;">														
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	 웹 방화벽 서버
																</td>
																<td class="text-center">
																  211.251.238.183
																</td>
																<td class="text-center">
																	5952
																</td>
																<td>																	
																<div class="form-group" style="margin-bottom: 0px;">
																	<div class="custom-control custom-radio">
																	<input class="custom-control-input" type="radio" id="4customRadio50" name="4customRadiogroup20"data-ip="211.251.238.183" data-id="root" data-pw="udupTZNE7d6y" data-port="5952" checked>
																	<label for="4customRadio50" class="custom-control-label">root</label>
																</div>																    
																</div>															
																</td>			
																<td class="text-center">
																<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>		
														</tbody>
													</table>
												</div>
											</div>
												<!-- 2차 NIA 5G -->
											<div class="tab-pane fade" id="custom-tabs-one-profile5" role="tabpanel" aria-labelledby="custom-tabs-one-profile5-tab">
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>NIA 5G NMS-WEB</h4> 
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://mds.publicbuswifi.com:453/nms/index.neo" target="_blank" >상용서버</a>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://211.252.81.138" target="_blank" >WEB_LB : 453</a>
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
														
															<tr>
																<td class="text-center">
																	 nms 웹 서버 -1
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	7451
																	 
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="5customRadio5" name="5customRadiogroup3"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21222">
																			<label for="5customRadio5" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="5customRadio6" name="5customRadiogroup3" data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21222" checked>
																			<label for="5customRadio6" class="custom-control-label">radius</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="5customRadio60" name="5customRadiogroup3" data-ip="211.251.238.183" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21222" checked>
																			<label for="5customRadio60" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="https://211.251.238.183:7451/nms/index.neo" target="_blank">WEB</a>
																</td>
																<td class="text-center">
																	nms / radius 같이 있음
																</td>
															</tr>
															<tr>
																<td class="text-center">
																  nms 웹 서버 -2
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	7452
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="5customRadio7" name="5customRadiogroup4"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21322">
																			<label for="5customRadio7" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="5customRadio8" name="5customRadiogroup4" data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21322" checked>
																			<label for="5customRadio8" class="custom-control-label">radius</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="5customRadio80" name="5customRadiogroup4" data-ip="211.251.238.183" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21322" checked>
																			<label for="5customRadio80" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="https://211.251.238.183:7452/nms/index.neo"target="_blank" >WEB</a>
																	
																</td>
																<td class="text-center">
																	nms / radius / external-api 같이 있음
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>NIA 5G Radius-WEB</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://rds.publicbuswifi.com/login" target="_blank" >상용서버</a>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://211.252.81.150/" target="_blank" >WEB_LB : 453</a>
														</div>
													</div>
													
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
														
															<tr>
																<td class="text-center">
																 radius 웹 서버 -1
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	6451
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="22customRadio5" name="22customRadiogroup3"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21222">
																			<label for="22customRadio5" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="22customRadio6" name="22customRadiogroup3" data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21222" checked>
																			<label for="22customRadio6" class="custom-control-label">radius</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="22customRadio60" name="22customRadiogroup3" data-ip="211.251.238.183" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21222" checked>
																			<label for="22customRadio60" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="https://211.251.238.183:6451" target="_blank" >WEB</a>
																	
																</td>
																<td class="text-center">
																	nms / radius 같이 있음
																</td>
															</tr>
															<tr>
																<td class="text-center">
																  radius 웹 서버 -2
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	6452
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="22customRadio7" name="22customRadiogroup4"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21322">
																			<label for="22customRadio7" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="22customRadio8" name="22customRadiogroup4" data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21322" checked>
																			<label for="22customRadio8" class="custom-control-label">radius</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="22customRadio81" name="22customRadiogroup4" data-ip="211.251.238.183" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21322" checked>
																			<label for="22customRadio81" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="https://211.251.238.183:6452" target="_blank" >WEB</a>
																	
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															</tbody></table>
															<div>
														<div style="float: left;">
															<h4>NIA 5G Radius-Auth</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<button type="button" class="btn btn-block btn-outline-secondary btn-xs" onclick=''>211.252.81.88:1822 (Access Port)</button>
															
														</div>
														<div style="float: left;margin: 5px;">
															<button type="button" class="btn btn-block btn-outline-secondary btn-xs" onclick=''>211.252.81.88:1823 (Account Port)</button>
														</div>
														<div style="float: left;margin: 5px;">
															<button type="button" class="btn btn-block btn-outline-secondary btn-xs" onclick=''>211.252.81.88:9210 (API Port)</button>
														</div>
													</div>
															<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
														
															<tr>
																<td class="text-center">
																	레디우스 인증 서버 -1
																</td>
																<td class="text-center">
																	211.251.238.11
																</td>
																<td class="text-center">
																	1822<br>
																	1823<br>
																	9210<br>
																	
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="12customRadio10" name="12customRadiogroup5"data-ip="211.251.238.11" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21822">
																			<label for="12customRadio10" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="12customRadio11" name="12customRadiogroup5" data-ip="211.251.238.11" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21822" checked>
																			<label for="12customRadio11" class="custom-control-label">radius</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="12customRadio12" name="12customRadiogroup5" data-ip="211.251.238.11" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21822">
																			<label for="12customRadio12" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	
																	
																</td>
																<td class="text-center">
																	1822 (Access Port)<br>
																	1823 (Account Port)<br>
																	9210 (API Port)<br>
																   
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	레디우스 인증 서버 -2
																</td>
																<td class="text-center">
																	211.251.238.12
																</td>
																<td class="text-center">
																	1822<br>
																	1823<br>
																	9210<br>
																	
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="12customRadio13" name="12customRadiogroup6"data-ip="211.251.238.12" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21922">
																			<label for="12customRadio13" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="12customRadio14" name="12customRadiogroup6" data-ip="211.251.238.12" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21922" checked>
																			<label for="12customRadio14" class="custom-control-label">radius</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="12customRadio15" name="12customRadiogroup6" data-ip="211.251.238.12" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21922">
																			<label for="12customRadio15" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>										
																</td>
																<td class="text-center">
																	1822 (Access Port)<br>
																	1823 (Account Port)<br>
																	9210 (API Port)<br>
																  
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	레디우스 인증 서버 -3
																</td>
																<td class="text-center">
																	211.43.13.25
																</td>
																<td class="text-center">
																	1822<br>
																	1823<br>
																	9210<br>
																	
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="12customRadio16" name="12customRadiogroup7"data-ip="211.43.13.25" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="22822">
																			<label for="12customRadio16" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="12customRadio17" name="12customRadiogroup7" data-ip="211.43.13.25" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="22822" checked>
																			<label for="12customRadio17" class="custom-control-label">radius</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="12customRadio18" name="12customRadiogroup7" data-ip="211.43.13.25" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="22822">
																			<label for="12customRadio18" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	
																	
																</td>
																<td class="text-center">
																	1822 (Access Port)<br>
																	1823 (Account Port)<br>
																	9210 (API Port)<br>
																    
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	레디우스 인증 서버 -4
																</td>
																<td class="text-center">
																	211.43.13.26
																</td>
																<td class="text-center">
																	1822<br>
																	1823<br>
																	9210<br>
																	
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="12customRadio19" name="12customRadiogroup8"data-ip="211.43.13.26" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="22922">
																			<label for="12customRadio19" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="12customRadio20" name="12customRadiogroup8" data-ip="211.43.13.26" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="22922" checked>
																			<label for="12customRadio20" class="custom-control-label">radius</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="12customRadio21" name="12customRadiogroup8" data-ip="211.43.13.26" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="22922">
																			<label for="12customRadio21" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>			
																</td>
																<td class="text-center">
																	1822 (Access Port)<br>
																	1823 (Account Port)<br>
																	9210 (API Port)<br>
																   
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>NIA 5G Captive-WEB</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="http://captive.nexpector.com/auth/view?svccode=NA" target="_blank" >상용서버</a>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="http://211.252.81.122" target="_blank" >WEB_LB : 80</a>
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>						
															<tr>
																<td class="text-center">
																	캡티브 웹 서버 -1
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	80
																</td>
																<td>														
																  <div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio22" name="2customRadiogroup9"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21422">
																			<label for="2customRadio22" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio23" name="2customRadiogroup9"data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21422" checked>
																			<label for="2customRadio23" class="custom-control-label">radius</label>
																		</div>
																		</div>
																</td>
																<td class="text-center">
															      <a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="http://211.251.238.191:6090/auth/view?svccode=NA" target="_blank" >WEB</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	캡티브 웹 서버 -2
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	80
																</td>
																<td>														
																  <div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio24" name="2customRadiogroup10"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21522">
																			<label for="2customRadio24" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio25" name="2customRadiogroup10"data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21522" checked>
																			<label for="2customRadio25" class="custom-control-label">radius</label>
																		</div>
																		</div>
																</td>
																<td class="text-center">
															      <a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="http://211.251.238.192:6090/auth/view?svccode=NA"target="_blank" >WEB</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	캡티브 웹 서버 -3
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	80
																</td>
																<td >														
																  <div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio26" name="2customRadiogroup11"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21622">
																			<label for="2customRadio26" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio27" name="2customRadiogroup11"data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21622" checked>
																			<label for="2customRadio27" class="custom-control-label">radius</label>
																		</div>
																		</div>
																</td>
																<td class="text-center">
															      <a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="http://211.251.238.189:6090/auth/view?svccode=NA"target="_blank" >WEB</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	캡티브 웹 서버 -4
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	80
																</td>
																<td>														
																  <div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio28" name="2customRadiogroup12"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21722">
																			<label for="2customRadio28" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio29" name="2customRadiogroup12"data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="21722" checked>
																			<label for="2customRadio29" class="custom-control-label">radius</label>
																		</div>
																		</div>
																</td>
																<td class="text-center">
															      <a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	<a class="btn btn-orange btn-sm" href="http://211.251.238.190:6090/auth/view?svccode=NA" target="_blank">WEB</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>NIA 5G 프록시 서버</h4>
														</div>
														<div style="float: left;margin: 5px;">
														<div style="float: left;margin: 5px;">
															<button type="button" class="btn btn-block btn-outline-secondary btn-xs" onclick='#'>Proxy LB 211.252.81.11:5011</button>
														</div>													
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>														
															
															<tr>
																<td class="text-center">
																	프록시 서버 -1
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	5011
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio30" name="2customRadiogroup13"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19622">
																			<label for="2customRadio30" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio31" name="2customRadiogroup13" data-ip="211.251.238.183" data-id="npauser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19622" checked>
																			<label for="2customRadio31" class="custom-control-label">npauser</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio32" name="2customRadiogroup13" data-ip="211.251.238.183" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19622">
																			<label for="2customRadio32" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	프록시 서버 -2
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	5011
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio33" name="2customRadiogroup14"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19722">
																			<label for="2customRadio33" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio34" name="2customRadiogroup14" data-ip="211.251.238.183" data-id="npauser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19722" checked>
																			<label for="2customRadio34" class="custom-control-label">npauser</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio35" name="2customRadiogroup14" data-ip="211.251.238.183" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19722">
																			<label for="2customRadio35" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	프록시 서버 -3
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	5011
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio36" name="2customRadiogroup15"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19822">
																			<label for="2customRadio36" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio37" name="2customRadiogroup15" data-ip="211.251.238.183" data-id="npauser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19822" checked>
																			<label for="2customRadio37" class="custom-control-label">npauser</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio38" name="2customRadiogroup15" data-ip="211.251.238.183" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19822">
																			<label for="2customRadio38" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	프록시 서버 -4
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	5011
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio39" name="2customRadiogroup16"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19922">
																			<label for="2customRadio39" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio40" name="2customRadiogroup16" data-ip="211.251.238.183" data-id="npauser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19922"checked>
																			<label for="2customRadio40" class="custom-control-label">npauser</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="2customRadio41" name="2customRadiogroup16" data-ip="211.251.238.183" data-id="ictuser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="19922">
																			<label for="2customRadio41" class="custom-control-label">ictuser</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>NIA 5G DB 서버</h4>
														</div>
														<div style="float: left;margin: 5px;">														
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	 DB 서버
																</td>
																<td class="text-center">
																  211.251.238.183
																</td>
																<td class="text-center">
																	8629
																</td>
																<td>																	
																<div class="form-group" style="margin-bottom: 0px;">
																	<div class="custom-control custom-radio">
																	<input class="custom-control-input" type="radio" id="2customRadio42" name="2customRadiogroup17"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="20522">
																	<label for="2customRadio42" class="custom-control-label">root</label>
																</div>
																    <div class="custom-control custom-radio">
																	<input class="custom-control-input" type="radio" id="2customRadio43" name="2customRadiogroup17"data-ip="211.251.238.183" data-id="tibero" data-pw="Eogksalsrnriotrkdwk!2080" data-port="20522"checked>
																	<label for="2customRadio43" class="custom-control-label">tibero</label>
																</div>
																</div>															
																</td>
																
																<td class="text-center">
																<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																
																</td>
																<td class="text-center">
																	<a class="btn btn-orange btn-sm" onclick="popup('/TableSpace2');">용량</a>
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>NIA 5G 기타 서버</h4>
														</div>
														<div style="float: left;margin: 5px;">														
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	 웹 방화벽 서버
																</td>
																<td class="text-center">
																  211.251.238.183
																</td>
																<td class="text-center">
																	5952
																</td>
																<td>																	
																<div class="form-group" style="margin-bottom: 0px;">
																	<div class="custom-control custom-radio">
																	<input class="custom-control-input" type="radio" id="2customRadio50" name="2customRadiogroup20"data-ip="211.251.238.183" data-id="root" data-pw="udupTZNE7d6y" data-port="5952" checked>
																	<label for="2customRadio50" class="custom-control-label">root</label>
																</div>																    
																</div>															
																</td>			
																<td class="text-center">
																<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>		
														</tbody>
													</table>
												</div>
											</div>
											<!-- 3차 -->
											<div class="tab-pane fade" id="custom-tabs-one-messages" role="tabpanel" aria-labelledby="custom-tabs-one-messages-tab">
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>3차 NMS-WEB</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://snm.nexpector.com/nms/index.neo" target="_blank">상용서버</a>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://211.251.252.17" target="_blank" >WEB_LB : 443</a>
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
														
															<tr>
																<td class="text-center">
																	nms 웹 서버
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	8080
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="34customRadio1" name="34customRadiogroup1"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="33122">
																			<label for="34customRadio1" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="34customRadio2" name="34customRadiogroup1" data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="33122" checked>
																			<label for="34customRadio2" class="custom-control-label">radius</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm"onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	nms / radius 같이 있음
																</td>
															</tr>
															
															
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>3차 Radius-Web</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://sna.nexpector.com/login" target="_blank" >상용서버</a>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://211.251.252.18" target="_blank" >WEB_LB : 443</a>
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
														
														<tr>
																<td class="text-center">
																	radius 웹 서버
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	6080
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="3customRadio1" name="3customRadiogroup1"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="33122">
																			<label for="3customRadio1" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="3customRadio2" name="3customRadiogroup1" data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="33122" checked>
																			<label for="3customRadio2" class="custom-control-label">radius</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm"onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	nms / radius 같이 있음
																</td>
															</tr>
															</tbody></table></div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>3차 Radius-Auth</h4>
														</div>
															<div style="float: left;margin: 5px;">
															<button type="button" class="btn btn-block btn-outline-secondary btn-xs" onclick=''>211.251.252.16:1812 (Access Port)</button>
															
														</div>
														<div style="float: left;margin: 5px;">
															<button type="button" class="btn btn-block btn-outline-secondary btn-xs" onclick=''>211.251.252.16:1813 (Account Port)</button>
														</div>
														<div style="float: left;margin: 5px;">
															<button type="button" class="btn btn-block btn-outline-secondary btn-xs" onclick=''>211.251.252.16:9200 (API Port)</button>
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
														
															<tr>
																<td class="text-center">
																	레디우스 인증 서버
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	1812<br>
																	1813<br>
																	9200<br>
																	
															        
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="3customRadio5" name="3customRadiogroup3"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="32122">
																			<label for="3customRadio5" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="3customRadio6" name="3customRadiogroup3" data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="32122" checked>
																			<label for="3customRadio6" class="custom-control-label">radius</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	1812 (Access Port)<br>
																	1813 (Account Port)<br>
																	9200 (API Port)<br>
																	
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>3차 Captive-WEB</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://snc.nexpector.com/auth/view?svccode=SC" target="_blank" >상용서버</a>
															
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="https://211.251.252.19/" target="_blank" >WEB_LB : 443</a>
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
														
															<tr>
																<td class="text-center">
																	캡티브 웹
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																  
																   7443
																	
																</td>
																<td>														
																    <div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="3customRadio7" name="3customRadiogroup4"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="34122">
																			<label for="3customRadio7" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="3customRadio8" name="3customRadiogroup4" data-ip="211.251.238.183" data-id="radius" data-pw="Eogksalsrnriotrkdwk!2080" data-port="34122" checked>
																			<label for="3customRadio8" class="custom-control-label">radius</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																														
																</td>
															</tr>													
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>3차 프록시 서버</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<button type="button" class="btn btn-block btn-outline-secondary btn-xs" onclick=''>Proxy LB 211.251.252.16:5001</button>
														</div>
														<div style="float: left;margin: 5px;">														
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>												
															<tr>
																<td class="text-center">
																	프록시 서버
																</td>
																<td class="text-center">
																	211.251.238.183
																</td>
																<td class="text-center">
																	5001
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="customRadio11" name="customRadiogroup8"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="31122" checked>
																			<label for="customRadio11" class="custom-control-label">root</label>
																		</div>																		
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>3차 DB 서버</h4>
														</div>
														<div style="float: left;margin: 5px;">														
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	 DB 서버 
																</td>
																<td class="text-center">
																  211.251.238.183
																</td>
																<td class="text-center">
																	8629
																</td>
																<td>														
																
																<div class="form-group" style="margin-bottom: 0px;">
																	<div class="custom-control custom-radio">
																	<input class="custom-control-input" type="radio" id="3customRadio13" name="3customRadiogroup15"data-ip="211.251.238.183" data-id="root" data-pw="Eogksalsrnriotrkdwk!2080" data-port="30122" checked>
																	<label for="3customRadio13" class="custom-control-label">root</label>
																</div>																
																</td>
																
																<td class="text-center">
																<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																
																</td>
																<td class="text-center">
																	<a class="btn btn-orange btn-sm" onclick="popup('/TableSpace3');">용량</a>
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>	
											</div>
											<!-- 뉴딜 -->
											<div class="tab-pane fade" id="custom-tabs-one-settings" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
												
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>뉴딜 NMS-WEB</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="http://211.114.218.26:8080" target="_blank">상용서버</a>
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	nms 웹 서버 
																</td>
																<td class="text-center">
																	211.114.218.26
																</td>
																<td class="text-center">
																	 8080
																	 
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="44customRadio1" name="44customRadiogroup1"data-ip="211.114.218.26" data-id="root" data-pw="Elwlxjfsbelf!2020" data-port="22">
																			<label for="44customRadio1" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="44customRadio2" name="44customRadiogroup1" data-ip="211.114.218.26 " data-id="npauser" data-pw="Sbelfelwlxjf!2020" data-port="22" checked>
																			<label for="44customRadio2" class="custom-control-label">npauser</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="44customRadio3" name="44customRadiogroup1" data-ip="211.114.218.26 " data-id="radius" data-pw="Sbelfelwlxjf!2020" data-port="22" checked>
																			<label for="44customRadio3" class="custom-control-label">radius</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm"onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	
																</td>
															</tr>
															
															
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>뉴딜 Radius-WEB</h4>
														</div>
														<div style="float: left;margin: 5px;">
															<a class="btn btn-block btn-outline-secondary btn-xs" href="http://211.114.218.26:6080/" target="_blank">상용서버</a>
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	radius 웹 서버 
																</td>
																<td class="text-center">
																	211.114.218.26
																</td>
																<td class="text-center">
																	 
																	 6080
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio1" name="4customRadiogroup1"data-ip="211.114.218.26" data-id="root" data-pw="Elwlxjfsbelf!2020" data-port="22">
																			<label for="4customRadio1" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio2" name="4customRadiogroup1" data-ip="211.114.218.26 " data-id="npauser" data-pw="Sbelfelwlxjf!2020" data-port="22" checked>
																			<label for="4customRadio2" class="custom-control-label">npauser</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio3" name="4customRadiogroup1" data-ip="211.114.218.26 " data-id="radius" data-pw="Sbelfelwlxjf!2020" data-port="22" checked>
																			<label for="4customRadio3" class="custom-control-label">radius</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm"onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																											    
																</td>
															</tr>
															
															
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>뉴딜 Radius-Auth</h4>
														</div>
														
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															
															<tr>
																<td class="text-center">
																	레디우스 인증 서버 
																</td>
																<td class="text-center">
																	211.114.218.27
																</td>
																<td class="text-center">
																	<br>
																	1812<br>
																	1813<br>
																	9510<br>
																	9520<br>
																	9530<br>
																	9540<br>
																</td>
																<td>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio5" name="4customRadiogroup3"data-ip="211.114.218.27" data-id="root" data-pw="Elwlxjfsbelf!2020" data-port="22">
																			<label for="4customRadio5" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio6" name="4customRadiogroup3" data-ip="211.114.218.27" data-id="radius" data-pw="Sbelfelwlxjf!2020" data-port="22" checked>
																			<label for="4customRadio6" class="custom-control-label">radius</label>
																		</div>
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>
																<td class="text-center">
																	포트 쓰임새 불분명
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>뉴딜 Captive-WEB</h4>
														</div>
														<div style="float: left;margin: 5px;">
<!-- 															<button type="button" class="btn btn-block btn-outline-secondary btn-xs" onclick='location.href="https://snc.nexpector.com/auth/view?svccode=SC"'>상용서버</button> -->
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	캡티브 웹
																</td>
																<td class="text-center">
																	211.114.218.28
																</td>
																<td class="text-center">
																    
																	6090
																</td>
																<td>														
																    <div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio7" name="4customRadiogroup4"data-ip="211.114.218.28" data-id="root" data-pw="Elwlxjfsbelf!2020" data-port="22" checked>
																			<label for="4customRadio7" class="custom-control-label">root</label>
																		</div>
																		
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	
																</td>
																<td class="text-center">
																	
																</td>
															</tr>													
														</tbody>
													</table>
												</div>
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>뉴딜 DB 서버</h4>
														</div>
														<div style="float: left;margin: 5px;">														
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>
																<th style="width: 180px">IP</th>
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	DB 서버
																</td>
																<td class="text-center">
																	211.114.218.29
																</td>
																<td class="text-center">
																	8629
																</td>
																<td >
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio11" name="4customRadiogroup8"data-ip="211.114.218.29" data-id="root" data-pw="Elwlxjfsbelf!2020" data-port="22">
																			<label for="4customRadio11" class="custom-control-label">root</label>
																		</div>	
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="4customRadio12" name="4customRadiogroup8"data-ip="211.114.218.29" data-id="tibero" data-pw="Sbelfelwlxjf!2020" data-port="22"checked>
																			<label for="4customRadio12" class="custom-control-label">tibero</label>
																		</div>																		
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																	
																</td>
																<td class="text-center">
																	<a class="btn btn-orange btn-sm" onclick="popup('/TableSpace4');">용량</a>
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
												
												
											</div>
											
											<!-- 운영 서버 -->
											<div class="tab-pane fade" id="custom-tabs-one-server" role="tabpanel" aria-labelledby="custom-tabs-one-server-tab">
												
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>운영 서버</h4>
														</div>
														<div style="float: left;margin: 5px;">
															
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">서비스 명</th>	
																<th style="width: 250px">웹 사이트</th>														
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	<h5>네오넥스소프트 웹메일</h5>
																</td>
																<td class="text-center">
																<a class="btn btn-success btn-sm" href="https://office.hiworks.com/neonexsoft.com" target="_blank" >WEB</a>
																</td>									
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	<h5>레드마인</h5>
																</td>
																<td class="text-center">
																<a class="btn btn-success btn-sm" href="http://106.248.228.114:3000/login" target="_blank" >WEB</a>
																</td>									
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	<h5>GitLab</h5>
																</td>
																<td class="text-center">
																<a class="btn btn-success btn-sm" href="http://192.168.11.182:9082" target="_blank" >WEB</a>
																</td>									
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	<h5>NEXUS</h5>
																</td>
																<td class="text-center">
																<a class="btn btn-success btn-sm" href="http://192.168.11.182:8081" target="_blank" >WEB</a>
																</td>									
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	<h5>젠킨스(신형)</h5>
																</td>
																<td class="text-center">
																<a class="btn btn-success btn-sm" href="http://192.168.11.182:8080" target="_blank" >WEB</a>
																</td>									
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	<h5>젠킨스(구형)</h5>
																</td>
																<td class="text-center">
																<a class="btn btn-success btn-sm" href="http://106.248.228.114:6092/jenkins/login" target="_blank" >WEB</a>
																</td>									
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	<h5>OpenTok 그룹웨어</h5>
																</td>
																<td class="text-center">
																<a class="btn btn-success btn-sm" href="http://106.247.229.146/neonexsoft.com" target="_blank" >WEB</a>
																</td>									
																<td class="text-center">
																	
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	<h5>Nas</h5>
																</td>
																<td class="text-center">
																<a class="btn btn-success btn-sm" href="http://192.168.1.100:5000" target="_blank" >WEB</a>
																</td>									
																<td class="text-center">
																	
																</td>
															</tr>
														</tbody>
													</table>
												</div>
																															
											</div>
											<!-- 개발 서버 -->
											<div class="tab-pane fade" id="custom-tabs-dev-server" role="tabpanel" aria-labelledby="custom-tabs-dev-server-tab">
												
												<div class="server-list-low">
													<div>
														<div style="float: left;">
															<h4>개발 서버</h4>
														</div>
														<div style="float: left;margin: 5px;">
															
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">																
																<th style="width: 250px">서비스 명</th>	
																<th style="width: 180px">IP</th>														
																<th style="width: 140px">Port</th>
																<th style="width: 130px">User</th>
																<th style="width: 200px">Protocol</th>
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
															    <td class="text-center">
																	신규 개발 서버
																</td>
																<td class="text-center">
																	192.168.11.182
																</td>
																<td class="text-center">
																22
																</td>
																<td >
																<div class="form-group" style="margin-bottom: 0px;">
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="DevcustomRadio1" name="DevcustomRadiogroup1"data-ip="192.168.11.182" data-id="root" data-pw="ict_neonex!" data-port="22">
																			<label for="DevcustomRadio1" class="custom-control-label">root</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="DevcustomRadio2" name="DevcustomRadiogroup1"data-ip="192.168.11.182" data-id="ictuser" data-pw="ictuser5001!" data-port="22" checked>
																			<label for="DevcustomRadio2" class="custom-control-label">ictuser</label>
																		</div>
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="DevcustomRadio3" name="DevcustomRadiogroup1"data-ip="192.168.11.182" data-id="npauser" data-pw="Eogksalsrnriotrkdwk!2080" data-port="22">
																			<label for="DevcustomRadio3" class="custom-control-label">npauser</label>
																		</div>																	
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>									
																<td class="text-center">
																	EOM 서버
																</td>
															</tr>
															<tr>
															    <td class="text-center">
																	 개발 서버
																</td>
																<td class="text-center">
																	192.168.11.132
																</td>
																<td class="text-center">
																22
																</td>
																<td >
																<div class="form-group" style="margin-bottom: 0px;">																	
																		<div class="custom-control custom-radio">
																			<input class="custom-control-input" type="radio" id="DevcustomRadio5" name="DevcustomRadiogroup2"data-ip="192.168.11.132" data-id="ictuser" data-pw="ict_neonex!" data-port="22" checked>
																			<label for="DevcustomRadio5" class="custom-control-label">ictuser</label>
																		</div>																																			
																	</div>
																</td>
																<td class="text-center">
																	<a class="btn btn-success btn-sm" onclick="SSH(this);">SSH</a>
																	<a class="btn btn-info btn-sm" onclick="SFTP(this);">SFTP</a>
																</td>									
																<td class="text-center">
																	nms/radius/bms 등 
																</td>
															</tr>
														</tbody>
													</table>
												</div>
																															
											</div>
											<!-- 관리 사이트 -->
											<div class="tab-pane fade" id="custom-tabs-one1-server" role="tabpanel" aria-labelledby="custom-tabs-one1-server-tab">
												
												<div class="server-list-low">
													<div>
														<div style="float: left;" >
															
														</div>
														<div style="float: left;margin: 5px;">
															
														</div>
													</div>
													<table class="table projects" style="border-bottom: 2px solid #DEE2E6;">
														  <thead>	
														   <tr class="text-center bg-secondary color-palette">
																<th style="width: 250px">사이트 명</th>	
																<th style="width: 250px">아이디</th>	
																<th style="width: 250px">패스워드</th>	
																<th style="width: 250px">웹 사이트</th>														
																<th style="width: 250px">비고</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center">
																	공공데이터 포탈
																</td>
																<td class="text-center">
																 neonexsoft
																</td>
																<td class="text-center">
																ict_neonex!1
																</td>
																<td class="text-center">
																<a class="btn btn-success btn-sm" href="https://www.data.go.kr/index.do" target="_blank" >WEB</a>
																</td>									
																<td class="text-center">
																	 공공데이터 제공 API 연동
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	KT Cloud
																</td>
																<td class="text-center">
																  ictneonex@neonexsoft.com
																</td>
																<td class="text-center">
																 spdhsprtm5001!
																</td>
																<td class="text-center">
																<a class="btn btn-success btn-sm" href="https://cloud.kt.com/portal/l/login" target="_blank" >WEB</a>
																</td>									
																<td class="text-center">
																 1차팜 서비스 관련
																</td>
															</tr>
															<tr>
																<td class="text-center">
																	KT Cloud
																</td>
																<td class="text-center">
																 cloud@neonexsoft.com
																</td>
																<td class="text-center">
																 Spdhsprtm5001!
																</td>
																<td class="text-center">
																<a class="btn btn-success btn-sm" href="https://cloud.kt.com/portal/l/login" target="_blank" >WEB</a>
																</td>									
																<td class="text-center">
																 NIA,표준팜 서비스 관련
																</td>
															</tr>
															<tr>
																<td class="text-center">
																구글클라우드<br>(BMS 지도 API 사이트)
																</td>
																<td class="text-center">
																  5001neo@gmail.com
																</td>
																<td class="text-center">
																  neonex04
																</td>
																<td class="text-center">
																<a class="btn btn-success btn-sm" href="https://console.cloud.google.com/" target="_blank" >WEB</a>
																</td>									
																<td class="text-center">
																 BMS 관련
																</td>
															</tr>
														
														</tbody>
													</table>
												</div>
																															
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
											</div>
											
										
	        
			<!-- footer -->
<!-- 			<footer class="main-footer" > -->
<!-- 				footer -->
<!-- 			</footer> -->
		
	</body>
</html>
