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

.jh_td {
	text-align: center;
	margin: 0 auto;
}

#yjh_btn {
	text-align: right;
}

#yjh_table {
	margin: 0 auto;
}

.slide-button {
	position: absolute;
	top: 0;
	bottom: 0;
	width: 5%;
	text-align: center;
}

.carousel-images {
	width: 1000px;
	height: 500px;
}

.slide-button img {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	font-size: 35px;
	font-weight: bold;
	background: rgba(255, 255, 255, 0.4);
	border-radius: 50%;
	height: 25px;
	width: 25px;
	color: white;
}

.button-prev {
	left: 0;
}

.button-next {
	right: 15px;
}

.slider ul {
	list-style: none;
	width: 500px;
	position: relative;
	left: 0;
	padding: 0;
	margin: 0;
}

.slider ul li {
	float: left;
}

.slider {
	position: relative;
	width: 1000px;
	overflow: hidden;
	margin: 0 auto;
}
#ICR_PFmodal {
	width: 400px;
	height: 325px;
}

@media ( min-width : 768px) {
	.modal-sm {
		width: 375px;
	}
#kdy-companion-writer {
	width: 820px;
	display: flex;
	justify-content: flex-start;
	margin-top: 5px;
	color: gray;
	margin-bottom: 10px;
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		var $slider = $('.slider'); // class or id of carousel slider
		var $slide = 'li'; // could also use 'img' if you're not using a ul
		var $transition_time = 0; // 0 second
		var $time_between_slides = 3000; // 4 seconds

		function slides() {
			return $slider.find($slide);
		}

		slides().fadeOut();

		// set active classes
		slides().first().addClass('active');
		slides().first().fadeIn($transition_time);

		// auto scroll 
		$interval = setInterval(function() {
			var $i = $slider.find($slide + '.active').index();

			slides().eq($i).removeClass('active');
			slides().eq($i).fadeOut($transition_time);

			if (slides().length == $i + 1)
				$i = -1; // loop to start

			slides().eq($i + 1).fadeIn($transition_time);
			slides().eq($i + 1).addClass('active');
		}, $transition_time + $time_between_slides);

		var imageBox = $('.slider ul');
		var imageWidth = $('.slider ul li img').width();
		var imageQuantity = $('.slider ul li').length;
		var currentImage = 1;
		var $transition_time = 1000;

		imageBox.css('width', imageWidth * imageQuantity);

		$(document).on("click", 'a', function() {

			var whichButton = $(this).data('nav');
			if (whichButton === "next") {
				currentImage++;
				if (currentImage >= imageQuantity) {
					currentImage = 1;
					nextImage(currentImage, imageWidth);
				} else {
					nextImage(currentImage, imageWidth);
				}

			} else {
				currentImage--;
				if (currentImage <= 0) {
					currentImage = imageQuantity;
					nextImage(currentImage, imageWidth)
				} else {
					nextImage(currentImage, imageWidth)
				}
			}
		});

		function nextImage(currentImage, imageWidth) {
			var pxValue = -(currentImage - 1) * imageWidth;
			imageBox.animate({
				'left' : pxValue

			})
		}

	});
</script>

</head>
<body>
	<!-- 아래 코드는 바디 바로 아래 작성해야함 * 공유 명령어  -->
	<input id='clip_tmp' type='text'
		style='position: absolute; top: -2000px;' />

	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div style="display: flex; justify-content: center;">
			<div id="common" style="width: 1000px; padding-top: 80px;">
				<div class="jck_content_container_div2" style="width: 100%;">

					<div id="kdy-companion-writer">
						<div id="kdy-co_prous-img" style="display: inline-block ;">
							<img class="ICR_C_writer" data-toggle="modal"
								data-target=".bs-example-modal-sm"
								src="${pageContext.request.contextPath }/resources/images/co_prous.png"
								style="height: 30px; cursor: pointer;">
						</div>
						&nbsp;<span class="ICR_C_writer" data-toggle="modal"
							data-target=".bs-example-modal-sm"
							style="cursor: pointer; font-size: x-large; ">${gallery.m_id}</span>
					</div>
					<div class="slider">
						<ul>
							<li><img class="carousel-images"
								src="${pageContext.request.contextPath }/resources/gallery_uploadFiles/${galleryAdd.g_img1}"
								alt="" width="1000" height="500" /></li>
							<li><img class="carousel-images"
								src="${pageContext.request.contextPath }/resources/gallery_uploadFiles/${galleryAdd.g_img2}"
								alt="" width="1000" height="500"></li>
							<li><img class="carousel-images"
								src="${pageContext.request.contextPath }/resources/gallery_uploadFiles/${galleryAdd.g_img3}"
								alt="" width="1000" height="500" /></li>

						</ul>
						<a class="slide-button button-prev" data-nav="prev"><img
							src="https://cdn3.iconfinder.com/data/icons/faticons/32/arrow-left-01-256.png" />
						</a> <a class="slide-button button-next" data-nav="next"><img
							src="https://cdn3.iconfinder.com/data/icons/faticons/32/arrow-right-01-512.png" /></a>

					</div>

					<div style="width: 100%; height: 80px;">
						<div style="display: flex; width: 1000px;">
							<div style="width: 500px; display: flex;">
								<div id="YJH_Glike_Y">
									<img style="width: 30px; height: 30px;"
										src="${pageContext.request.contextPath }/resources/images/p_like2.png"
										onclick="window.location='gallery_like.do?g_id=${gallery.g_id}'">
									${gallery.g_like }
								</div>
								<div id="YJH_Glike_N">
									<img style="width: 30px; height: 30px;"
										src="${pageContext.request.contextPath }/resources/images/p_like.png"
										onclick="window.location='gallery_unlike.do?g_id=${gallery.g_id}'">
									${gallery.g_like }
								</div>
								<div style="margin-left: 10px;">
									<button style="border: 0; outline: 0; background: none;">
										<a href="#" onclick="copy_trackback(); return false;"> <img
											style="width: 35px; height: 35px;"
											src="${pageContext.request.contextPath }/resources/images/share.png"></a>
									</button>
								</div>
							</div>
							<div style="width: 500px;">
								<div id="yjh_btn"
									style="display: flex; justify-content: flex-end;">
									<div
										style="margin-left: 10px; border-radius: 10px; border: 3px solid #6495ed6b;">
										<button id="bbt1"
											style="border: 0; border-radius: 10px; width: 100%; height: 100%; padding: 6px; color: #0ac5a8; background-color: #ffffff; cursor: pointer;">목록</button>
										<!-- <a href="gallery_list.do" style="width:100%;height:100%;">목록으로</a> -->
									</div>


									<div
										style="margin-left: 10px; border-radius: 10px; border: 3px solid #6495ed6b;">
										<button id="bbt2"
											style="border: 0; border-radius: 10px; width: 100%; height: 100%; padding: 6px; color: #0ac5a8; background-color: #ffffff; cursor: pointer;">수정</button>

										<%-- <a class="yjh_btn_useronly"
											href="gallery_renew.do?gallery_num=${gallery.g_id }">수정</a> --%>
									</div>
									<div
										style="margin-left: 10px; border-radius: 10px; border: 3px solid #6495ed6b;">
										<button id="bbt3"
											style="border: 0; border-radius: 10px; width: 100%; height: 100%; padding: 6px; color: #0ac5a8; background-color: #ffffff; cursor: pointer;">삭제</button>

										<%-- <a class="yjh_btn_useronly"
											href="gallery_delete.do?gallery_num=${gallery.g_id }">글삭제</a> --%>
									</div>

								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
		<div
			style="margin: 0 auto; margin-bottom: 80px; width: 1000px; height: auto; overflow: scroll;">
			<span style="width: 100%; height: auto; word-break: break-all;">${gallery.g_content }</span>
		</div>
		<!-- 프로필 모달 -->
			<form>
				<div class="modal fade bs-example-modal-sm" tabindex="-1"
					role="dialog" aria-labelledby="mySmallModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-sm">
						<div id="ICR_PFmodal" class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">${gallery.m_id }님의프로필</h4>
							</div>
							<div class="modal-body">


								<div id="ICR_info" style="text-align: center;">
									<table id="ICR_info_table" style="margin: 0 auto;">
										<tr>
											<td rowspan="7"
												style="text-align: center; line-height: normal;"><img
												id="ICR_pro_m_img"
												src="${pageContext.request.contextPath}/resources/images/none_img.JPG"
												style="width: 150px; height: 150px; display: inline;">
											</td>
										</tr>
										<tr>
											<td>&nbsp;<font color="#0AC5A8"
												style="font-weight: bold;" id="ICR_pro_m_id"></font>
											</td>
										</tr>
										<tr>
											<td>&nbsp;<font color="#0AC5A8"
												style="font-weight: bold;" id="ICR_pro_m_name"></font>
											</td>
										</tr>
										<tr>
											<td>&nbsp;<font color="#0AC5A8"
												style="font-weight: bold;" id="ICR_pro_m_like"></font>
											</td>
										</tr>
										<tr>
											<td id="ICR_ReportCnt">&nbsp;<font color="#0AC5A8"
												style="font-weight: bold;" id="ICR_pro_m_reportcount"></font>
											</td>
										</tr>
										<tr>
											<td>&nbsp;<font color="#0AC5A8"
												style="font-weight: bold;" id="ICR_pro_m_intro"></font></td>
										</tr>
									</table>
									<br>
									<c:if test="${sessionScope.userID ne null}">
										<div style="text-align: center;">
											<div>
												<input type="text" id="ICR_reasonBox" name="r_reason"
													style="display: none; margin: 0 auto;"
													placeholder="신고 사유를 입력해주세요."> <br>
												<button id="ICR_likeBtn" type="button"
													class="btn btn-primary">추천하기</button>
												<button id="ICR_ReportBtn1" type="button"
													class="btn btn-primary">신고하기</button>
												<button id="ICR_ReportBtn2" type="button"
													class="btn btn-primary" style="display: none;">신고하기</button>
											</div>
										</div>
									</c:if>
									<c:if test="${sessionScope.userID eq null}">
										<div style="text-align: center;">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">취소</button>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		<jsp:include page="footer.jsp" />
	</div>




	<script>
		$('#bbt1').click(function(){
			location.href="gallery_list.do";
		});
		$('#bbt2').click(function(){
			location.href="gallery_renew.do?gallery_num=${gallery.g_id }";
		});
		$('#bbt3').click(function(){
			location.href="gallery_delete.do?gallery_num=${gallery.g_id }";
		});
		//추천
$(document).on("click", "#ICR_likeBtn", function(event){
	$.ajax({
		url : "MemberLikeCh.do?writer=${gallery.m_id}",
		dataType : "json",
		async: false,
		type : "get",
		success : function(data){
	         if(data.result == 1){
	        	 if(confirm("이미 추천한 회원입니다. 추천을 취소할까요?")==true){
	        		 ICRLikeDelete();
	        	 }else{
	        		 return;
	        	 }
	         }else {
				if(confirm("${gallery.m_id}님을 추천하시겠습니까?")==true){
					ICRLikeInsert();
				}else{
					return;
				}
	         }
		},
		error : function(data){
			alert("회원 추천에 실패했습니다. 관리자에게 문의하세요!");
		}
	});
});
function ICRLikeInsert(){
	$.ajax({
		url : "MemberLikeInsert.do?writer=${gallery.m_id}",
		dataType : "json",
		async: false,
		type : "get",
		success : function(data){
			 if(data.result == 1){
				 alert("추천되었습니다.");
				 return;
			 }else{
				alert("회원 추천에 실패했습니다. 관리자에게 문의하세요!");
				return;
			 }
		},
		error : function(data){
			alert("회원 추천에 실패했습니다. 관리자에게 문의하세요!");
		}
	});
}
function ICRLikeDelete(){
	$.ajax({
		url : "MemberLikeUpdate.do?writer=${gallery.m_id}",
		dataType : "json",
		async: false,
		type : "get",
		success : function(data){
			 if(data.result == 1){
				 alert("추천이 취소되었습니다.");
				 return;
			 }else{
				alert("추천 취소에 실패했습니다. 관리자에게 문의하세요!");
				return;
			 }
		},
		error : function(data){
			alert("추천 취소에 실패했습니다. 관리자에게 문의하세요!");
		}
	});
}
$('.ICR_C_writer').on('click',function(){
	$.ajax({
		url : "selectMemberProfile.do",
		dataType : "json",
		data : {
			m_id : "${gallery.m_id}"
		},
		success : function(member){
			console.log(member);
			$('#ICR_pro_m_id').html("회원 아이디 : " + member.m_id);
			$('#ICR_pro_m_name').html("회원 이름 : " + member.m_name);
			$('#ICR_pro_m_like').html("추천수 : " + member.m_like);
			$('#ICR_pro_m_reportcount').html("신고당한 수 : " + member.m_reportcount);
			$('#ICR_pro_m_intro').html("소개글 : " + member.m_intro);
			$('#ICR_pro_m_img').attr("src", "${pageContext.request.contextPath}/resources/uploadFiles/" + member.m_image);
		},
		error : function(){
		}
		
	});
	
	$('#ICR_reasonBox').val("");
	$('#ICR_reasonBox').css('display','none');
	$('#ICR_ReportBtn1').css('display','inline-block');
	$('#ICR_ReportBtn2').css('display','none');
})
//신고
$(document).on("click", "#ICR_ReportBtn1", function(event){
	$.ajax({
		url : "MemberReportCh.do?writer=${gallery.m_id}",
		dataType : "json",
		async: false,
		type : "get",
		success : function(data){
	         if(data.result == 1){
				alert("이미 신고한 회원입니다.");
	         }else {
				$('#ICR_reasonBox').css('display','block');
				$('#ICR_ReportBtn1').css('display','none');
				$('#ICR_ReportBtn2').css('display','inline-block');
				$('#ICR_reasonBox').focus();
	         }
		},
		error : function(data){
			alert("회원 신고에 실패했습니다. 관리자에게 문의하세요!");
		}
	});
});


$(document).on("click", "#ICR_ReportBtn2", function(event){
	var r_reason = $('#ICR_reasonBox').val();
	if(r_reason!=null && r_reason!=""){
		$.ajax({
			url : "MemberReport2.do?writer=${gallery.m_id}&r_reason="+r_reason,
			dataType : "json",
			async: false,
			type : "get",
			success : function(data){
				if(data.result==1){
					alert("접수되었습니다. 신고해주셔서 감사합니다.");
					$('#ICR_reasonBox').val("");
					$('#ICR_reasonBox').css('display','none');
					$('#ICR_ReportBtn1').css('display','inline-block');
					$('#ICR_ReportBtn2').css('display','none');
				}else{
					alert("회원 신고에 실패했습니다. 관리자에게 문의하세요!");
					$('#ICR_reasonBox').val("");
					$('#ICR_reasonBox').css('display','none');
					$('#ICR_ReportBtn1').css('display','inline-block');
					$('#ICR_ReportBtn2').css('display','none');
				}
			},
			error : function(data){
				alert("회원 신고에 실패했습니다. 관리자에게 문의하세요!");
			}
		});
	}else{
		alert("신고 사유를 입력해주세요.");
		$('#ICR_reasonBox').focus();
		return;
	}
	
});
		
		
	/*<!-- 글쓰기 버튼 유무  -->/  */
			if ("${sessionScope.userID}" != "") {
				if ("${sessionScope.userID}" == "${gallery.m_id }") {
					$('#yjh_writeBtn').css('display', 'block');
					$('.yjh_btn_useronly').css('display', 'block');
				} else {
					$('#yjh_writeBtn').css('display', 'none');
					$('.yjh_btn_useronly').css('display', 'none');
				}

				if ("${glikeCount}" != "0") {
					$('#YJH_Glike_Y').css('display', 'none');
					$('#YJH_Glike_N').css('display', 'block');
				} else {
					$('#YJH_Glike_Y').css('display', 'block');
					$('#YJH_Glike_N').css('display', 'none');
				}
			} else {
				$('#yjh_writeBtn').css('display', 'none');
				$('.yjh_btn_useronly').css('display', 'none');
				$('#YJH_Glike_Y').css('display', 'none');
				$('#YJH_Glike_N').css('display', 'none');

			}
		</script>

	<script>
			//상품 페이지 공유 버튼 
			function copy_trackback() {
				var address = window.document.location.href;
				$('#clip_tmp').val(address);
				$('#clip_tmp').select();
				var successful = document.execCommand('copy');
				if (successful) {
					alert('url 주소가 복사되었습니다.');
				} else {
					alert('url 주소가 복사되지 않았습니다.');
				}
			}
		</script>
</body>
</html>