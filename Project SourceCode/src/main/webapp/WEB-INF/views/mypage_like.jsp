<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
* {
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse:collapse;
	box-sizing:border-box;
	text-decoration:none;
}
html{
	height : 100%;
}
body{
	height : 100%;
}
.jck_wrap{
	min-height:100%;
	position : relative;
	padding-bottom : 200px;
}
table{
	text-align: center;
}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



</head>
<style>
#ICR_writedlist{
	width: 1000px;
	margin: 0 auto;
	text-align: center;
}
.btn-default{
	width: 49%;
}
#ICR_ICR_BoardBtn{
	background: #2C3C5B;
	color: white;
}
#ICR_Companionlist, #ICR_msg2{
	display: none;
}
a{
	text-decoration: none;
}
.ICR_pageNum a{
	text-decoration: none;
	color: #333;
}
.ICR_textDiv{
	margin-top: 30px;
}
.ICR_DeleteBtn_B, .ICR_DeleteBtn_C{
	cursor: pointer;
}
</style>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp"/>
		
		<div id="ICR_writedlist">
			<h3 style="margin-bottom: 50px;">좋아요 한 글 목록</h3>
			<button id="ICR_ICR_BoardBtn" class="btn btn-default">통합게시판</button>
			<button id="ICR_ICR_CompanionBtn" class="btn btn-default">동행게시판</button><br><br>
			
			
			
			<!-- 통합게시판 -->
			<c:if test="${not empty board}">
			<table id="ICR_Boardlist" class="table">
				<tr style="background: #ffe9df;">
					<td>글번호</td>
					<td>등록일자</td>
					<td>글제목</td>
					<td>좋아요 취소</td>
				</tr>
				<c:forEach items="${board}" var="board">
				<tr>
					<td>${board.b_id}</td>
					<td>
					<fmt:parseDate var="dateString" value="${board.b_timestamp}" pattern="yyyy-MM-dd HH:mm:ss" />
					<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd " />
					</td>
					<td><a style="text-decoration: none;" href="board_detail.do?b_id=${board.b_id}&m_id=${board.m_id}">${board.b_title}</a></td>
					<td>
						<label class="ICR_DeleteBtn_B">&times;</label>
					</td>
				</tr>
				</c:forEach>
				
				<!-- 앞 페이지 번호 처리 -->
				<tr align="center" height="20">
					<td class="ICR_pageNum" colspan="4">
					<c:if test="${currentPage <= 1}">[이전]&nbsp;</c:if>
					<c:if test="${currentPage > 1}">
							<c:url var="WritedListST" value="WritedList.do">
								<c:param name="page" value="${currentPage-1}" />
								<c:param name="m_id" value="${sessionScope.userID}" />
							</c:url>
							<a href="${WritedListST}">[이전]</a>
						</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" />
						<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
							<c:if test="${p eq currentPage}">
								<font color="#0AC5A8" size="4"><b>[${p}]</b></font>
							</c:if>
							<c:if test="${p ne currentPage}">
								<c:url var="WritedListCHK" value="WritedList.do">
									<c:param name="page" value="${p}" />
									<c:param name="m_id" value="${sessionScope.userID}" />
								</c:url>
								<a href="${WritedListCHK}">${p}</a>
							</c:if>
						</c:forEach> <c:if test="${currentPage >= maxPage}">[다음]</c:if>
						<c:if test="${currentPage < maxPage}">
							<c:url var="WritedListEND" value="WritedList.do">
								<c:param name="page" value="${currentPage+1}" />
								<c:param name="m_id" value="${sessionScope.userID}" />
							</c:url>
							<a href="${WritedListEND}">[다음]</a>
						</c:if>
						</td>
				</tr>
				
			</table> 
			</c:if>
			<div id="ICR_msg1">
			<c:if test="${empty board}">
			<div class="ICR_textDiv">찜한 게시글이 없습니다.<br><a style="text-decoration: none;" href="board_list.do">☞게시글 찜하러가기☜</a>
			</div></c:if>
			</div>
			
			<!-- 동행게시판 -->
			<c:if test="${not empty companion}">
			<table id="ICR_Companionlist" class="table">
				<tr style="background: #ffe9df;">
					<td>글번호</td>
					<td>등록일자</td>
					<td>글제목</td>
					<td>좋아요 취소</td>
				</tr>
				<c:forEach items="${companion}" var="com">
				<tr>
					<td>${com.c_id}</td>
					<td>${com.c_adddate}</td>
					<td><a style="text-decoration: none;" href="companion_detail.do?c_id=${com.c_id}">${com.c_name}</a></td>
					<td><label class="ICR_DeleteBtn_C">&times;</label></td>
				</tr>
				</c:forEach>
				
				
				
				<!-- 앞 페이지 번호 처리 -->
				<tr align="center" height="20">
					<td class="ICR_pageNum" colspan="5">
					<c:if test="${currentPage2 <= 1}">[이전]&nbsp;</c:if>
					<c:if test="${currentPage2 > 1}">
						<c:url var="WritedListST" value="WritedList.do">
							<c:param name="page2" value="${currentPage2-1}" />
							<c:param name="m_id" value="${sessionScope.userID}" />
						</c:url>
						<a href="${WritedListST}">[이전]</a>
					</c:if>
						<!-- 끝 페이지 번호 처리 -->
						<c:set var="endPage" value="${maxPage2}" />
						<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
							<c:if test="${p eq currentPage2}">
								<font color="#0AC5A8" size="4"><b>[${p}]</b></font>
							</c:if>
							<c:if test="${p ne currentPage2}">
								<c:url var="WritedListCHK" value="WritedList.do">
									<c:param name="page2" value="${p}" />
									<c:param name="m_id" value="${sessionScope.userID}" />
								</c:url>
								<a href="${WritedListCHK}">${p}</a>
							</c:if>
						</c:forEach>
						<c:if test="${currentPage2 >= maxPage2}">[다음]</c:if>
						<c:if test="${currentPage2 < maxPage2}">
							<c:url var="WritedListEND" value="WritedList.do">
								<c:param name="page2" value="${currentPage2+1}" />
								<c:param name="m_id" value="${sessionScope.userID}" />
							</c:url>
							<a href="${WritedListEND}">[다음]</a>
						</c:if>
						</td>
				</tr>
				
			</table>
			</c:if>
			<div id="ICR_msg2">
			<c:if test="${empty companion}">
			<div class="ICR_textDiv">찜한 동행 게시글이 없습니다.<br><a style="text-decoration: none;" href="companion_list.do">☞동행 게시글 찜하러가기☜</a>
			</div></c:if>
			</div>
		</div>

		<jsp:include page="footer.jsp"/>
	</div>

<script>
$(function() {
	if("${listView}"=="com"){
		ICR_ICR_CompanionBtn.click();
	}
});
</script>
<script>
$(".ICR_DeleteBtn_B").click(function(){
    
    var tdArr = new Array();    // 배열 선언
    var checkBtn = $(this);
	
    var tr = checkBtn.parent().parent();
    var td = tr.children();
    
    var idVal = td.eq(0).text().trim();
    
	window.location="BoardLikeDelete.do?b_id=" + idVal;
    }
);
$(".ICR_DeleteBtn_C").click(function(){
    
    var tdArr = new Array();    // 배열 선언
    var checkBtn = $(this);
	
    var tr = checkBtn.parent().parent();
    var td = tr.children();
    
    var idVal = td.eq(0).text().trim();
    
	window.location="CompanionLikeDelete.do?c_id=" + idVal;
    }
);
</script>
<script>
$(function() {
	if("${listView}"=="com"){
		ICR_ICR_CompanionBtn.click();
	}
});
</script>
<script>
$('#ICR_ICR_BoardBtn').on('click',function(){
	$('#ICR_ICR_BoardBtn').css('background','#2C3C5B');
	$('#ICR_ICR_BoardBtn').css('color','white');
	$('#ICR_ICR_CompanionBtn').css('background','white');
	$('#ICR_ICR_CompanionBtn').css('color','#333');
	$('#ICR_Boardlist').css('display','table');
	$('#ICR_Companionlist').css('display','none');
	$('#ICR_msg1').css('display','block');
	$('#ICR_msg2').css('display','none');
})
$('#ICR_ICR_CompanionBtn').on('click',function(){
	$('#ICR_ICR_BoardBtn').css('background','white');
	$('#ICR_ICR_BoardBtn').css('color','#333');
	$('#ICR_ICR_CompanionBtn').css('background','#2C3C5B');
	$('#ICR_ICR_CompanionBtn').css('color','white');
	$('#ICR_Boardlist').css('display','none');
	$('#ICR_Companionlist').css('display','table');
	$('#ICR_msg1').css('display','none');
	$('#ICR_msg2').css('display','block');
})




</script>
</body>
</html>