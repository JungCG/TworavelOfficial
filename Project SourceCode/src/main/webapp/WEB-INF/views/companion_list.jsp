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
	display: flex;
	justify-content: center;
	flex-direction: column;
	margin-bottom: 30px;
	border: 1px solid #0000001f;
}

.KDY-menu {
	display: flex;
	margin-bottom: 60px;
	justify-content: space-around;
	margin-top: 30px;
}

.KDY-menutext {
	color: #2C3C5B;
	font-size: 50px;
	padding: 10px;
	text-shadow: 2px 2px 2px #FBE8D9;
}

.KDY-notice {
	
}

.KDY-noticetitle {
	margin-top: 4px;
	color: #2c555b;
	font-size: 20px;
	padding: 10px;
	text-shadow: 1px 1px 1px #FBE8D9;
}

.KDY-noticetext {
	color: #93BDBF;
	font-size: 16px;
	padding: 10px;
	padding-left: 40px;
}

#KDY-companiontable {
	text-align: center;
	border-collapse: collapse;
	margin-bottom: 30px;
}

.kdy-companion-title:hover {
	color: #93BDBF;
	font-weight: bold;
	transition: 1s;
	cursor: pointer;
}

tr:first-of-type>td {
	padding-bottom: 20px;
	font-size: 18px;
}

tr>td {
	/* color: #282828; */
	color: #686868;
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
						<p>동행 구하기</p>
					</div>
					<div class="KDY-notice">
						<p class="KDY-noticetitle">동행글 작성 및 신청은 신중히 판단하여 본인이 신청해 주시기
							바랍니다.</p>
						<ul class="KDY-noticetext">
							<li>글 작성시 포인트 30포인트 차감, 동행 신청시 20포인트 차감</li>
							<li>게시글에는 연락처를 꼭 명시해 주시기 바랍니다.</li>
							<li>중복글 및 규정에 맞지 않는 글은 운영자가 수정 및 삭제 가능합니다.</li>
						</ul>
					</div>
				</div>
				<table id="KDY-companiontable">
					<tr>
						<td>글번호</td>
						<td>글상태</td>
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
								<td class="kdy-list-td">${hvo.c_dealstatus}</td>
								<td class="kdy-list-td"
									style="display: flex; justify-content: center;">
									<p class="kdy-companion-title"
										style="display: inline; padding: 7px; padding-right: 0px;">${hvo.c_name}</p>
									<div>
										<img
											src="${pageContext.request.contextPath}/resources/images/hotview.png">
									</div>
								</td>
								<td class="kdy-list-td">${hvo.m_id}</td>
								<td class="kdy-list-td"><fmt:formatDate var="date"
										value="${hvo.c_adddate}" pattern="yyyy-MM-dd HH:mm" />

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
								<td class="kdy-list-td"><c:if
										test="${vo.c_dealstatus eq 'N'}">
										<font style="color: #0072ffad;" color="blue" size="4">진행중</font>
									</c:if>
									<c:if test="${vo.c_dealstatus eq 'Y'}">
										<font style="color: #ff5200bb;" color="red" size="4">완료</font>
									</c:if></td>
								<td class="kdy-list-td">
									<p class="kdy-companion-title" style="display: inline;">${vo.c_name}</p>
									<input type=hidden value="${vo.c_id}" name="c_id" class="c_id">
								</td>
								<td class="kdy-list-td">${vo.m_id}</td>
								<td class="kdy-list-td"><fmt:formatDate var="date"
										value="${vo.c_adddate}" pattern="yyyy-MM-dd HH:mm" /> ${date}</td>
								<td class="kdy-list-td">${vo.c_like}</td>
								<td class="kdy-list-td">${vo.c_view}</td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<c:choose>
							<c:when test="${not empty userID}">
								<td colspan="6"
									style="text-align: end; padding-top: 30px; padding-right: 30px; color: #0AC5A8;"><button
										type="button" id="clwrite"
										style="color: #0AC5A8; border: 3px solid #6495ed6b; border-radius: 10px; padding: 6px; background-color: #ffffff;">글쓰기</button></td>
							</c:when>
						</c:choose>
					</tr>
					<tr>
						<td colspan="6">
							<form action="companion_list.do" method="get">
								<input type="text" placeholder="검색어를 입력해주세요"
									style="width: 250px; height: 20px; border-radius: 10px; border: 3px solid #6495ed6b; padding: 10px; margin-top: 30px; margin-left: 100px;"
									name="keyword"> <input type="submit" value="검색"
									style="background-color: white; border-radius: 10px; height: 100%; border: 3px solid #6495ed6b; padding: 5px; color: #0AC5A8;">
							</form>
						<td>
					</tr>
					<tr align="center" height="20">
						<td colspan="6"
							style="padding-top: 20px; color: #0AC5A8;padding-left: 100px;">
							<c:if test="${currentPage <= 1}">[이전]&nbsp;
							</c:if> <c:if test="${currentPage > 1}">
								<c:url var="clistST" value="companion_list.do">
									<c:param name="page" value="${currentPage-1}" />
									<c:param name="type" value="${type}" />
									<c:if test="${not empty keyword}">
										<c:param name="keyword" value="${keyword}"></c:param>
									</c:if>
								</c:url>
								<a href="${clistST}"
									style="color: #0AC5A8;">[이전]</a>
							</c:if> <!-- 끝 페이지 번호 처리 --> <c:forEach var="p" begin="${startPage}"
								end="${endPage}">
								<c:if test="${p <= maxPage}">
									<c:if test="${p eq currentPage}">
										<font color="cornflowerblue" size="4"><b>[${p}]</b></font>
									</c:if>
									<c:if test="${p ne currentPage}">
										<c:url var="clistchk" value="companion_list.do">
											<c:param name="page" value="${p}" />
											<c:param name="type" value="${type}" />
											<c:if test="${not empty keyword}">
												<c:param name="keyword" value="${keyword }"></c:param>
											</c:if>
										</c:url>
										<a href="${clistchk}">${p}</a>
									</c:if>
								</c:if>
							</c:forEach> <c:if test="${currentPage >= maxPage}">[다음]
	 						</c:if> <c:if test="${currentPage < maxPage}">
								<c:url var="clistEND" value="companion_list.do">
									<c:param name="page" value="${currentPage+1}" />
									<c:param name="type" value="${type}" />
									<c:if test="${not empty keyword}">
										<c:param name="keyword" value="${keyword }"></c:param>
									</c:if>
								</c:url>
								<a href="${clistEND}"
									style="color: #0AC5A8;">[다음]</a>
							</c:if>
						</td>
					</tr>
				</table>
			</section>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
	<script>
		$(function() {
			$(".kdy-companion-title").click(
					function() {
						var c_id = $(this).next(".c_id").val();
						location.href = "companion_detail.do?c_id=" + c_id
								+ "&page=${currentPage}"
					});
		});
		//수정부분
		$(function() {
			$("#clwrite").click(function() {
				var user_id = "${userID}";
				if (user_id == "null" || user_id == "") {
					alert("동행글을 작성 하시려면 로그인을 해야됩니다");
				} else {
					$.ajax({
						url : "companion_write.do",
						data : {
							m_id : "${userID}"
						},
						success : function(res) {
							if (res >= 30) {
								location.href = "companion_write_result.do"
							} else {
								alert("포인트가 부족합니다. 앵벌이 스타트!");
							}

						}
					});
				}
			});
		});
	</script>
</body>
</html>