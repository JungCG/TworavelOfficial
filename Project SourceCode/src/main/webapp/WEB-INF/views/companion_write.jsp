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
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse: collapsed;
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

KDY {
	width: 100%;
	display: flex;
	justify-content: center;
	margin-top: 70px;
	margin-bottom: 100px;
}

section {
	width: 1000px;
	display: flex;
	justify-content: center;
	flex-direction: column;
}

#smart_editor2 {
	width: 100%;
}

#kdy-name-input {
	height: 30px;
	width: 50%;
	border: 3px solid rgb(78 102 255/ 39%);
	outline: none;
	padding-left: 5px;
}

#kdy-type-select {
	border: 3px solid rgb(78 102 255/ 39%);
	outline: none;
	color: dodgerblue;
}

#kdy-password-input {
	border: 3px solid rgb(78 102 255/ 39%);
	outline: none;
}

input[type='radio']:after {
	width: 15px;
	height: 15px;
	border-radius: 15px;
	top: -2px;
	left: -1px;
	position: relative;
	background-color: #d1d3d1;
	content: '';
	display: inline-block;
	visibility: visible;
	border: 2px solid white;
}

input[type='radio']:checked:after {
	width: 15px;
	height: 15px;
	border-radius: 15px;
	top: -2px;
	left: -1px;
	position: relative;
	background-color: aliceblue;
	content: '';
	display: inline-block;
	visibility: visible;
	border: 3px solid powderblue;;
}

#kdy-secret-tr {
	display: none;
}

#submitModifyCompanionBtn {
	color: #0AC5A8;
	border: 3px solid rgb(78 102 255/ 39%);
	font-size: 16px;
	background-color: white;
	border-radius: 5px;
	padding: 5px;
}

#kdy-serach-list {
	color: #0AC5A8;
	border: 3px solid rgb(78 102 255/ 39%);
	border-radius: 5px;
	padding: 5px;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js">
	
</script>
</head>

<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<KDY>
		<section>
				<input type="button" id="meetbtn" value="미팅포인트 지정">
				<input type="button" id="meetsubmit" value="미팅포인트 등록">
		<input type ="text" id="meet" value="0">
			<form name="frm" enctype="multipart/form-data">
			<input type="text"value="0" name="c_meet" id="meetvalue">
				<input type="hidden" value="0" name="c_id" /> <input type="hidden"
					value="0" name="c_view" /> <input type="hidden" value="0"
					name="c_like" />
				<!-- 지도 시작 -->
				<div id="map" style="width: 1000px; height: 500px; z-index: 0;"></div>
				<p>
					<em>지도를 클릭해서 마커를 표시하신후 '위치확정' 버튼을 눌러주세요</em>
				</p>
				<div id="clickLatlng"></div>
				<input type="button" id="se" value="위치 확정 "> <input type="hidden"
					id="mapval0" name="mapval1"> <input type="hidden" id="mapval1" name="mapval2"> <input
					type="hidden" id="mapval2" name="mapval3"> <input type="hidden"id="mapval3" name="mapval4">
				<input type="hidden"id="mapval4" name="mapval5">
				<!-- 지도 끝 -->
				<table align="center" style="width: 100%;">
					<tr style="height: 30px">
						<td style="color: #0AC5A8;">작성자</td>
						<td colspan="3"><input type="text" name="m_id"></td>
					</tr>
					<tr style="height: 30px">
						<td style="color: #0AC5A8;">글분류</td>
						<td style="width: 30%; padding-top: 30px; padding-bottom: 30px;"><select
							name="c_type" id="kdy-type-select">
								<option value="S">수도권</option>
								<option value="G">지방</option>
								<option value="I">섬</option>
						</select></td>
						<td style="color: #0AC5A8;">제목</td>
						<td style="width: 55%;"><input type="text" name="c_name"
							id="kdy-name-input" placeholder="글 제목을 입력해주세요"
							required="required"></td>
					</tr>
					<tr style="height: 30px">
						<td style="color: #0AC5A8;">경비</td>
						<td style="width: 85%;" colspan="3"><input type="text"
							name="c_value" id="kdy-value-input"
							placeholder="1인당 여행경비를 입력해주세요" required="required"></td>
					</tr>
					<tr style="height: 30px">
						<td style="color: #0AC5A8;">인원</td>
						<td style="width: 85%;" colspan="3"><input type="text"
							name="c_many" id="kdy-many-input" placeholder="총 인원을 입력해주세요"
							required="required"></td>
					</tr>
					<tr style="height: 30px">
						<td style="color: #0AC5A8;">출발 날짜</td>
						<td style="width: 85%;" colspan="3"><input type="date"
							name="c_startd" id="kdy-startd-input" placeholder="출발 날짜를 입력해주세요"
							required="required"></td>
					</tr>
					<tr style="height: 30px">
						<td style="color: #0AC5A8;">도착 날짜</td>
						<td style="width: 85%;" colspan="3"><input type="date"
							name="c_endd" id="kdy-endd-input" placeholder="도착 날짜를 입력해주세요"
							required="required"></td>
					</tr>
					<tr>
						<td>카테고리 분류</td>
						<td><select name="c_lid" onchange="categoryChange(this)"
							style="width: 130px; height: 25px;">
								<option style="display: none;">카테고리</option>
								<option value="1">지역</option>
								<option value="2">인원</option>
								<option value="3">성향</option>
						</select> <select name="c_sid" id="ICR_smallCategory"
							style="width: 130px; height: 25px;">
								<option style="display: none;">소분류</option>
						</select></td>
					</tr>


					<!-- 					<tr style="height: 30px">
						<td style="color: #0AC5A8;">비밀글</td>
						<td>&nbsp;&nbsp;<label for="yes"
							style="color: rgb(78 102 255/ 90%);">Yes&nbsp;&nbsp;</label><input
							type="radio" name="b_secret" id="yes" value="Y" />&nbsp;&nbsp;<label
							for="No" style="color: rgb(78 102 255/ 90%);">No</label> <input
							type="radio" name="b_secret" id="No" checked="checked" value="N" /></td>
					</tr>
					<tr style="height: 70px" id="kdy-secret-tr">
						<td style="color: #0AC5A8;">비밀번호</td>
						<td><input type="password" name="b_secretnumber"
							id="kdy-password-input"></td>
					</tr> -->
					<tr>
						<td colspan="4" style="padding-top: 30px;"><textarea
								id="c_description" name="c_description"></textarea></td>
					</tr>
					<tr style="height: 50px">
						<td colspan="4" align="end"><input type="button"
							id="submitModifyCompanionBtn" value="등록하기"> <a
							href="companion_list.do" id="kdy-serach-list">목록으로</a></td>
					</tr>
				</table>
			</form>
		</section>
		</KDY>
		<jsp:include page="footer.jsp" />
	</div>
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "c_description", //textarea ID
					sSkinURI : "${pageContext.request.contextPath}/resources/se/SmartEditor2Skin.html", //skin경로
					fCreator : "createSEditor2",
				/*
				글 수정용 코드입니다
				fOnAppLoad:function(){
				oEditors.getById["c_description"].exec("PASTE_HTML", ["asdsadsadsadsad"]);
				}, */

				});

		$('#submitModifyCompanionBtn').click(
				function() {
					if ($("#kdy-name-input").val() == "") {
						alert("글 제목을 입력해주세요")
						$("#kdy-name-input").focus();
						return false;
					}
					if ($("#yes").is(":checked")) {
						if ($("#kdy-password-input").val() == "") {
							alert("비밀번호를 입력해주세요");
							$("#kdy-password-input").focus();
							return false;
						}
					}
					oEditors.getById["c_description"].exec(
							"UPDATE_CONTENTS_FIELD", []);
					document.frm.action = "companioninsert.do";
					document.frm.method = "POST";
					document.frm.submit();
				});
		$(function() {

			if ($("#No").is(":checked")) {
				$("#kdy-secret-tr").css("display", "none");
			}
			$("#yes").click(function() {
				alert("비밀번호를 입력해주세요")
				$("#kdy-secret-tr").css("display", "table-row");
			})
			$("#No").click(function() {
				$("#kdy-secret-tr").css("display", "none");
			})
		})
	</script>
	<!-- 지도스크립트 -->
		<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb74b1c432c6717d09c3677341bf1ead&libraries=services"></script>
	<script>
		var allpolyline = [];
		var markers1 = [];
		var meetpoint =[];
		var clickLine
		var pp = [];
		var clickPosition = [];
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
$("#se").click(function(){
	alert("위치가 확정되었습니다");
})
		// 지도를 클릭한 위치에 표출할 마커입니다
$("#meetbtn").click(function(){
if($("#meet").val()=="0"){
	
	alert("미팅포인트로 지정할 위치에 클릭을 해주세요")
	$("#meet").val("1");
}else{
	$("#meet").val("0");
}
	
})
$("#meetsubmit").click(function(){
	if($("#meet").val()=="1"){
		
		alert("미팅포인트가 등록되었습니다");
		$("#meet").val("0");
	}
})
		// 지도에 마커를 표시합니다
	/* 	$("#meetbtn").click(function(){
				$("#meet").val("2");
	
			}) */
			
/* 					var meetmarker = new kakao.maps.Marker({
				position: map.getCenter() 
				});
		meetpoint.push(meetmarker);
		meetmarker.setMap(map);
 */
		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		var meetmarker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
}); 
		var linePath = [];
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			if($("#meet").val()=="1"){
				 var latlng = mouseEvent.latLng; 
				    meetmarker.setPosition(latlng);
					position : mouseEvent.latLng
				$("#meet").val()=="0";
				$("#meetvalue").val(mouseEvent.latLng);
				meetmarker.setMap(map);
				alert("미팅포인트등록 버튼을 눌러주세요");
			}
			else{
			
/* 			
			if(meetpoint==null){
				
				var meetmarker = new kakao.maps.Marker({
					// 지도 중심좌표에 마커를 생성합니다 
					position : mouseEvent.latLng
				});
				meetpoint.push(meetmarker);
			}
				meetmarker.setMap(map);
			 */
			
			if (markers1.length == 5) {
				/*         markers1[0] = markers1[1];
				 markers1[1] = markers1[2];
				 markers1[3] = markers1[4];
				 markers1[0] = markers1[1]; */
				alert("최대 생성 가능한 마커는 5개입니다")
				return false;
			}
			for (var q = 0; q < allpolyline.length; q++) {
				console.log("q1 : " + q);
				console.log(allpolyline[q]);
				allpolyline[q].setMap(null);
			}
			// 지도에 선을 표시합니다 
			var marker = new kakao.maps.Marker({
				// 지도 중심좌표에 마커를 생성합니다 
				position : mouseEvent.latLng
			});
			marker.setMap(map);
			markers1.push(marker);
			// 클릭한 위도, 경도 정보를 가져옵니다 
			var latlng = mouseEvent.latLng;
			// 마커 위치를 클릭한 위치로 옮깁니다
			var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
			message += '경도는 ' + latlng.getLng() + ' 입니다' + markers1.length;
			var resultDiv = document.getElementById('clickLatlng');
			resultDiv.innerHTML = message;
			kakao.maps.event.addListener(marker, 'click', function() {
				console.log("6. marker click event");
				console.log(marker.getPosition());
				for (var i = 0; i < markers1.length; i++) {
					var mp = marker.getPosition();
					var mps = markers1[i].getPosition();
					var z = mp.getLat();
					var o = mps.getLat();
					console.log(i + "번째" + markers1[i].getPosition());

					if (z == o) {
						alert(i + "번쨰입니다");

						console.log("9. markers1.splice(i,1); 전");
						markers1.splice(i, 1);
						pp.splice(i, 1);
						console.log("10. markers1.splice(i,1); 후");
						$("#mapval" + i).val("");
						linePath.splice(i + 1, 1);
					}
				}

				marker.setMap(null);
				alert("linePath.length : " + linePath.length);
				alert("pp.length : " + pp.length);
				alert("markers1.length : " + markers1.length);
				for (var q = 0; q < allpolyline.length; q++) {
					console.log("q1 : " + q);
					console.log(allpolyline[q]);
					allpolyline[q].setMap(null);
				}
			});
			for (var u = 0; u < markers1.length; u++) {
				var mps = markers1[u].getPosition();
				var o = mps.getLat();
				var o1 = mps.getLng();
				linePath[u] = new kakao.maps.LatLng(o, o1);
				console.log(markers1[u].getPosition());
			}
			// 지도에 표시할 선을 생성합니다
			var polyline = new kakao.maps.Polyline({
				path : linePath, // 선을 구성하는 좌표배열 입니다
				strokeWeight : 5, // 선의 두께 입니다
				strokeColor : '#FFAE00', // 선의 색깔입니다
				strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				strokeStyle : 'solid' // 선의 스타일입니다
			});

			allpolyline.push(polyline);
			pp.push(polyline);

			polyline.setMap(map);
		}});

		$("#se").click(function() {

			for (var i = 0; i < 5; i++) {
				if (i < markers1.length)
					$("#mapval" + i).val(markers1[i].getPosition());
				else
					$("#mapval" + i).val("");
			}

		})
	</script>
	<script>
		//카테고리 선택 스크립트
		function categoryChange(e) {
			var location = [ "강원도", "경기도", "경상남도", "경상북도", "전라남도", "전라북도", "충청남도", "충청북도" ];
			var people = [ "~4명", "5~8명", "9명~" ];
			var interest = [ "호캉스", "청춘", "자연", "유적지", "액티비티" ];
			var target = document.getElementById("ICR_smallCategory");

			if (e.value == "1")
				var d = location;
			else if (e.value == "2")
				var d = people;
			else if (e.value == "3")
				var d = interest;
			target.options.length = 0;

			//소분류 value값
			for (i = 0; i < d.length; i++) {
				var opt = document.createElement("option");
				opt.value = i + 1;
				opt.innerHTML = d[i];
				target.appendChild(opt);
			}
		}
	</script>
</body>
</html>