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
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<body>

<!-- private int g_id;
	private String m_id;
	private int g_like;
	private String g_content;
	private int g_view; -->
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div id="common" style="width: 1000px; padding: 80px 0px;">
			<div class="jck_content_container_div2">


				<form action="gInsert.do" method="post"
					enctype="multipart/form-data">
					<table align="center">
						
						<tr>
							<td>작성자</td>
							<td><input type="text" name="m_id"></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<!-- 원래 vo에 있는 이름 board_file 을 사용하게 되면 String 형태여야 함. file 형태로 가져가야 하므로 name을 vo의 field명과 다르게 지정함. -->
							<td><input type="file" name="upfile"></td>
						</tr>

						<tr>
							<td>내용</td>
							<td><input type="text" name="g_content"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="등록하기"> &nbsp;&nbsp; <a href="gallery_list.do">목록으로</a></td>
						</tr>
					</table>
				</form>





			</div>




		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>