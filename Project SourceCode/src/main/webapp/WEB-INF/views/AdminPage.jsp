<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목 수정해주세요.</title>
<style>
* {
	outline:none;
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
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

.boardtype {
   display: flex;
   justify-content: center;
   flex-direction: column;
font-family: 'Noto Sans KR', sans-serif;
font-size:20px;}
#gela{
	
font-family: 'Noto Sans KR', sans-serif;	
}
#prola{
	font-family: 'Noto Sans KR', sans-serif;	
	
}
#qnala{
	font-family: 'Noto Sans KR', sans-serif;	
	
}
#newsla{
	font-family: 'Noto Sans KR', sans-serif;	
	
}

.imgtextbox {
   display: flex;
}

.GJW-gocontent {
   cursor: pointer;
}
.GJW-hotviewtr{
class="GJW-boardlisttr"



}
.GJW-boardlisttr{
	    font-family: 'Nanum Gothic';
	
}
.rd {
   display: none;
}

.GJW-commentCount {
   font-size: 14px;
   color: gray;
}
.GJW-boardlisttr{
	    font-family: 'Nanum Gothic';
	
	
	
}
section {
   display: flex;
   flex-direction: column;
}

.boardtype-1 {
   display: flex;
   font-weight: bolder;
font-family: 'Noto Sans KR', sans-serif;}

.typeimg {
   width: 300px;
   height: 300px;
   margin-bottom: 10px;
}

.gjw-board-wrap {
   width: 80%;
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
   width: 80%;
   display: flex;
    justify-content: space-around;}

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
   width: 100%;
}

#GJW-serchbar {
   display: flex;
   justify-content: center;
   flex-direction: column;
}

table {
   border-collapse: collapse;
   border: 1px solid;
}

.kdy_board_wrap {
   display: flex;
   justify-content: center;
}

table {
   text-align: center;
   border: inset;
   width: 100%;
}

td {
   border: 0px;
   border-bottom: 1px inset;
   padding: 15px;
}

#GJW-hotviewtable {
   background: aliceblue;
}
.GJW-boardlisttr{
	
	
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
font-family: 'Noto Sans KR', sans-serif;

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
#GJW-writePage{
	
	
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
.GJW-scretnumbertext{
	
	    border: ridge;
	    outline: none;
}
#GJW-trborder{
	border-bottom:1px solid brown;
}
.lasc {
   background-color: #bbe889;
   border: none;
   border-radius: 25px;
   font-size: 14px;
   padding: 10px;
}
#GJW-searchbar{
    padding-left: 10px;
width: 350px;
    outline: none;
    border-radius: 20px;
    height:30px;
    border: 1px solid brown;
}

</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp"/>
		  <section>
              <div style ="display: flex;
    justify-content: center;">
              	<h1 style ="font-size: 50px; margin-bottom: 50px;color:#CC8431">관리자 페이지</h1>
              </div>
               <div id="GJW-menuwrap">
                  <div class="GJW-Board">
                     <div class="boardtype" style = "   font-family: 'Hanna', serif;">
                     <a href="adminpage.do?type=B">게시판</a>
                        <div class="boardtype-1">
                           <label for="ge" value="P" id="gela">동행게시판</label> <input
                              type="radio" name="type" class="rd" id="ge" value="P"
                              ${param.type == 'P'? "checked='checked'" : "" } />
                        </div>
                        <div class="boardtype-1">
                           <label for="pro" value="B" id="prola">게시판</label> <input
                              type="radio" name="type" class="rd" id="pro" value="B"
                              ${param.type == 'B' ? "checked='checked'" : "" } />
                        </div>
                        <div class="boardtype-1">
                           <label for="qna" value="M" id="qnala">회원정보</label> <input
                              type="radio" name="type" class="rd" id="qna" value="M"
                              ${param.type == 'M' ? "checked='checked'" : "" } />
                        </div>
                        <div class="boardtype-1">
                           <label for="news" value="S" id="newsla">신고리스트&nbsp;&nbsp;&nbsp;</label>
                           <input type="radio" name="type" class="rd" id="news" value="S"
                              ${param.type == 'S' ? "checked='checked'" : "" } />
                        </div>
                     </div>
                  </div>
               </div>
               <div class="kdy_board_wrap">
                  <div class="gjw-board-wrap">
                              <c:if test="${type eq 'C'}">
                              
                       <table>
					<tr>
						<td>상품번호</td>
						<td>상품명</td>
						<td>작성자</td>
						<td>가격</td>
						<td>등록일</td>
						<td>조회수</td>
						<td>삭제</td>
					</tr>

					<c:if test="${not empty plist }">
						<c:forEach items="${plist }" var="pvo">
							<tr>
								<td>${pvo.p_id}</td>
								<td><a href="ProductContentCtl.do?p_id=${pvo.p_id}&c_lid=${pvo.c_lid}&m_id=${pvo.m_id}&Likeresult=0">${pvo.p_name}</a>
								</td>
								<td>${pvo.m_id }</td>
								<td>${pvo.p_value}원</td>
								<td><fmt:parseDate var="dateString" value="${pvo.p_adddate }" pattern="yyyy-MM-dd HH:mm:ss" />
                              <fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd" /></td>
								<td>${pvo.p_view }</td>
								<td><a href="AdminDeleteProductCtl.do?p_id=${pvo.p_id }">상품
										삭제</a></td>
							</tr>
						</c:forEach>
					</c:if>
					
					
					
					<c:if test="${empty plist}">
						<tr>
							<td colspan='5'>검색결과가없습니다</td>
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
							<td><a href ="BoardContentCtl.do?b_id=${mvo.b_id}&currentPage=${param.currentPage}">${mvo.b_id }</a></td>
							<td class="GJW"><span class="GJW-gocontent">
								<a href ="BoardContentCtl.do?b_id=${mvo.b_id}&currentPage=${param.currentPage}">${mvo.b_title}</a>
									<input type="hidden" class="bb_secret" name="b_secret"
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
							<td>		<fmt:formatDate var="date" value="${mvo.b_timestamp}"
														pattern="yyyy-MM-dd HH:mm" />
													${date}</td>
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
						<tr id = "GJW-trborder"style ="border-bottom:1px solid brown;">
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
 								<tr style ="background-color: #e46d6d;">
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
					<td>
					<c:if test="${mb.m_out eq 'N'.charAt(0)}">
					<input type = "button" class ="outbtn" value ="회원삭제">
					</c:if>
										<form action = "AdminDeleteMemberCtl.do" method ="post" class = "outform">
										<input type ="hidden" value ="${mb.m_id }" name  ="m_id">
										<input type = "text" name = "o_reason" placeholder = "삭제사유를 입력해주세요" class ="o_reason" required="required">
										<input type = "submit" value ="등록">
										<input type ="button" value ="취소" class  ="outclosebtn">
										</form>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty mlist}">
							<tr>
								<td colspan='5'>검색결과가없습니다</td>
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

					</tr>
					<c:if test="${not empty slist }">
						<c:forEach items="${slist }" var="rb">
							<tr>
								<td>${rb.r_id }</td>
								<td>${rb.m_id }</td>
								<td>${rb.m_id2 }</td>
								<td>${rb.r_reason }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty slist }">
							<tr>
								<td colspan ="4">검색결과가 없습니다</td>
							</tr>
					</c:if>
					
					
					
					
				</table>
                                                                                                                        </c:if>
                                                                                                                        <table>
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
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>