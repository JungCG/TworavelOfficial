<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이트 소개</title>
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
								<p>오다의 이야기는 여기서부터 시작합니다.</p>
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
									관광, 휴양도 경험의 일부이긴 합니다. 하지만 저희는 진짜 제대로 된 경험을 저희 오다인들에게 제공하고 싶습니다.
									깊은 경험을 통하여 자기 자신을 제대로 마주하고, 이를 통하여 본인을 다시 한번 돌아보고, 결국에는 현실로
									돌아와서도 현재를 여행처럼 살게 하는 것, 그것이 저희가 추구하는 오다의 가치이자 존재이유입니다.</p>
							</div>
						</div>
					</div>
					<br>
					<div
						style="width: 1000px; height: 650px; margin: 0 auto; position: relative; padding-top: 10px;">
						<div
							style="z-index: 5; width: 1000px; height: 200px; position: absolute; top: 100px; text-align: center;">
							<span style="font-size: 80px; font-weight: bold;">T&nbsp;W&nbsp;O&nbsp;&nbsp;</span><span
								style="color: #0AC5A8; font-size: 80px; font-weight: bold;">R&nbsp;A&nbsp;V&nbsp;E&nbsp;L</span><br>
							<span style="font-size: 60px; font-weight: bold;">&#124;&#124;</span>
						</div>
						<div
							style="z-index: 5; width: 1000px; height: 200px; position: absolute; top: 300px; text-align: center;">
							<span style="color: #0AC5A8; font-size: 60px; font-weight: bold;">T&nbsp;R&nbsp;A&nbsp;V&nbsp;E&nbsp;L&nbsp;&nbsp;</span>
							<span style="font-size: 60px; font-weight: bold;">T&nbsp;O&nbsp;G&nbsp;E&nbsp;T&nbsp;H&nbsp;E&nbsp;R</span>
						</div>
						<div
							style="z-index: 5; width: 1000px; height: 200px; position: absolute; top: 520px; text-align: center;">
							<span style="font-size: 30px; font-weight: bold;">TwoRAVEL은
								'Travel'과 'Together'의 합성어로</span><br> <span
								style="font-size: 30px; font-weight: bold;">'함께 떠나는 여행'을
								의미합니다.</span>
						</div>

						<img style="width: 1000px; height: 650px; opacity: 0.5;"
							src="${pageContext.request.contextPath }/resources/images/MainPage.jpg" />
					</div>
					<br>
					<div style="width: 100%;">
						<div style="text-align: center; padding-top: 30px; padding-bottom:10px;">
							<p style="font-size: 30px; color: #34666f; font-weight: bolder;">
								오다는 다양한 우리의 경험을<br> 고객에게 이어가려 합니다.
							</p>
						</div>
						<div style="width: 100%; padding: 30px 0px;">
							<p>&nbsp;&nbsp;그렇다고 편협되게 우리만의 경험을 일방적으로 전달하려는 것은 아닙니다. 여행
								매니아들로 구성된 오다의 경영진은 그러하기에 우리의 경험을 고객에게 이으려 합니다. 그렇다고 편협되게 우리만의
								경험을 일방적으로 전달하려는 것은 아닙니다. 저희가 고객을 이해하려고 노력하듯이, 여행을 실질적으로 구성하는 현지
								여행사의 경험 또한 매우 중요합니다. 그러하기에 각 나라에서 그 나라를 진정 잘 이해하며, 오다의 철학도 완벽하게
								공감하는 선별된 현지 여행사와 상호 독점 계약을 통하여 독보적인 상품을 개발하고, 그들의 경험 또한 고객에게
								이어갑니다. 또한 오다와 함께 여행을 함께 한 고객들의 실질적인 경험도 그 이후의 다른 오다인들에게 또다시 연결될
								수 있도록 이어갑니다.</p>
						</div>
					</div>
				</div>
				<br> <br>
				<div style="width: 100%;">
					<div>
						<h1 style="color: #0AC5A8;">2. 개발팀 소개</h1>
					</div>
					<div style="width: 100%; padding: 20px 0px;">
						<div style="display: flex; justify-content: center;">
							<div style="margin: 0px 20px; margin-bottom: 30px;">
								<div
									style="width: 300px; height: 300px; margin: 0 auto; position: relative;">
									<div
										style="z-index: 5; width: 300px; height: 300px; position: absolute; top: -20px; padding: 5px;">
										<img style="width: 100%; height: 100%;"
											src="${pageContext.request.contextPath }/resources/images/Self.png">
									</div>
									<div
										style="width: 300px; height: 300px; opacity: 0.5; background-color: #f5f5dc; border-radius: 100%; bottom: 0px;">
										&nbsp;</div>
								</div>
								<div style="text-align: center;">
									<p class="dName">정창균</p>
									<p class="d">Developer</p>
									<p class="dEmail">1360cat@hanmail.net</p>
									<p class="dGit">
										<a href="https://github.com/JungCG" target="_blank">github.com/JungCG</a>
									</p>
									<div class="part_dropdown">
										View Details
										<div class="part_dropdown_content">
											<span class="dPart">#Member_Func #Scheduling #Network</span>
											<span class="dPart">#CoronaMap #Server #공공_API</span> <span
												class="dPart">#Point #E-mailing</span>
										</div>
									</div>
								</div>
							</div>
							<div style="margin: 0px 20px; margin-bottom: 30px;">
								<div
									style="width: 300px; height: 300px; margin: 0 auto; position: relative;">
									<div
										style="z-index: 5; width: 300px; height: 300px; position: absolute; top: -20px; padding: 5px;">
										<img style="width: 100%; height: 100%;"
											src="${pageContext.request.contextPath }/resources/images/Self.png">
									</div>
									<div
										style="width: 300px; height: 300px; opacity: 0.5; background-color: #f5f5dc; border-radius: 100%; bottom: 0px;">
										&nbsp;</div>
								</div>
								<div style="text-align: center;">
									<p class="dName">정창균</p>
									<p class="d">Developer</p>
									<p class="dEmail">1360cat@hanmail.net</p>
									<p class="dGit">
										<a href="https://github.com/JungCG" target="_blank">github.com/JungCG</a>
									</p>
									<div class="part_dropdown">
										View Details
										<div class="part_dropdown_content">
											<span class="dPart">#Member_Func #Scheduling #Network</span>
											<span class="dPart">#CoronaMap #Server #공공_API</span> <span
												class="dPart">#Point #E-mailing</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div style="display: flex; justify-content: center;">
							<div style="margin: 0px 20px;">
								<div
									style="width: 300px; height: 300px; margin: 0 auto; position: relative;">
									<div
										style="z-index: 5; width: 300px; height: 300px; position: absolute; top: -20px; padding: 5px;">
										<img style="width: 100%; height: 100%;"
											src="${pageContext.request.contextPath }/resources/images/Self.png">
									</div>
									<div
										style="width: 300px; height: 300px; opacity: 0.5; background-color: #f5f5dc; border-radius: 100%; bottom: 0px;">
										&nbsp;</div>
								</div>
								<div style="text-align: center;">
									<p class="dName">정창균</p>
									<p class="d">Developer</p>
									<p class="dEmail">1360cat@hanmail.net</p>
									<p class="dGit">
										<a href="https://github.com/JungCG" target="_blank">github.com/JungCG</a>
									</p>
									<div class="part_dropdown">
										View Details
										<div class="part_dropdown_content">
											<span class="dPart">#Member_Func #Scheduling #Network</span>
											<span class="dPart">#CoronaMap #Server #공공_API</span> <span
												class="dPart">#Point #E-mailing</span>
										</div>
									</div>
								</div>
							</div>
							<div style="margin: 0px 20px;">
								<div
									style="width: 300px; height: 300px; margin: 0 auto; position: relative;">
									<div
										style="z-index: 5; width: 300px; height: 300px; position: absolute; top: -20px; padding: 5px;">
										<img style="width: 100%; height: 100%;"
											src="${pageContext.request.contextPath }/resources/images/Self.png">
									</div>
									<div
										style="width: 300px; height: 300px; opacity: 0.5; background-color: #f5f5dc; border-radius: 100%; bottom: 0px;">
										&nbsp;</div>
								</div>
								<div style="text-align: center;">
									<p class="dName">정창균</p>
									<p class="d">Developer</p>
									<p class="dEmail">1360cat@hanmail.net</p>
									<p class="dGit">
										<a href="https://github.com/JungCG" target="_blank">github.com/JungCG</a>
									</p>
									<div class="part_dropdown">
										View Details
										<div class="part_dropdown_content">
											<span class="dPart">#Member_Func #Scheduling #Network</span>
											<span class="dPart">#CoronaMap #Server #공공_API</span> <span
												class="dPart">#Point #E-mailing</span>
										</div>
									</div>
								</div>
							</div>
							<div style="margin: 0px 20px;">
								<div
									style="width: 300px; height: 300px; margin: 0 auto; position: relative;">
									<div
										style="z-index: 5; width: 300px; height: 300px; position: absolute; top: -20px; padding: 5px;">
										<img style="width: 100%; height: 100%;"
											src="${pageContext.request.contextPath }/resources/images/Self.png">
									</div>
									<div
										style="width: 300px; height: 300px; opacity: 0.5; background-color: #f5f5dc; border-radius: 100%; bottom: 0px;">
										&nbsp;</div>
								</div>
								<div style="text-align: center;">
									<p class="dName">정창균</p>
									<p class="d">Developer</p>
									<p class="dEmail">1360cat@hanmail.net</p>
									<p class="dGit">
										<a href="https://github.com/JungCG" target="_blank">github.com/JungCG</a>
									</p>
									<div class="part_dropdown">
										View Details
										<div class="part_dropdown_content">
											<span class="dPart">#Member_Func #Scheduling #Network</span>
											<span class="dPart">#CoronaMap #Server #공공_API</span> <span
												class="dPart">#Point #E-mailing</span>
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
					<div style="width: 100%; overflow-x:hidden;">
						<div style="padding-top: 10px; padding-bottom: 5px;">
							<span style="font-size: 20px; font-weight: bolder;">이미지 출처</span>
						</div>
						<ul>
							<li><a style="color: grey;" target="_blank"
								href="https://notefolio.net/vacaskingdom">- https://notefolio.net/vacaskingdom</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://brunch.co.kr/@hotelscomkr/466">- https://brunch.co.kr/@hotelscomkr/466</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://kr.freepik.com/free-photo/tropical-beach_3501168.htm#page=5&query=travel&position=24">- https://kr.freepik.com/free-photo/tropical-beach_3501168.htm#page=5&query=travel&position=24</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://kr.freepik.com/free-photo/chair-and-table-dinning-on-the-beach-and-sea-with-blue-sky_4011139.htm#page=2&query=travel&position=31">- https://kr.freepik.com/free-photo/chair-and-table-dinning-on-the-beach-and-sea-with-blue-sky_4011139.htm#page=2&query=travel&position=31</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://kr.freepik.com/free-photo/beach-surrounded-by-the-sea-and-greenery-under-the-sunlight-and-a-blue-sky-in-praslin-in-seychelles_11486730.htm#page=1&query=travel&position=22">- https://kr.freepik.com/free-photo/beach-surrounded-by-the-sea-and-greenery-under-the-sunlight-and-a-blue-sky-in-praslin-in-seychelles_11486730.htm#page=1&query=travel&position=22</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://smartstore.naver.com/summit8392/products/5001032097?NaPm=ct%3Dkjv50kyg%7Cci%3D315ca710b3d9c29555d18c0c9d31081a489bf6ff%7Ctr%3Dslsl%7Csn%3D803789%7Chk%3D6164c8e0a10b8fb8477564fdbab6be9876e425cf">- https://smartstore.naver.com/summit8392/products/5001032097?NaPm=ct%3Dkjv50kyg%7Cci%3D315ca710b3d9c29555d18c0c9d31081a489bf6ff%7Ctr%3Dslsl%7Csn%3D803789%7Chk%3D6164c8e0a10b8fb8477564fdbab6be9876e425cf</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://search.shopping.naver.com/catalog/4033084782?query=%EC%BD%94%EB%8B%A5%20FunSaver&NaPm=ct%3Dkjv51tpk%7Cci%3D7ff653b51440800688f2c90cdbf6708754de3814%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3D060619cb19e1444e2de2a74abdd3c70ccef5dc1c">- https://search.shopping.naver.com/catalog/4033084782?query=%EC%BD%94%EB%8B%A5%20FunSaver&NaPm=ct%3Dkjv51tpk%7Cci%3D7ff653b51440800688f2c90cdbf6708754de3814%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3D060619cb19e1444e2de2a74abdd3c70ccef5dc1c</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://brand.naver.com/lionmall/products/655260439?NaPm=ct%3Dkjv53bq0%7Cci%3D72600947209f26181c5c507f201e6b18f39f5054%7Ctr%3Dslsl%7Csn%3D459030%7Chk%3Dddedfd9952da18b571b1fd2efe0b082d58f0d48e">- https://brand.naver.com/lionmall/products/655260439?NaPm=ct%3Dkjv53bq0%7Cci%3D72600947209f26181c5c507f201e6b18f39f5054%7Ctr%3Dslsl%7Csn%3D459030%7Chk%3Dddedfd9952da18b571b1fd2efe0b082d58f0d48e</a></li>
							<li><a style="color: grey;" target="_blank"
								href="http://365market3.co.kr/goods/goods_view.php?goodsNo=1000003777&inflow=naver&NaPm=ct%3Dkjv54gm8%7Cci%3D8a07fdd9b7852f1e2dfe28382d03c2c7919797ef%7Ctr%3Dslsl%7Csn%3D1191165%7Chk%3D511d2bfba6e1662cefd040e176a13cb011246436">- http://365market3.co.kr/goods/goods_view.php?goodsNo=1000003777&inflow=naver&NaPm=ct%3Dkjv54gm8%7Cci%3D8a07fdd9b7852f1e2dfe28382d03c2c7919797ef%7Ctr%3Dslsl%7Csn%3D1191165%7Chk%3D511d2bfba6e1662cefd040e176a13cb011246436</a></li>

						</ul>
						<div style="padding-top: 10px; padding-bottom: 5px;">
							<span style="font-size: 20px; font-weight: bolder;">동영상 출처</span>
						</div>
						<ul>
							<li><a style="color: grey;" target="_blank"
								href="https://www.youtube.com/embed/euJ0p3sCfGM?autoplay=1&loop=1&mute=1">- https://www.youtube.com/embed/euJ0p3sCfGM?autoplay=1&loop=1&mute=1</a></li>
							<li><a style="color: grey;" target="_blank"
								href="https://www.youtube.com/embed/Py-BAqWV144?autoplay=1&loop=1&mute=1">- https://www.youtube.com/embed/Py-BAqWV144?autoplay=1&loop=1&mute=1</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>