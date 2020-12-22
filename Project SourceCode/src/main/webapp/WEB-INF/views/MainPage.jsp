<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse:collapsed;
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
		<jsp:include page="home.jsp"/>
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>