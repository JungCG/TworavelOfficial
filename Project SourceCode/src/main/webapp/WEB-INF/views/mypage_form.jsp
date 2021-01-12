<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icr_mypage.css">
<!DOCTYPE html>
<html>
<head>

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
#ICR_myicon img{
	width: 130px;
	height: 130px;
	margin: 30px 50px 30px 50px;
}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp"/>
		
	
		<div id="ICR_MyPage">
			<h3 style="margin-bottom: 50px;">마이페이지</h3>
			<div id="ICR_profile_img">
				<c:if test="${not empty member.m_image}">
				<img src="${pageContext.request.contextPath}/resources/uploadFiles/${member.m_image}" style="width: 300px; height: 300px; display: inline;">
				</c:if>
				<c:if test="${empty member.m_image}">
				<img src="${pageContext.request.contextPath}/resources/images/none_img.JPG" style="width: 300px; height: 300px; display: inline;">
				</c:if>
			</div>
			
			<div id="ICR_info">
				<table id="ICR_info_table">
					<tr>
						<td>
							<h5><font color="#0AC5A8" style="font-weight: bold;">회원 아이디 : </font>&nbsp;&nbsp;${member.m_id}</h5>
						</td>
						<td></td>
	
					</tr>
					<tr>
						<td>
							<h5><font color="#0AC5A8" style="font-weight: bold;">회원 이름 : </font>&nbsp;&nbsp;${member.m_name}</h5>
						</td>
						<td></td>
	
					</tr>
					<tr>
						<td>
							<h5><font color="#0AC5A8" style="font-weight: bold;">가입일 : </font>&nbsp;&nbsp;${member.m_joindate}</h5>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<h5><font color="#0AC5A8" style="font-weight: bold;">추천수 : </font>&nbsp;&nbsp;${member.m_like}</h5>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<h5><font color="#0AC5A8" style="font-weight: bold;">신고당한 수 : </font>&nbsp;&nbsp;${member.m_reportcount}</h5>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<h5><font color="#0AC5A8" style="font-weight: bold;">이메일 : </font>&nbsp;&nbsp;${member.m_email}</h5>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<h5><font color="#0AC5A8" style="font-weight: bold;">포인트 : </font>&nbsp;&nbsp;${member.m_point}</h5>
						</td>
						<td></td>
					</tr>
					<tr>
	
						<td><h5><font color="#0AC5A8" style="font-weight: bold;">소개글 : </font>&nbsp;&nbsp;${member.m_intro}</h5></td>
						<td></td>
					</tr>
				</table>
				<c:url var="ProfileUpdateForm" value="ProfileUpdateForm.do">
					<c:param name="m_id" value="${member.m_id}" />
				</c:url>
				<button type="button" id="ICR_modifyBtn" class="btn btn-default" onclick="location.href='${ProfileUpdateForm}'">수정하기</button>
			</div>
			
			
			
			
			
		<hr id="ICR_hr">
		<div id="ICR_myicon">
			<div style="display: inline; cursor: pointer;" title="채팅방" onclick="ICR_ChatOpen();"><img class="ICR_my_img" src="${pageContext.request.contextPath}/resources/images/chatting.png"></div>
			<a href="WritedList.do?m_id=${member.m_id}" title="작성한 게시글"><img class="ICR_my_img" src="${pageContext.request.contextPath}/resources/images/edit.png"></a>
			<a href="CompanionStatus.do?m_id=${member.m_id}" title="동행신청내역"><img class="ICR_my_img" src="${pageContext.request.contextPath}/resources/images/friends.png"></a>
			<a href="FavordPage.do?m_id=${member.m_id}" title="키워드 설정"><img class="ICR_my_img" src="${pageContext.request.contextPath}/resources/images/ring.png"></a><br>
			<a href="LikeList.do?m_id=${member.m_id}" title="좋아요한 글"><img class="ICR_my_img" src="${pageContext.request.contextPath}/resources/images/heart.png"></a>
			<a href="${pageContext.request.contextPath}" title="메인페이지"><img class="ICR_my_img" src="${pageContext.request.contextPath}/resources/images/home.png"></a>
			<div style="display: inline; cursor: pointer;" title="회원탈퇴"><img data-toggle="modal" data-target=".bs-example-modal-sm" class="ICR_my_img" src="${pageContext.request.contextPath}/resources/images/logout.png"></div>
		</div>
		</div>
		
		
		<!-- 탈퇴 모달 -->
		<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div id="ICR_exModal" class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">회원 탈퇴</h4>
					</div>
					<div class="modal-body">
						<p>정말 탈퇴하겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button id="ICR_exBtn" type="button" class="btn btn-primary">탈퇴하기</button>
					</div>
				</div>
		  </div>
		</div>
		
		
		
		<jsp:include page="footer.jsp"/>
	</div>	
	
	
<script>
$('#ICR_exBtn').on('click',function(){
	$('#ICR_exModal').css('display','none');
	var m_id = "${member.m_id}";
	$.ajax({
		url : "${pageContext.request.contextPath}/MemberOut.do?m_id=" + m_id,
		typd : "get",
		success : function(data){
			alert("회원 탈퇴되었습니다.");
			window.location = "${pageContext.request.contextPath}";
		},
		error : function(data){
			alert("회원 탈퇴에 실패했습니다. 관리자에게 문의하세요!");
			window.location = "${pageContext.request.contextPath}";
		}
	});
	
});
function ICR_ChatOpen(){
	var popupX = (window.screen.width / 2) - 400;

	var popupY= (window.screen.height / 2) - 250;
 
	window.open('Chat.do?m_id=${member.m_id}', 'TworavelChat', 'width='+ 800 +', height='+ 500 +', left=' + popupX + ', top='+ popupY);
	}
</script>
</body>

</html>