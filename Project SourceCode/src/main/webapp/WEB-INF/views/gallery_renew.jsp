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

#yjh_table {
	margin: 0 auto;
}

#yjh_edit_btn {
	background-color: white;
	cursor: pointer;
	font-size: medium
}

#yjh_btn {
	text-align: right;
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

				<div id="yjh_btn">
					<input type="submit" value="수정하기 " id="yjh_edit_btn">
					&nbsp;&nbsp; <a href="gallery_list.do">목록으로</a>
				</div>

				<form action="gUpdate.do" method="post"
					enctype="multipart/form-data">
					<table id="yjh_table">
						<tr>
							<td>작성자</td>
							<td><input type="text" name="board_writer"
								value="${gallery.m_id}" readonly="readonly"> <input
								type="hidden" name="g_id" value="${gallery.g_id}"></td>
						</tr>
						<tr>
							<td>기존 첨부파일</td>
							<td><c:if test="${empty galleryAdd.g_img1 }">
						첨부파일 없음
					</c:if> <c:if test="${!empty galleryAdd.g_img1 }">
									<img
										src="${pageContext.request.contextPath }/resources/gallery_uploadFiles/${galleryAdd.g_img1}" />

								</c:if></td>
						</tr>
						<tr>
							<td>변경할 첨부파일</td>
							<td><input type="file" name="upfile" multiple></td>
						</tr>

						<tr>
							<td>내용</td>
							<td><input type="text" name="g_content"
								value="${gallery.g_content }"></td>
						</tr>


					</table>
					<br>
					</table>
				</form>





			</div>




		</div>
		<jsp:include page="footer.jsp" />
	</div>
	<script>
		
	</script>
</body>
</html>