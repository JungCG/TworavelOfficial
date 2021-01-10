<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icr_weather.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/GJW-weather.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TwoRAVEL</title>
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
		<jsp:include page="home.jsp"/>
		<jsp:include page="footer.jsp"/>
	</div>
	
	<!-- 날씨 -->
	<div id="ICR_weatherBox">
		<div>
			<h4 style="text-align: center; padding:10px; color: #0AC5A8">
				현재 <span id="weather_region">${weatherArr[4]}</span> 날씨
			</h4>
			<img id="weather_Img1" width="100" height="100"
				src="${pageContext.request.contextPath}/resources/images/sun.png">
			<img id="weather_Img2" width="100" height="100"
				src="${pageContext.request.contextPath}/resources/images/cloudy.png">
			<img id="weather_Img3" width="100" height="100"
				src="${pageContext.request.contextPath}/resources/images/cloudy2.png">
			<div id="ICR_weatherBox2">
				<p>
					날씨 : <span id="weather_SKY">${weatherArr[0]}</span>
				</p>
				<p>
					기온 : <span id="weather_T3H">${weatherArr[1]}</span>℃
				</p>
				<p>
					습도 : <span id="weather_REH">${weatherArr[2]}</span>%
				</p>
				<p>
					풍향 : <span id="weather_VEC">${weatherArr[3]}</span>m/s
				</p>
			</div>
		</div>
		
		<!-- Small button group -->
		<div class="btn-group">
			<button id="OtherWeather"
				class="btn btn-default btn-sm dropdown-toggle" type="button"
				data-toggle="dropdown" aria-expanded="false">
				다른 지역 날씨 보기&nbsp;<span class="caret"></span>
			</button>

			<ul class="dropdown-menu" role="menu">
				<li><button class="Village" value="1">서울</button></li>
				<li><button class="Village" value="2">경기도</button></li>
				<li><button class="Village" value="3">강원도</button></li>
				<li><button class="Village" value="4">충청북도</button></li>
				<li><button class="Village" value="5">충청남도</button></li>
				<li><button class="Village" value="6">전라북도</button></li>
				<li><button class="Village" value="7">전라남도</button></li>
				<li><button class="Village" value="8">경상북도</button></li>
				<li><button class="Village" value="9">경상남도</button></li>
				<li><button class="Village" value="10">제주도</button></li>
			</ul>
				<button id="GJW-OtherWeather">
				일기예보&nbsp;<span class="caret"></span>
			</button>
		</div>
	<!-- 	<div class="btn-group"style="
    left: 1px;
">
			<button id="GJW-OtherWeather">
				일기예보 보기&nbsp;<span class="caret"></span>
			</button>
		</div> -->

	</div>
	<div id="GJW-weatherbox">
		<div id="GJW-dropdown">
			<ul class="dropdown-menu2" role="menu">
				<li><button type="button" value="11B10101" class="weatherbtn">서울</button>
				<li><button type="button" value="11B20201" class="weatherbtn">인천</button>
				<li><button type="button" value="11B20601" class="weatherbtn">수원</button>
				<li><button type="button" value="11B20305" class="weatherbtn">파주</button>
				<li><button type="button" value="11D10301" class="weatherbtn">춘천</button>
				<li><button type="button" value="11D10401" class="weatherbtn">원주</button>
				<li><button type="button" value="11D20501" class="weatherbtn">강릉</button>
				<li><button type="button" value="11C20401" class="weatherbtn">대전</button>
				<li><button type="button" value="11C20101" class="weatherbtn">서산</button>
				<li><button type="button" value="11C20404" class="weatherbtn">세종</button>
				<li><button type="button" value="11C10301" class="weatherbtn">청주</button>
				<li><button type="button" value="11G00201" class="weatherbtn">제주</button>
				<li><button type="button" value="11G00401" class="weatherbtn">서귀포</button>
				<li><button type="button" value="11F20501" class="weatherbtn">광주</button>
				<li><button type="button" value="21F20801" class="weatherbtn">목포</button>
				<li><button type="button" value="11F20401" class="weatherbtn">여수</button>
				<li><button type="button" value="11F10201" class="weatherbtn">전주</button>
				<li><button type="button" value="21F10501" class="weatherbtn">군산</button>
				<li><button type="button" value="11H20201" class="weatherbtn">부산</button>
				<li><button type="button" value="11H20101" class="weatherbtn">울산</button>
				<li><button type="button" value="11H20301" class="weatherbtn">창원</button>
				<li><button type="button" value="11H10701" class="weatherbtn">대구</button>
				<li><button type="button" value="11H10501" class="weatherbtn">안동</button>
				<li><button type="button" value="11H10201" class="weatherbtn">포항</button>
			</ul>
		</div>



		<div id="day1" style="display: nonedisplay: flex;background: #f5f5dc85;/* margin-top: 20; */padding-top: 65px;padding-bottom: 65px;margin-top: 0px;">

			<div class="weatherbox" style="text-align: center;">
				<div id="date36" class="date">날짜</div>
				<div class="weathern">
					<div id="min16" class="min">최저온도</div>
					/
					<div id="max16" class="max">최고온도</div>

				</div>
				<div id="max16" class="max">날씨</div>
			</div>

			<div class="weatherbox">
				<div id="date3" class="date"></div>
				<div class="weathern">
					<div id="min1" class="min"></div>
					/
					<div id="max1" class="max"></div>
				</div>
				<div id="we1" class=we></div>
			</div>
			<div class="weatherbox">
				<div id="date4" class="date"></div>
				<div class="weathern">
					<div id="min2" class="min"></div>
					/
					<div id="max2" class="max"></div>
				</div>
				<div id="we2" class=we></div>
			</div>
			<div class="weatherbox">
				<div id="date5" class="date"></div>
				<div class="weathern">
					<div id="min3" class="min"></div>
					/
					<div id="max3" class="max"></div>
				</div>
				<div id="we3" class=we></div>
			</div>
			<div class="weatherbox">
				<div id="date6" class="date"></div>
				<div class="weathern">
					<div id="min4" class="min"></div>
					/
					<div id="max4" class="max"></div>
				</div>
				<div id="we4" class=we></div>
			</div>
			<div class="weatherbox">
				<div id="date7" class="date"></div>
				<div class="weathern">
					<div id="min5" class="min"></div>
					/
					<div id="max5" class="max"></div>
				</div>
				<div id="we5" class=we></div>
			</div>
			<div class="weatherbox">
				<div id="date8" class="date"></div>
				<div class="weathern">
					<div id="min6" class="min"></div>
					/
					<div id="max6" class="max"></div>
				</div>
				<div id="we6" class=we></div>
			</div>
			<div class="weatherbox">
				<div id="date9" class="date"></div>
				<div class="weathern">
					<div id="min7" class="min"></div>
					/
					<div id="max7" class="max"></div>
				</div>
				<div id="we7" class=we></div>
			</div>
			<div class="weatherbox">
				<div id="date10" class="date"></div>
				<div class="weathern">
					<div id="min8" class="min"></div>
					/
					<div id="max8" class="max"></div>
				</div>
				<div id="we8" class=we></div>
			</div>
		</div>
	</div>

	<div id="coronaMap"
		style="position: fixed; width: 100px; height: 170px; right: 50px; bottom: 180px; outline: none; z-index: 1;">
		<div
			style="color: red; font-weight: bolder; position: relative; width: 100%; height: 120px; background-color: rgba(255, 255, 255, 0); outline: none;">
			<img width="100%" height="120px;"
				src="${pageContext.request.contextPath}/resources/images/coronaIcon2.png">
		</div>
		<button
			id = "coronaMapBtn" style="color : white; font-weight:bolder;position: relative; width: 100%; height: 50px; background-color: red; cursor : pointer; outline:none;">코로나 현황<br>보러가기</button>
	</div>
<!-- 날씨 스크립트 -->
<script>
	$(function(){
		$('.Village').on('click',function(e){
			var villageName = $(this).val();
			//alert("클릭한 val()값 : " + $(this).val());
			var region = "";
			var nx = "";
			var ny = "";
			if(villageName=="1"){
				region = "서울"; nx = 60; ny = 127;
			}else if(villageName=="2"){
				region = "경기도"; nx = 60; ny = 121;
			}else if(villageName=="3"){
				region = "강원도"; nx = 92; ny = 131;
			}else if(villageName=="4"){
				region = "충청북도"; nx = 69; ny = 106;
			}else if(villageName=="5"){
				region = "충청남도"; nx = 68; ny = 100;
			}else if(villageName=="6"){
				region = "전라북도"; nx = 63; ny = 89;
			}else if(villageName=="7"){
				region = "전라남도"; nx = 50; ny = 67;
			}else if(villageName=="8"){
				region = "경상북도"; nx = 91; ny = 106;
			}else if(villageName=="9"){
				region = "경상남도"; nx = 90; ny = 77;
			}else if(villageName=="10"){
				region = "제주도"; nx = 52; ny = 38;
			}
			//alert("ajax 에서 넣은 값들 : " + region + nx + ny);
			
			$.ajax({
				url:"${pageContext.request.contextPath}/Weather.do",
				type:"post",
				data:{
					"region" : region,
					"nx" : nx,
					"ny" : ny
				},
				async:false,
				dataType:"json",
				success:function(data){
					$('#weather_SKY').text(data.SKY);
					$('#weather_T3H').text(data.T3H);
					$('#weather_REH').text(data.REH);
					$('#weather_VEC').text(data.VEC);
					$('#weather_region').text(data.region);
	
					if($('#weather_SKY').text()=="맑음"){
						$('#weather_Img1').css('display','inline-block');
						$('#weather_Img2').css('display','none');
						$('#weather_Img3').css('display','none');
					}else if($('#weather_SKY').text()=="구름많음"){
						$('#weather_Img1').css('display','none');
						$('#weather_Img2').css('display','inline-block');
						$('#weather_Img3').css('display','none');
					}else if($('#weather_SKY').text()=="흐림"){
						$('#weather_Img1').css('display','none');
						$('#weather_Img2').css('display','none');
						$('#weather_Img3').css('display','inline-block');
					}
				},
				error:function(){
					alert("날씨 불러오기 실패함");
				}
		
			})
		})
	})
	
	$(function(){
		if("${weatherArr[0]}"=="맑음"){
			$('#weather_Img1').css('display','inline-block');
			$('#weather_Img2').css('display','none');
			$('#weather_Img3').css('display','none');
		}else if("${weatherArr[0]}"=="구름많음"){
			$('#weather_Img1').css('display','none');
			$('#weather_Img2').css('display','inline-block');
			$('#weather_Img3').css('display','none');
		}else if("${weatherArr[0]}"=="흐림"){
			$('#weather_Img1').css('display','none');
			$('#weather_Img2').css('display','none');
			$('#weather_Img3').css('display','inline-block');
		}
		
		$("#coronaMapBtn").click(function(){
			location.href="./coronaMap.do";
		});
	})
	//검색 기능
$(function(){
	$("#searchform").submit(function(){
		var option =$("#filter option:selected").val(); 
		var keyword =$("#keyword").val();
		if(keyword==""){
			alert("검색어를 입력해주세요");
			$("#keyword").focus();
			return false;
		}
		else{
			if(option==1){
				$("#searchform").attr("action","companion_list.do");
			}
			else if(option==2){
			$("#searchform").attr("action","tworavelmap.do");
		}
		else if(option==3){
			$("#searchform").attr("action","board_list.do");
		}
			
		}
	})
})
		$(function() {

			$(".weatherbtn").click(function() {
				$("#day1").css("display", "flex");
				var areavalue = $(this).val();
				var values = [];
				$.post("weatherforecast.do", {
					area : areavalue
				}, function(retVal) {
					values = retVal.list;
					$.each(values, function(index, value) {

						$("#min1").text(value.taMin3);
						$("#max1").text(+value.taMax3);
						$("#min2").text(value.taMin4);
						$("#max2").text(+value.taMax4);
						$("#min3").text(value.taMin5);
						$("#max3").text(+value.taMax5);
						$("#min4").text(value.taMin6);
						$("#max4").text(value.taMax6);
						$("#min5").text(value.taMin7);
						$("#max5").text(+value.taMax7);
						$("#min6").text(value.taMin8);
						$("#max6").text(+value.taMax8);
						$("#min7").text(value.taMin9);
						$("#max7").text(+value.taMax9);
						$("#min8").text(value.taMin10);
						$("#max8").text(+value.taMax10);
						$("#date3").text(value.date3);
						$("#date4").text(value.date4);
						$("#date5").text(value.date5);
						$("#date6").text(value.date6);
						$("#date7").text(value.date7);
						$("#date8").text(value.date8);
						$("#date9").text(value.date9);
						$("#date10").text(value.date10);
						$("#date11").text(value.date11);
						$("#date12").text(value.date12);
						$("#we1").text(value.wf3);
						$("#we2").text(value.wf4);
						$("#we3").text(value.wf5);
						$("#we4").text(value.wf6);
						$("#we5").text(value.wf7);
						$("#we6").text(value.wf8);
						$("#we7").text(value.wf9);
						$("#we8").text(value.wf10);
						$("#we1").text(value.wf11);

					});

				});

			})
		})
		
		
		$("#GJW-OtherWeather").click(function(){
			
			$(".dropdown-menu2").css("display","block");
		})
		$(document).mouseup(function (e) {

// 팝업 아이디

var container = $(".dropdown-menu2");

if (!container.is(e.target) && container.has(e.target).length === 0){
container.css("display","none");

}	
var container = $("#day1");

if (!container.is(e.target) && container.has(e.target).length === 0){
container.css("display","none");

}	
});
 </script>
</body>
</html>