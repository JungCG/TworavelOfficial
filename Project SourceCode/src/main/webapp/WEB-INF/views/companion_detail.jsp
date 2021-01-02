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
<title>Insert title here</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

* {
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse: collapsed;
	box-sizing: border-box;
	text-decoration: none;
	outline: none;
}

@font-face {
	font-family: 'MaplestoryOTFBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'CookieRun-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff')
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
	font-family: 'Jal_Onuel';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff')
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

@font-face {
	font-family: 'NEXON Lv2 Gothic Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
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
	border: 1px solid #0000001a;
}

#kdy-companion-title {
	display: flex;
	justify-content: center;
	font-size: 35px;
	margin-bottom: 20px;
	margin-top: 10px;
}

#kdy-companion-writer {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 10px;
	margin-top: 5px;
	margin-right: 10px;
	color: gray;
}

#kdy-companion-date {
	display: flex;
	justify-content: flex-end;
	margin-right: 10px;
	color: gray;
	margin-bottom: 10px;
}

#kdy-companion-content {
	border-top: 1px solid #00000017;
	padding-top: 40px;
	padding-left: 20px;
	border-bottom: 1px solid #00000017;
	padding-bottom: 40px;
}

#kdy-comment-div {
	border: 2px solid #0ac5a866;
	outline: none;
	margin-top: 30px;
	margin-bottom: 20px;
	width: 80%;
	border-radius: 9px;
}

#kdy-comment-wrap {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

#kdy-comment-write {
	overflow: hidden;
	resize: none;
	outline: none;
	width: 100%;
	overflow: hidden;
	width: 100%;
}

#kdy-cwriter-wrap {
	margin-left: 20px;
	margin-top: 10px;
	font-weight: bold;
}

#kdy-ccontent-wrap {
	margin-left: 20px;
	margin-top: 10px;
}

#kdy-commentsubmit-wrap {
	display: flex;
	justify-content: flex-end;
	margin-right: 30px;
	margin-bottom: 10px;
}

#kdy-comment-submit {
	background: none;
	color: #0ac5a8bf;
	outline: none;
}

#kdy-companion-type {
	margin-top: 40px;
	color: #3d91ffc4;
	font-size: 26px;
	font-family: 'Hanna', fantasy;
}

#kdy-blist-link {
	color: rgb(0 166 255/ 68%);
	background: #3d91ff00;
	border: 2px solid #0ac5a866;
	border-radius: 10px;
	padding: 5px;
	font-weight: bold;
	margin-left: 10px;
	font-family: BMHANNAAir;
}

#kdy-blist-update {
	color: rgb(0 166 255/ 68%);
	background: #3d91ff00;
	border: 2px solid #0ac5a866;
	border-radius: 10px;
	padding: 5px;
	font-weight: bold;
	font-family: BMHANNAAir;
}

#kdy-blist-delete {
	color: rgb(0 166 255/ 68%);
	background: #3d91ff00;
	border: 2px solid #0ac5a866;
	border-radius: 10px;
	padding: 5px;
	font-weight: bold;
	margin-left: 10px;
	font-family: BMHANNAAir;
}

#kdy-nonecomment-wrap {
	display: flex;
	justify-content: center;
	margin-top: 15px;
	text-align: center;
	color: cornflowerblue;
	font-weight: bold;
}

.kdy-comment-cl {
	margin-top: 10px;
	margin-bottom: 10px;
}

#kdy-comment-writer {
	font-weight: bold;
}

#kdy-comment-date {
	font-size: 12px;
	color: gray;
	display: flex;
}

#kdy-commentlist-wrap {
	border-bottom: 1px solid #00000017;
}

.kdy-recomment-btn {
	background: none;
	color: gray;
	font-size: 12px;
}

#kdy-recomment-content {
	margin-top: 10px;
	margin-left: 80px;
}

#kdy-recomment-writer {
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 80px;
}

#kdy-recomment-date {
	font-size: 12px;
	color: gray;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 80px;
}

#kdy-recommentlist-wrap {
	border-bottom: 1px solid #00000017;
}

#kdy-recommentwrite-div {
	border: 2px solid #0ac5a866;
	outline: none;
	margin-top: 30px;
	margin-bottom: 20px;
	width: 80%;
	border-radius: 9px;
}

#kdy-comment-wrap {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

#kdy-recomment-write {
	overflow: hidden;
	resize: none;
	outline: none;
}

#kdy-recomwriter-wrap {
	margin-left: 20px;
	margin-top: 10px;
	font-weight: bold;
}

#kdy-recontent-wrap {
	margin-left: 20px;
	margin-top: 10px;
}

#kdy-recommentsubmit-wrap {
	display: flex;
	justify-content: flex-end;
	margin-right: 30px;
	margin-bottom: 10px;
}

#kdy-recomment-submit {
	background: none;
	color: #0ac5a8bf;
	outline: none;
}

.kdy-recomment-close {
	background: none;
	color: #0ac5a8bf;
	outline: none;
	cursor: pointer;
}

.kdy-comment-update {
	font-size: 12px;
	color: gray;
	background: none;
	margin-left: 15px;
	margin-right: 10px;
}

.kdy-recomment-update {
	font-size: 12px;
	color: gray;
	background: none;
	margin-left: 15px;
	margin-right: 10px;
}

.kdy-commentupdate-submit {
	font-size: 12px;
	color: gray;
	background: none;
	margin-right: 5px;
	margin-left: 5px;
}

.kdy-recommentupdate-submit {
	font-size: 12px;
	color: gray;
	background: none;
	margin-right: 5px;
	margin-left: 5px;
}

.kdy-commentupdate-close {
	font-size: 12px;
	color: gray;
	background: none;
}

.kdy-recommentupdate-close {
	font-size: 12px;
	color: gray;
	background: none;
}

.kdy-comment-textarea {
	resize: none;
	height: auto;
	width: 100%;
}

#Ad {
	overflow: hidden;
}

.kdy-recomment-textarea {
	resize: none;
	height: auto;
	width: 100%;
}

#kdy-c_like-btn {
	cursor: pointer;
}

#kdy-like-count {
	font-family: 'MaplestoryOTFBold';
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />

		<div id="kdy-wrap">
			<section>
				<div style="width: 100vh; padding-left: 10vh;">
					<div id="kdy-companion-wrap">
						<div id="kdy-companion-title">${clist.c_name }</div>
						<div id="kdy-companion-writer">${clist.m_id }</div>
						<div id="kdy-companion-date">
							<fmt:formatDate var="date" value="${clist.c_timestamp}"
								pattern="yyyy-MM-dd HH:mm" />

							${date}
						</div>
						<div id="kdy-companion-content">${clist.c_description }
							<div id="kdy-like-div"
								style="display: flex; justify-content: center; margin-top: 100px;">
								<div
									style="background-color: #3d91ff0f; width: 130px; height: 130px; border-radius: 50%;">
									<div id="kdy-like-count"
										style="margin-top: 20px; padding-bottom: 5px;
	/* padding-left: 13px; */ color: rgb(52, 73, 94); font-size: 25px; display: flex; justify-content: center;">${blist.c_like }</div>
									<div style="display: flex; justify-content: center;">
										<img
											src="${pageContext.request.contextPath }/resources/images/c_like.png"
											style="height: 40px;" id="kdy-c_like-btn">
									</div>
								</div>
							</div>
						</div>
					</div>

					<div>
						<c:if test="${empty clist}">
							<div id="kdy-nonecomment-wrap">
								<div>
									<div style="display: flex; justify-content: center;">
										<img
											src="${pageContext.request.contextPath }/resources/images/chat.png"
											style="width: 100px; height: 100px; display: flex;">
									</div>
									<div style="font-family: BMHANNAAir;">
										등록된 댓글이 없습니다. <br> 댓글을 남겨보세요.
									</div>
								</div>

							</div>
						</c:if>
						<c:if test="${not empty clist}">
							<c:forEach var="cvo" items="${clist }">
								<c:choose>
									<c:when test="${cvo.c_re_level eq '0'}">
										<div id="kdy-commentlist-wrap">
											<div class="kdy-comment-cl" id="kdy-comment-writer">
												${cvo.m_id }</div>
											<div class="kdy-comment-cl" id="kdy-comment-content">
												<textarea rows="1" id="Ad" resize="none"
													class="kdy-comment-textarea" readonly="readonly">${cvo.c_description }</textarea>
											</div>
											<div>
												<div class="kdy-comment-cl" id="kdy-comment-date">
													<fmt:formatDate var="date" value="${cvo.c_timestamp}"
														pattern="yyyy-MM-dd HH:mm" />

													${date}&nbsp;&nbsp;&nbsp; <input type="button" value="답글달기"
														class="kdy-recomment-btn"> <input type="button"
														value="수정하기" class="kdy-comment-update">
													<form action="commentupdate.do" method="post"
														style="display: none;" id="kdy-commentupdate-form"
														name="commentupdateform">
														<input type="hidden" value="${userID}" name="c_id">

														<input type="hidden" value="${cvo.c_id }" name="c_id">
														<input type="hidden" value="${blist.c_id }" name="c_ref">
														<input type="hidden" value="${cvo.c_re_step }"
															name="c_re_step"> <input type="hidden"
															value="${cvo.c_description }"
															class="before-c_description"> <input
															type="hidden" value="${cvo.c_re_level }"
															name="c_re_level"> <input type="hidden"
															class="after-c_description" name="c_description" value="">
														<input type="button" class="kdy-commentupdate-submit"
															value="등록"> <input type="button"
															class="kdy-commentupdate-close" value="취소">
													</form>
													<a
														href="deleteComment.do?c_id=${cvo.c_id }&rc_id=${blist.c_id}&c_re_step=${cvo.c_re_step}"
														class="">X</a>
												</div>
											</div>
											<div style="display: none; justify-content: center;">
												<!-- 대댓글  form -->
												<div id="kdy-recommentwrite-div">
													<form action="recommentInsert.do" method="post">
														<div id="kdy-recomwriter-wrap">
															<!-- 밑에부분 UserID에 세션에있는 현재 ID를 넣어줘야함 -->
															<input type="text" value="${userID }" name="m_id">
															<input type="hidden" value="${clist.c_id }" name="c_id">
															<input type="hidden" name="c_re_step"
																value="${cvo.c_re_step }"> <input type="hidden"
																name="c_ref" value="${clist.c_id }">
														</div>
														<div id="kdy-recontent-wrap">
															<textarea id="kdy-recomment-write" rows="1"
																placeholder="대댓글을 남겨보세요" class="kdy-recomment-textarea"
																name="c_description"></textarea>
														</div>
														<div id="kdy-recommentsubmit-wrap">
															<input type="submit" value="등록" id="kdy-recomment-submit">&nbsp;&nbsp;
															<input type="button" value="취소"
																class="kdy-recomment-close">
														</div>
													</form>
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div id="kdy-recommentlist-wrap">
											<div id="kdy-recomment-writer">${cvo.m_id }</div>
											<div id="kdy-recomment-content">
												<textarea rows="1" resize="none"
													class="kdy-comment-textarea" readonly="readonly">${cvo.c_description }</textarea>
											</div>
											<div style="display: flex;">
												<div id="kdy-recomment-date">
													<fmt:formatDate var="date" value="${cvo.c_timestamp}"
														pattern="yyyy-MM-dd HH:mm" />

													${date}
												</div>
												<input type="button" value="수정하기"
													class="kdy-recomment-update">
												<form action="commentupdate.do" method="post"
													style="display: none;" class="kdy-recommentupdate-form">
													<input type="hidden" value="${cvo.c_id }" name="c_id">
													<input type="hidden" value="${clist.c_id }" name="c_ref">
													<input type="hidden" value="${userID}" name="m_id">

													<input type="hidden" value="${cvo.c_re_step }"
														name="c_re_step"> <input type="hidden"
														value="${cvo.c_description }" class="before-c_description">
													<input type="hidden" value="${cvo.c_re_level }"
														name="c_re_level"> <input type="hidden"
														class="after-c_description" name="c_description" value="">
													<input type="button" class="kdy-recommentupdate-submit"
														value="등록"> <input type="button"
														class="kdy-recommentupdate-close" value="취소">
												</form>
												<a
													href="deleteRecomment.do?c_id=${cvo.c_id }&rc_id=${clist.c_id}"
													class="">X</a>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</div>
					<div id="kdy-comment-wrap">
						<div id="kdy-comment-div">
							<form action="commentInsert.do" method="post">
								<div id="kdy-cwriter-wrap">
									<input type="text" value="${userID }" name="m_id"
										readonly="readonly" style="font-family: 'Jal_Onuel';">
									<input type="hidden" value="${clist.c_id }" name="c_id">
								</div>
								<div id="kdy-ccontent-wrap">
									<textarea id="kdy-comment-write" rows="1"
										placeholder="댓글을 남겨보세요" name="c_description"></textarea>
								</div>
								<div id="kdy-commentsubmit-wrap">
									<input type="submit" value="등록" id="kdy-comment-submit">
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
				<a href="companion_updateform.do?c_id=${clist.c_id }"
					id="kdy-blist-update">글수정</a> <a
					href="companiondelete.do?c_id=${clist.c_id }" id="kdy-clist-delete">글삭제</a>
				<a href="companion_list.do" id="kdy-clist-link">글목록</a>
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
		xSize(document.getElementById('kdy-comment-write'));
		xSize($(".kdy-comment-textarea"));

		var txtArea = $(".kdy-comment-textarea");
		if (txtArea) {
			txtArea.each(function() {
				$(this).height(this.scrollHeight);
			});
		}

		$(function() {

			//대댓글 달기
			$(".kdy-recomment-close").click(
					function() {
						$(this).parent().parent().parent().parent().css(
								"display", "none");
					})
			$(".kdy-recomment-btn").click(function() {
				$(this).parent().parent().next().css("display", "flex");
			})

			//수정부분
			$(".kdy-comment-update").click(
					function() {
						$(this).css("display", "none");
						$(this).next('#kdy-commentupdate-form').css("display",
								"flex");
						$(this).parent().parent().prev().children(
								".kdy-comment-textarea")
								.prop("readonly", false);
					})

			$(".kdy-commentupdate-close").click(
					function() {
						var beforeval = $(this).prev().prev().prev().prev(
								".before-c_description").val();
						$(this).parent().parent().prev().val(beforeval);
						$(this).parent().css("display", "none");
						$(this).parent().parent().parent().prev().children(
								".kdy-comment-textarea").val(beforeval);
						$(this).parent().parent().parent().prev().children(
								".kdy-comment-textarea").prop("readonly", true)
						$(this).parent().prev('.kdy-comment-update').css(
								"display", "block");
						$(this).prev("#kdy-recomment-submit").css("display",
								"block");
					})

			$(".kdy-commentupdate-submit")
					.click(
							function() {
								var c_description = $(this).parent().parent()
										.parent().prev().children(
												".kdy-comment-textarea").val();
								$(this).prev(".after-c_description").val(c_description);
								$(this).parent("#kdy-commentupdate-form")
										.submit();
							})

			$(".kdy-recomment-update").click(
					function() {
						$(this).css("display", "none");
						$(this).next('.kdy-recommentupdate-form').css(
								"display", "flex");
						$(this).parent().prev().children(
								".kdy-comment-textarea")
								.prop("readonly", false);
					})
			$(".kdy-recommentupdate-close").click(
					function() {
						var beforeval = $(this).prev().prev().prev().prev(
								".before-c_description").val();
						$(this).parent().parent().prev().val(beforeval);
						$(this).parent().css("display", "none");
						$(this).parent().parent().prev().children(
								".kdy-comment-textarea").val(beforeval);
						$(this).parent().parent().prev().children(
								".kdy-comment-textarea").prop("readonly", true)
						$(this).parent().prev('.kdy-recomment-update').css(
								"display", "block");
						$(this).prev("#kdy-recomment-submit").css("display",
								"block");
					})
			$(".kdy-recommentupdate-submit").click(
					function() {
						var c_description = $(this).parent().parent().prev()
								.children(".kdy-comment-textarea").val();
						$(this).prev(".after-c_description").val(c_description);
						$(this).parent(".kdy-recommentupdate-form").submit();
					})

		})
		   $(function(){
         
         
         $("#kdy-c_like-btn").click(function(){
            var user_id = "${userID}";
            if(user_id=="null" || user_id == ""){
               alert("글추천을 하시려면 회원가입을 하셔야합니다")
            }
            else{
               $.ajax({
                  url:"companion_likecheck.do",
                  data:{m_id: "${userID}",c_id:${clist.c_id}},
                  success:function(res1){
                     if(res1 == 1){
                         var deletelike= confirm("이미 추천하신 글입니다 추천을 취소하시겠습니까?")
                        if(deletelike == true){
                           $.ajax({
                              url:"companion_like.do",
                              data:{m_id: "${userID}",c_id:${clist.c_id},chc:res1},
                              success:function(res){
                                 alert("글 추천을 취소하셨습니다");
                                 $("#kdy-like-count").text(res);
                              }
                           })
                        }
                     }
                     else{
               var heart= confirm("글을 추천하시겠습니까?");
               
               if(heart == true){
               $.ajax({
                  url:"companion_like.do",
                  data:{m_id: "${userID}",c_id :${blist.c_id},chc : res1},
                success : function(res) {
                  alert("글추천에 성공하셨습니다");
                  $("#kdy-like-count").text(res);
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