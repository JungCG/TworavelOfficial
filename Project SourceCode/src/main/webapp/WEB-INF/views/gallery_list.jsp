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

	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div id="common" style="width: 1000px; padding: 80px 0px;">
			<div class="jck_content_container_div2">


				<div id="ICR_writeBtn">
					<a href="gallery_write.do">글쓰기</a>
				</div>

				<div id="ICR_Product_main">
					<div>
						<c:if test="${not empty list }">
							<c:forEach items="${list }" var="pvo" varStatus="i">
								<table style="display: inline; width: 350px;">
									
									<tr>
										<td colspan="3"><a href="./">
										<img
												src="${pageContext.request.contextPath }/resources/gallery_uploadFiles/${pvo.g_img1}"
												style="width: 300px; height: auto;"> 
										
												</a></td>
									</tr>
									
									<tr>
										<td>${pvo.g_content}</td>
										<td>${pvo.g_like}</td>
										<td>${pvo.g_view}</td>
									</tr>
									







								</table>
							</c:forEach>



 

							<!-- 앞 페이지 번호 처리 -->
							<div id="YJH_paging">
								<tr align="center" height="20">
									<td colspan="5" style="padding-top: 20px; color: #0AC5A8; font-family: 'Jal_Onuel';"><c:if test="${currentPage <= 1}">
[이전]&nbsp;
</c:if> <c:if test="${currentPage > 1}">
											<c:url var="blistST" value="gallery_list.do">
												<c:param name="page" value="${currentPage-1}" />
											</c:url>
											<a href="${blistST}"
												style="color: #0AC5A8;  font-family: 'Jal_Onuel';">[이전]</a>




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
											<a href="${blistEND}"
												style="color: #0AC5A8; font-family: 'Jal_Onuel';">[다음]</a>
										</c:if></td>
								</tr>
							</div>
							<c:if test="${i.count%3 eq 0}">
								<br>
							</c:if>

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





				<%-- <div id="ICR_Product">
									<table style="width: 250px; table-layout: fixed;">
										<tr>
											<td colspan="2"><a
												href="ProductContentCtl.do?p_id=${pvo.p_id}&c_lid=${pvo.c_lid}&m_id=${pvo.m_id}&Likeresult=0">
													<img
													style="width: 240px; height: 180px; border-radius: 15px;"
													src="./upload/${pvo.pa_img3}">
											</a></td>
										</tr>
										<tr>
											<td colspan="2"
												style="text-align: left; text-overflow: ellipsis; overflow: hidden;"><nobr>
													<a
														href="ProductContentCtl.do?p_id=${pvo.p_id}&c_lid=${pvo.c_lid}&m_id=${pvo.m_id}&Likeresult=0">${pvo.p_name}</a>
												</nobr></td>
										</tr>
										<tr>
											<td colspan="2"
												style="text-align: left; font-size: small; width: 40px;">${pvo.l_name}&nbsp;&nbsp;|&nbsp;
												<fmt:parseDate var="dateString" value="${pvo.p_adddate }"
													pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
													value="${dateString}" pattern="yy년 MM월 dd일 " />
										</tr>
										<tr>
											<td style="font-weight: bold; text-align: left;">${pvo.p_value}원</td>
											<td style="text-align: right;"><img
												src="./images/p_view.png" style="width: 20px; height: 20px;">${pvo.p_view }&nbsp;
												<img src="./images/p_like.png"
												style="width: 18px; height: 18px;">${pvo.p_like }</td>
										</tr>
									</table>
								</div>
								<c:if test="${i.count%3 eq 0}">
									<br>
								</c:if> --%>






			</div>




		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>