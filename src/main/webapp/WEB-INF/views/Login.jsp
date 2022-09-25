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
	</head>
	<body class="hold-transition login-page">
		<div class="login-box">
			<div class="card card-outline card-primary">
				<div class="card-header text-center">
					<b>Enterprise Operating Manager</b>
				</div>
				<div class="card-body">
					 <form action="/login_proc" method="post">
						<div class="input-group mb-3">
							<input type="text" class="form-control" name="username" id="username" placeholder="아이디 입력해주세요" value="Admin">
						</div>
						<div class="input-group mb-3">
							<input type="password" class="form-control" name="password" id="password" placeholder="password">
						</div>
					  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
					<div class="social-auth-links text-center mt-2 mb-3">
						<button type="submit" class="btn btn-block btn-primary"> 
							로그인
						</button>
						<button type="button"onclick ="location.href='/signup'" class="btn btn-block btn-primary"> 
							회원가입
						</button>
<!-- 						 <button type="button" class="btn btn-primary" onClick="location.href='signUp'">회원 가입</button> -->
					</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>