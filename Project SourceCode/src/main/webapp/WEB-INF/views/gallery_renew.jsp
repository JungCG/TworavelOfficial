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

.first_td {
	width: 200px;
	text-align: center;
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


				<div id="yjh_btn" style="display: flex; justify-content: flex-end;">
					<div
						style="margin-left: 10px; border-radius: 10px; border: 3px solid #6495ed6b;">
						<input type="button" id="bbt1"
							style="border: 0; border-radius: 10px; width: 100%; height: 100%; padding: 6px; color: #0ac5a8; background-color: #ffffff; cursor: pointer;" value="목록">
					</div>
				</div>


				<form action="gUpdate.do" method="post"
					enctype="multipart/form-data">
					<table id="yjh_table">
						<tr>
							<td class="first_td">작성자</td>
							<td colspan="3"><input type="text" name="board_writer"
								value="${gallery.m_id}" readonly="readonly"> <input
								type="hidden" name="g_id" value="${gallery.g_id}"></td>
						</tr>
						<tr>
							<td colspan="4">&nbsp;</td>
						</tr>
						<tr>
							<td class="first_td">기존 첨부파일</td>
							<td style="width: 250px;"><img
								src="${pageContext.request.contextPath }/resources/gallery_uploadFiles/${galleryAdd.g_img1}"
								style="height: 200px; width: 250px; margin-right: 5px;" /></td>
							<td style="width: 250px;"><img
								src="${pageContext.request.contextPath }/resources/gallery_uploadFiles/${galleryAdd.g_img2}"
								style="height: 200px; width: 250px; margin: 0 5px;" /></td>
							<td style="width: 250px;"><img
								src="${pageContext.request.contextPath }/resources/gallery_uploadFiles/${galleryAdd.g_img3}"
								style="height: 200px; width: 250px; margin: 0 5px;" /></td>
						</tr>
						<tr>
							<td colspan="4">&nbsp;</td>
						</tr>
						<tr>
							<td class="first_td">변경할 첨부파일</td>
							<td style="width: 250px; overflow-x: hidden;"><input
								style="width: 250px;" type="file" name="upfile1"
								required="required"></td>
							<td style="width: 250px; overflow-x: hidden;"><input
								style="width: 250px;" type="file" name="upfile2"
								required="required"></td>
							<td style="width: 250px; overflow-x: hidden;"><input
								style="width: 250px;" type="file" name="upfile3"
								required="required"></td>

						</tr>
						<tr>
							<td colspan="4">&nbsp;</td>
						</tr>
						<tr>
							<td class="first_td">내용</td>

							<%--  <td><input type="text" name="g_content"
								value="${gallery.g_content }"></td>   --%>


							<td colspan="3" style="border: 1px solid #333;"><textarea
									style="width: 100%;" rows="10" cols="" name="g_content"
									required="required" placeholder="글을 작성해주세요">${gallery.g_content }</textarea>
							</td>
						<tr>
							<td colspan="4">&nbsp;</td>
						</tr>




					</table>

					<!--  <div style="width: 100%; text-align: right;">
						<input type="submit" value="수정" id="yjh_edit_btn">
					</div> -->


					<div id="yjh_btn" style="display: flex; justify-content: flex-end;">
						<div
							style="margin-left: 10px; border-radius: 10px; border: 3px solid #6495ed6b;">
							<input type ="submit"  id="bbt2"
								style="border: 0; border-radius: 10px; width: 100%; height: 100%; padding: 6px; color: #0ac5a8; background-color: #ffffff; cursor: pointer;" value="수정">


						</div>
					</div>


					<br>

				</form>





			</div>




		</div>
		<jsp:include page="footer.jsp" />

		<script>
			$('#bbt1').click(function() {
				location.href = "gallery_list.do";
			});
			/* $('#bbt2').click(function(){
				location.href="/gInsert.do?gallery_num=${gallery.g_id }";
			}); */
		</script>

</body>
</html>