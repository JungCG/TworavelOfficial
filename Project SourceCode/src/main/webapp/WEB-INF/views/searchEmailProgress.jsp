<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 전송중</title>
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

.pre-loader {
	background: #fff;
	background-position: center center;
	background-size: 13%;
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	z-index: 12345;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center
}

.pre-loader .loader-logo {
	padding-bottom: 15px
}

.pre-loader .loader-progress {
	height: 30px;
	border-radius: 15px;
	max-width: 700px;
	margin: 0 auto;
	display: block;
	background: #ecf0f4;
	overflow: hidden
}

.pre-loader .bar {
	width: 0%;
	height: 30px;
	display: block;
	background: #f1d6bc;
}

.pre-loader .percent {
	text-align: center;
	font-size: 24px;
	display: none
}

.pre-loader .loading-text {
	text-align: center;
	font-size: 18px;
	font-weight: bolder;
	padding-top: 15px;
}

</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo"><img src="${pageContext.request.contextPath }/resources/images/preloadImg.jpg" alt=""></div>
			<div class='loader-progress' id="progress_div">
				<div class='bar' id='bar1'></div>
			</div>
			<div class='percent' id='percent1'>0%</div>
			<div class="loading-text">
				임시 비밀번호 이메일 전송중!!
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/resources/js/Emailprocess.js"></script>
	<script>
		location.href = "SearchEmailSendCtl.do?m_id=${m_id}";
	</script>
</body>
</html>