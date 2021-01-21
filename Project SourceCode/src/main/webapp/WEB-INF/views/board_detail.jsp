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
<title>게시판 상세 페이지</title>
<style>
* {
	outline:none;
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse: collapse;
	box-sizing: border-box;
	text-decoration: none;
	outline: none;
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
	display: flex;
	justify-content: center;
	border: 1px solid #0000001a;
}

#gjw-board-title {
	display: flex;
	justify-content: center;
	font-size: 35px;
	margin-bottom: 20px;
	margin-top: 10px;
}

#gjw-board-writer {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 10px;
	margin-top: 5px;
	margin-right: 10px;
	color: gray;
}

#gjw-board-date {
	display: flex;
	justify-content: flex-end;
	margin-right: 10px;
	color: gray;
	margin-bottom: 10px;
}

#gjw-board-content {
	border-top: 1px solid #00000017;
	padding-top: 40px;
	padding-left: 20px;
	border-bottom: 1px solid #00000017;
	padding-bottom: 40px;
}

#gjw-comment-div {
	border: 2px solid #0ac5a866;
	outline: none;
	margin-top: 30px;
	margin-bottom: 20px;
	width: 80%;
	border-radius: 9px;
}

#gjw-comment-wrap {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

#gjw-comment-write {
	overflow: hidden;
	resize: none;
	outline: none;
	width: 100%;
	overflow: hidden;
	width: 100%;
}

#gjw-cwriter-wrap {
	margin-left: 20px;
	margin-top: 10px;
	font-weight: bold;
}

#gjw-ccontent-wrap {
	margin-left: 20px;
	margin-top: 10px;
}

#gjw-commentsubmit-wrap {
	display: flex;
	justify-content: flex-end;
	margin-right: 30px;
	margin-bottom: 10px;
}

#gjw-comment-submit {
	background: none;
	color: #0ac5a8bf;
	outline: none;
}

#gjw-board-type {
	margin-top: 40px;
	color: #3d91ffc4;
	font-size: 26px;
}

#gjw-blist-link {
	color: rgb(0 166 255/ 68%);
	background: #3d91ff00;
	border: 2px solid #0ac5a866;
	border-radius: 10px;
	padding: 5px;
	font-weight: bold;
	margin-left: 10px;
}

#gjw-blist-update {
	color: rgb(0 166 255/ 68%);
	background: #3d91ff00;
	border: 2px solid #0ac5a866;
	border-radius: 10px;
	padding: 5px;
	font-weight: bold;
}

#gjw-blist-delete {
	color: rgb(0 166 255/ 68%);
	background: #3d91ff00;
	border: 2px solid #0ac5a866;
	border-radius: 10px;
	padding: 5px;
	font-weight: bold;
	margin-left: 10px;
}

#gjw-nonecomment-wrap {
	display: flex;
	justify-content: center;
	margin-top: 15px;
	text-align: center;
	color: cornflowerblue;
	font-weight: bold;
}

.gjw-comment-cl {
	margin-top: 10px;
	margin-bottom: 10px;
}

#gjw-comment-writer {
	font-weight: bold;
}

#gjw-comment-date {
	font-size: 12px;
	color: gray;
	display: flex;
}

#gjw-commentlist-wrap {
	border-bottom: 1px solid #00000017;
}

.gjw-recomment-btn {
	background: none;
	color: gray;
	font-size: 12px;
}

#gjw-recomment-content {
	margin-top: 10px;
	margin-left: 80px;
}

#gjw-recomment-writer {
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 80px;
}

#gjw-recomment-date {
	font-size: 12px;
	color: gray;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 80px;
}

#gjw-recommentlist-wrap {
	border-bottom: 1px solid #00000017;
}

#gjw-recommentwrite-div {
	border: 2px solid #0ac5a866;
	outline: none;
	margin-top: 30px;
	margin-bottom: 20px;
	width: 80%;
	border-radius: 9px;
}

#gjw-comment-wrap {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

#gjw-recomment-write {
	overflow: hidden;
	resize: none;
	outline: none;
}

#gjw-recomwriter-wrap {
	margin-left: 20px;
	margin-top: 10px;
	font-weight: bold;
}

#gjw-recontent-wrap {
	margin-left: 20px;
	margin-top: 10px;
}

#gjw-recommentsubmit-wrap {
	display: flex;
	justify-content: flex-end;
	margin-right: 30px;
	margin-bottom: 10px;
}

#gjw-recomment-submit {
	background: none;
	color: #0ac5a8bf;
	outline: none;
}

.gjw-recomment-close {
	background: none;
	color: #0ac5a8bf;
	outline: none;
	cursor: pointer;
}

.gjw-comment-update {
	font-size: 12px;
	color: gray;
	background: none;
	margin-left: 15px;
	margin-right: 10px;
}

.gjw-recomment-update {
	font-size: 12px;
	color: gray;
	background: none;
	margin-left: 15px;
	margin-right: 10px;
}

.gjw-commentupdate-submit {
	font-size: 12px;
	color: gray;
	background: none;
	margin-right: 5px;
	margin-left: 5px;
}

.gjw-recommentupdate-submit {
	font-size: 12px;
	color: gray;
	background: none;
	margin-right: 5px;
	margin-left: 5px;
}

.gjw-commentupdate-close {
	font-size: 12px;
	color: gray;
	background: none;
}

.gjw-recommentupdate-close {
	font-size: 12px;
	color: gray;
	background: none;
}

.gjw-comment-textarea {
	resize: none;
	height: auto;
	width: 100%;
}

#Ad {
	overflow: hidden;
}

.gjw-recomment-textarea {
	resize: none;
	height: auto;
	width: 100%;
}

#gjw-b_like-btn {
	cursor: pointer;
}

#gjw-like-count {
}
#ICR_PFmodal {
    width: 400px;
    height: 325px;
}
@media (min-width: 768px){
	.modal-sm {
	   	 width: 375px;
	}
}
						
						
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />

		<div id="gjw-wrap">
			<section style="display:flex;width: 1000px">
				<div style="width: 800px;">
					<div id="gjw-board-wrap">
						<div id="gjw-board-type">
							<c:if test="${blist.b_type eq 'N' }">
					공지사항
					</c:if>
							<c:if test="${blist.b_type eq 'G' }">
					여행정보
					</c:if>
							<c:if test="${blist.b_type eq 'R'}">
					리뷰
					</c:if>
						</div>
						<div id="gjw-board-title">${blist.b_title }</div>
<div id="gjw-board-writer">
							<div id="kdy-co_prous-img">
								<img class="ICR_C_writer" data-toggle="modal"
									data-target=".bs-example-modal-sm"
									src="${pageContext.request.contextPath }/resources/images/co_prous.png"
									style="height: 30px; cursor: pointer;">
							</div>
							&nbsp;<span class="ICR_C_writer" data-toggle="modal"
								data-target=".bs-example-modal-sm" style="cursor: pointer;line-height: 2.5;color: #777676;">${blist.m_id}</span>

						</div>	
						
						
						
						
						<div id="gjw-board-date">
							<fmt:formatDate var="date" value="${blist.b_timestamp}"
								pattern="yyyy-MM-dd HH:mm" />

							${date}
						</div>
						<div id="gjw-board-content">${blist.b_content }
							<div id="gjw-like-div"
								style="display: flex; justify-content: center; margin-top: 100px;">
								<div
									style="background-color: #3d91ff0f; width: 130px; height: 130px; border-radius: 50%;">
									<div id="gjw-like-count"
										style="margin-top: 20px; padding-bottom: 5px;
	/* padding-left: 13px; */ color: rgb(52, 73, 94); font-size: 25px; display: flex; justify-content: center;">${blist.b_like }</div>
									<div style="display: flex; justify-content: center;">
										<img
											src="${pageContext.request.contextPath }/resources/images/b_like.png"
											style="height: 40px;" id="gjw-b_like-btn">
									</div>
								</div>
							</div>
						</div>
					</div>

					<div>
						<c:if test="${empty clist}">
							<div id="gjw-nonecomment-wrap">
								<div>
									<div style="display: flex; justify-content: center;">
										<img
											src="${pageContext.request.contextPath }/resources/images/chat.png"
											style="width: 100px; height: 100px; display: flex;">
									</div>
									<div>
										등록된 댓글이 없습니다. <br> 댓글을 남겨보세요.
									</div>
								</div>

							</div>
						</c:if>
						<c:if test="${not empty clist}">
							<c:forEach var="cvo" items="${clist }">
								<c:choose>
									<c:when test="${cvo.b_re_level eq '0'}">
										<div id="gjw-commentlist-wrap">
											<div class="gjw-comment-cl" id="gjw-comment-writer">
												${cvo.m_id }</div>
											<div class="gjw-comment-cl" id="gjw-comment-content">
												<textarea rows="1" id="Ad" resize="none"
													class="gjw-comment-textarea" readonly="readonly">${cvo.b_content }</textarea>
											</div>
											<div>
												<div class="gjw-comment-cl" id="gjw-comment-date">
													<fmt:formatDate var="date" value="${cvo.b_timestamp}"
														pattern="yyyy-MM-dd HH:mm" />

													${date}&nbsp;&nbsp;&nbsp; 
													<c:choose>
					<c:when test="${not empty userID}">
													<input type="button" value="답글달기"
														class="gjw-recomment-btn">
														</c:when>
														</c:choose>
														
														<c:choose>
					<c:when test="${cvo.m_id eq userID}">
														 <input type="button"
														value="수정하기" class="gjw-comment-update">
													<form action="commentupdate.do" method="post"
														style="display: none;" id="gjw-commentupdate-form"
														name="commentupdateform">
														<input type="hidden" value="${userID}" name="m_id">

														<input type="hidden" value="${cvo.b_id }" name="b_id">
														<input type="hidden" value="${blist.b_id }" name="b_ref">
														<input type="hidden" value="${cvo.b_re_step }"
															name="b_re_step"> <input type="hidden"
															value="${cvo.b_content }" class="before-b_content">
														<input type="hidden" value="${cvo.b_re_level }"
															name="b_re_level"> <input type="hidden"
															class="after-b_content" name="b_content" value="">
														<input type="button" class="gjw-commentupdate-submit"
															value="등록"> <input type="button"
															class="gjw-commentupdate-close" value="취소">
													</form>
													<a
														href="deleteComment.do?b_id=${cvo.b_id }&rb_id=${blist.b_id}&b_re_step=${cvo.b_re_step}"
														class="">X</a>
														</c:when>
														</c:choose>
												</div>
											</div>
											<div style="display: none; justify-content: center;">
												<!-- 대댓글  form -->
												<div id="gjw-recommentwrite-div">
													<form action="recommentInsert.do" method="post">
														<div id="gjw-recomwriter-wrap">
															<!-- 밑에부분 UserID에 세션에있는 현재 ID를 넣어줘야함 -->
															<input type="text" value="${userID }" name="m_id">
															<input type="hidden" value="${blist.b_id }" name="b_id">
															<input type="hidden" name="b_re_step"
																value="${cvo.b_re_step }"> <input type="hidden"
																name="b_ref" value="${blist.b_id }">
														</div>
														<div id="gjw-recontent-wrap">
															<textarea id="gjw-recomment-write" rows="1"
																placeholder="대댓글을 남겨보세요" class="gjw-recomment-textarea"
																name="b_content"></textarea>
														</div>
														<div id="gjw-recommentsubmit-wrap">
															<input type="submit" value="등록" id="gjw-recomment-submit">&nbsp;&nbsp;
															<input type="button" value="취소"
																class="gjw-recomment-close">
														</div>
													</form>
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div id="gjw-recommentlist-wrap">
											<div id="gjw-recomment-writer">${cvo.m_id }</div>
											<div id="gjw-recomment-content">
												<textarea rows="1" resize="none"
													class="gjw-comment-textarea" readonly="readonly">${cvo.b_content }</textarea>
											</div>
											<div style="display: flex;">
												<div id="gjw-recomment-date">
													<fmt:formatDate var="date" value="${cvo.b_timestamp}"
														pattern="yyyy-MM-dd HH:mm" />

													${date}
												</div>
												<c:choose>
					<c:when test="${cvo.m_id eq userID}">
												<input type="button" value="수정하기"
													class="gjw-recomment-update">
												<form action="commentupdate.do" method="post"
													style="display: none;" class="gjw-recommentupdate-form">
													<input type="hidden" value="${cvo.b_id }" name="b_id">
													<input type="hidden" value="${blist.b_id }" name="b_ref">
													<input type="hidden" value="${userID}" name="m_id">

													<input type="hidden" value="${cvo.b_re_step }"
														name="b_re_step"> <input type="hidden"
														value="${cvo.b_content }" class="before-b_content">
													<input type="hidden" value="${cvo.b_re_level }"
														name="b_re_level"> <input type="hidden"
														class="after-b_content" name="b_content" value="">
													<input type="button" class="gjw-recommentupdate-submit"
														value="등록"> <input type="button"
														class="gjw-recommentupdate-close" value="취소">
												</form>
												<a
													href="deleteRecomment.do?b_id=${cvo.b_id }&rb_id=${blist.b_id}&b_re_step=${cvo.b_re_step}"
													class=""style="margin-top: 10px;font-size: 12px;">X</a>
													</c:when>
													</c:choose>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</div>
					<c:choose>
					<c:when test="${not empty userID}">
					<div id="gjw-comment-wrap">
						<div id="gjw-comment-div">
							<form action="commentInsert.do" method="post">
								<div id="gjw-cwriter-wrap">
									<input type="text" value="${userID }" name="m_id"
										readonly="readonly">
									<input type="hidden" value="${blist.b_id }" name="b_id">
								</div>
								<div id="gjw-ccontent-wrap">
									<textarea id="gjw-comment-write" rows="1"
										placeholder="댓글을 남겨보세요" name="b_content"></textarea>
								</div>
								<div id="gjw-commentsubmit-wrap">
									<input type="submit" value="등록" id="gjw-comment-submit">
								</div>
							</form>
						</div>
					</div>
					</c:when>
					</c:choose>
				</div>
			</section>
		</div>

		<div style="display: flex; justify-content: center;">
			<div
				style="width: 1000px; display: flex; justify-content: flex-end; margin-right: 10px; margin-top: 15px; margin-bottom: 15px;">
				
				
				<c:choose>
					<c:when test="${blist.m_id eq userID}">
				<a href="board_updateform.do?b_id=${blist.b_id }"
					id="gjw-blist-update">글수정</a> <a
					href="boarddelete.do?b_id=${blist.b_id }" id="gjw-blist-delete">글삭제</a>
					</c:when>
					</c:choose>
				<a href="board_list.do?b_type=${blist.b_type }" id="gjw-blist-link">글목록</a>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
		
		
		
		
		
		
		
		<!-- 프로필 모달 -->
		<form>
		<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div id="ICR_PFmodal" class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">${blist.m_id }님의 프로필</h4>
					</div>
					<div class="modal-body">
			
			
			<div id="ICR_info" style="text-align: center;">
				<table id="ICR_info_table" style="margin: 0 auto;">
					<tr>
						<td rowspan="7" style="text-align: center;line-height: normal;">
							<img id="ICR_pro_m_img" src="${pageContext.request.contextPath}/resources/images/none_img.JPG" style="width: 150px; height: 150px; display: inline;">
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;<font color="#0AC5A8" style="font-weight: bold;" id="ICR_pro_m_id"></font>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;<font color="#0AC5A8" style="font-weight: bold;" id="ICR_pro_m_name"></font>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;<font color="#0AC5A8" style="font-weight: bold;" id="ICR_pro_m_like"></font>
						</td>
					</tr>
					<tr>
						<td id="ICR_ReportCnt">
							&nbsp;<font color="#0AC5A8" style="font-weight: bold;" id="ICR_pro_m_reportcount"></font>
						</td>
					</tr>
					<tr>
						<td>&nbsp;<font color="#0AC5A8" style="font-weight: bold;" id="ICR_pro_m_intro"></font></td>
					</tr>
				</table><br>
				<c:if test="${sessionScope.userID ne null}">
					<div style="text-align: center;">
						<div>
						<input type="text" id="ICR_reasonBox" name="r_reason" style="display: none;margin: 0 auto;" placeholder="신고 사유를 입력해주세요.">
						<br>
						<button id="ICR_likeBtn" type="button" class="btn btn-primary">추천하기</button>
						<button id="ICR_ReportBtn1" type="button" class="btn btn-primary">신고하기</button>
						<button id="ICR_ReportBtn2" type="button" class="btn btn-primary" style="display: none;">신고하기</button>
						</div>
					</div>
				</c:if>
				<c:if test="${sessionScope.userID eq null}">
					<div style="text-align: center;">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</c:if>
				</div>
					</div>
				</div>
		  </div>
		</div>
		</form>
		
		
		

		
	</div>
	
	
<!-- 프로필 스트립트 -->
<script>
//추천
$(document).on("click", "#ICR_likeBtn", function(event){
	$.ajax({
		url : "MemberLikeCh.do?writer=${blist.m_id}",
		dataType : "json",
		async: false,
		type : "get",
		success : function(data){
	         if(data.result == 1){
	        	 if(confirm("이미 추천한 회원입니다. 추천을 취소할까요?")==true){
	        		 ICRLikeDelete();
	        	 }else{
	        		 return;
	        	 }
	         }else {
				if(confirm("${blist.m_id}님을 추천하시겠습니까?")==true){
					ICRLikeInsert();
				}else{
					return;
				}
	         }
		},
		error : function(data){
			alert("회원 추천에 실패했습니다. 관리자에게 문의하세요!");
		}
	});
});
function ICRLikeInsert(){
	$.ajax({
		url : "MemberLikeInsert.do?writer=${blist.m_id}",
		dataType : "json",
		async: false,
		type : "get",
		success : function(data){
			 if(data.result == 1){
				 alert("추천되었습니다.");
				 return;
			 }else{
				alert("회원 추천에 실패했습니다. 관리자에게 문의하세요!");
				return;
			 }
		},
		error : function(data){
			alert("회원 추천에 실패했습니다. 관리자에게 문의하세요!");
		}
	});
}
function ICRLikeDelete(){
	$.ajax({
		url : "MemberLikeUpdate.do?writer=${blist.m_id}",
		dataType : "json",
		async: false,
		type : "get",
		success : function(data){
			 if(data.result == 1){
				 alert("추천이 취소되었습니다.");
				 return;
			 }else{
				alert("추천 취소에 실패했습니다. 관리자에게 문의하세요!");
				return;
			 }
		},
		error : function(data){
			alert("추천 취소에 실패했습니다. 관리자에게 문의하세요!");
		}
	});
}


$('#gjw-board-writer').on('click',function(){
	$.ajax({
		url : "selectMemberProfile.do",
		dataType : "json",
		data : {
			m_id : "${blist.m_id}"
		},
		success : function(member){
			console.log(member);
			$('#ICR_pro_m_id').html("회원 아이디 : " + member.m_id);
			$('#ICR_pro_m_name').html("회원 이름 : " + member.m_name);
			$('#ICR_pro_m_like').html("추천수 : " + member.m_like);
			$('#ICR_pro_m_reportcount').html("신고당한 수 : " + member.m_reportcount);
			$('#ICR_pro_m_intro').html("소개글 : " + member.m_intro);
			$('#ICR_pro_m_img').attr("src", "${pageContext.request.contextPath}/resources/uploadFiles/" + member.m_image);
		},
		error : function(){
		}
		
	});
	
	
	
	
	$('#ICR_reasonBox').val("");
	$('#ICR_reasonBox').css('display','none');
	$('#ICR_ReportBtn1').css('display','inline-block');
	$('#ICR_ReportBtn2').css('display','none');
})
//신고
$(document).on("click", "#ICR_ReportBtn1", function(event){
	$.ajax({
		url : "MemberReportCh.do?writer=${blist.m_id}",
		dataType : "json",
		async: false,
		type : "get",
		success : function(data){
	         if(data.result == 1){
				alert("이미 신고한 회원입니다.");
	         }else {
				$('#ICR_reasonBox').css('display','block');
				$('#ICR_ReportBtn1').css('display','none');
				$('#ICR_ReportBtn2').css('display','inline-block');
				$('#ICR_reasonBox').focus();
	         }
		},
		error : function(data){
			alert("회원 신고에 실패했습니다. 관리자에게 문의하세요!");
		}
	});
});


$(document).on("click", "#ICR_ReportBtn2", function(event){
	var r_reason = $('#ICR_reasonBox').val();
	if(r_reason!=null && r_reason!=""){
		$.ajax({
			url : "MemberReport2.do?writer=${blist.m_id}&r_reason="+r_reason,
			dataType : "json",
			async: false,
			type : "get",
			success : function(data){
				if(data.result==1){
					alert("접수되었습니다. 신고해주셔서 감사합니다.");
					$('#ICR_reasonBox').val("");
					$('#ICR_reasonBox').css('display','none');
					$('#ICR_ReportBtn1').css('display','inline-block');
					$('#ICR_ReportBtn2').css('display','none');
				}else{
					alert("회원 신고에 실패했습니다. 관리자에게 문의하세요!");
					$('#ICR_reasonBox').val("");
					$('#ICR_reasonBox').css('display','none');
					$('#ICR_ReportBtn1').css('display','inline-block');
					$('#ICR_ReportBtn2').css('display','none');
				}
			},
			error : function(data){
				alert("회원 신고에 실패했습니다. 관리자에게 문의하세요!");
			}
		});
	}else{
		alert("신고 사유를 입력해주세요.");
		$('#ICR_reasonBox').focus();
		return;
	}
	
});

</script>
	
	
	
	<script>
		function xSize(e) {
			var t;

			e.onfocus = function() {
				t = setInterval(function() {
					e.style.height = '1px';
					e.style.height = (e.scrollHeight + 12) + 'px';
				}, 100);
			}
			e.onblur = function() {
				clearInterval(t);
			}
		}
		xSize(document.getElementById('gjw-comment-write'));
		xSize($(".gjw-comment-textarea"));

		var txtArea = $(".gjw-comment-textarea");
		if (txtArea) {
			txtArea.each(function() {
				$(this).height(this.scrollHeight);
			});
		}

		$(function() {

			//대댓글 달기
			$(".gjw-recomment-close").click(
					function() {
						$(this).parent().parent().parent().parent().css(
								"display", "none");
					})
			$(".gjw-recomment-btn").click(function() {
				$(this).parent().parent().next().css("display", "flex");
			})

			//수정부분
			$(".gjw-comment-update").click(
					function() {
						$(this).css("display", "none");
						$(this).next('#gjw-commentupdate-form').css("display",
								"flex");
						$(this).parent().parent().prev().children(
								".gjw-comment-textarea")
								.prop("readonly", false);
					})

			$(".gjw-commentupdate-close").click(
					function() {
						var beforeval = $(this).prev().prev().prev().prev(
								".before-b_content").val();
						$(this).parent().parent().prev().val(beforeval);
						$(this).parent().css("display", "none");
						$(this).parent().parent().parent().prev().children(
								".gjw-comment-textarea").val(beforeval);
						$(this).parent().parent().parent().prev().children(
								".gjw-comment-textarea").prop("readonly", true)
						$(this).parent().prev('.gjw-comment-update').css(
								"display", "block");
						$(this).prev("#gjw-recomment-submit").css("display",
								"block");
					})

			$(".gjw-commentupdate-submit")
					.click(
							function() {
								var b_content = $(this).parent().parent()
										.parent().prev().children(
												".gjw-comment-textarea").val();
								$(this).prev(".after-b_content").val(b_content);
								$(this).parent("#gjw-commentupdate-form")
										.submit();
							})

			$(".gjw-recomment-update").click(
					function() {
						$(this).css("display", "none");
						$(this).next('.gjw-recommentupdate-form').css(
								"display", "flex");
						$(this).parent().prev().children(
								".gjw-comment-textarea")
								.prop("readonly", false);
					})
			$(".gjw-recommentupdate-close").click(
					function() {
						var beforeval = $(this).prev().prev().prev().prev(
								".before-b_content").val();
						$(this).parent().parent().prev().val(beforeval);
						$(this).parent().css("display", "none");
						$(this).parent().parent().prev().children(
								".gjw-comment-textarea").val(beforeval);
						$(this).parent().parent().prev().children(
								".gjw-comment-textarea").prop("readonly", true)
						$(this).parent().prev('.gjw-recomment-update').css(
								"display", "block");
						$(this).prev("#gjw-recomment-submit").css("display",
								"block");
					})
			$(".gjw-recommentupdate-submit").click(
					function() {
						var b_content = $(this).parent().parent().prev()
								.children(".gjw-comment-textarea").val();
						$(this).prev(".after-b_content").val(b_content);
						$(this).parent(".gjw-recommentupdate-form").submit();
					})

		})
		   $(function(){
         
         
         $("#gjw-b_like-btn").click(function(){
            var user_id = "${userID}";
            if(user_id=="null" || user_id == ""){
               alert("글추천을 하시려면 회원가입을 하셔야합니다")
            }
            else{
               $.ajax({
                  url:"board_likecheck.do",
                  data:{m_id: "${userID}",b_id:${blist.b_id}},
                  success:function(res1){
                     if(res1 == 1){
                         var deletelike= confirm("이미 추천하신 글입니다 추천을 취소하시겠습니까?")
                        if(deletelike == true){
                           $.ajax({
                              url:"board_like.do",
                              data:{m_id: "${userID}",b_id:${blist.b_id},chc:res1},
                              success:function(res){
                                 alert("글 추천을 취소하셨습니다");
                                 $("#gjw-like-count").text(res);
                              }
                           })
                        }
                     }
                     else{
               var heart= confirm("글을 추천하시겠습니까?");
               
               if(heart == true){
               $.ajax({
                  url:"board_like.do",
                  data:{m_id: "${userID}",b_id :${blist.b_id},chc : res1},
                success : function(res) {
                  alert("글추천에 성공하셨습니다");
                  $("#gjw-like-count").text(res);
                                                      }
                                                   })
                                          }
                                       }
                                    }
                                 })

                        }
                     })

      })
	</script>
</body>
</html>
