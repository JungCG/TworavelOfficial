<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icr_weather.css">
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
	border-collapse:collapsed;
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
			<img id="weather_Img2" width="100" height="71000"
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
		  <button id="OtherWeather" class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
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
		</div>
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
	})
</script>

</body>
</html>