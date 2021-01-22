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

yjh_table {
	margin: 0 auto;
}

#yjh_edit_btn {
	background-color: white;
	cursor: pointer;
	font-size: medium;
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



				<form action="gInsert.do" method="post"
					enctype="multipart/form-data">

					
					<div id="yjh_btn" style="display: flex; justify-content: flex-end;">
						<div
							style="margin-left: 10px; border-radius: 10px; border: 3px solid #6495ed6b;">
							<input type="button" id="bbt1"
								style="border: 0; border-radius: 10px; width: 100%; height: 100%; padding: 6px; color: #0ac5a8; background-color: #ffffff; cursor: pointer;" value="목록">
						</div>
					</div>


					<table id="yjh_table">

						<tr>
							<td class="first_td">작성자</td>
							<td><input type="text" name="m_id" value="${userID }"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td class="first_td">첨부파일</td>
							<!-- 원래 vo에 있는 이름 board_file 을 사용하게 되면 String 형태여야 함. file 형태로 가져가야 하므로 name을 vo의 field명과 다르게 지정함. -->
							<td><input style="width:250px" type="file" name="upfile1" required="required">
								<input style="width:250px" type="file" name="upfile2" required="required"> <input style="width:250px"
								type="file" name="upfile3" required="required"></td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td class="first_td">내용</td>
							<td style="border: 1px solid #333;">
								<!-- <input type="text" name="g_content" required="required"></td> -->
								<textarea style="width: 100%;" rows="10" cols=""
									name="g_content" required="required" placeholder="글을 작성해주세요"></textarea>
							</td>

						</tr>

						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
					</table>

					<div id="yjh_btn" style="display: flex; justify-content: flex-end;">
						<div
							style="margin-left: 10px; border-radius: 10px; border: 3px solid #6495ed6b;">
							<input type ="submit" id="bbt2"
								style="border: 0; border-radius: 10px; width: 100%; height: 100%; padding: 6px; color: #0ac5a8; background-color: #ffffff; cursor: pointer;" value="등록">


						</div>
					</div>
				</form>





			</div>

			<script>
				$('#bbt1').click(function() {
					location.href = "gallery_list.do";
				});
				/* $('#bbt2').click(function(){
					location.href="gallery_renew.do?gallery_num=${gallery.g_id }";
				}); */
			</script>


		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>