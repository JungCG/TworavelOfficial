<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진</title>
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
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div id="common"
			style="width: 1000px; padding: 2px; height: auto; background-color: #FAFAFA;">
				<div style="padding : 10px;">
					<img style="width: 100%; height: auto;"
						src="${pageContext.request.contextPath }/resources/images/2magazinemain.png">
				</div>
			<div class="jck_content_container_div2" style="padding: 30px;">
				<div style="width: 100%; padding-left: 10px;">
					<div style="padding: 20px 0px; margin-top: 100px;">
						<h1 style="color: #0AC5A8;">1. 자기 소개</h1>
					</div>
					<div style="display: flex;">
						<div style="width: 300px; height: auto; padding: 10px;">
							<p style="font-size: 30px;">
								<b>2&nbsp;+&nbsp;RAVEL </b>
							</p>
						</div>
						<div style="width: 700px; height: auto; padding: 10px;">
							<div style="color: gray;">
								<b style="font-size: 24px;">안녕 나는 2Ravel이야</b> <br>
								<p style="font-size: 18px;">
									Tworavel = together travel <br>누구나 보면 알아차릴 쉬운 이름이지!<br>누군가와
									같이 여행할 생각에 가슴이 두근두근하지 않아 친구?
								</p>
							</div>
						</div>
					</div>
					<div style="padding: 20px 0px; margin-top: 60px;">
						<h1 style="color: #0AC5A8;">2. 여행 주제</h1>
					</div>
					<div style="display: flex;">
						<div style="width: 300px; height: auto; padding: 10px;">
							<p style="font-size: 30px;">
								<b>여행, 길과 사람</b>
							</p>
						</div>
						<div style="width: 700px; height: auto; padding: 10px;">
							<div style="color: gray;">
								<b style="font-size: 24px;">이번 호의 여행 주제는 길</b> <br>
								<p style="font-size: 18px;">
									거리의 길를 따라 걸어가며<br>여행지의 거리에서 두근거림을 느낄 수 있는 곳으로 가보자! <br>interactive
									한 공간 <br> 앞에 무엇이 오는지 알 수 없으며, 걸음에 맞춰 환경이 계속 변화하는 곳을 말한다.
									즉, 공간과 사람이 상호작용을 할 수 있는 공간이다.
								</p>
							</div>
						</div>
					</div>
					<div style="padding: 20px 0px; margin-top: 60px;">
						<h1 style="color: #0AC5A8;">3. 여행지</h1>
					</div>
					<div style="display: flex;">
						<div style="width: 300px; height: auto; padding: 10px;">
							<p style="font-size: 30px;">
								<b>여행, 길과 사람</b>
							</p>
						</div>
						<div style="width: 700px; height: auto; padding: 10px;">
							<div style="color: gray;">
								<b style="font-size: 24px;">첫 여행지는 바로!!</b> <br>
								<p style="font-size: 18px;">
									한국의 수도! 서울!<br>우리의 첫 여행은 익선동 한옥마을로 정했어<br>익선동은
									1930년대에 지어진 한옥마을로 유명해 20세기 후반부터는 관광 명소이자 성소수자들의 보금자리가 되었지. 가~장
									오래된 한옥 집단 지구였던 이곳은 2010년에 젠트리피케이션을 겪으면서 동네 모습이 급격히 바뀌었어.<br>때문에
									지역만의 고유한 정체성을 잃어간다는 지적을 받고 있기도 하지.<br>서울에서 요즘 가장 핫한 한옥마을의
									골목길로 가보자!
								</p>
							</div>
						</div>
					</div>
					<br>
					<div style="padding: 10px; margin-top: 20px;">
						<img style="width: 100%; height: auto;"
							src="${pageContext.request.contextPath }/resources/images/2magazinemap.png"><br>
						<b style="justify-content: flex-end; display: flex;">익선동 한옥마을
							골목길 지도</b>
					</div>
					<br>
					<div style="width: 100%;">
						<div style="text-align: center; padding: 30px 0px;">
							<p style="font-size: 30px; color: #34666f; font-weight: bolder;">
								멋진 길과 사람들, Sequence & Interaction</p>
							<p style="font-size: 18px; padding-top: 10px;">
								&nbsp;&nbsp;길에는 연속성이 있고 그 연속성에는 상호 작용이 있어.&nbsp;우리는 상호작용이 풍부한
								공간에서 흥미를 느껴,&nbsp;도파민이 팍팍 나온다는 소리지!&nbsp;그 때문에 구불구불한 옛 골목길에서 길과
								상호작용을 하고 흥미를 느껴 모여드는 거야.&nbsp;그 점에 있어서 익선동은 정말 최적의 위치지!<br>
							</p>
						</div>
					</div>
				</div>
				<div style="display: flex; margin-top: 100px; padding-left: 10px;">
					<div style="width: 1000px; height: auto;">
						<p>
							<b style="font-size: 24px; padding-left: 10px;">경양식 1920</b> <br>
						<p style="font-size: 18px; padding: 4px;">
							&nbsp;돈까스가 맛있는 집으로 유명한 경양식 1920!<br> &nbsp;혹시... 가면 1920년에
							열었는지 한 번 물어봐줄래? ㅋㅋ
						</p>
					</div>
				</div>
				<br>
				<div style="display: flex; padding-left: 20px;">
					<div style="width: 1000px; height: 200px;">
						<img style="width: 255px; height: auto; margin-right: 60px;"
							src="${pageContext.request.contextPath }/resources/images/light Western meal.jpg">
						<img style="width: 255px; height: auto; margin-right: 60px;"
							src="${pageContext.request.contextPath }/resources/images/light Western meal2.jpg">
						<img style="width: 255px; height: auto;"
							src="${pageContext.request.contextPath }/resources/images/light Western meal3.jpg">
					</div>
				</div>
				<div style="display: flex; margin-top: 60px; padding-left: 10px;">
					<div style="width: 1000px; height: auto;">
						<p>
							<b style="font-size: 24px; padding-left: 10px;">PROUST</b> <br>
						<p style="font-size: 18px; padding: 4px;">
							&nbsp;익선동 홍차전문카페<br> &nbsp;그날그날 만든 밀크티를 전문적으로 판매하기도 해 밀크티가
							일품!
						</p>
					</div>
				</div>
				<br>
				<div style="display: flex; padding-left: 20px;">
					<div style="width: 1000px; height: 200px;">
						<img style="width: 255px; height: auto; margin-right: 60px;"
							src="${pageContext.request.contextPath }/resources/images/proust11.png">
						<img style="width: 255px; height: auto; margin-right: 60px;"
							src="${pageContext.request.contextPath }/resources/images/proust22.png">
						<img style="width: 255px; height: auto;"
							src="${pageContext.request.contextPath }/resources/images/proust33.png">
					</div>
				</div>
				<div style="display: flex; margin-top: 60px; padding-left: 10px;">
					<div style="width: 1000px; height: auto;">
						<p>
							<b style="font-size: 24px; padding-left: 10px;">뜰안</b> <br>
						<p style="font-size: 18px; padding: 4px;">
							&nbsp;한옥마을의 분위기 그대로의 전통카페<br> &nbsp;입구부터 뜰안으로 들어서는 길에선 한국의
							냄새가 물신 뿜어져와!&nbsp;외국인 친구들 드루와!드루와!!
						</p>
					</div>
				</div>
				<br>
				<div style="display: flex;padding-left: 20px;">
					<div style="width: 1000px; height: 200px;">
						<img style="width: 255px; height: auto; margin-right: 60px;"
							src="${pageContext.request.contextPath }/resources/images/ddeulahn1.png">
						<img style="width: 255px; height: auto; margin-right: 60px;"
							src="${pageContext.request.contextPath }/resources/images/ddeulahn2.png">
						<img style="width: 255px; height: auto;"
							src="${pageContext.request.contextPath }/resources/images/ddeulahn3.png">
					</div>
				</div>
				<div
					style="width: 100%; margin-top: 100px; margin-bottom: 120px; padding-left: 10px;">
					<div
						style="text-align: center; padding-top: 80px; padding-bottom: 20px;">
						<p style="font-size: 30px; color: #34666f; font-weight: bolder;">
							Together Travel 우리가 함께한 첫 시간!</p>
						<p style="font-size: 18px; padding-top: 10px;">
							&nbsp;&nbsp;오늘은 익선동에 대해서 소개했어.<br>익선동에 대해 모든 것을 담을 수는 없었지만,
							조금이나마 관심을 가질수 있었다면 좋겠어!<br>아직 코로나라 가보기는 좀 꺼려지지만,<br>
							끝나면 모두 함께 가자구!
						</p>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>