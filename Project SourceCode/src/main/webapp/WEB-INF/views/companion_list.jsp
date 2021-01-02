<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

@font-face {
	font-family: 'MaplestoryOTFBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'MaplestoryOTFLight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFLight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NEXONFootballGothicLA1';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXONFootballGothicLA1.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Jal_Onuel';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'BMHANNAAir';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'BBTreeGB';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGB.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

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

#kdy-wrap {
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

section {
	width: 1000px;
	width: 1000px;
	display: flex;
	justify-content: center;
	flex-direction: column;
	margin-bottom: 30px;
	border: 1px solid #0000001f;
}

.KDY-menutext {
	font-size: 30px;
	font-size: 30px;
	border: 4px solid #3d91ff38;
	border-radius: 40px;
	padding: 10px;
	background-color: #0000ff00;
	text-shadow: 1px 1px 1px #3d91ff70;
	box-shadow: 1px 1px 1px #3d91ff59;
	font-family: 'Hanna', fantasy;
}

.KDY-menu {
	display: flex;
	margin-bottom: 60px;
	justify-content: space-around;
	margin-top: 30px;
}

#KDY-companiontable {
	text-align: center;
	border-collapse: collapse;
	margin-bottom: 30px;
}

tr:first-of-type>td {
	padding-bottom: 20px;
	font-size: 18px;
	font-family: 'MaplestoryOTFBold';
}

a {
	text-decoration: none;
	color: black;
}

.kdy-list-tr {
	border-bottom: 0.1px solid #80808036;
}

.kdy-hotlist-tr {
	border-bottom: 0.1px solid #80808036;
	background-color: #f0f8ffcc;
}

.kdy-pass-div {
	margin-top: 3px;
	display: flex;
}

.kdy-list-td {
	font-size: 15px;
	padding-top: 11px;
	padding-bottom: 8px;
	font-family: 'Jal_Onuel';
}
</style>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div id="kdy-wrap">
			<section>
				<div class="KDY-menu">
					<div class="KDY-menutext">
						<a href="companion_list.do?type=N" id="N">동행 구하기</a>
					</div>
				</div>
				<table id="KDY-companiontable">
					<tr>
						<td>글번호</td>
						<td>글제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>추천수</td>
						<td>조회수</td>
					</tr>
					<tr>
						<c:forEach var="hvo" items="${hotlist}" varStatus="status">
							<tr class="kdy-hotlist-tr">
								<td class="kdy-list-td">${hvo.c_id}</td>
								<td class="kdy-list-td"
									style="display: flex; justify-content: center;">
									<p class="kdy-companion-title"
										style="display: inline; padding: 7px; padding-right: 0px;">${hvo.c_title}</p>
									<div>
										<img
											src="${pageContext.request.contextPath}/resources/images/hotview.png">
									</div>
								</td>
								<td class="kdy-list-td">${hvo.m_id}</td>
								<td class="kdy-list-td"><fmt:formatDate var="date"
										value="${hvo.c_timestamp}" pattern="yyyy-MM-dd HH:mm" />

									${date}</td>
								<td class="kdy-list-td">${hvo.c_like}</td>
								<td class="kdy-list-td">${hvo.c_view}</td>
							</tr>

						</c:forEach>
					</tr>
					<c:if test="${listCount eq 0}">
						<tr>
							<td colspan="6" align="center"><br> <br> 게시판에 저장된
								글이 없습니다.<br> <br></td>
						</tr>
					</c:if>
					<c:if test="${listCount ne 0}">
						<c:forEach var="vo" items="${list}" varStatus="status">
							<tr class="kdy-list-tr">
								<td class="kdy-list-td">${vo.c_id}</td>
								<c:choose>
									<%-- <c:when test="${vo.c_secret eq 'Y'}">
										<td class="kdy-list-td"
											style="display: flex; justify-content: center;">
											<p class="kdy-companion-title"
												style="display: inline; padding: 7px; padding-right: 0px;">${vo.c_name}</p>
											<div>
												<img
													src="${pageContext.request.contextPath}/resources/images/lock1.png">
											</div>
									</c:when> --%>
									<c:otherwise>
										<td class="kdy-list-td">
											<p class="kdy-companion-title" style="display: inline;">${vo.c_name}</p>
									</c:otherwise>
								</c:choose>
								</td>

								<td class="kdy-list-td">${vo.m_id}</td>
								<td class="kdy-list-td"><fmt:formatDate var="date"
										value="${vo.c_timestamp}" pattern="yyyy-MM-dd HH:mm" />

									${date}</td>
								<td class="kdy-list-td">${vo.c_like}</td>
								<td class="kdy-list-td">${vo.c_view}</td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<td colspan="6"
							style="text-align: end; padding-top: 30px; padding-right: 30px; color: #0AC5A8;"><a
							href="companion_write.do"
							style="color: #0AC5A8; border: 3px solid #6495ed6b; border-radius: 10px; padding: 6px; font-family: 'Jal_Onuel';">글쓰기</a></td>
					</tr>

					<tr>
						<td colspan="6">
							<form action="companion_list.do" method="get">
								<input type="text" placeholder="검색어를 입력해주세요"
									style="width: 250px; height: 20px; border-radius: 10px; border: 3px solid #6495ed6b; padding: 10px;"
									name="keyword"> <input type="submit" value="검색"
									style="background-color: white; border-radius: 10px; height: 100%; border: 3px solid #6495ed6b; padding: 5px; color: #0AC5A8; font-family: 'Jal_Onuel';">
							</form>
						<td>
					</tr>
					<tr align="center" height="20">
						<td colspan="6"
							style="padding-top: 20px; color: #0AC5A8; font-family: 'Jal_Onuel';"><c:if
								test="${currentPage <= 1}"> [이전]&nbsp;
 </c:if> <c:if test="${currentPage > 1}">
								<c:url var="blistST" value="companion_list.do">
									<c:param name="page" value="${currentPage-1}" />
									<c:param name="type" value="${type}" />
								</c:url>
								<a href="${blistST}"
									style="color: #0AC5A8; font-family: 'Jal_Onuel';">[이전]</a>
							</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" />
							<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
								<c:if test="${p eq currentPage}">
									<font color="cornflowerblue" size="4"><b>[${p}]</b></font>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="blistchk" value="companion_list.do">
										<c:param name="page" value="${p}" />
										<c:param name="type" value="${type}" />

									</c:url>
									<a href="${blistchk}">${p}</a>
								</c:if>
							</c:forEach> <c:if test="${currentPage >= maxPage}">
 [다음]
 </c:if> <c:if test="${currentPage < maxPage}">
								<c:url var="blistEND" value="companion_list.do">
									<c:param name="page" value="${currentPage+1}" />
									<c:param name="type" value="${type}" />
								</c:url>
								<a href="${blistEND}"
									style="color: #0AC5A8; font-family: 'Jal_Onuel';">[다음]</a>
							</c:if></td>
					</tr>
				</table>
			</section>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>