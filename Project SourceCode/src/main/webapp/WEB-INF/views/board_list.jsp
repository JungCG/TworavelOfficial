<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
* {
	outline:none;
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse: collapse;
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

#gjw-wrap {
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
}

.GJW-menutext {
	font-size: 30px;
}

.GJW-menu {
	display: flex;
	margin-bottom: 60px;
	justify-content: space-around;
}

#GJW-boardtable {
	text-align: center;
	border-collapse: collapse;
}

tr:first-of-type>td {
	padding-bottom: 20px;
	color: cornflowerblue;
	font-size: 18px;
}

a {
	text-decoration: none;
	color: black;
}

#gjw-list-tr {
	border-bottom: 0.1px solid #80808036;
}
</style>
</head>
<body>
	<script>
		$(function() {
			if ('${type}' == 'N') {
				$("#N").css("color", "cornflowerblue");
			}
			if ('${type}' == 'G') {
				$("#G").css("color", "cornflowerblue");
			}
			if ('${type}' == 'R') {
				$("#R").css("color", "cornflowerblue");
			}

		})
	</script>

	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div id="gjw-wrap">
			<section>

				<div class="GJW-menu">
					<div class="GJW-menutext">
						<a href="board_list.do?type=N" id="N">공지사항</a>
					</div>
					<div class="GJW-menutext">
						<a href="board_list.do?type=G" id="G">여행정보</a>
					</div>
					<div class="GJW-menutext">
						<a href="board_list.do?type=R" id="R">리뷰</a>
					</div>
				</div>
				<table id="GJW-boardtable">
					<tr>
						<td>글번호</td>
						<td>글제목</td>
						<td>작성자</td>
						<td>작성시간</td>
						<td>추천수</td>
						<td>조회수</td>
					</tr>
					<c:if test="${listCount eq 0}">
						<tr>
							<td colspan="6" align="center"><br> <br> 게시판에 저장된
								글이 없습니다.<br> <br></td>
						</tr>
					</c:if>
					<c:if test="${listCount ne 0}">
						<c:forEach var="vo" items="${list}" varStatus="status">
							<tr id="gjw-list-tr">
								<td style="padding-top: 5px; padding-bottom: 5px;">${vo.b_id}</td>
								<td style="padding-top: 5px; padding-bottom: 5px;"><a
									href="board_detail.do?b_id=${vo.b_id}&page=${currentPage}">
										&nbsp;${vo.b_title} </a></td>
								<td style="padding-top: 5px; padding-bottom: 5px;">${vo.m_id}</td>
								<td style="padding-top: 5px; padding-bottom: 5px;">${vo.b_timestamp}</td>
								<td style="padding-top: 5px; padding-bottom: 5px;">${vo.b_like}</td>
								<td style="padding-top: 5px; padding-bottom: 5px;">${vo.b_view}</td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<td colspan="6"
							style="text-align: end; padding-top: 30px; padding-right: 30px; color: #0AC5A8;"><a
							href="board_write.do" style="color: #0AC5A8;border: 3px solid #6495ed6b;border-radius: 10px; padding:6px">글쓰기</a></td>
					</tr>

					<tr>
						<td colspan="6">
							<form action="" method="get">
								<input type="text" placeholder="검색어를 입력해주세요"
									style="width: 250px; height: 20px; border-radius: 10px; border:3px solid #6495ed6b; padding: 10px;">
								<input type="submit" value="검색"
								style="background-color: white;border-radius: 10px;height: 100%;border: 3px solid #6495ed6b;padding: 5px;color: #0AC5A8;">
							</form>
						<td>
					</tr>
					<tr align="center" height="20">
						<td colspan="6" style="padding-top: 20px;color:#0AC5A8;"><c:if
								test="${currentPage <= 1}"> [이전]&nbsp;
 </c:if> <c:if test="${currentPage > 1}">
								<c:url var="blistST" value="board_list.do">
									<c:param name="page" value="${currentPage-1}" />
									<c:param name="type" value="${type}" />
								</c:url>
								<a href="${blistST}" style="color:#0AC5A8;">[이전]</a>
							</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" />
							<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
								<c:if test="${p eq currentPage}">
									<font color="cornflowerblue" size="4"><b>[${p}]</b></font>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="blistchk" value="board_list.do">
										<c:param name="page" value="${p}" />
										<c:param name="type" value="${type}" />

									</c:url>
									<a href="${blistchk}">${p}</a>
								</c:if>
							</c:forEach> <c:if test="${currentPage >= maxPage}">
 [다음]
 </c:if> <c:if test="${currentPage < maxPage}">
								<c:url var="blistEND" value="board_list.do">
									<c:param name="page" value="${currentPage+1}" />
									<c:param name="type" value="${type}" />
								</c:url>
								<a href="${blistEND}" style="color:#0AC5A8;">[다음]</a>
							</c:if></td>
					</tr>
				</table>
			</section>
		</div>
		<jsp:include page="footer.jsp" />
	</div>

</body>
</html>