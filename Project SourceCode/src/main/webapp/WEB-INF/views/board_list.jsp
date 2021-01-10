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
	margin-bottom: 30px;
	border: 1px solid #0000001f;
}

.GJW-menutext {
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

.GJW-menu {
	display: flex;
	margin-bottom: 60px;
	justify-content: space-around;
	margin-top: 30px;
}

#GJW-boardtable {
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

.gjw-list-tr {
	border-bottom: 0.1px solid #80808036;
}

.gjw-hotlist-tr {
	border-bottom: 0.1px solid #80808036;
	background-color: #f0f8ffcc;
}

.gjw-pass-div {
	margin-top: 3px;
	display: flex;
}

.gjw-secretnumber {
	border: 1px solid #3d91ff;
	outline: none;
	text-align: center;
}

.gjw-secretsubmit {
	display: block;
	margin-left: 2px;
	/* border: 1px solid #3d91ff; */
	background: none;
	color: #3d91ff;
	font-size: 14px;
}

.gjw-list-td {
	font-size: 15px;
	padding-top: 11px;
	padding-bottom: 8px;
	font-family: 'Jal_Onuel';
}
g{
font-size: 13px;
    color: #00000066;
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
					<tr style="border-bottom: 1px solid #00000026;">
						<td>글번호</td>
						<td>글제목</td>
						<td>작성자</td>
						<td>작성시간</td>
						<td>추천수</td>
						<td>조회수</td>
					</tr>
					<tr>
						<c:forEach var="hvo" items="${hotlist}" varStatus="status">
							<tr class="gjw-hotlist-tr">
								<td class="gjw-list-td">${hvo.b_id}</td>
								<td class="gjw-list-td"
									style="display: flex; justify-content: center;">
									<p class="gjw-board-title"
										style="display: inline; padding: 7px; padding-right: 0px; cursor: pointer;">${hvo.b_title}
										
																	<c:if test="${not empty hvo.b_commentCount}">
										<g>(${hvo.b_commentCount })</g>
										</c:if>
										</p>
									<div>
										<img
											src="${pageContext.request.contextPath}/resources/images/hotview.png">
									</div>
									<div class="gjw-pass-div">
										<input type="hidden" value="${hvo.b_secret }"
											class="gjw-board-secret"> <input type="hidden"
											value="${hvo.b_id }" class="gjw-board-b_id"> <input
											type="password" style="display: none;"
											class="gjw-secretnumber"> <input type="hidden"
											value="${hvo.b_secretnumber }" class="gjw-secretnumber-text">
											<input type="hidden" value="${hvo.m_id }"
											class="gjw-board-m_id">
										<input type="button" style="display: none;"
											class="gjw-secretsubmit" value="확인">
									</div>
								</td>
								<td class="gjw-list-td">${hvo.m_id}</td>
								<td class="gjw-list-td"><fmt:formatDate var="date"
										value="${hvo.b_timestamp}" pattern="yyyy-MM-dd HH:mm" />

									${date}</td>
								<td class="gjw-list-td">${hvo.b_like}</td>
								<td class="gjw-list-td">${hvo.b_view}</td>
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
							<tr class="gjw-list-tr">
								<td class="gjw-list-td">${vo.b_id}</td>
								<c:choose>
									<c:when test="${vo.b_secret eq 'Y'}">
										<td class="gjw-list-td"
											style="display: flex; justify-content: center;">
											<p class="gjw-board-title"
												style="display: inline; padding: 7px; padding-right: 0px;">${vo.b_title}<c:if test="${not empty vo.b_commentCount}">
										
										<g>(${vo.b_commentCount })</g>
										</c:if></p>
											<div>
												<img
													src="${pageContext.request.contextPath}/resources/images/lock1.png">
											</div>
									</c:when>
									<c:otherwise>
										<td class="gjw-list-td">
											<p class="gjw-board-title" style="display: inline;">${vo.b_title}<c:if test="${not empty vo.b_commentCount}">
										
										<g>(${vo.b_commentCount })</g>
										</c:if></p>
									</c:otherwise>
								</c:choose>
								<div class="gjw-pass-div">
									<input type="hidden" value="${vo.b_secret }"
										class="gjw-board-secret"> <input type="hidden"
										value="${vo.b_id }" class="gjw-board-b_id"> <input
										type="password"
										style="display: none; margin-bottom: 5px; width: 60%;"
										class="gjw-secretnumber"> <input type="hidden"
										value="${vo.b_secretnumber }" class="gjw-secretnumber-text">
										<input type="hidden" value="${vo.m_id }"  class="gjw-board-m_id"> 
									<input type="button" style="display: none; margin-bottom: 5px"
										class="gjw-secretsubmit" value="확인">
								</div>
								</td>

								<td class="gjw-list-td">${vo.m_id}</td>
								<td class="gjw-list-td"><fmt:formatDate var="date"
										value="${vo.b_timestamp}" pattern="yyyy-MM-dd HH:mm" />

									${date}</td>
								<td class="gjw-list-td">${vo.b_like}</td>
								<td class="gjw-list-td">${vo.b_view}</td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<c:choose>
							<c:when test="${not empty userID}">
								<td colspan="6"
									style="text-align: end; padding-top: 30px; padding-right: 30px; color: #0AC5A8;"><a
									href="board_write.do"
									style="color: #0AC5A8; border: 3px solid #6495ed6b; border-radius: 10px; padding: 6px; font-family: 'Jal_Onuel';">글쓰기</a></td>
							</c:when>
						</c:choose>
					</tr>

					<tr>
						<td colspan="6">
							<form action="board_list.do" method="get" style="padding-top:20px;">
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
 </c:if>
 							 	 <c:if test="${currentPage > 1}">
								<c:url var="blistST" value="board_list.do">
									<c:param name="page" value="${currentPage-1}" />
									<c:param name="type" value="${type}" />
									<c:if test="${not empty keyword}">
										<c:param name="keyword" value="${keyword }"></c:param>
										</c:if>
									
								</c:url>
								<a href="${blistST}"
									style="color: #0AC5A8; font-family: 'Jal_Onuel';">[이전]</a>
							</c:if> <!-- 끝 페이지 번호 처리 --> 
							
		
							<c:forEach var="p" begin="${startPage}" end="${endPage }">
								<c:if test="${p <= maxPage}"> 
								<c:if test="${p eq currentPage}">
									<font color="cornflowerblue" size="4"><b>[${p}]</b></font>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="blistchk" value="board_list.do">
										<c:param name="page" value="${p}" />
										<c:param name="type" value="${type}" />
										<c:if test="${not empty keyword}">
										<c:param name="keyword" value="${keyword }"></c:param>
										</c:if>
									</c:url>
									<a href="${blistchk}">${p}</a>
								</c:if>
								</c:if> 
							</c:forEach> <c:if test="${currentPage >= maxPage}">
 [다음]
 </c:if> <c:if test="${currentPage < maxPage}">
								<c:url var="blistEND" value="board_list.do">
									<c:param name="page" value="${currentPage+1}" />
									<c:param name="type" value="${type}" />
									<c:if test="${not empty keyword}">
										<c:param name="keyword" value="${keyword }"></c:param>
										</c:if>
									
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
	<script>
		$(function() {
			$(".gjw-board-title").click(
					function() {
						var b_secret = $(this).nextAll(".gjw-pass-div")
								.children(".gjw-board-secret").val();
						var b_id = $(this).nextAll(".gjw-pass-div").children(
								".gjw-board-b_id").val();
						var m_id = $(this).nextAll(".gjw-pass-div").children(
								".gjw-board-m_id").val();
						if (b_secret == "Y") {
							alert("비밀글입니다 비밀번호를 입력해주세요");
							$(this).nextAll(".gjw-pass-div").children(
									".gjw-secretnumber")
									.css("display", "block");
							$(this).nextAll(".gjw-pass-div").children(
									".gjw-secretsubmit")
									.css("display", "block");
							$(this).nextAll(".gjw-pass-div").children(
									".gjw-secretnumber").focus();

						} else {
							location.href = "board_detail.do?b_id=" + b_id + "&m_id=" + m_id
									+ "&page=${currentPage}"
						}
					})
		})
		$(function() {
			var sc = $(".bb_secret").val();
			console.log(sc);
			if (sc == "N") {

				sc.next("img").css("display", "none");
			}
		})
		$(function() {
			$(".gjw-secretsubmit").click(
					function() {
						var b_secretnumber = $(this).prev(
								".gjw-secretnumber-text").val();
						var b_secretnumber1 = $(this).prev().prev(
								".gjw-secretnumber").val()
						var b_id = $(this).prev().prev()
								.prev(".gjw-board-b_id").val();
						var passReg = /^[0-9]{4}$/;
						if (b_secretnumber == "") {
							alert("비밀번호를 입력해주세요");
							return;
						} else if (!passReg.test(b_secretnumber)) {
							alert("숫자 4자리를 입력해주세요");
							return;
						} else {
							if (b_secretnumber == b_secretnumber1) {
								location.href = "board_detail.do?b_id=" + b_id
										+ "&page=${currentPage}"

							} else {
								alert("비밀번호를 잘못입력하셨습니다");
							}
						}
					})

		})
	</script>
</body>
</html>