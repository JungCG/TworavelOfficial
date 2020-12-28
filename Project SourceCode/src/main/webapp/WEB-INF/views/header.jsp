<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    	String ctx = request.getContextPath();
    	String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<script type="text/javascript">
		$(function() {
			<% if(userID == null){
			%>
			var before = document.getElementsByClassName("jck_before_login");
    		for(var i = 0 ; i<before.length;i++){
    			before[i].style.display = "block";
    		}
    		var after = document.getElementsByClassName("jck_after_login");
    		for(var i = 0 ; i<after.length;i++){
    			after[i].style.display = "none";
    		}
			<%
			}else{
			%>
			var before = document.getElementsByClassName("jck_before_login");
			for(var i = 0 ; i<before.length;i++){
				before[i].style.display = "none";
			}
			var after = document.getElementsByClassName("jck_after_login");
			for(var i = 0 ; i<after.length;i++){
				after[i].style.display = "block";
			}
			<%
				if(userID.equals("potatotravel")){
			%>
					var managerPage = document.getElementById("manager_my_page");
					var userPage = document.getElementById("user_my_page");
					userPage.style.display="none";
			<%
				}else{
			%>
					var managerPage = document.getElementById("manager_my_page");
					var userPage = document.getElementById("user_my_page");
					managerPage.style.display = "none";
			<%
				}
			%>
			
			<%
			}
			%>
			
			$('.jck_up').on('click', function(e) {
				e.preventDefault();
				$('html,body').animate({
					scrollTop : 0
				}, 1000);
			});

			$(window).scroll(
					function(event) {
						if ($(this).scrollTop() == 0) {
							$('#header_container').css("border-bottom",
									"1px solid black");
						} else {
							$('#header_container').css("border-bottom", "0");
						}
					});
		});
	</script>
	<div id="header_container"
		style="width: 100vw; border-bottom: 1px solid black;">
		<header
			style="position: relative; width: 1280px; padding: 0 10px; height: 70px; display: flex; justify-content: space-between; align-items: center; z-index:1;">
			<div id="header_inside" style="position: fixed; width: 1280px;">
				<div id="header_inside_section">
					<div id="header_inside_section_left"
						style="display: flex; justify-content: space-between; align-items: center; background-color: white; height: 70px;">
						<div id="header_inside_section_left_img">
							<a href="./"> <img
								src="${pageContext.request.contextPath }/resources/images/logo_icon.png"
								style="width: 167.741935484px; height: auto;">
							</a>
						</div>
						<div style="margin-left: 20px; position: relative;">
							<div style="width: 30px; height: 30px;"></div>
						</div>
						<div style="margin-left: 20px; position: relative;">
							<div style="width: 30px; height: 30px;"></div>
						</div>
						<div id="header_inside_section_left_menu">
							<ul
								style="list-style: none; display: flex; justify-content: space-between; align-items: center;">
								<li style="display: inline-block;"><a href="#"
									style="padding: 0 15px;">사이트 소개</a></li>
								<li style="display: inline-block;"><a href="#"
									style="padding: 0 15px;">동행 구하기</a></li>
								<li id="jck_dropdown" style="display: inline-block;"><a
									href="#" style="padding: 0 15px;">통합 게시판</a>
									<div id="jck_dropdown_content">
										<a href="board_list.do?type=N">공지 사항</a> <a href="board_list.do?type=G">여행 정보</a> <a href="board_list.do?type=R">여행
											리뷰</a>
									</div></li>
								<li style="display: inline-block;"><a href="#"
									style="padding: 0 15px;">갤러리</a></li>
								<li style="display: inline-block;"><a href="#"
									style="padding: 0 15px;">포테이토박스</a></li>
								<li style="display: inline-block;"><a href="tworavelmap.do"
									style="padding: 0 15px;">여행 지도</a></li>
							</ul>
						</div>
						<div style="margin-left: 20px; position: relative;">
							<div style="width: 30px; height: 30px;"></div>
						</div>
						<div style="margin-left: 10px; position: relative;">
							<div style="width: 15px; height: 15px;"></div>
						</div>
						<div style="margin-left: 20px; position: relative;">
							<div style="width: 30px; height: 30px;"></div>
						</div>
						<div style="margin-left: 20px; position: relative;">
							<div style="width: 30px; height: 30px;"></div>
						</div>
						<div>
							<ul
								style="list-style: none; display: flex; justify-content: space-between; align-items: center;">
								<li style="display: inline-block;" class="jck_before_login"><a href="./loginPre.do"
									style="padding: 0 15px;">My Page</a></li>
								<li style="display: inline-block;" class="jck_after_login" id="user_my_page"><a href="./MyPage.do"
									style="padding: 0 15px;">My Page</a></li>
									<li style="display: inline-block;" class="jck_after_login" id="manager_my_page"><a href="./AdminPage.do"
									style="padding: 0 15px;">Admin</a></li>
								<li style="display: inline-block;" class="jck_before_login"><a href="./loginPre.do"
									style="padding: 0 15px;">Login</a></li>
								<li style="display: inline-block;" class="jck_after_login"><a href="./logout.do"
									style="padding: 0 15px;">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>
	<div class="jck_up" style="position: fixed; width: 100px; height: 100px; right: 50px; bottom: 50px; border-radius: 100%; cursor : pointer; outline:none; z-index:1;">
		<button
			style="position: relative; width: 100%; height: 100%; background-color: #0AC5A8; border-radius: 100%; cursor : pointer; outline:none;">TOP</button>
	</div>
	
	<script>
		(function() {
			var w = window;
			if (w.ChannelIO) {
				return (window.console.error || window.console.log || function() {
				})('ChannelIO script included twice.');
			}
			var ch = function() {
				ch.c(arguments);
			};
			ch.q = [];
			ch.c = function(args) {
				ch.q.push(args);
			};
			w.ChannelIO = ch;
			function l() {
				if (w.ChannelIOInitialized) {
					return;
				}
				w.ChannelIOInitialized = true;
				var s = document.createElement('script');
				s.type = 'text/javascript';
				s.async = true;
				s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
				s.charset = 'UTF-8';
				var x = document.getElementsByTagName('script')[0];
				x.parentNode.insertBefore(s, x);
			}
			if (document.readyState === 'complete') {
				l();
			} else if (window.attachEvent) {
				window.attachEvent('onload', l);
			} else {
				window.addEventListener('DOMContentLoaded', l, false);
				window.addEventListener('load', l, false);
			}
		})();
		
		ChannelIO('boot', {
			"pluginKey" : "f1f8e46a-2c26-4d02-ac37-3e5c504751ac"
		});
	</script>
</body>
</html>
