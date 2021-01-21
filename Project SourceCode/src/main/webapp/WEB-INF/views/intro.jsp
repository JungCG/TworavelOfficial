<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap"
	rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이트 소개</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<style>
* {
	padding: 0;
	margin: 0;
	border: 0;
	box-sizing: border-box;
	text-decoration: none;
	color: #333;
}
/*  border-collapse: collapse; */
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

button {
	cursor: pointer;
}

p {
	margin: 5px 0px;
}

.dName {
	font-weight: bolder;
	font-size: 25px;
}

.d {
	
}

.dEmail {
	
}

.dGit {
	font-weight: bolder;
}

.dGit a {
	color: #1f94ff;
}

.dPart {
	color: blue;
	font-size: 15px;
}

.part_dropdown {
	position: relative;
	font-weight: bolder;
	background-color: #64A2AD;
	height: 40px;
	line-height: 40px;
	font-size: 20px;
	color: white;
}

.part_dropdown_content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 120px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 10;
	text-align: center;
}

.part_dropdown_content span {
	padding: 0px 10px;
	display: block;
}

.part_dropdown:hover .part_dropdown_content {
	display: block;
}

</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
   
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart1);
    google.charts.setOnLoadCallback(drawChart2);    
    google.charts.setOnLoadCallback(drawChart3);    

       
    function drawChart1() {
    
        // Create the data table.
        var data1 = new google.visualization.DataTable();
        data1.addColumn('string', 'Topping');
        data1.addColumn('number', 'Slices');
        data1.addRows([
        ["강원도",${m1}],["경기도",${m2}],["경상남도",${m3}],["경상북도",${m4}],["전라남도",${m5}],["전라북도",${m6}],["충청남도",${m7}],["충청북도",${m8}],
        ]);
        
        // Set chart options
        var options1 = {'title':'지역',
                       'width':480,
                       'height':300,'pieHole': 0.4,};
        
        // Instantiate and draw our chart, passing in some options.
        
        var chart1 = new google.visualization.PieChart(document.getElementById('areacount'));
        chart1.draw(data1, options1);
    } 
                
    function drawChart2() {
    
        // Create the data table.
        var data2 = new google.visualization.DataTable();
        data2.addColumn('string', 'Topping');
        data2.addColumn('number', 'Slices');
        data2.addRows([
        ["호캉스",${t1}],["청춘",${t2}],["자연",${t3}],["유적지",${t4}],["액티비티",${t5}],
        ]);
        // Set chart options
        var options2 = {'title':'여행성향',
                       'width':480,
                       'height':300,
                       'pieHole': 0.4,};
        // Instantiate and draw our chart, passing in some options.
        var chart2 = new google.visualization.PieChart(document.getElementById('tendencycount'));
        chart2.draw(data2, options2);
    }          
    
    function drawChart3() {
    
        // Create the data table.
        var data3 = new google.visualization.DataTable();
        data3.addColumn('string', 'Topping');
        data3.addColumn('number', 'Slices');
        data3.addRows([
        ["4명이내",${p1}],["5~8명",${p2}],["9명이상",${p3}],
        ]);
        // Set chart options
        var options3 = {'title':'인원수',
                       'width':480,
                       'height':300,
                       'pieHole': 0.4,};
        // Instantiate and draw our chart, passing in some options.
        var chart3 = new google.visualization.PieChart(document.getElementById('peoplecount'));
        chart3.draw(data3, options3);
    }                          
</script>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div id="common"
			style="width: 1000px; padding: 80px 0px; height: auto;">
			<div class="jck_content_container_div2">
				<div>
					<img style="width: 100%; height: auto;"
						src="${pageContext.request.contextPath }/resources/images/logo_text.png">
				</div>
				<div style="width: 100%;">
					<div style="padding: 20px 0px;">
						<h1 style="color: #0AC5A8;">1. 사이트 소개</h1>
					</div>
					<div style="display: flex;">
						<div style="width: 300px; height: auto;">
							<p style="font-size: 30px;">
								<b>우리에게 여행은<br> "무엇"일까요.
								</b>
							</p>
						</div>
						<div style="width: 700px; height: auto;">
							<div style="color: gray;">
								<p>투레블의 이야기는 여기서부터 시작합니다.</p>
								<br>
								<p>여행, 누군가에게는 시야를 넓힐 수 있는 기회이고, 누군가에게는 현실을 벗어나 휴양을 즐길 수 있는
									소중한 시간이며, 또 누군가에게는 단순한 유흥일 수도 있습니다.</p>
								<br>
								<p>저희는 여행이란 자기 자신을 오롯이 만나는 시간이라 생각합니다. 현실에서는 다른 사람과의 비교하며
									느끼는 상대적 박탈감에, 때로는 바쁜 업무라는 핑계에, 외면하기도 하고 일부로 마주하지 않으려고도 하는 가장
									소중한 자기 자신을, 여행에서는 자연스럽게 마주할 수 밖에 없게 됩니다. 그런 의미에서 여행은 일종의 ‘영혼의
									거울’이라 생각합니다.</p>
								<br>
							</div>
							<div style="color: gray;">
								<p>
									<b>그렇다면, 여행에서 가장 중요한 것들은 관광이나 휴양으로 충분한가요?</b>
								</p>
								<br>
							</div>
							<div style="color: gray;">
								<p>보다 철학적인 개념으로 ‘경험’이 더해져 더 깊은 여행이 되리라 저희는 믿습니다. 사실 넓은 의미에서
									관광, 휴양도 경험의 일부이긴 합니다. 하지만 저희는 진짜 제대로 된 경험을 저희 투레블러들에게 제공하고
									싶습니다. 깊은 경험을 통하여 자기 자신을 제대로 마주하고, 이를 통하여 본인을 다시 한번 돌아보고, 결국에는
									현실로 돌아와서도 현재를 여행처럼 살게 하는 것, 그것이 저희가 추구하는 투레블의 가치이자 존재이유입니다.</p>
							</div>
						</div>
					</div>
					<br>
					<div
						style="width: 1000px; height: 650px; margin: 0 auto; position: relative; padding-top: 10px;">
						<div
							style="z-index: 5; width: 1000px; height: 200px; position: absolute; top: 100px; text-align: center;">
							<span
								style="font-size: 80px; font-weight: bold; font-family: 'Montserrat', sans-serif;">T&nbsp;W&nbsp;O&nbsp;&nbsp;</span><span
								style="color: #0AC5A8; font-size: 80px; font-weight: bold; font-family: 'Montserrat', sans-serif;">R&nbsp;A&nbsp;V&nbsp;E&nbsp;L</span><br>
							<span
								style="font-size: 60px; font-weight: bold; font-family: 'Montserrat', sans-serif;">&#124;&#124;</span>
						</div>
						<div
							style="z-index: 5; width: 1000px; height: 200px; position: absolute; top: 300px; text-align: center;">
							<span
								style="color: #0AC5A8; font-size: 60px; font-weight: bold; font-family: 'Montserrat', sans-serif;">T&nbsp;R&nbsp;A&nbsp;V&nbsp;E&nbsp;L&nbsp;&nbsp;</span>
							<span
								style="font-size: 60px; font-weight: bold; font-family: 'Montserrat', sans-serif;">T&nbsp;O&nbsp;G&nbsp;E&nbsp;T&nbsp;H&nbsp;E&nbsp;R</span>
						</div>
						<div
							style="z-index: 5; width: 1000px; height: 200px; position: absolute; top: 520px; text-align: center;">
							<span style="font-size: 30px; font-weight: bold;">TwoRAVEL은
								'Travel'과 'Together'의 합성어로</span><br> <span
								style="font-size: 30px; font-weight: bold;">'함께 떠나는 여행'을
								의미합니다.</span>
						</div>

						<img style="width: 1000px; height: 650px; opacity: 0.5;"
							src="${pageContext.request.contextPath }/resources/images/MainPage.png" />
					</div>
					<br>

					<div style="display: flex; justify-content: center; width: 100%">
						<div id="areacount" style="margin-left: 30px;"></div>
						<div id="peoplecount" style="margin-left: -110px;"></div>
						<div id="tendencycount" style="margin-left: -125px;"></div>
					</div>
				</div>
				<br> <br>
				<div style="width: 100%; margin: 20px 0px;">
					<div style="margin-bottom: 10px;">
						<h1 style="color: #0AC5A8;">2. 개발팀 소개</h1>
					</div>
					<div style="width: 100%; padding: 20px 0px;">
						<div style="display: flex; justify-content: center;">
							<div style="padding: 0px 20px; margin-bottom: 30px;">
								<div
									style="width: 200px; height: 200px; margin: 0 auto; position: relative;">
									<div
										style="z-index: 5; width: 200px; height: 200px; position: absolute; padding: 5px;">
										<img style="width: 100%; height: 100%;"
											src="${pageContext.request.contextPath }/resources/images/JungCG.png">
									</div>
									<div
										style="border: 5px solid #64a2ad; width: 200px; height: 200px; opacity: 0.5; border-radius: 100%; bottom: 0px;">
										&nbsp;</div>
								</div>
								<div style="text-align: center;">
									<p class="dName">정창균</p>
									<p class="d">Developer</p>
									<p class="dEmail">1360cat@hanmail.net</p>
									<p class="dGit">
										<a href="https://github.com/JungCG" target="_blank">JungCG
											(github)</a>
									</p>
									<div class="part_dropdown">
										View Details
										<div class="part_dropdown_content">
											<span class="dPart">#Member_Func #Scheduling #Network</span>
											<span class="dPart">#CoronaMap #Server #공공_API #KaKaoMap_Api</span> <span
												class="dPart">#Point #E-mailing</span>
										</div>
									</div>
								</div>
							</div>
							<div style="padding: 0px 20px; margin-bottom: 30px;">
								<div
									style="width: 200px; height: 200px; margin: 0 auto; position: relative;">
									<div
										style="z-index: 5; width: 200px; height: 200px; position: absolute; padding: 5px;">
										<img style="width: 100%; height: 100%;"
											src="${pageContext.request.contextPath }/resources/images/the_ykk.png">
									</div>
									<div
										style="border: 5px solid #64a2ad; width: 200px; height: 200px; opacity: 0.5; border-radius: 100%; bottom: 0px;">
										&nbsp;</div>
								</div>
								<div style="text-align: center;">
									<p class="dName">금지운</p>
									<p class="d">Developer</p>
									<p class="dEmail">the_ykk@naver.com</p>
									<p class="dGit">
										<a href="https://github.com/GJWoon" target="_blank">GJWoon
											(github)</a>
									</p>
									<div class="part_dropdown">
										View Details
										<div class="part_dropdown_content">
											<span class="dPart">#Board #AdminPage</span> <span
												class="dPart">#WeatherForecast</span> <span class="dPart">#SmartEditor2.0</span>
											<span class="dPart"> #ChatBot Api </span> <span class="dPart">#KaKaoMap
												Api </span> <span class="dPart">#Chart api #IamPort Api</span>
										</div>
									</div>
								</div>
							</div>
							<div style="padding: 0px 20px; margin-bottom: 30px;">
								<div
									style="width: 200px; height: 200px; margin: 0 auto; position: relative;">
									<div
										style="z-index: 5; width: 200px; height: 200px; position: absolute; padding: 5px;">
										<img style="width: 100%; height: 100%;"
											src="${pageContext.request.contextPath }/resources/images/salyun.png">
									</div>
									<div
										style="border: 5px solid #64a2ad; width: 200px; height: 200px; opacity: 0.5; border-radius: 100%; bottom: 0px;">
										&nbsp;</div>
								</div>
								<div style="text-align: center;">
									<p class="dName">강대영</p>
									<p class="d">Developer</p>
									<p class="dEmail">kadaye15572@gmail.com</p>
									<p class="dGit">
										<a href="https://github.com/salyun" target="_blank">salyun (github)</a>
									</p>
									<div class="part_dropdown">
										View Details
										<div class="part_dropdown_content">
											<span class="dPart">#Companion #Scheduling</span> <span
												class="dPart">#SmartEditor #Magazine</span> <span
												class="dPart">#Kakaomap</span>
										</div>
									</div>
								</div>
							</div>
							<div style="padding: 0px 20px; margin-bottom: 30px;">
								<div
									style="width: 200px; height: 200px; margin: 0 auto; position: relative;">
									<div
										style="z-index: 5; width: 200px; height: 200px; position: absolute; padding: 5px;">
										<img style="width: 100%; height: 100%;"
											src="${pageContext.request.contextPath }/resources/images/JH.png">
									</div>
									<div
										style="border: 5px solid #64a2ad; width: 200px; height: 200px; opacity: 0.5; border-radius: 100%; bottom: 0px;">
										&nbsp;</div>
								</div>
								<div style="text-align: center;">
									<p class="dName">윤지혜</p>
									<p class="d">Developer</p>
									<p class="dEmail">jihyeyoon111@gmail.com</p>
									<p class="dGit">
										<a href="https://github.com/realJihye" target="_blank">realJihye
											(github)</a>
									</p>
									<div class="part_dropdown">
										View Details
										<div class="part_dropdown_content">
											<span class="dPart">#Gallery #Point</span>
											<span class="dPart">#Intro #Bootstrap</span>
											<span class="dPart">#File-Upload #Like</span>
										</div>
									</div>
								</div>
							</div>
							<div style="padding: 0px 20px; margin-bottom: 30px;">
								<div
									style="width: 200px; height: 200px; margin: 0 auto; position: relative;">
									<div
										style="z-index: 5; width: 200px; height: 200px; position: absolute; padding: 5px;">
										<img style="width: 100%; height: 100%;"
											src="${pageContext.request.contextPath }/resources/images/CR.png">
									</div>
									<div
										style="border: 5px solid #64a2ad; width: 200px; height: 200px; opacity: 0.5; border-radius: 100%; bottom: 0px;">
										&nbsp;</div>
								</div>
								<div style="text-align: center;">
									<p class="dName">임채린</p>
									<p class="d">Developer</p>
									<p class="dEmail">ewuuu1112@gmail.com</p>
									<p class="dGit" style="font-size:0.9em">
										<a href="https://github.com/ChaeRin-Im" target="_blank">ChaeRin-Im
											(github)</a>
									</p>
									<div class="part_dropdown">
										View Details
										<div class="part_dropdown_content">
											<span class="dPart">#TodayWeather #MyPage</span> <span
												class="dPart">#MemberProfile <br> #Report #Like
											</span> <span class="dPart">#Chatting</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br> <br>
				<div style="width: 100%;">
					<div style="width: 100%;">
						<h1 style="color: #0AC5A8;">3. 저작권 표기</h1>
					</div>
					<div style="width: 100%; overflow-x: hidden;">
						<div style="padding-top: 10px; padding-bottom: 5px;">
							<span style="font-size: 20px; font-weight: bolder;">이미지 출처</span>
						</div>
						<ul>
							<li><a style="color: grey;" target="_blank"
								href="https://notefolio.net/vacaskingdom">-
									https://notefolio.net/vacaskingdom</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://brunch.co.kr/@hotelscomkr/466">-
									https://brunch.co.kr/@hotelscomkr/466</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://www.flaticon.com/packs/weather-161?k=1608556847505">-
									https://www.flaticon.com/packs/weather-161?k=1608556847505</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://www.flaticon.com/">- https://www.flaticon.com/</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://codepen.io/juliepark/pen/QxWVPv">-
									https://codepen.io/juliepark/pen/QxWVPv</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://kr.freepik.com/free-photo/tropical-beach_3501168.htm#page=5&query=travel&position=24">-
									https://kr.freepik.com/free-photo/tropical-beach_3501168.htm#page=5&query=travel&position=24</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://kr.freepik.com/free-photo/chair-and-table-dinning-on-the-beach-and-sea-with-blue-sky_4011139.htm#page=2&query=travel&position=31">-
									https://kr.freepik.com/free-photo/chair-and-table-dinning-on-the-beach-and-sea-with-blue-sky_4011139.htm#page=2&query=travel&position=31</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://kr.freepik.com/free-photo/beach-surrounded-by-the-sea-and-greenery-under-the-sunlight-and-a-blue-sky-in-praslin-in-seychelles_11486730.htm#page=1&query=travel&position=22">-
									https://kr.freepik.com/free-photo/beach-surrounded-by-the-sea-and-greenery-under-the-sunlight-and-a-blue-sky-in-praslin-in-seychelles_11486730.htm#page=1&query=travel&position=22</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://smartstore.naver.com/summit8392/products/5001032097?NaPm=ct%3Dkjv50kyg%7Cci%3D315ca710b3d9c29555d18c0c9d31081a489bf6ff%7Ctr%3Dslsl%7Csn%3D803789%7Chk%3D6164c8e0a10b8fb8477564fdbab6be9876e425cf">-
									https://smartstore.naver.com/summit8392/products/5001032097?NaPm=ct%3Dkjv50kyg%7Cci%3D315ca710b3d9c29555d18c0c9d31081a489bf6ff%7Ctr%3Dslsl%7Csn%3D803789%7Chk%3D6164c8e0a10b8fb8477564fdbab6be9876e425cf</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://search.shopping.naver.com/catalog/4033084782?query=%EC%BD%94%EB%8B%A5%20FunSaver&NaPm=ct%3Dkjv51tpk%7Cci%3D7ff653b51440800688f2c90cdbf6708754de3814%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3D060619cb19e1444e2de2a74abdd3c70ccef5dc1c">-
									https://search.shopping.naver.com/catalog/4033084782?query=%EC%BD%94%EB%8B%A5%20FunSaver&NaPm=ct%3Dkjv51tpk%7Cci%3D7ff653b51440800688f2c90cdbf6708754de3814%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3D060619cb19e1444e2de2a74abdd3c70ccef5dc1c</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://brand.naver.com/lionmall/products/655260439?NaPm=ct%3Dkjv53bq0%7Cci%3D72600947209f26181c5c507f201e6b18f39f5054%7Ctr%3Dslsl%7Csn%3D459030%7Chk%3Dddedfd9952da18b571b1fd2efe0b082d58f0d48e">-
									https://brand.naver.com/lionmall/products/655260439?NaPm=ct%3Dkjv53bq0%7Cci%3D72600947209f26181c5c507f201e6b18f39f5054%7Ctr%3Dslsl%7Csn%3D459030%7Chk%3Dddedfd9952da18b571b1fd2efe0b082d58f0d48e</a></li>
							<li><a style="color: grey;" target="_blank"
								href="http://365market3.co.kr/goods/goods_view.php?goodsNo=1000003777&inflow=naver&NaPm=ct%3Dkjv54gm8%7Cci%3D8a07fdd9b7852f1e2dfe28382d03c2c7919797ef%7Ctr%3Dslsl%7Csn%3D1191165%7Chk%3D511d2bfba6e1662cefd040e176a13cb011246436">-
									http://365market3.co.kr/goods/goods_view.php?goodsNo=1000003777&inflow=naver&NaPm=ct%3Dkjv54gm8%7Cci%3D8a07fdd9b7852f1e2dfe28382d03c2c7919797ef%7Ctr%3Dslsl%7Csn%3D1191165%7Chk%3D511d2bfba6e1662cefd040e176a13cb011246436</a></li>

						</ul>
						<div style="padding-top: 10px; padding-bottom: 5px;">
							<span style="font-size: 20px; font-weight: bolder;">동영상 출처</span>
						</div>
						<ul>
							<li><a style="color: grey;" target="_blank"
								href="https://www.youtube.com/embed/euJ0p3sCfGM?autoplay=1&loop=1&mute=1">-
									https://www.youtube.com/embed/euJ0p3sCfGM?autoplay=1&loop=1&mute=1</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://www.youtube.com/embed/Py-BAqWV144?autoplay=1&loop=1&mute=1">-
									https://www.youtube.com/embed/Py-BAqWV144?autoplay=1&loop=1&mute=1</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
