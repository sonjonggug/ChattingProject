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
 
<script>
</script>
</head>
<body> 
<script> 
   
 	function English(){
 		var text= $("#msg").val();
	   $.ajax({
	        type : 'GET',
	        url :'/SearchEng',
	        data :{
	    		lang : text,	    		
	    	},
	        dataType : "json",
	        success : function(data) {        
	            $("#msg").val(data.message.result.translatedText);
	        },
	        error : function(error) {
	            alert("실패하였습니다.");
           
	        }
	    }); 
 	}
	function China(){
 		var text= $("#msg").val();
	   $.ajax({
	        type : 'GET',
	        url :'/SearchChi',
	        data :{
	    		lang : text,	    		
	    	},
	        dataType : "json",
	        success : function(data) {        	
	            $("#msg").val(data.message.result.translatedText);
	        },
	        error : function(error) {
	            alert("실패하였습니다.");
           
	        }
	    }); 
 	}
	function StartClock(){
//    timerId = setInterval(PrintTime, 1000);
	var text = $("#channel").val();
		$.ajax({
	 		 type : 'GET',
	 	    url :'/SearchCnt',
	 	   	data :{
	 	   	channel : text,	    		
	    	},
	 	    dataType : "json",
//	 	   	contentType : 'application/json',
	 	    success : function(data) {       
	 	      alert(data);	                        	
	 	    },
	 	    error : function(error) {
	 	        alert("실패하였습니다.");    	 	        
	 	    }
	 		}); 
			
	}
</script>

	<div id='chatt'>	 	
		<h1>단체 채팅창</h1>
		<h3>IP : ${sessionScope.IP}  Port :  ${sessionScope.Port}</h3> <h3 id="channel" name="channel" >${sessionScope.channel}</h3>
		<input type='hidden' id='mid' value='${sessionScope.id}' readonly>
		<input type='hidden' value='로그인' id='btnLogin' >
		<buttion type="button" onclick="Session();">${sessionScope.Count}</buttion>
		<br/>
		<div id='talk'></div>
		<div id='sendZone'>
			<textarea id='msg' value='hi...' ></textarea>
			<button type="button" onclick="China();">중국어</button>
			<button type="button" onclick="English();">영어</button>
			<button type="button" onclick="StartClock();">차트</button>
			<input type='hidden' value='전송' id='btnSend'>						
			<input type='hidden' value='${sessionScope.id} 님이 입장하셨습니다.' id='alram1'>
		</div>
	</div>
	<div>
	<!--차트가 그려질 부분-->
	  <canvas id="myChart" width="100" height="100"></canvas>
	</div>
	<script src='resources/js/chatt.js'></script>
</body>
</html>