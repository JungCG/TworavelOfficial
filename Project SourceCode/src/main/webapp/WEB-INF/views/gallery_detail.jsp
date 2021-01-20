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
  .carousel-images{
     width: 1000px;
     height: 500px;
  }
  
  .slide-button img {
     position: absolute;
     top: 50%;
     transform: translateY(-50%);
     font-size: 35px;
     font-weight: bold;
     background: rgba(255,255,255,0.4);
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
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
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

	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div id="common" style="width: 1000px; padding: 80px 0px;">
			<div class="jck_content_container_div2">




				<div id="kdy-companion-writer">
					<div id="kdy-co_prous-img" style="display:inline-block;">
						<img class="ICR_C_writer" data-toggle="modal"
							data-target=".bs-example-modal-sm"
							src="${pageContext.request.contextPath }/resources/images/co_prous.png"
							style="height: 30px; cursor: pointer;">
					</div>
					&nbsp;<span class="ICR_C_writer" data-toggle="modal"
						data-target=".bs-example-modal-sm" style="cursor: pointer;">${gallery.m_id}</span>
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
				<form action="gInsert.do" method="post"
					enctype="multipart/form-data">

					<table id="yjh_table">
						<%-- <tr>
							<td class="jh_td">작성자</td>
							<td class="jh_td">${gallery.m_id }</td>
						</tr> --%>

						<tr>
							<td></td>
							<td style="text-align: right;">
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

							</td>

						</tr>





						<tr>
							<td class="jh_td">내용</td>
							<td class="jh_td">${gallery.g_content }</td>
						</tr>

					</table>
					<div id="yjh_btn">
						<a class="yjh_btn_useronly"
							href="gallery_renew.do?gallery_num=${gallery.g_id }">수정페이지로이동</a>
						&nbsp;&nbsp; <a class="yjh_btn_useronly"
							href="gallery_delete.do?gallery_num=${gallery.g_id }">글삭제</a>
						&nbsp;&nbsp; <a href="gallery_list.do">목록으로</a>

					</div>
					<br>

				</form>





			</div>




		</div>
		<jsp:include page="footer.jsp" />
	</div>





	<script>
	<!-- 글쓰기 버튼 유무  -->
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
</body>
</html>