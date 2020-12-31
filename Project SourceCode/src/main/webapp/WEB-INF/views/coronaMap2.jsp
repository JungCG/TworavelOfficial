<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>클릭한 위치에 마커 표시하기</title>
<style>
#cm * {
	border: 0px;
	font-size: 12px;
	margin: 0px;
	padding:0;
}

#coronaContent{
	border-collapse : collapse;
}

#coronaContent *{
	border : 1px solid black;
}

#coronaContent th {
	background-color: rgb(44, 60, 91);
	color:white;
	padding : 5px 0px;
}

#coronaContent th {
	padding : 1px 0px;
}
</style>
</head>
<body>
	<div id = "cm" style="width: 100%; height: auto; margin-bottom : 20px;">
		<div style="text-align:center; font-weight:bolder; font-size:30px; padding : 10px 0px; margin-bottom:40px;">전국 코로나 상황</div>
		<div id="coronaMap" style="width: 100%; height: 500px; border:1px solid black;"></div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=174736117a3d890ca8fda93be0ca5e1f"></script>
	<script>
		var mapContainer = document.getElementById('coronaMap'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.97306981103329,
					127.96714174648405), // 지도의 중심좌표
			level : 13,
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		 
		var positions = [];
		
		<c:if test="${not empty coronaList}">
		<c:forEach var="vo" items="${coronaList}" varStatus="status">
 		positions.push({content:'<div style="height:auto; padding:5px 2px; width : 150px;"><div style="font-size:18px; font-weight:bolder; padding-left:10px;  width : 150px;">${vo.c_name}</div><div style=" width : 150px; padding-top:5px; padding-left:5px;">격리중 환자 수 : ${vo.c_isolingcnt}</div><div style=" width : 150px; padding-top:3px; padding-left:5px;">격리 해제 수 : ${vo.c_isolclearcnt}</div><div style="width : 150px; padding-top:3px; padding-left:5px; <c:if test="${vo.c_incdec < 10}">color:green</c:if><c:if test="${vo.c_incdec >= 10}">color:red</c:if>; font-weight:bolder;">전일대비 증가 수 : ${vo.c_incdec}</div><div style="padding-top:3px; width : 150px; padding-left:5px;">사망자 수 : ${vo.c_deathcnt}</div><div style="padding-top:3px; width : 150px; padding-left:5px;">10만명당 발생률 : ${vo.c_qurrate}</div></div>',latlng:new kakao.maps.LatLng(${vo.c_la},${vo.c_ma})});
		</c:forEach>
		</c:if>
		
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png'; // 마커이미지의 주소입니다    
	    var imageSize = new kakao.maps.Size(20, 20); // 마커이미지의 크기입니다
	    var imageOption = {offset: new kakao.maps.Point(1, 1)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		
		for (var i = 0; i < positions.length; i++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커의 위치
		        image: markerImage // 마커이미지 설정 
		    });

		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });

		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
	</script>
	
	
	<div style="float:right; width : 250px; height : 30px;">
		<span style="height : 100%; color : gray; font-weight:bolder; line-height:30px;">기준 : </span><span id = "updateDateSpan" style="height : 100%; line-height:30px; color : gray; font-weight:bolder;"></span>&nbsp;&nbsp;&nbsp;<button id = "updateCorona" style="width:100px; height : 100%; font-weight:bolder; background-color:#0AC5A8; cursor : pointer; float:right;">업데이트 확인</button>
	</div>
	
	<script>
		var va;
		<c:if test="${not empty coronaList}">
		<c:forEach var="vo" items="${coronaList}" varStatus="status">
		//지도에 표시할 원을 생성합니다
		var fc, sc, fo, cr;
		<c:if test="${vo.c_createdt ne null}">
			var updateDate=${vo.c_createdt};
			$("#updateDateSpan").text(updateDate);
		</c:if>
		<c:if test="${vo.c_incdec < 10}">
			fc='green';
			sc='green';
			fo = 0.5;
		</c:if>
		<c:if test="${vo.c_incdec >= 10}">
			fc='red';
			sc='red';
			fo = 0.7;
		</c:if>
		
		switch (${vo.c_id}) {
		  case 1 :
		  case 2 :
		  case 3 :
		  case 4 :
		  case 5 :
		  case 6 :
		  case 7 :
		  case 8 :
		  case 9 :
			  cr = 50000;
			  fo = 0.1
			  break;
		  default :
			  cr = 20000;
		    break;
		}
		
		var circle = new kakao.maps.Circle({
			center : new kakao.maps.LatLng(${vo.c_la}, ${vo.c_ma}), // 원의 중심좌표 입니다 
			radius : cr, // 미터 단위의 원의 반지름입니다 
			strokeWeight : 2, // 선의 두께입니다 
			strokeColor : sc, // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			fillColor : fc, // 채우기 색깔입니다
			fillOpacity : fo
		// 채우기 불투명도 입니다   
		});
		//지도에 원을 표시합니다 
		circle.setMap(map);
		</c:forEach>
		</c:if>
	</script>
	
	
	<!-- coronaList 를 가지고 들어온다 -->
	<table id = "coronaContent" style = "width : 100%; text-align:center; border: 1px solid black;">
		<tr>
			<th style="padding-top: 5px; padding-bottom: 5px;">Index</th>
			<th style="padding-top: 5px; padding-bottom: 5px;">지역명</th>
			<th style="padding-top: 5px; padding-bottom: 5px;">확진자 수</th>
			<th style="padding-top: 5px; padding-bottom: 5px;">격리중인 환자 수</th>
			<th style="padding-top: 5px; padding-bottom: 5px;">격리 해제 수</th>
			<th style="padding-top: 5px; padding-bottom: 5px;">전일대비 증가 수</th>
			<th style="padding-top: 5px; padding-bottom: 5px;">사망자 수</th>
			<th style="padding-top: 5px; padding-bottom: 5px;">10만명당 발생률</th>
		</tr>
		<c:if test="${not empty coronaList}">
			<c:forEach var="vo" items="${coronaList}" varStatus="status">
				<tr>
					<td style="padding-top: 5px; padding-bottom: 5px;">${vo.c_id}</td>
					<td style="padding-top: 5px; padding-bottom: 5px; font-weight:bolder;">${vo.c_name}</td>
					<td style="padding-top: 5px; padding-bottom: 5px;">${vo.c_defcnt}</td>
					<td style="padding-top: 5px; padding-bottom: 5px;">${vo.c_isolingcnt}</td>
					<td style="padding-top: 5px; padding-bottom: 5px;">${vo.c_isolclearcnt}</td>
					<td style="padding-top: 5px; padding-bottom: 5px; <c:if test="${vo.c_incdec < 10}">color:green</c:if><c:if test="${vo.c_incdec >= 10}">color:red</c:if>; font-weight:bolder;">${vo.c_incdec}</td>
					<td style="padding-top: 5px; padding-bottom: 5px;">${vo.c_deathcnt}</td>
					<td style="padding-top: 5px; padding-bottom: 5px;">${vo.c_qurrate}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	
	<script>
		$(function(){
			$("#updateCorona").click(function(){
				location.href="./coronaMapUpdate.do";
			});
		});
	</script>
</body>
</html>