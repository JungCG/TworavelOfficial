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
	flex-direction: column;
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
	font-size: 22px;
	font-weight: bold;
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
	display:flex;
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

#gjw-commentupdate-submit {
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
.gjw-comment-textarea{
resize:none;
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />

		<div id="gjw-wrap">
			<section>
				<div style="width: 100vh; padding-left: 10vh;">
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
						<div id="gjw-board-writer">${blist.m_id }</div>
						<div id="gjw-board-date">${blist.b_timestamp }</div>
						<div id="gjw-board-content">${blist.b_content }</div>
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
										등록된 댓글이 없습니다 <br> 댓글을 남겨보세요
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
											<textarea rows="1" resize="none" class="gjw-comment-textarea">${cvo.b_content }</textarea>
												</div>
												<div>
											<div class="gjw-comment-cl" id="gjw-comment-date">
												${cvo.b_timestamp }&nbsp;&nbsp;&nbsp; <input type="button"
													value="답글달기" class="gjw-recomment-btn"> <input
													type="button" value="수정하기" class="gjw-comment-update">
												<form action="" style="display: none;" id="gjw-commentupdate-form">
													<input type="hidden" value="${cvo.b_ref }" name="b_ref">
													<input type="hidden" value="${cvo.b_re_step }"
														name="b_re_step"> <input type="hidden"
														value="${cvo.b_re_level }" name="b_re_level"> <input
														type="hidden" name="b_content"> <input
														type="button" id="gjw-commentupdate-submit" value="등록">
													<input type="button" class="gjw-commentupdate-close"
														value="취소">
												</form>
											</div>
											</div>
											<div style="display: none; justify-content: center;">
												<!-- 대댓글  form -->
												<div id="gjw-recommentwrite-div">
													<form action="recommentInsert.do" method="post">
														<div id="gjw-recomwriter-wrap">
															<!-- 밑에부분 UserID에 세션에있는 현재 ID를 넣어줘야함 -->
													<input type="text" value="UserID" name="m_id">
													 <input type="hidden" value="${blist.b_id }" name="b_id">
													<input type="hidden" name="b_re_step" value="${cvo.b_re_step }">
													<input type="hidden" name="b_ref" value="${blist.b_id }">
														</div>
														<div id="gjw-recontent-wrap">
															<textarea id="gjw-recomment-write" rows="1"
																placeholder="대댓글을 남겨보세요" class="gjw-comment-textarea" name="b_content"></textarea>
														</div>
														<div id="gjw-recommentsubmit-wrap">
															<input type="submit" value="등록" id="gjw-recomment-submit">&nbsp;&nbsp;
															<input type="button" value="취소" class="gjw-recomment-close">
														</div>
													</form>
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div id="gjw-recommentlist-wrap">
											<div id="gjw-recomment-writer">${cvo.m_id }</div>
											<div id="gjw-recomment-content">${cvo.b_content }</div>



											<div style="display: flex;">
												<div id="gjw-recomment-date">${cvo.b_timestamp }</div>
												<input type="button" value="수정하기" class="gjw-comment-update">
												<form action="" style="display:none;">
													<input type="hidden" value="${cvo.b_ref }" name="b_ref">
													<input type="hidden" value="${cvo.b_re_step }"
														name="b_re_step"> <input type="hidden"
														value="${cvo.b_re_level }" name="b_re_level"> <input
														type="hidden" name="b_content"> <input
														type="button" id="gjw-commentupdate-submit" value="등록">
													<input type="button" class="gjw-commentupdate-close"
														value="취소">
												</form>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</div>
					<div id="gjw-comment-wrap">
						<div id="gjw-comment-div">
							<form action="commentInsert.do" method="post">
								<div id="gjw-cwriter-wrap">
									<!-- <input type="text" value="UserID" name="m_id"> -->UserID
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
				</div>
			</section>
		</div>

		<div style="display: flex; justify-content: center;">
			<div
				style="width: 1000px; display: flex; justify-content: flex-end; margin-right: 10px; margin-top: 15px; margin-bottom: 15px;">
				<a href="board_list.do?b_type=${blist.b_type }"
					id="gjw-blist-update">글수정</a> <a
					href="board_list.do?b_type=${blist.b_type }" id="gjw-blist-link">글목록</a>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
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
		xSize(document.getElementById('gjw-recomment-write'));

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
			$(".gjw-comment-update").click(function(){
				
				$(this).css("display","none");
				$(this).next('form').css("display","flex");
				
			})
			
			$(".gjw-commentupdate-close").click(function(){
				$(this).parent().css("display","none");
				$(this).parent().prev('.gjw-comment-update').css("display","block");

			})
		})
	</script>
</body>
</html>