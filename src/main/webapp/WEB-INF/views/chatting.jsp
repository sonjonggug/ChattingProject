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
 
 <!--	cross origin	-->
<!-- <script type="text/javascript" src="/js/jquery.ajax-cross-origin.min.js"></script> -->
 
</head>
<body> 
<script> 
   
//  setInterval(SearchCnt, 30000);
   
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
	function SearchCnt(){
      
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
	 	    	  $("#user_cnt").text("현재 "+data+"명 접속중입니다."); 	 	    	 
	 	    },
	 	    error : function(error) {
	 	        alert("실패하였습니다.");    	 	        
	 	    }
	 		}); 
			
	}
	function talkBot(){
	      
		var text = $("#msg").val(); // 메시지 정보
		var userid = $("#mid").val(); // 메시지 정보
		var channel_name = $("#channel").val(); // 메시지 정보
		
		var msg = "Q : "+text+ "A :";
		
			$.ajax({
		 		 type : 'GET',
		 	    url :'/talkBot',
		 	   	data :{
		 	   	talk : msg ,
		 	   	userid : userid ,
		 	   	channel_name : channel_name 
		    	},
		 	    dataType : "json",

		 	    success : function(data) {
		 	    	var str = data.generations[0].text;
		 	    	var words = str.indexOf(':'); // 첫번째로 Q가 있는 위치 index 리턴 		  	    	
		 	    	var result = str.slice(0, words-2); //0부터 첫번째 Q가 있는위치까지 짜름
		 	    	$('input[name=alram1]').attr('value',result);
		 	    	sendo();

		 	    
		 	    },
		 	    error : function(error) {
		 	        alert(error);    	 	        
		 	    }
		 		}); 
				
		}
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
			<button type="button" onclick="talkBot();">테스트</button>
			<input type='hidden' value='전송' id='btnSend'>						
			<input type='hidden' value='${sessionScope.id} 님이 입장하셨습니다.' id='alram1' name='alram1'>
			<input type='hidden' value='${sessionScope.id} 님이 퇴장하셨습니다.' id='exitAlram'>
		</div>
	</div>
	<div>	
	</div>
	<script src='resources/js/chatt.js'></script>

</body>
</html>