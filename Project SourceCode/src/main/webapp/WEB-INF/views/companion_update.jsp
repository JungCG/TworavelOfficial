<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

KDY {
	width: 100%;
	display: flex;
	justify-content: center;
	margin-top: 70px;
	margin-bottom: 100px;
}

section {
	width: 1000px;
	display: flex;
	justify-content: center;
	flex-direction: column;
}

#smart_editor2 {
	width: 100%;
}

#kdy-title-input {
	height: 30px;
	width: 50%;
	border: 3px solid rgb(78 102 255/ 39%);
	outline: none;
	padding-left: 5px;
}

#kdy-type-select {
	border: 3px solid rgb(78 102 255/ 39%);
	outline: none;
	color: dodgerblue;
}

#kdy-password-input {
	border: 3px solid rgb(78 102 255/ 39%);
	outline: none;
}

input[type='radio']:after {
	width: 15px;
	height: 15px;
	border-radius: 15px;
	top: -2px;
	left: -1px;
	position: relative;
	background-color: #d1d3d1;
	content: '';
	display: inline-block;
	visibility: visible;
	border: 2px solid white;
}

input[type='radio']:checked:after {
	width: 15px;
	height: 15px;
	border-radius: 15px;
	top: -2px;
	left: -1px;
	position: relative;
	background-color: aliceblue;
	content: '';
	display: inline-block;
	visibility: visible;
	border: 3px solid powderblue;;
}

#kdy-secret-tr {
	display: none;
}

#submitModifyCompanionBtn {
	color: #0AC5A8;
	border: 3px solid rgb(78 102 255/ 39%);
	font-size: 16px;
	background-color: white;
	border-radius: 5px;
	padding: 5px;
}

#kdy-serach-list {
	color: #0AC5A8;
	border: 3px solid rgb(78 102 255/ 39%);
	border-radius: 5px;
	padding: 5px;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js">
	
</script>
</head>

<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<KDY>
		<section>
			<form name="frm" enctype="multipart/form-data">
				<input type="hidden" value="${clist.c_id }" name="c_id">
				<table align="center" style="width: 100%;">
					<tr style="height: 80px">
						<td style="color: #0AC5A8;">글제목</td>
						<td style="width: 85%;"><input type="text" name="c_name"
							id="kdy-title-input" required="required" value="${clist.c_name }"></td>
					<tr style="height: 30px">
						<td style="color: #0AC5A8;">작성자</td>
						<td><input type="text" name="m_id" value="${userID }"
							readonly="readonly"></td>
					</tr>
					<tr>
						<td style="color: #0AC5A8;">경비</td>
						<td style="width: 85%;"><input type="text" name="c_value"
							id="kdy-companion-value" required="required" value="${clist.c_value}"></td>
					</tr>
					<tr>
						<td style="color: #0AC5A8;">인원</td>
						<td style="width: 85%;"><input type="text" name="c_many"
							id="kdy-companion-many" required="required" value="${clist.c_many}"></td>
					</tr>
			
					<tr style="height: 30px">
						<td style="color: #0AC5A8;">출발 날짜</td>
						<td style="width: 85%;" colspan="3">
						<fmt:parseDate var="Sdate" value="${clist.c_startd}"
								pattern="yyyy-MM-dd" />
						<input type="date"
							name="c_startd" id="kdy-startd-input" value=<fmt:formatDate value="${Sdate}" pattern="yyyy-MM-dd" />
							></td>
					</tr>
					<tr style="height: 30px">
						<td style="color: #0AC5A8;">도착 날짜</td>
						<td style="width: 85%;" colspan="3">
						<fmt:parseDate var="Edate" value="${clist.c_endd}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						<input type="date"
							name="c_endd" id="kdy-endd-input" value=<fmt:formatDate value="${Edate}" pattern="yyyy-MM-dd" />
							required="required"></td>
					</tr>
							
					<tr style="height: 30px">
						<td style="color: #0AC5A8;">글분류</td>
						<td style="width: 90%; padding-top: 30px; padding-bottom: 30px;">
							<select name="c_type" id="kdy-type-select">
								<option value="S">수도권</option>
								<option value="G">지방</option>
								<option value="I">섬</option>
						</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="padding-top: 30px;"><textarea
								id="c_description" name="c_description"></textarea>
								</td>
					</tr>
					<tr style="height: 50px">
						<td colspan="2" align="end"><input type="button"
							id="submitModifyCompanionBtn" value="등록하기"> <a
							href="companion_list.do" id="kdy-serach-list">목록으로</a>
							</td>
					</tr>
				</table>
			</form>
		</section>
		</KDY>
		<jsp:include page="footer.jsp" />
	</div>
	<script type="text/javascript"> 
/* 	$(function(){
		   var a = <fmt:parseDate var="Sdate" value="${clist.c_startd}"
				pattern="yyyy-MM-dd HH:mm:ss" />
					<fmt:formatDate value="${Sdate}" pattern="yyyy-MM-dd" />;
		   var b = <fmt:parseDate var="Edate" value="${clist.c_endd}"
				pattern="yyyy-MM-dd HH:mm:ss" />
					<fmt:formatDate value="${Edate}" pattern="yyyy-MM-dd" />;
		   
		   $("#kdy-startd-input").val(a);
		   $("#kdy-endd-input").val(b);
		
	}) */
		   

	
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder:"c_description",  //textarea ID
    sSkinURI: "${pageContext.request.contextPath}/resources/se/SmartEditor2Skin.html",  //skin경로
    fCreator: "createSEditor2",

    
    fOnAppLoad:function(){
	oEditors.getById["c_description"].exec("PASTE_HTML", ["${fn:replace(clist.c_description, "\"", "'") }"]);
	}
});
$('#submitModifyCompanionBtn').click(function() {
	if($("#kdy-title-input").val()==""){
		alert("글 제목을 입력해주세요")
	$("#kdy-title-input").focus();
		return false;
	}
oEditors.getById["c_description"].exec("UPDATE_CONTENTS_FIELD", []);
document.frm.action ="updatecompanion.do";
document.frm.method ="POST";
document.frm.submit();
 });

 </script>
</body>
</html>