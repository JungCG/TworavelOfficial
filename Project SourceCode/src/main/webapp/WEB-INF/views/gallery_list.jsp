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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style>

* {
	padding: 0;
	margin: 0;
	border: 0;
	box-sizing: border-box;
	text-decoration: none;
}
/*  border-collapse: collapse;
    color: #0AC5A8; */
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

#yjh_writeBtn {
	text-align: right;
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


				<div id="yjh_writeBtn">
					<a href="gallery_write.do">글쓰기</a>
				</div>

				<div id="ICR_Product_main">
					<div style="display:flex; flex-wrap:wrap; justify-content:space-between;">
						<c:if test="${not empty list }">
							<c:forEach items="${list }" var="pvo" varStatus="i">
								<table style="width: 300px;">

									<tr>
										<td colspan="3"><a
											href="gallery_detail.do?page=${currentPage}&gallery_num=${pvo.g_id }">
												<img
												src="${pageContext.request.contextPath }/resources/gallery_uploadFiles/${pvo.g_img1}"
												style="width: 300px; height: 350px;">

										</a></td>
									</tr>

									<tr>
										<td>${pvo.g_content}</td>

										<td colspan="2" id="ICR_p_like_N" style="text-align: right"><img 
											style="width: 30px; height: 30px;"
											src="${pageContext.request.contextPath }/resources/images/p_like.png">
											${pvo.g_like}</td>

										<!--  <td>${pvo.g_view}</td> -->
									</tr>

								</table>
							</c:forEach>
						</c:if>
<!--  -->
<!-- <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="..." class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="..." class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="..." class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div> -->
<!--  -->


							
							
						<c:if test="${not empty list }">
						<!-- 앞 페이지 번호 처리 -->
							<div id="YJH_paging" style="text-align: center; margin:0 auto;">
								<table>
								<tr align="center" height="20">
									<td colspan="5"
										style="padding-top: 20px; font-family: 'Jal_Onuel';"><c:if
											test="${currentPage <= 1}">
[이전]&nbsp;
</c:if> <c:if test="${currentPage > 1}">
											<c:url var="blistST" value="gallery_list.do">
												<c:param name="page" value="${currentPage-1}" />
											</c:url>
											<a href="${blistST}" style="font-family: 'Jal_Onuel';">[이전]</a>




										</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" />
										<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
											<c:if test="${p eq currentPage}">
												<font color="red" size="4"><b>[${p}]</b></font>
											</c:if>
											<c:if test="${p ne currentPage}">
												<c:url var="blistchk" value="gallery_list.do">
													<c:param name="page" value="${p}" />
												</c:url>
												<a href="${blistchk}">${p}</a>
											</c:if>
										</c:forEach> <c:if test="${currentPage >= maxPage}">
[다음]
</c:if> <c:if test="${currentPage < maxPage}">
											<c:url var="blistEND" value="gallery_list.do">
												<c:param name="page" value="${currentPage+1}" />
											</c:url>
											<a href="${blistEND}" style="font-family: 'Jal_Onuel';">[다음]</a>
										</c:if></td>
								</tr>
								</table>
							</div>
						</c:if>
						<c:if test="${empty list }">
							<div id="ICR_Product">
								<table style="width: 250px; table-layout: fixed;">
									<tr>
										<td colspan="2"
											style="text-align: left; text-overflow: ellipsis; overflow: hidden;">데이터없음
										</td>
									</tr>
								</table>
							</div>
						</c:if>

					</div>
				</div>




			</div>




		</div>
		<jsp:include page="footer.jsp" />
	</div>

	<!-- 글쓰기 버튼 유무  -->
	<script>
		if ("${sessionScope.userID}" != "") {
			$('#yjh_writeBtn').css('display', 'block');
		} else {
			$('#yjh_writeBtn').css('display', 'none');
			$('#YJH_Glike_Y').css('display', 'none');
		}
	</script>
</body>
</html>