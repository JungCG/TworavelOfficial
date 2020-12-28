<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
input {
	cursor: pointer;
	font-size:17px;
	font-weight : bolder;
}

.jck_login_container button {
	background-color: white;
	cursor: pointer;
	border-radius: 25px;
	width: 100px;
	height: auto;
	border: 0;
}

.jck_login_container button:first-child {
	width : 100px;
	height : auto;
}

.jck_login_container {
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-around;
	align-items: center;
}

.jck_login_container .topImg {
	width : 312px;
	height : auto;
}

.jck_login_container .snsImg {
	width: 100px;
	height: auto;
}

.jck_login_container .rightimg {
	width: 500px;
	height : auto;
}

.jck_login_container .jck_login_input {
	width: 350px;
	height: 50px;
	background-color: white;
	font-weight: bolder;
	border: 3px solid #0AC5A8;
	border-radius: 25px;
	box-sizing: border-box;
	text-align: center;
}

.jck_login_container .middle_input {
	width: 150px;
	height: 35px;
	color: white;
	background-color: #0AC5A8;
	border-radius: 25px;
	box-sizing: border-box;
	text-align: center;
}

.jck_login_container .middle_input:active{
	background-color: rgba(10,197,168,0.7);
}

.jck_login_container .middle_input:hover{
	background-color: rgba(10,197,168,0.7);
}

.jck_login_container .right_input {
	width: 150px;
	height: 35px;
	color: white;
	background-color: #0AC5A8;
	border-radius: 25px;
	box-sizing: border-box;
	text-align: center;
}

.jck_login_container .right_input:active{
	background-color: rgba(10,197,168,0.7);
}

.jck_login_container .right_input:hover{
	background-color: rgba(10,197,168,0.7);
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
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp"/>
		<div id = "common" style="width : 1000px; padding : 80px 0px;">
			<div class = "jck_content_container">
            <div class = "jck_content_container_div2">
                <div class="jck_login_container">
					<div class="jck_login_item jck_login_item1">
						<div>
							<h2>My Account</h2>
							<h4>Sign in</h4>
							<br>
							<div style="text-align:center;">
								<button style="width : 312px;">
									<img src="${pageContext.request.contextPath }/resources/images/tourist.jpg" class="topImg">
								</button>
							</div>
						</div>
					</div>
					<div class="jck_login_item jck_login_item2">
						<div style="padding-top:100px; text-align : center;">
							<form action="LoginCtl.do" method="post">
								<table id="table_tr">
									<tr id="table_tr_id">
										<td>ID&nbsp;&nbsp;&nbsp;</td>
										<td colspan="2"><input type="text" name="m_id"
											id="m_id" class="jck_login_input" required></td>
									</tr>
									<tr id="table_tr_middle">
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr id="table_tr_pw">
										<td>PW&nbsp;&nbsp;&nbsp;</td>
										<td colspan="2"><input type="password"
											name="m_pw" id="m_pw" class="jck_login_input"
											required></td>
									</tr>
									<tr id="table_tr_middle">
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr id="table_tr_btn">
										<td></td>
										<td><input type="submit" value="로그인"
											class="middle_input font_change"></td>
										<td><input type="reset" value="Reset"
											class="middle_input font_change"></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>

									<tr>
										<td></td>
										<td><a href="#"><input type="button" value="회원가입"
												class="right_input font_change" id="jck_join_btn"></a></td>
										<td><a href="#"><input type="button" value="아이디 찾기"
												class="right_input font_change" id="search_page"></a></td>
									</tr>
								</table>
							</form>
							
							<div style="text-align:center; padding-top : 50px;">
								<button style="margin-left: 35px;">
									<img src="${pageContext.request.contextPath }/resources/images/google.png" class="snsImg">
								</button>
								<button style="margin-left : 30px;">
									<img src="${pageContext.request.contextPath }/resources/images/facebook.png" class="snsImg">
								</button>
								<button style="margin-left : 30px;">
									<img src="${pageContext.request.contextPath }/resources/images/instagram.png" class="snsImg">
								</button>
							</div>
						</div>
					</div>
				</div>
            </div>
			</div>
		</div>
		<jsp:include page="footer.jsp"/>
	</div>
	<script>
    	$(document).ready(function(){
    		$("#jck_join_btn").click(function() {
				location.href = "./joinPre.do";
			});
    		
    		$("#search_page").click(function(){
    			location.href = "./searchPage.do";
    		});
    	});
   	</script>
</body>
</html>