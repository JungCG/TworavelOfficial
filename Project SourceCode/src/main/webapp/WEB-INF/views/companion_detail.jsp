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
* {
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

#kdy-wrap {
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

.customoverlay {
	position: relative;
	bottom: 85px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #000;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.customoverlay .title {
	display: block;
	text-align: center;
	background: #fff;
	margin-right: 35px;
	padding: 10px 15px;
	font-size: 14px;
	font-weight: bold;
	width: 100%;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

section {
	width: 1000px;
	display: flex;
	justify-content: center;
	flex-direction: column;
	border: 1px solid #0000001a;
}

table>tr>td {
	margin-top: 51px;
	margin-bottom: 51px;
}

td {
	padding: 2px;
	height: 30px;
}

#kdy-companion-title {
	display: flex;
	justify-content: center;
	font-size: 35px;
	margin-bottom: 20px;
	margin-top: 10px;
}

#kdy-companion-writer {
	width: 820px;
	display: flex;
	justify-content: flex-end;
	margin-top: 5px;
	margin-right: 10px;
	color: gray;
}

#kdy-companion-date {
	padding: 5px;
	font-size: 5px;
	display: flex;
	color: gray;
	justify-content: flex-end;
}

#kdy-companion-content {
	width: 820px;
	padding-top: 20px;
	padding-bottom: 20px;
	margin-bottom: 10px;
}

#kdy-companion-content-tr {
	
}

#kdy-companion-description {
	margin-top: 10px;
}

#kdy-companion-description-p {
	font-size: 16px;
	font-weight: bold;
}

#kdy-clist-link {
	color: rgb(0 166 255/ 68%);
	background: #3d91ff00;
	border: 2px solid #0ac5a866;
	border-radius: 10px;
	padding: 5px;
	font-weight: bold;
	margin-left: 10px;
}

#kdy-clist-update {
	color: rgb(0 166 255/ 68%);
	background: #3d91ff00;
	border: 2px solid #0ac5a866;
	border-radius: 10px;
	padding: 5px;
	font-weight: bold;
}

#kdy-clist-delete {
	color: rgb(0 166 255/ 68%);
	background: #3d91ff00;
	border: 2px solid #0ac5a866;
	border-radius: 10px;
	padding: 5px;
	font-weight: bold;
	margin-left: 10px;
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
	
}

table>tr {
	border: 1px solid gray;
}

#csub {
	
}

.csub_btn {
	width: 820px;
	cursor: pointer;
	background: none;
	color: gray;
	font-size: 12px;
}

.hrinout {
	width: 820px;
	height: 1px;
	background: #bbb;
	background-image: -webkit-linear-gradient(left, #eee, #777, #eee);
	background-image: -moz-linear-gradient(left, #eee, #777, #eee);
	background-image: -ms-linear-gradient(left, #eee, #777, #eee);
	background-image: -o-linear-gradient(left, #eee, #777, #eee);
}

.hrnline {
	width: 820px;
	border-top: 1px solid #bbb;
}

#csub_btn {
	color: rgb(234 119 19/ 68%);
	background: #ffffff;
	border: 2px solid #b1c50a66;
	border-radius: 10px;
	padding: 5px;
	font-weight: bold;
	font-size: 16px;
	margin-bottom: 20px;
	margin-left: 90%;
}

#ICR_PFmodal {
	width: 400px;
	height: 325px;
}

@media ( min-width : 768px) {
	.modal-sm {
		width: 375px;
	}
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div id="kdy-wrap">
			<section>
				<div style="width: 100vh; padding-left: 10vh;">
					<div id="kdy-companion-wrap">
						<div id="kdy-companion-title" style="padding-top: 20px;">${clist.c_name}</div>

						<div id="kdy-companion-writer">
							<div id="kdy-co_prous-img">
								<img class="ICR_C_writer" data-toggle="modal"
								data-target=".bs-example-modal-sm"
									src="${pageContext.request.contextPath }/resources/images/co_prous.png"
									style="height: 30px; cursor: pointer;">
							</div>
							&nbsp;<span class="ICR_C_writer" data-toggle="modal"
								data-target=".bs-example-modal-sm" style="cursor: pointer;">${clist.m_id}</span>
						</div>
						<div id="kdy-companion-date">
							<fmt:formatDate var="date" value="${clist.c_adddate}"
								pattern="yyyy-MM-dd HH:mm" />
							${date}
						</div>
						<hr class="hrnline">
						<br>
						<table id="kdy-companion-content">
							<tr id="kdy-companion-content-tr">
								<td>&nbsp;&nbsp;1인당 경비</td>
								<td colspan="3">${clist.c_value}</td>
							</tr>
							<tr id="kdy-companion-content-tr">
								<td>&nbsp;&nbsp;총인원</td>
								<td colspan="3">${clist.c_many}</td>
							</tr>
							<tr id="kdy-companion-content-tr">
								<td>&nbsp;&nbsp;여행 시작일</td>
								<td colspan="3"><fmt:parseDate var="Sdate"
										value="${clist.c_startd}" pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
										value="${Sdate}" pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;여행 마감일</td>
								<td colspan="3"><fmt:parseDate var="Edate"
										value="${clist.c_endd}" pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
										value="${Edate}" pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;카테고리</td>
								<td>지역&nbsp;&nbsp;&nbsp;&nbsp;${tlist1}</td>
								<td>인원&nbsp;&nbsp;&nbsp;&nbsp;${tlist2}</td>
								<td>성향&nbsp;&nbsp;&nbsp;&nbsp;${tlist3}</td>

							</tr>
						</table>
						<hr class="hrinout">
						<div id="map"
							style="width: 820px; height: 500px; z-index: 0; border: 1px gray;"></div>
						<hr class="hrinout">
						<div id="kdy-companion-description" style="margin-top: 60px;">
							<p id="kdy-companion-description-p" style="margin-top: 20px;">세부
								내용</p>
							<br>
							<hr class="hrnline">
							<br> &nbsp; ${clist.c_description}
						</div>


						<div id="kdy-like-div"
							style="display: flex; justify-content: center; margin-top: 100px; margin-bottom: 20px;">
							<div
								style="background-color: #3d91ff0f; width: 130px; height: 130px; border-radius: 50%;">
								<div id="kdy-like-count"
									style="margin-top: 20px; padding-bottom: 5px; color: rgb(52, 73, 94); font-size: 25px; display: flex; justify-content: center;">${clist.c_like }</div>
								<div style="display: flex; justify-content: center;">
									<img
										src="${pageContext.request.contextPath }/resources/images/b_like.png"
										style="height: 40px;" id="kdy-c_like-btn">
								</div>
							</div>
						</div>
						<c:choose>
							<c:when test="${clist.m_id ne userID && not empty userID}">
								<div id="csub">
									<form action="companion_insertInfo.do" method="post"
										id="csub_form" name="csub_form">
										<input type="hidden" value="${clist.c_id}" name="c_id">
										<input type="hidden" value="${clist.m_id}" name="m_id2">
										<input type="hidden" value="${userID}" name="m_id"> <input
											type="hidden" value="${clist.c_name}" name="c_name">
										<input type="button" id="csub_btn" value="동행신청"
											style="cursor: pointer;"></input>
									</form>
								</div>
							</c:when>
						</c:choose>
					</div>
				</div>
			</section>
			<!-- 프로필 모달 -->
			<form>
				<div class="modal fade bs-example-modal-sm" tabindex="-1"
					role="dialog" aria-labelledby="mySmallModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-sm">
						<div id="ICR_PFmodal" class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">${blist.m_id }님의프로필</h4>
							</div>
							<div class="modal-body">


								<div id="ICR_info" style="text-align: center;">
									<table id="ICR_info_table" style="margin: 0 auto;">
										<tr>
											<td rowspan="7"
												style="text-align: center; line-height: normal;"><img
												id="ICR_pro_m_img"
												src="${pageContext.request.contextPath}/resources/images/none_img.JPG"
												style="width: 150px; height: 150px; display: inline;">
											</td>
										</tr>
										<tr>
											<td>&nbsp;<font color="#0AC5A8"
												style="font-weight: bold;" id="ICR_pro_m_id"></font>
											</td>
										</tr>
										<tr>
											<td>&nbsp;<font color="#0AC5A8"
												style="font-weight: bold;" id="ICR_pro_m_name"></font>
											</td>
										</tr>
										<tr>
											<td>&nbsp;<font color="#0AC5A8"
												style="font-weight: bold;" id="ICR_pro_m_like"></font>
											</td>
										</tr>
										<tr>
											<td id="ICR_ReportCnt">&nbsp;<font color="#0AC5A8"
												style="font-weight: bold;" id="ICR_pro_m_reportcount"></font>
											</td>
										</tr>
										<tr>
											<td>&nbsp;<font color="#0AC5A8"
												style="font-weight: bold;" id="ICR_pro_m_intro"></font></td>
										</tr>
									</table>
									<br>
									<c:if test="${sessionScope.userID ne null}">
										<div style="text-align: center;">
											<div>
												<input type="text" id="ICR_reasonBox" name="r_reason"
													style="display: none; margin: 0 auto;"
													placeholder="신고 사유를 입력해주세요."> <br>
												<button id="ICR_likeBtn" type="button"
													class="btn btn-primary">추천하기</button>
												<button id="ICR_ReportBtn1" type="button"
													class="btn btn-primary">신고하기</button>
												<button id="ICR_ReportBtn2" type="button"
													class="btn btn-primary" style="display: none;">신고하기</button>
											</div>
										</div>
									</c:if>
									<c:if test="${sessionScope.userID eq null}">
										<div style="text-align: center;">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">취소</button>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<!-- 프로필 스트립트 -->
			<script>
//추천
$(document).on("click", "#ICR_likeBtn", function(event){
	$.ajax({
		url : "MemberLikeCh.do?writer=${clist.m_id}",
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
				if(confirm("${clist.m_id}님을 추천하시겠습니까?")==true){
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
		url : "MemberLikeInsert.do?writer=${clist.m_id}",
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
		url : "MemberLikeUpdate.do?writer=${clist.m_id}",
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
$('.ICR_C_writer').on('click',function(){
	$.ajax({
		url : "selectMemberProfile.do",
		dataType : "json",
		data : {
			m_id : "${clist.m_id}"
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
		url : "MemberReportCh.do?writer=${clist.m_id}",
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
			url : "MemberReport2.do?writer=${clist.m_id}&r_reason="+r_reason,
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
//동행 신청
$(function(){
	$("#csub_btn").click(function(){
		var user_id = "${userID}";
		if (user_id == "null" || user_id == "") {
			alert("동행 신청 하시려면 로그인을 해야됩니다");
		} else {
			$.ajax({
				url : "companion_insertInfo_check.do",
				data : {
					m_id : "${userID}"
				},
				success : function(res) {
					if (res >= 20) {
						alert("동행신청에 성공하셨습니다.");
							//$("#csub_form").submit(); 이거 한줄로 됨 그걸 이리 길게 쓴 나는 bbddg다.
							$(document).ready(function()
									{
									    var f = $('#csub_form');
									    var action = f.attr('action');
									    var serializedForm = f.serialize();
									    $.post
									    (
									        action,
									        serializedForm,
									        function(){}
									    );
									});
					} else {
						alert("동행신청에 실패 하셨습니다. 포인트가 부족합니다.");
					}
				}
			});
		}
	});
});

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
			//수정부분
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
                  data:{m_id: "${userID}",c_id :${clist.c_id},chc : res1},
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
			<!-- 지도 스크립트 -->
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb74b1c432c6717d09c3677341bf1ead&libraries=services"></script>
			<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
	<c:if test="${meetpoint ne '0'}">
      center: new kakao.maps.LatLng${meetpoint}, 
     </c:if>
      <c:if test="${meetpoint eq '0'}">
      center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
      </c:if>
        level: 3 // 지도의 확대 레벨
    };  

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도에 표시할 원을 생성합니다
<c:if test="${meetpoint ne '0'}">
var imageSrc = '${pageContext.request.contextPath}/resources/images/meeting.png', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
var marker1 = new kakao.maps.Marker({
    position: new kakao.maps.LatLng${meetpoint},
    zIndex:10000,
    opacity:1,
    image: markerImage

});
marker1.setMap(map);
var content = '<div class="customoverlay">' +
'    <span class="title">MeetingPoint</span>' +
'  </a>' +
'</div>';

//커스텀 오버레이가 표시될 위치입니다 
var position44 = new kakao.maps.LatLng${meetpoint};  

//커스텀 오버레이를 생성합니다
var customOverlay = new kakao.maps.CustomOverlay({
map: map,
position: position44,
content: content,
yAnchor: 1 
});
</c:if>


<c:if test="${not empty maplist}">
<c:forEach var="mvo" items="${maplist }">
//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var marker = new kakao.maps.Marker({
    position: new kakao.maps.LatLng${mvo.c_xy},
    zIndex:3,
    zIndex:1050,
    opacity:0.8,
});
marker.setMap(map);
</c:forEach>
</c:if>


// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
var linePath = [
	<c:if test="${not empty maplist}">
	<c:forEach var="mvo" items="${maplist }">
    new kakao.maps.LatLng${mvo.c_xy},
	</c:forEach>
	</c:if>
];

// 지도에 표시할 선을 생성합니다
var polyline = new kakao.maps.Polyline({
    path: linePath, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 13	, // 선의 두께 입니다
    strokeColor: '#FFAE00', // 선의 색깔입니다
    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid', // 선의 스타일입니다
    zIndex:9999,
    endArrow:true 
});
// 지도에 선을 표시합니다 
polyline.setMap(map);  
</script>
		</div>
		<div style="display: flex; justify-content: center;">
			<div
				style="width: 1000px; display: flex; justify-content: flex-end; margin-right: 10px; margin-top: 15px; margin-bottom: 15px;">
				<c:choose>
					<c:when test="${clist.m_id eq userID}">
						<a href="companion_update.do?c_id=${clist.c_id }"
							id="kdy-clist-update">글수정</a>
						<a href="companiondelete.do?c_id=${clist.c_id }"
							id="kdy-clist-delete">글삭제</a>
					</c:when>
				</c:choose>
				<a href="companion_list.do" id="kdy-clist-link">글목록</a>
			</div>
		</div>
		<jsp:include page="footer.jsp" />

	</div>
</body>
</html>
