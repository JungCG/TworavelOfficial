<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TwoRAVEL 박스</title>
<style>
* {
	outline: none;
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse: collapse;
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

.jck_middle_contents {
	display: flex;
	flex-wrap: nowrap;
	justify-content: space-between;
	padding: 3px;
	margin-top: 30px;
}

.content_img {
	width: 300px;
	height: 300px;
}

.contents_p {
	border-radius: 20px;
	line-height: 40px;
	height: 40px;
	background-color: #93bdbf;
	font-weight: bolder;
	color: white;
	text-align: center;
}

.jck_transform {
	-webkit-transform: rotate(16deg);
	-ms-transform: rotate(16deg);
	transform: rotate(16deg);
}
.jck_opacity_l{
	opacity : 0.6;
}
.jck_opacity{
	opacity : 0.9;
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<input id='clip_tmp' type='text'
		style='position: absolute; top: -2000px;' />
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div id="common" style="width: 1000px; padding: 80px 0px;">
			<div>
				<div id="jck_top_contents"
					style="display: flex; flex-wrap: nowrap; justify-content: space-between; border-bottom: 3px solid gray; padding: 3px; padding-bottom: 15px;">
					<div style="width: 480px; height: auto; position: relative;">

						<div class="jck_transform"
							style="z-index: 5; position: absolute; top: 259px; left: 170px; text-align: center;">
							<span class="jck_opacity_l"
								style="font-weight: bold; font-family: 'Montserrat', sans-serif;">T&nbsp;W&nbsp;O&nbsp;&nbsp;</span>
							<span class="jck_opacity_l"
								style="color: #0AC5A8; font-weight: bold; font-family: 'Montserrat', sans-serif;">R&nbsp;A&nbsp;V&nbsp;E&nbsp;L</span><br>
							<br>
							<br>
							<br>
							<br> <span class="jck_opacity_l"
								style="color: #0AC5A8; font-weight: bold; font-family: 'Montserrat', sans-serif;">T&nbsp;R&nbsp;A&nbsp;V&nbsp;E&nbsp;L</span><br>
							<br> <span class="jck_opacity_l"
								style="font-weight: bold; font-family: 'Montserrat', sans-serif;">T&nbsp;O&nbsp;G&nbsp;E&nbsp;T&nbsp;H&nbsp;E&nbsp;R</span>
						</div>

						<div class="jck_transform"
							style="z-index: 5; position: absolute; top: 259px; left: 170px; text-align: center;">
							<span class="jck_opacity_l"
								style="font-weight: bold; font-family: 'Montserrat', sans-serif;">T&nbsp;W&nbsp;O&nbsp;&nbsp;</span>
							<span class="jck_opacity_l"
								style="color: #0AC5A8; font-weight: bold; font-family: 'Montserrat', sans-serif;">R&nbsp;A&nbsp;V&nbsp;</span><span class="jck_opacity"
								style="color: #0AC5A8; font-weight: bold; font-family: 'Montserrat', sans-serif;">E&nbsp;L</span><br>
							<br>
							<br>
							<br>
							<br> <span class="jck_opacity_l"
								style="color: #0AC5A8; font-weight: bold; font-family: 'Montserrat', sans-serif;">T&nbsp;R&nbsp;A&nbsp;V&nbsp;E&nbsp;</span><span class="jck_opacity"
								style="color: #0AC5A8; font-weight: bold; font-family: 'Montserrat', sans-serif;">L</span><br>
							<br> <span class="jck_opacity_l"
								style="font-weight: bold; font-family: 'Montserrat', sans-serif;">T&nbsp;O&nbsp;G&nbsp;E&nbsp;T&nbsp;H&nbsp;</span><span class="jck_opacity"
								style="font-weight: bold; font-family: 'Montserrat', sans-serif;">E&nbsp;R</span>
						</div>

						<img
							src="${pageContext.request.contextPath }/resources/images/tworavelbox2.jpg"
							style="width: 100%;">
					</div>
					<div style="width: 480px; height: auto; padding-left: 10px;">
						<div style="border-bottom: 1px solid gray;">
							<span style="font-size: 45px; font-weight: bolder;">TwoRAVEL
								박스</span>
							<button
								style="float: right; border: 0; outline: 0; background: none;">
								<a href="#" onclick="copy_trackback(); return false;"> <img
									style="width: 48xp; height: 48px;"
									src="${pageContext.request.contextPath }/resources/images/shareIcon.png"></a>
							</button>
							<br>
						</div>
						<div>
							<br>
							<p style="line-height: 30px; padding-bottom: 10px;">
								TwoRAVEL에서 판매하는 프로젝트 상품으로 국내 여행자들이 직접 뽑은 아이템들로 구성했습니다.<br>
								TwoRAVELER들의 여행을 조금 더 편리하고 쾌적하게 다녀올 수 있도록 경험을 잇습니다 :)<br>
								"알차고 유용한 준비물 뽀시래기들 6종 모음 툴"<br>
							</p>
							<p style="color: gray;">
								&#8227;&nbsp;TwoRAVEL BOX S<br> &nbsp;&nbsp;1) 국내산 KF94 4중
								필터 마스크 대형 2매<br> &nbsp;&nbsp;2) 응급/구급 상자 상비약<br>
								&nbsp;&nbsp;3) 휴족시간 쿨링시트 6매입x 3개<br> &nbsp;&nbsp;4) 6종
								여행용세면도구<br> &#8227;&nbsp;TwoRAVEL BOX L<br>
								&nbsp;&nbsp;1) TwoRAVEL BOX S<br> &nbsp;&nbsp;2) 코닥
								FunSaver<br> &nbsp;&nbsp;3) 마인그라피 카메라 스마트폰 삼각대 7500B
							</p>
							<br>
						</div>
						<div>
							<table style="width: 100%;">
								<tr>
									<td>상품 선택 *</td>
								</tr>
								<tr>
									<td><select name="options" id="options"
										style="width: 100%; height: 35px; border: 1px solid gray;">
											<option value="0">필수 선택 사항입니다.</option>
											<option value="15000">&nbsp;&nbsp;&nbsp;(TwoRAVEL
												BOX S + 배송료 3000)&nbsp;&nbsp;15,000원</option>
											<option value="38000">&nbsp;&nbsp;&nbsp;(TwoRAVEL
												BOX L + 배송료 3000)&nbsp;&nbsp;38,000원</option>
									</select></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>
										<button class="btn btn-lg btn-block  btn-custom"
											id="charge_kakao"
											style="width: 100%; height: 50px; text-align: center; background-color: #34666f; color: white; cursor: pointer; font-weight: bolder;">구매하기</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>

				<div class="jck_middle_contents">
					<div>
						<div>
							<img
								src="${pageContext.request.contextPath }/resources/images/boxcontent1.jpg"
								class="content_img">
						</div>
						<div>
							<p class="contents_p">국내산 KF94 4중 필터 마스크 대형 2매</p>
						</div>
					</div>
					<div>
						<div>
							<img
								src="${pageContext.request.contextPath }/resources/images/boxcontent7.jpg"
								class="content_img">
						</div>
						<div>
							<p class="contents_p">코닥 FunSaver</p>
						</div>
					</div>
					<div>
						<div>
							<img
								src="${pageContext.request.contextPath }/resources/images/boxcontent3.jpg"
								class="content_img">
						</div>
						<div>
							<p class="contents_p">마인그라피 카메라 스마트폰 삼각대 7500B</p>
						</div>
					</div>
				</div>

				<div class="jck_middle_contents">
					<div>
						<div>
							<img
								src="${pageContext.request.contextPath }/resources/images/boxcontent4.jpg"
								class="content_img">
						</div>
						<div>
							<p class="contents_p">응급/구급 상자 상비약</p>
						</div>
					</div>
					<div>
						<div>
							<img
								src="${pageContext.request.contextPath }/resources/images/boxcontent5.jpg"
								class="content_img">
						</div>
						<div>
							<p class="contents_p">휴족시간 쿨링시트 6매입x 3개</p>
						</div>
					</div>
					<div>
						<div>
							<img
								src="${pageContext.request.contextPath }/resources/images/boxcontent6.jpg"
								class="content_img">
						</div>
						<div>
							<p class="contents_p">6종 여행용세면도구</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>

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

	<script>
		$('#charge_kakao').click(function() {
			var bill = $("#options option:selected").val();
			if (bill == '0') {
				alert("옵션을 선택해주세요!");
				return;
			}
	<%if (session.getAttribute("userID") == null) {%>
		alert("로그인이 필요한 서비스입니다.");
			return;
	<%}%>
		// getter
			var IMP = window.IMP;
			IMP.init('imp65132807');
			var money = bill;

			IMP.request_pay({
				pg : 'inicis',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : 'TwoRavel Box',
				amount : money,
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자이름',
				buyer_tel : '010-1234-5678',
				buyer_addr : '인천광역시 부평구',
				buyer_postcode : '123-456'
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '\n고유ID : ' + rsp.imp_uid;
					msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					msg += '\n결제 금액 : ' + rsp.paid_amount;
					msg += '\n카드 승인번호 : ' + rsp.apply_num;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '\n에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				document.location.href = "TworavelBox.do"; //alert창 확인 후 이동할 url 설정
			});
		});
	</script>
</body>
</html>
