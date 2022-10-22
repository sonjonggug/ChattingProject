<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<link rel='stylesheet' type='text/css' href='/resources/css/chatt.css'>
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="/resources/css/all.css">
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
 
 
</head>
<body> 
<script> 

</script>

	<div id='chatt'>	 			
		<h3>IP : ${sessionScope.IP}  Port :  ${sessionScope.Port}</h3> <h3 id="user_cnt">현재 1명 접속중입니다.</h3>
		<input type='hidden' id="channel" name="channel" value='${sessionScope.channel}'>
		<input type='hidden' id='mid' name="mid" value='${sessionScope.id}' readonly>
		<input type='hidden' value='로그인' id='btnLogin' >
		<buttion type="button" onclick="Session();">${sessionScope.Count}</buttion>
		<br/>
		<div id='talk'></div>
		<div id='sendZone'>
			<textarea id='msg' name='msg'></textarea>
			<button type="button" onclick="China();">중국어</button>
			<button type="button" onclick="English();">영어</button>
			<input type='hidden' value='전송' id='btnSend'>						
			<input type='hidden' value='${sessionScope.id} 님이 입장하셨습니다.' id='alram1' name='alram1'>
			<input type='hidden' value='${sessionScope.id} 님이 퇴장하셨습니다.' id='exitAlram'>
		</div>
	</div>
	<div>	
	</div>
	<script src='resources/js/chatt.js'></script>
	<script src='resources/js/api.js'></script>

</body>
</html>