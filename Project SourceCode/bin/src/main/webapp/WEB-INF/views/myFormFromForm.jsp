<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목 수정해주세요.</title>
<style>
* {
	outline:none;
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse:collapse;
	box-sizing:border-box;
	text-decoration:none;
}

html{
	height : 100%;
}

body{
	height : 100%;
}

.jck_wrap{
	min-height:100%;
	position : relative;
	padding-bottom : 200px;
}

</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp"/>
		<div id = "common" style="width : 1000px; padding : 80px 0px;">
		
		</div>
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>