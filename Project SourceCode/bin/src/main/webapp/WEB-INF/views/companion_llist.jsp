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
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div id="common" style="width: 1000px; padding: 80px 0px;">
			<h3>동 행 게 시 판</h3>
			<form method="get" name="listForm" action="bList.do">
				<input type="hidden" name="page" value="${currentPage}"> <input
					type="text" name="keyword"> <input type="submit" value="검색">
			</form>
			<table>
				<tr>
					<td align="right" colspan="5"><input type="button"
						value="전체목록" onclick="window.location='bList.do'"> <input
						type="button" value="글쓰기" onclick="window.location='writeForm.do'"></td>
				</tr>
				<tr bgcolor="#FFD1B7">
					<td align="center" width="120">글상태</td>
					<td align="center" width="100">글번호</td>
					<td align="center" width="480">글제목</td>
					<td align="center" width="100">작성자</td>
					<td align="center" width="100">작성일</td>
					<td align="center" width="100">조회수</td>
				</tr>
				<!-- 글이 없을 경우 -->
				<c:if test="${listCount eq 0}">
					<tr>
						<td colspan="6" align="center"><br> <br> 게시판에 저장된
							글이 없습니다.<br> <br></td>
					</tr>
				</c:if>
				<c:if test="${listCount ne 0}">
					<c:forEach var="vo" items="${list}" varStatus="status">
						<tr>
							<td align="center">${status.count}</td>
							<!-- $안에 상태 넣어야지 -->
							<td align="center">${status.count}</td>
							<td align="left"><a
								href="bDetail.do?board_num=${vo.board_num}&page=${currentPage}">
									&nbsp;${vo.board_title} </a></td>
							<td align="center">${vo.board_writer}</td>
							<td align="center">${vo.regDate}</td>
							<td align="center">${vo.read_count}</td>
						</tr>
					</c:forEach>
				</c:if>
				<!-- 앞 페이지 번호 처리 -->
				<tr align="center" height="20">
					<td colspan="5"><c:if test="${currentPage <= 1}">[이전]&nbsp;
						</c:if> <c:if test="${currentPage > 1}">
							<c:url var="blistST" value="bList.do">
								<c:param name="page" value="${currentPage-1}" />
							</c:url>
							<a href="${blistST}">[이전]</a>
						</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" />
						<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
							<c:if test="${p eq currentPage}">
								<font color="red" size="4"><b>[${p}]</b></font>
							</c:if>
							<c:if test="${p ne currentPage}">
								<c:url var="blistchk" value="bList.do">
									<c:param name="page" value="${p}" />
								</c:url>
								<a href="${blistchk}">${p}</a>
							</c:if>
						</c:forEach> <c:if test="${currentPage >= maxPage}">[다음]
						</c:if> <c:if test="${currentPage < maxPage}">
							<c:url var="blistEND" value="bList.do">
								<c:param name="page" value="${currentPage+1}" />
							</c:url>
							<a href="${blistEND}">[다음]</a>
						</c:if></td>
				</tr>
			</table>
			<script type="text/javascript">
				$(function() {
					$('form[name=listForm]')
							.on(
									'submit',
									function(e) {
										if ($('input[name=keyword]').val() == null
												|| $('input[name=keyword]')
														.val() == "") {
											alert("검색어를 입력해 주세요");
											e.preventDefault();
										} else {
											return true;
										}
									});
				});
				function showInsertForm() {
					location.href = "Companion_write.do";
				}
			</script>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>