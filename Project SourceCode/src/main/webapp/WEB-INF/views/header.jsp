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
<style>
@font-face {
    font-family: 'Jal_Onuel';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
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

* {
   color: #333;
   font-family : 'Jal_Onuel';
   }

header * {
	font-size: 15px;
}

.pre-loader {
	background: #fff;
	background-position: center center;
	background-size: 13%;
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	z-index: 12345;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center
}

.pre-loader .loader-logo {
	padding-bottom: 15px
}

.pre-loader .loader-progress {
	height: 30px;
	border-radius: 15px;
	max-width: 700px;
	margin: 0 auto;
	display: block;
	background: #ecf0f4;
	overflow: hidden
}

.pre-loader .bar {
	width: 0%;
	height: 30px;
	display: block;
	background: #f1d6bc;
}

.pre-loader .percent {
	text-align: center;
	font-size: 24px;
	display: none
}

.pre-loader .loading-text {
	text-align: center;
	font-size: 18px;
	font-weight: bolder;
	padding-top: 15px;
}

.jck_dropdown {
	position: relative;
}

.jck_dropdown_content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 120px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	text-align: center;
}

.jck_dropdown_content a {
	padding: 12px 16px;
	display: block;
}

.jck_dropdown:hover .jck_dropdown_content {
	display: block;
}

.jck_dropdown_content>a:hover {
	background-color: #0AC5A8;
	color: white;
}

.jck_label-info {
	background-color: rgba(255, 0, 0, 0.7);
	position: absolute;
	top: 5px;
	right: 80px;
}

.jck_label {
	display: inline;
	font-size: 15px;
	font-weight: 700;
	line-height: 1;
	color: white;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	padding: 3px;
	border-radius: 4px;
}

.jckModal {
	display: none; /* Hidden by default */
	z-index: 10000; /* Sit on top */
	position: fixed; /* Stay in place */
	padding: 0px 20px;
	width: 200px;
	text-align: center;
	right : 0px;
}

.jckModal-content {
	position: fixed; /* Stay in place */
	background-color: rgba(255, 0, 0, 0.7);
	border: 1px solid #888;
	width: 200px;
	text-align: center;
	top : 25px;
	right : 50px;
	height : 43px;
	font-weight : bolder;
	font-size : 15px;
	line-height:20px;
}

.jckModal-content p{
	color : white;
}
#ICR_weatherBox2 p{
	margin : 8px 0 8px 0;
}


</style>

<script>
function getUnread(){
	$.ajax({
		type:"POST",
		url : "./ChatUnreadServlet",
		data : {
			userID : '<%=userID%>'
		},
		success : function(result){
			if(result >= 1){
				showUnread(result);
				$('#unread').css('display','inline');
			}else{
				showUnread('');
				$('#unread').css('display','none');
			}
		}
	});
}

function getInfiniteUnread(){
	setInterval(function(){
		getUnread();
	}, 5000);
}

function showUnread(result){
	$('#unread').html(result);
}
</script>
</head>
<body>
	<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo">
				<img
					src="${pageContext.request.contextPath }/resources/images/preloadImg.jpg"
					alt="">
			</div>
			<div class='loader-progress' id="progress_div">
				<div class='bar' id='bar1'></div>
			</div>
			<div class='percent' id='percent1'>0%</div>
			<div class="loading-text">페이지 로딩중...</div>
		</div>
	</div>
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
		style="width: 100%; border-bottom: 1px solid black;">
		<header
			style="position: relative; width: 1280px; padding: 0 10px; height: 70px; display: flex; justify-content: space-between; align-items: center; z-index: 999; border-radius: 0 0 10px 10px;">
			<div id="header_inside"
				style="position: fixed; width: 1280px; border-radius: 0 0 10px 10px;">
				<div id="header_inside_section"
					style="border-radius: 0 0 10px 10px;">
					<div id="header_inside_section_left"
						style="display: flex; justify-content: space-between; align-items: center; background-color: white; height: 70px; border-radius: 0 0 10px 10px;">
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
								<li class="jck_dropdown" style="display: inline-block;"><a
									href="intro.do" style="padding: 0 15px;">사이트 소개</a>
									<div class="jck_dropdown_content">
										<a href="intro.do">사이트 소개</a> <a href="Magazine.do">매거진</a>
									</div></li>
								<li style="display: inline-block;"><a
									href="companion_list.do" style="padding: 0 15px;">동행 구하기</a></li>
								<li class="jck_dropdown" style="display: inline-block;"><a
									href="board_list.do?type=N" style="padding: 0 15px;">통합 게시판</a>
									<div class="jck_dropdown_content">
										<a href="board_list.do?type=N">공지 사항</a> <a
											href="board_list.do?type=G">여행 정보</a> <a
											href="board_list.do?type=R">여행 리뷰</a>
									</div></li>
								<li style="display: inline-block;"><a
									href="gallery_list.do" style="padding: 0 15px;">갤러리</a></li>
								<li style="display: inline-block;"><a href="TworavelBox.do"
									style="padding: 0 15px;">Tworavel 박스</a></li>
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
								<li style="display: inline-block;" class="jck_before_login"><a
									href="./loginPre.do" style="padding: 0 15px;">My Page</a></li>
								<li style="display: inline-block;" class="jck_after_login"
									id="user_my_page"><a href="./MyPage.do"
									style="padding: 0 15px;">My Page</a><span id="unread"
									class="jck_label jck_label-info"></span></li>
								<li style="display: inline-block;" class="jck_after_login"
									id="manager_my_page"><a href="./adminpage.do?type=M"
									style="padding: 0 15px;">Admin</a><span id="unread"
									class="jck_label jck_label-info"></span></li>
								<li style="display: inline-block;" class="jck_before_login"><a
									href="./loginPre.do" style="padding: 0 15px;">Login</a></li>
								<li style="display: inline-block;" class="jck_after_login"><a
									href="./logout.do" style="padding: 0 15px;">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>
	<div class="jck_up"
		style="position: fixed; width: 100px; height: 100px; right: 50px; bottom: 50px; border-radius: 100%; cursor: pointer; outline: none; z-index: 999;">
		<button
			style="font-weight: bolder; position: relative; width: 100%; height: 100%; background-color: #0AC5A8; border-radius: 100%; cursor: pointer; outline: none;">TOP</button>
	</div>
	<div id="JckModal" class="jckModal">
		<!-- Modal content -->
		<div class="jckModal-content">
			<p>
				새로운 메시지가<br>도착했습니다.
			</p>
		</div>
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
	<script
		src="${pageContext.request.contextPath }/resources/js/process.js"></script>
	<%
		if (userID != null) {
	%>
	<script type="text/javascript">
		$(document).ready(function() {
			getUnread();
			getInfiniteUnread();
			IntervalNewMessage();
		});

		var jckModal = document.getElementById("JckModal");
		
		function IntervalNewMessage(){
			setInterval(function(){
				getNewMessage();
			}, 5000);
		}
		function getNewMessage() {
			ShowMessageModal();
		}
		function ShowMessageModal() {
			var total = <%=session.getAttribute("totalChat")%>;
			var unreadm = <%=session.getAttribute("totalUnreadChat")%>;
			
			$.ajax({
				type:"POST",
				url : "./totalChat",
				data : {
					userID : '<%=userID%>'
				},
				success : function(result){
					var temptotal = result;
					$.ajax({
						type:"POST",
						url : "./totalUnreadChat",
						data : {
							userID : '<%=userID%>'
						},
						success : function(result){
							var tempunreadm = result;
							if((tempunreadm > unreadm)&&(temptotal > total)){
									jckModal.style.display = "block";
									setTimeout(function() {
										jckModal.style.display = "none";
									}, 2000);
							}
							
							$.ajax({
								type:"POST",
								url : "./updateTotal",
								data : {
									"totalChat" : temptotal,
									"totalUnreadChat" : tempunreadm
								},
								success : function(result){
								}
							});
						}
					});
				}
			});
			
		}
		
		window.onclick = function(event) {
			if (event.target == jckModal) {
				jckModal.style.display = "none";
			}
		}
	</script>
	<%
		}
	%>
</body>
</html>

