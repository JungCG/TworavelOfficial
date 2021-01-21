<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
<body>
<div id = "common" style="text-align : center;">
	<div style="text-align : center;">
		<div style="width:1560px; height : 650px; margin: 0 auto; position:relative; padding-top:10px;">
			<div style="width : 1560px;height: 200px;position : absolute; top:50px; text-align:center;">
				<span style="font-family : 'Montserrat', sans-serif; font-size:80px; font-weight:bold;">T&nbsp;W&nbsp;O&nbsp;&nbsp;</span><span style="font-family : 'Montserrat', sans-serif; color:#0AC5A8; font-size:80px; font-weight:bold;">R&nbsp;A&nbsp;V&nbsp;E&nbsp;L</span>
			</div>
			<div style="position:absolute; top:500px; left : 376.1px;">
				<div>
					<form id="searchform">
						<select name="filter" id="filter" style="padding-left:20px; font-size: 17px; font-weight:bolder; text-align:center; width : 100px; height : 60px; border-radius:10px; background-color:rgba(255,255,255,0.8);">
							<option value="1">동행</option>
							<option value="2">지도</option>
							<option value="3">게시판</option>
						</select>
						<input style="font-size: 17px; font-weight:bolder; width : 600px; height : 60px; text-align:center; border-radius:10px; background-color:rgba(255,255,255,0.8);" type="text" id="keyword" name="keyword" placeholder="검색어를 입력해주세요."/>
						<input style="color : #2C3C5B; font-size: 20px; font-weight:bolder; width : 100px; height : 60px; border-radius:10px; background-color:rgba(10,197,168,0.8);" type="submit" value="Search" id="searchbtn">
					</form>
				</div>
			</div>
			<img style="width:1300px; height : 700px;" src = "${pageContext.request.contextPath }/resources/images/MainPage.png"/>
		</div>
	</div>
	<div style="text-align:center; padding-top : 60px; padding-bottom: 10px;">
		<h1 style="color : #0AC5A8;">TwoRAVELER VLOG</h1>
	</div>	
	<div>
		<div>
			<iframe width="1000" height="506" src="https://www.youtube.com/embed/euJ0p3sCfGM?autoplay=1&loop=1&mute=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
	</div>
	<div style="text-align:center; padding-top : 40px; padding-bottom: 10px;">
		<h1 style="color : #0AC5A8;">What is a travel to us</h1>
	</div>
	<div style="text-align:center; padding-bottom : 40px;">
		<div>
			<iframe width="1000" height="506" src="https://www.youtube.com/embed/Py-BAqWV144?autoplay=1&loop=1&mute=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
	</div>
<!--공통부분-->
</div>
</body>
</html> 
