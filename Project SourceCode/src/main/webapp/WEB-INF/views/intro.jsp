<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jck_main.css">
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
	box-sizing: border-box;
	text-decoration: none;
}
/*  border-collapse: collapse; */
html {
	height: 100%;
}

body {
	height: 100%;
}

.jck_wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 200px;
}

#ICR_writeBtn {
	position: left;
}

#YJH_paging {
	position: center;
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<body>

	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div id="common" style="width: 1000px; padding: 80px 0px;">
			<div class="jck_content_container_div2">


				1.사이트 소개 <br> 2.팀소개<br> 3.자매품 감자마켓<br> 4.저작권 표기






			</div>




		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>