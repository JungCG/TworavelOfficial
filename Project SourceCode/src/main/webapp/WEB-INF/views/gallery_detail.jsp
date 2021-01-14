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
							<td>${gallery.m_id }</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td><c:if test="${empty galleryAdd.g_img1 }">
				첨부파일 없음
			</c:if> <c:if test="${not empty galleryAdd.g_img1 }">
									<img
										src="${pageContext.request.contextPath }/resources/gallery_uploadFiles/${galleryAdd.g_img1}" />

								</c:if></td>
						</tr>
						<tr>
							<td>내용</td>
							<td>${gallery.g_content }</td>
						</tr>
						<tr>
							<td><a href="gallery_renew.do?gallery_num=${gallery.g_id }">수정페이지로
									이동</a> &nbsp;&nbsp; <a href="gallery_delete.do?gallery_num=${gallery.g_id }">글 삭제</a>
								&nbsp;&nbsp; <a href="gallery_list.do">목록으로</a></td>
						</tr>

					</table>
					<br>

				</form>





			</div>




		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>