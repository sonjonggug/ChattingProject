<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--로그인 페이지-->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>bookmark test</title>
		<link rel="stylesheet" href="/resources/css/adminlte.css">
		<link rel="stylesheet" href="/resources/css/all.css">
		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/adminlte.min.js"></script>
		<script src="/resources/js/bootstrap.bundle.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<script>
function checkk(){
	var idvalue = document.getElementById('userid').value;
	var idcheck = /^[a-z0-9]+$/
	    if (!idcheck.test(idvalue) || idvalue.length<6){ // .test 로 정규식 체크를 하는듯??
	    	alert('아이디는 영소문자,숫자로 구성된 6글자 이상으로 조합해주세요.')
	        $('#userid').focus()
	        return false;
	    }
	 var pw1 = document.getElementById('user_pw').value;
	 var pw2 = document.getElementById('user_pw2').value;
	 var pwcheck =/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/ // 최소 8 자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자 정규식
	    if ( pw1 != pw2 ) {
	      alert( '패스워드가 일치 하지않습니다.' );
	      $('#user_pw').focus()
	      return false;
	    }     
	   if (!pwcheck.test(pw1) || pw1.length<8 ){
		   alert('패스워드는 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자로 구성된 8글자 이상으로 조합해주세요.' );
	      $('#user_pw').focus()
	      return false;
	}
	 var username = document.getElementById('user_name').value;
	 var usernamecheck =/^[가-힣]{2,5}$/
	   if (!usernamecheck.test(username)){
		   alert('이름을 정확히 기재하세요' );
	      $('#user_name').focus()
	      return false;
	}
}

</script>
	</head>
	<body class="hold-transition login-page">
		<div class="login-box">
			<div class="card card-outline card-primary">
				<div class="card-header text-center">
					<b>Enterprise Operating Manager</b>
				</div>
				<div class="card-body">
					 <form action="/signup" method="post" onsubmit="return checkk();">
					     <div class="input-group mb-3">
							<input type="text" class="form-control" name="userid" id="userid" placeholder="아이디를 입력해주세요" >
							<button type="button" id="sbm-btn" name="sbm-btn">아이디 중복 확인</button>						
						</div>						
						<div class="input-group mb-3">
							<input type="password" class="form-control" name="user_pw" id="user_pw" placeholder="패스워드를 입력해주세요">
						</div>
						<div class="input-group mb-3">
							<input type="password" class="form-control" name="user_pw2" id="user_pw2" placeholder="패스워드를 재입력해주세요">
						</div>						
						<div class="input-group mb-3">							
							<input type="text" class="form-control" name="user_name" id="user_name" placeholder="이름을 입력해주세요">							
						</div>
						<div class="text-center">
						<input class="text-center" type="radio" id="customRadio1" name="user_sex" value="남" checked>
						<label for="customRadio1" class="label">남자</label> 									
						<input class="text-center" type="radio" id="customRadio2" name="user_sex" value="여"  >
						<label for="customRadio2" class="label">여자</label> 
						</div>               						
	                   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="social-auth-links text-center mt-2 mb-3">
						<button type="submit" class="btn btn-block btn-primary"> 
							회원가입
						</button>
<!-- 						 <button type="button" class="btn btn-primary" onClick="location.href='signUp'">회원 가입</button> -->
					</div>
					</form>
				</div>
			</div>
		</div>
		<script>
		$("#sbm-btn").on("click",function(){
		 	var text = $("#userid").val();
		 	$.ajax({
		 		 type : 'GET',
		 	    url :'/checkid',
		 	   data :{
		    		userid : text,	    		
		    	},
		 	    dataType : "json",
// 		 	   	contentType : 'application/json',
		 	    success : function(data) {       
		 	    	if (data.count > 0) {        	
		 	    		 alert("사용가능한 아이디입니다.");
		 	    		 $("#user_pw").focus();
		 	    		}else {
		 	                alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
		 	                //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인                  
		 	                $("#userid").focus();                                                     
		 	            }      	                        	
		 	    },
		 	    error : function(error) {
		 	        alert("실패하였습니다.");    
		 	        alert(arror);
		 	    }
		 		}); 
			});		 
		</script>
	</body>
</html>