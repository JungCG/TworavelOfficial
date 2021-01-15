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
	border-collapse: collapse;
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
	font-family: 'Hanna', fantasy;
	color: #282828;
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
.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;width: 100%;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
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
	padding: 5px;
	font-size: 5px;
	display: flex;
	color: gray;
}

#kdy-companion-content {
	color: #282828;
	width: 828px;
	padding-top: 20px;
	padding-bottom: 20px;
	margin-bottom: 10px;
}

#kdy-companion-content-tr {

}

#kdy-companion-description {
	font-color: #282828;
	margin-top: 10px;

}

#kdy-companion-description-p {
	font-size: 16px;
	font-weight: bold;
}

/* #kdy-companion-type {
	margin-top: 40px;
	color: #3d91ffc4;
	font-size: 26px;
	font-family: 'Hanna', fantasy;
} */
#kdy-clist-link {
	color: rgb(0 166 255/ 68%);
	background: #3d91ff00;
	border: 2px solid #0ac5a866;
	border-radius: 10px;
	padding: 5px;
	font-weight: bold;
	margin-left: 10px;
	font-family: BMHANNAAir;
}

#kdy-clist-update {
	color: rgb(0 166 255/ 68%);
	background: #3d91ff00;
	border: 2px solid #0ac5a866;
	border-radius: 10px;
	padding: 5px;
	font-weight: bold;
	font-family: BMHANNAAir;
}

#kdy-clist-delete {
	color: rgb(0 166 255/ 68%);
	background: #3d91ff00;
	border: 2px solid #0ac5a866;
	border-radius: 10px;
	padding: 5px;
	font-weight: bold;
	margin-left: 10px;
	font-family: BMHANNAAir;
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

table>tr {
	border: 1px solid gray;
}

#csub {
	
}

.csub_btn {
	cursor: pointer;
	background: none;
	color: gray;
	font-size: 12px;
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
						<div id="kdy-companion-title">${clist.c_name}</div>
						<div id="kdy-companion-writer">${clist.m_id}
							<div id="kdy-companion-date">
								<fmt:formatDate var="date" value="${clist.c_adddate}"
									pattern="yyyy-MM-dd HH:mm" />
								${date}
							</div>
						</div>
						<table id="kdy-companion-content">
							<tr id="kdy-companion-content-tr">
								<td>1인당 경비</td>
								<td colspan="3">${clist.c_value}</td>
							</tr>
							<tr id="kdy-companion-content-tr">
								<td>총인원</td>
								<td colspan="3">${clist.c_many}</td>
							</tr>
							<tr id="kdy-companion-content-tr">
								<td>여행 시작일</td>
								<td colspan="3"><fmt:parseDate var="Sdate"
										value="${clist.c_startd}" pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
										value="${Sdate}" pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<td>여행 마감일</td>
								<td colspan="3"><fmt:parseDate var="Edate"
										value="${clist.c_endd}" pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
										value="${Edate}" pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<td>카테고리</td>
								<td>지역&nbsp;&nbsp;${tlist1}</td>
								<td>인원&nbsp;&nbsp;${tlist2}</td>
								<td>성향&nbsp;&nbsp;${tlist3}</td>

							</tr>
						</table>
						<c:if test="${(meetpoint ne '0')||(not empty maplist) }">
						<div id="map"
							style="width: 897px; height: 500px; z-index: 0; border: 1px gray;"></div></c:if>
						<div id="kdy-companion-description">
							<p id="kdy-companion-description-p">세부 내용</p>
							&nbsp; ${clist.c_description}
						</div>

						<div id="kdy-like-div"
							style="display: flex; justify-content: center; margin-top: 100px;">
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
										<input type ="button" id="csub_btn" value="동행신청"/>
									</form>
								</div>
							</c:when>
						</c:choose>
					</div>
				</div>
			</section>
<script>
//동행 신청
$(function(){
	$("#csub_btn").click(function(){
		var user_id = "${userID}";
		if (user_id == "null" || user_id == "") {
			alert("동행 신청 하시려면 로그인을 해야됩니다");
		} else {
			alert("1성공")
			$.ajax({
				url : "companion_insertInfo_check.do",
				data : {
					m_id : "${userID}"
				},
				success : function(res) {
					if (res >= 20) {
						alert("성공")
						submit = "companion_insertInfo.do"
					} else {
						alert("실패")
						alert("포인트가 부족합니다. 앵벌이 스타트!");
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
					id="kdy-clist-update">글수정</a> <a
					href="companiondelete.do?c_id=${clist.c_id }" id="kdy-clist-delete">글삭제</a>
				</c:when>
				</c:choose>
				<a href="companion_list.do" id="kdy-clist-link">글목록</a>
			</div>
		</div>
		<jsp:include page="footer.jsp" />

	</div>
</body>
</html>