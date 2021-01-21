<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminPage</title>
<style>

* {
   color: #333;
   font-family : 'Jal_Onuel';
}
* {
	outline: none;
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



.boardtype {
	display: flex;
	justify-content: center;
	flex-direction: column;
	font-size: 20px;
}

#gela {
}

#prola {
}

#qnala {
}

#newsla {
}

.imgtextbox {
	display: flex;
}

.GJW-gocontent {
	cursor: pointer;
}

.GJW-hotviewtr {class ="GJW-boardlisttr"
	
}

.GJW-boardlisttr {
}

.rd {
	display: none;
}

.GJW-commentCount {
	font-size: 14px;
	color: gray;
}

.GJW-boardlisttr {
}

section {
	display: flex;
	flex-direction: column;
	width: 1800px;
}

.boardtype-1 {
	display: flex;
	font-weight: bolder;
}

.typeimg {
	width: 300px;
	height: 300px;
	margin-bottom: 10px;
}

.gjw-board-wrap {
	width: 1500px;
	display: flex;
	justify-content: center;
	flex-direction: column;
	margin-top: 30px;
	margin-bottom: 30px;
}

.boardtype-1 {
	margin: 20px;
	font-size: 25px;
}

.boardtype {
	width: 20%;
	display: contents;
}

.GJW-Board {
	display: flex;
	border-bottom: 2px solid #a52a2a26;
	display: flex;
	justify-content: space-around;
}

label {
	cursor: pointer;
}

.imgtextbox {
	flex-direction: inherit;
}

#boardtext {
	margin: auto;
	font-size: 50px;
	font-weight: bold;
	color: darkgrey;
	margin-left: 50px;
}

#GJW-maintable {
	width: 1500px;
}

#GJW-serchbar {
	display: flex;
	justify-content: center;
	flex-direction: column;
}

table {
	border-collapse: collapse;
	border: 1px solid #0000003b;
	width: 1500px;
}

.kdy_board_wrap {
	display: flex;
	justify-content: center;
}

table {
	text-align: center;
	width: 1500px;
}

td {
	border: 0px;
	border-bottom: 1px inset;
	padding: 15px;
}

#GJW-hotviewtable {
	background: aliceblue;
}

.GJW-boardlisttr {
	
}

#GJW-hotviewdiv {
	width: 100%;
}

.GJW-hotviewtr {
	background-color: antiquewhite;
	color: blue;
	border-bottom: 1px solid gainsboro;
	color: lightcoral;
	font-weight: bold;
}

#GJW-boardip {
	background-color: white;
	font-weight: bolder;
	font-size: 18px;
}

.check {
	display: none;
}

.GJW-pagenumber {
	margin-left: 5px;
}

#GJW-BoardPagig {
	justify-content: center;
	display: flex;
	margin-top: 20px;
}

#GJW-srearhinput {
	display: flex;
	justify-content: center;
	margin-left: 40px;
}

#GJW-writeBoard {
	justify-content: flex-end;
	display: flex;
}

#GJW-menuwrap {
	display: flex;
	justify-content: center;
}

.GJW-boardlisttr {
	background-color: white;
}

.GJW-lockimg {
	width: 15px;
}

#GJW-writePage {
	display: flex;
	justify-content: flex-end;
}

* a {
	text-decoration: none;
}

.lase {
	background-color: #bbe889;
	border: none;
	border-radius: 25px;
	font-size: 20px;
	padding: 10px;
	margin: 10px;
}

.GJW-scretnumbertext {
	border: ridge;
	outline: none;
}

#GJW-trborder {
	border-bottom: 1px solid brown;
}

.lasc {
	background-color: #bbe889;
	border: none;
	border-radius: 25px;
	font-size: 14px;
	padding: 10px;
}

#GJW-searchbar {
	padding-left: 10px;
	width: 350px;
	outline: none;
	border-radius: 20px;
	height: 30px;
	border: 1px solid brown;
}

.adminform {
	display: none;
}

.typelink:link {
	text-decoration: none;
	color: #009688;;
}

.typelink:visited {
	text-decoration: none;
	color: #009688;;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:link {
	text-decoration: none;
	color: black;
}
</style>


<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div style="display:flex;justify-content: center;">
		<section>
			<div
				style="display: flex; justify-content: center; margin-top: 50px;">
				<h1 style="font-size: 50px; margin-bottom: 50px; color: #009688bd">TwoRavel
					Admin</h1>
			</div>
			<div id="GJW-menuwrap">
				<div class="GJW-Board" style="width: 1500px;">
					<div class="boardtype">
						<div class="boardtype-1">

							<a href="adminpage.do?type=B" class="typelink" id="typeB">게시판</a>

						</div>
						<div class="boardtype-1">
							<a href="adminpage.do?type=C" class="typelink" id="typeC">동행게시판</a>
						</div>
						<div class="boardtype-1">
							<a href="adminpage.do?type=M" class="typelink" id="typeM">회원관리</a>
						</div>
						<div class="boardtype-1">
							<a href="adminpage.do?type=S" class="typelink" id="typeS">신고내역</a>

						</div>
					</div>
				</div>
			</div>
			<div class="kdy_board_wrap">
				<div class="gjw-board-wrap">
					<c:if test="${type eq 'C'}">
						<table>
							<tr>
								<td>글번호</td>
								<td>글제목</td>
								<td>작성자</td>
								<td>등록날짜</td>
								<td>인원수</td>
								<td>완료상태</td>
								<td>좋아요</td>
							</tr>
							<c:if test="${not empty clist }">
								<c:forEach items="${clist }" var="pvo">
									<tr>
										<td>${pvo.c_id}</td>
										<td><a href="companion_detail.do?c_id=${pvo.c_id}">${pvo.c_name}</a>
										</td>
										<td>${pvo.m_id }</td>
										<td><fmt:formatDate var="date" value="${pvo.c_adddate}"
												pattern="yyyy-MM-dd HH:mm" /> ${date}</td>
										<td>${pvo.c_many}명</td>
										<td>${pvo.c_dealstatus }</td>
										<td><a href="admincompaniondelete.do?c_id=${pvo.c_id }">동행글
												삭제</a></td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty clist}">
								<tr>
									<td colspan='7'>검색결과가없습니다</td>
								</tr>
							</c:if>
						</table>
					</c:if>
					<c:if test="${type eq 'B'}">
						<table>
							<tr>
								<td>글번호</td>
								<td>글내용</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>조회수</td>
								<td>삭제</td>
							</tr>
							<c:if test="${not empty blist}">
								<c:forEach items="${blist }" var="mvo" varStatus="s">
									<c:set var="b_secret" value="${mvo.b_secret}" />
									<tr class="GJW-boardlisttr">
										<td><a href="board_detail.do?b_id=${mvo.b_id}">${mvo.b_id }</a></td>
										<td class="GJW"><span class="GJW-gocontent"> <a
												href="board_detail.do?b_id=${mvo.b_id}">${mvo.b_title}</a> <input
												type="hidden" class="bb_secret" name="b_secret"
												value="${mvo.b_secret }"> <c:if
													test="${b_secret eq 'Y'}">
													<img src="images/lock.png" class="GJW-lockimg">
												</c:if> <input type="hidden" class="bb_id" name="bb_id"
												value="${mvo.b_id}">
										</span> <span class="GJW-commentCount">(${mvo.b_count })</span> <span
											class="check"> <input type="hidden" class="bb_id"
												name="bb_id" value="${mvo.b_id}">
										</span></td>
										<td>${mvo.m_id }</td>
										<td><fmt:formatDate var="date" value="${mvo.b_timestamp}"
												pattern="yyyy-MM-dd HH:mm" /> ${date}</td>
										<td>${mvo.b_view }</td>
										<td><a href="Adminboarddelete.do?b_id=${mvo.b_id }">게시글
												삭제</a></td>
								</c:forEach>
							</c:if>
							<c:if test="${empty blist}">
								<tr>
									<td colspan='6'>검색결과가없습니다</td>
								</tr>
							</c:if>
						</table>

					</c:if>

					<c:if test="${type eq 'M'}">
						<table>
							<tr id="GJW-trborder" style="border-bottom: 1px solid brown;">
								<td>회원아이디</td>
								<td>회원명</td>
								<td>닉네임</td>
								<td>가입일</td>
								<td>추천수</td>
								<td>포인트</td>
								<td>신고당한횟수</td>
								<td>계정상태</td>
								<td>이메일</td>
								<td>회원삭제</td>
							</tr>
							<c:if test="${not empty mlist }">
								<c:forEach items="${mlist }" var="mb">
									<c:if test="${mb.m_out eq 'Y'.charAt(0)}">
										<tr style="background-color: #e46d6d;">
									</c:if>
									<%-- 	 <c:if test="${mb.m_out eq 'N'}">
								<tr>
								</c:if>  --%>
									<td>${mb.m_id }</td>
									<td>${mb.m_name}</td>
									<td>${mb.m_nick}</td>
									<td>${mb.m_joindate}</td>
									<td>${mb.m_like}</td>
									<td>${mb.m_point}</td>
									<td>${mb.m_reportcount}</td>
									<td>${mb.m_status}</td>
									<td>${mb.m_email}</td>
									<td><c:if test="${mb.m_out eq 'N'.charAt(0)}">
											<input type="button" class="outbtn" value="회원삭제">
										</c:if>
										<form action="AdminDeleteMember.do" method="post"
											class="outform" style="display: none;">
											<input type="hidden" value="${mb.m_id }" name="m_id">
											<input type="text" name="o_reason" placeholder="삭제사유를 입력해주세요"
												class="o_reason" required="required"> <input
												type="submit" value="등록"> <input type="button"
												value="취소" class="outclosebtn">
										</form></td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty mlist}">
								<tr>
									<td colspan='10'>검색결과가없습니다</td>
								</tr>
							</c:if>
						</table>

					</c:if>
					<c:if test="${type eq 'S'}">
						<table>
							<tr>
								<td>신고번호</td>
								<td>신고자</td>
								<td>피신고자</td>
								<td>신고사유</td>
								<td>회원관리</td>
							</tr>
							<c:if test="${not empty rlist }">
								<c:forEach items="${rlist }" var="rb">
									<tr>
										<td>${rb.r_id }</td>
										<td>${rb.m_id }</td>
										<td>${rb.m_id2 }</td>
										<td>${rb.r_reason }</td>
										<td>
											<form action="adminminuspoint">
												<input type="hidden" value="${rb.m_id2 }" name="m_id">
												<input type=submit value="포인트 리셋"
													style="background-color: white; border: 1px solid black; margin-bottom: 10px; padding: 3px;">
											</form> <input type="button" value="회원삭제" class="adminbtn"
											style="background-color: white; border: 1px solid black; margin-bottom: 10px; padding: 3px;">
											<form action="AdminDeleteMember.do" method="post"
												class="adminform">
												<input type="text" id="point" required="required"
													placeholder="삭제사유 입력"
													style="border: 1px solid; height: 27px;" name="o_reason">
												<input type="hidden" value="${rb.m_id2 }" name="m_id">
												<input type=submit value="회원삭제" class="adminbtn"
													style="background-color: white; border: 1px solid black; margin-bottom: 10px; padding: 3px;">
												<input type="button" value="취소" class="adminclosebtn"
													style="background-color: white; border: 1px solid black; padding: 3px;">
											</form>
											<form action="adminddeleteReport">
												<input type="hidden" value="${rb.r_id }" name="r_id">
												<input type=submit value="신고내역삭제"
													style="background-color: white; border: 1px solid black; margin-bottom: 10px; padding: 3px;">
											</form>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty rlist }">
								<tr>
									<td colspan="5">검색결과가 없습니다</td>
								</tr>
							</c:if>




						</table>
					</c:if>
					<table>
						<tr align="center" height="20">
							<td colspan="6"
								style="padding-top: 20px; color: #0AC5A8;"><c:if
									test="${currentPage <= 1}"> [이전]&nbsp;
 </c:if> <c:if test="${currentPage > 1}">
									<c:url var="blistST" value="adminpage.do">
										<c:param name="page" value="${currentPage-1}" />
										<c:param name="type" value="${type}" />
										<c:if test="${not empty keyword}">
											<c:param name="keyword" value="${keyword }"></c:param>
										</c:if>
									</c:url>
									<a href="${blistST}"
										style="color: #0AC5A8;">[이전]</a>
								</c:if> <!-- 끝 페이지 번호 처리 --> <c:forEach var="p" begin="${startPage}"
									end="${endPage }">
									<c:if test="${p <= maxPage}">
										<c:if test="${p eq currentPage}">
											<font color="cornflowerblue" size="4"><b>[${p}]</b></font>
										</c:if>
										<c:if test="${p ne currentPage}">
											<c:url var="blistchk" value="adminpage.do">
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
									<c:url var="blistEND" value="adminpage.do">
										<c:param name="page" value="${currentPage+1}" />
										<c:param name="type" value="${type}" />
										<c:if test="${not empty keyword}">
											<c:param name="keyword" value="${keyword }"></c:param>
										</c:if>
									</c:url>
									<a href="${blistEND}"
										style="color: #0AC5A8;">[다음]</a>
								</c:if></td>
						</tr>
					</table>
		</section>
		</div>
		<jsp:include page="footer.jsp" />
	</div>

	<script>
		$(function() {
			$(".outbtn").click(function() {
				$(this).css("display", "none");
				$(this).next(".outform").css("display", "block");
			})

			$(".adminbtn").click(function() {
				$(this).next('.adminform').css("display", "block");
				$(this).css("display", "none");
			})

			$(".adminclosebtn").click(function() {
				$(this).parent('form').css("display", "none");
				$(this).parent('form').prev().css("display", "inline-block");
			})
		})
		$(function(){
			
			if("${type}"=="B"){
			
			$("#typeB").css("color","#FF5722");
		}else if("${type}"=="C"){
			$("#typeC").css("color","#FF5722");
			
		}else if("${type}"=="S"){
			$("#typeS").css("color","#FF5722");
			
		}else if("${type}"=="M"){
			$("#typeM").css("color","#FF5722");
			
		}
			
		})
	</script>
</body>
</html>
