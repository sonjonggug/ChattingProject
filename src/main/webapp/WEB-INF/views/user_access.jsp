<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--유저 페이지-->
<!--user_access.html-->
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
    <meta charset="UTF-8">
    <title>user access</title>
</head>
<body>
<h1>!!!환영합니다!!!</h1>
<div th:text="${info}"></div>
</body>
</html>