<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<style>
* {
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse: collapsed;
	box-sizing: border-box;
	text-decoration: none;
}

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
input {
	cursor: pointer;
}

.jck_login_container button {
	background-color: white;
	cursor: pointer;
	border-radius: 25px;
	border: 0;
}

.jck_login_container {
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-around;
	align-items: center;
	flex-basis: 10%;
}

.jck_login_container .jck_login_input {
	width : 300px;
	height : 50px;
	background-color: white;
	font-weight: bolder;
	border: 3px solid #2C3C5B;
	border-radius: 25px;
	box-sizing: border-box;
	text-align: center;
}

.jck_login_container .middle_input {
	width : 100px;
	height: 50px;
	color: white;
	background-color: #0AC5A8;
	border-radius: 25px;
	box-sizing: border-box;
	text-align: center;
	font-weight : bolder;
}

.jck_login_item {
	display: flex;
}

#table_tr {
	text-align: center;
	border-collapse: collapse;
	box-sizing: border-box;
	font-weight: bolder;
}

</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div id="common" style="width: 1000px; padding: 80px 0px;">
			<div class="jck_content_container_div2" style="padding-top:20px;">
				<div class="jck_login_container">
					<div class="jck_login_item jck_login_item2">
						<div>
							<form action="IdSearchCtl.do" id="idsearchform"
								name="idsearchform" method="post">
								<table id="table_tr">
									<tr>
										<td></td>
										<td colspan="2"><h1 align="center">아이디 찾기</h1></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr id="table_tr_id">
										<td class="font_change">이름&nbsp;&nbsp;&nbsp;</td>
										<td colspan="2"><input type="text" name="search_name"
											id="search_name" class="jck_login_input" required></td>
									</tr>
									<tr id="table_tr_middle">
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr id="table_tr_pw">
										<td class="font_change">이메일&nbsp;&nbsp;&nbsp;</td>
										<td colspan="2"><input type="text" name="search_email"
											id="search_email" class="jck_login_input" required></td>
									</tr>
									<tr id="table_tr_middle">
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr id="table_tr_btn">
										<td></td>
										<td><input type="reset" class="middle_input font_change"></td>
										<td><input type="submit" value="찾기" id="idsearchbtn"
											class="middle_input font_change"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
					<div class="jck_login_item jck_login_item2">
						<div>
							<form action="PwdSearchCtl.do" id="pwdsearchform"
								name="pwdsearchform" method="post">
								<table id="table_tr">
									<tr>
										<td></td>
										<td colspan="2"><h1 align="center">비밀번호 찾기</h1></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr id="table_tr_id">
										<td class="font_change">아이디&nbsp;&nbsp;&nbsp;</td>
										<td colspan="2"><input type="text" name="search_id"
											id="search_id" class="jck_login_input" required></td>
									</tr>
									<tr id="table_tr_middle">
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr id="table_tr_pw">
										<td class="font_change">이메일&nbsp;&nbsp;&nbsp;</td>
										<td colspan="2"><input type="text" name="search_email"
											id="search_email" class="jck_login_input" required></td>
									</tr>
									<tr id="table_tr_middle">
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr id="table_tr_btn">
										<td></td>
										<td><input type="reset" class="middle_input font_change"></td>
										<td><input type="submit" value="찾기" id="pwdsearchbtn"
											class="middle_input font_change"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>