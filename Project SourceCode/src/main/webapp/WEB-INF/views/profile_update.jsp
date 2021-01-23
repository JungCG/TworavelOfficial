<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icr_profileupdate.css?ver=22">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
* {
	padding: 0;
	margin: 0;
	border-collapse:collapse;
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
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
$(document).ready(function() {
	$('#m_intro').on('keyup', function() {
		if ($(this).val().length > 100) {
			$(this).val($(this).val().substring(0, 100));
		}
	});
	$("#m_pw2").on("input", function() {

		if ($("#m_pw").val() != $("#m_pw2").val()) {
			$("#pwchkmsg").css("display", "none");
			$("#pwchkmsg1").css("display", "inline-block");
			$("#pwchkmsg2").css("display", "none");
		} else {
			$("#pwchkmsg").css("display", "none");
			$("#pwchkmsg1").css("display", "none");
			$("#pwchkmsg2").css("display", "inline-block");
		}

	});
});
</script>



</head>

<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp"/>
	
	
		<div id="JWJprofileform">
				<form action="ProfileUpdate.do" method="post" name="form1" enctype="multipart/form-data" onsubmit="return check()">
					<fieldset style="border: 0; border-bottom: 1px solid gray;">
						<h3>회&nbsp;원&nbsp;정&nbsp;보</h3>
						<table id="JWJprofiletable">
							<tbody>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">이 름</td>
									<td><input type="text" id="m_name" name="m_name" readonly required value="${member.m_name}" style="border:none;"></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">회원 ID</td>
									<td><input type="text" id="m_id" name="m_id" readonly value="${member.m_id}" style="border:none;"></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">비밀번호</td>
									<td><input type="password" name="m_pw" id="m_pw" value="${member.m_pw}" required>&nbsp; <b
										style="color: gray; font-size: 8pt;">첫글자 대문자 / 대소문자,_ 사용 /
											6~12글자</b></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">비밀번호 확인</td>
									<td><input type="password" name="m_pw2" id="m_pw2" required>&nbsp;
									<b id="pwchkmsg" style="display: inline-block;">* 비밀번호를 입력해주세요.</b>
									<b id="pwchkmsg1" style="display: none;">* 비밀번호를 확인해주세요.</b>
									<b id="pwchkmsg2" style="display: none;">* 확인 되었습니다.</b></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">휴대전화</td>
									<td><input type="text" id="m_phone" name="m_phone"
										value="${member.m_phone}" required></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">이메일</td>
									<td><input type="email" id="m_email" name="m_email" readonly value="${member.m_email}" required>&nbsp;
										<input type="button" class="btn btn-default" value="중복체크" onclick="emailDupCheck()" readonly style="display:none;"></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">생년월일</td>
									<td><input type="date" id="m_birth" name="m_birth"
										style="width: 56%;" value="${member.m_birth}" required></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
										<td width="5%" align="center">*</td>
										<td width="20%">주소</td>
										<td><input type="text" id="sample4_postcode"
											onclick="sample4_execDaumPostcode()" placeholder="우편번호"
											readonly required value="${param.sample4_postcode }"
											class="jck_join_input"> <input type="button" id="adressBtn" class="btn btn-default"
											onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" id="sample4_roadAddress"
											name="m_address" placeholder="도로명주소" readonly
											required value="${member.m_address}"
											class="jck_join_input"> <input type="text"
											id="sample4_jibunAddress" placeholder="지번주소" readonly
											value="${param.sample4_jibunAddress }" class="jck_join_input">
											<span id="guide" style="color: #999; display: none"></span> <br>
											<input type="hidden" id="sample4_extraAddress"
											placeholder="참고항목"> <input type="text"
											id="sample4_detailAddress" name="m_address_detail"
											placeholder="상세주소를 입력해주세요."
											value="${member.m_address_detail}"
											class="jck_join_input" required></td>
									</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">성별</td>
									<td>
									<input type="radio" name="m_gender" id="man" value="M">남성&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="m_gender" id="woman" value="F">여성&nbsp;&nbsp;&nbsp;&nbsp;
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">프로필 이미지</td>
									<td><input type="text" id="m_image" name="m_image" value="${member.m_image}" readonly>&nbsp;&nbsp;
									
									<label id="imgUpBtn" for="userimg" class="btn btn-default" >첨부하기</label>
									<input type="file" name="upfile" id="userimg" style="display: none;">
									<label id = "imgDeleteBtn" class="btn btn-default" >&times;</label><br>
									
									<img id="showimg" src="/uploadFiles/${member.m_image}" style="width: 200px; height: 200px;"></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
	
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">닉네임</td>
									<td><input type="text" id="m_nick" name="m_nick" readonly value="${member.m_nick}" required style="border:none;"></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">프로필 소개글</td>
									<td><textarea rows="2" cols="40" style="resize: none;" id="m_intro" name="m_intro">${member.m_intro}</textarea></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
					<div id="formbtn">
						<br>
						<input type="submit" id="btnSubmit" class="btn btn-default" value="수정완료"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" id="btnback" class="btn btn-default"  onclick="location.href='MyPage.do'">취소</button>
					</div>
				</form>
			</div>
		
		
		<jsp:include page="footer.jsp"/>
	</div>
	
	
	
	<script>
	$(function(){
		if("${member.m_gender}"=='M'){
			$('#man').prop("checked", true);
		}else if("${member.m_gender}"=='F'){
			$('#woman').prop("checked", true);
		}
	})
	
	function emailDupCheck(){
		$.ajax({
			url:"${pageContext.request.contextPath}/EmailCheck.do",
			type:"post",
			data:{
				"m_email" : "${member.m_email}"
			},
			async:false,
			dataType:"json",
			success:function(data){
				if(data.bool==true){
					alert("사용 가능한 이메일 입니다.");
				}else if(data.bool==false){
					alert("사용 불가능한 이메일 입니다. 다른 이메일을 입력하세요.");
				}
			},
			error:function(){
				alert("이메일 중복확인 에러 발생")
			}
		})
	}
	</script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>
<script>
$(function() {
	if("${member.m_image}"==""){
		$("#showimg").attr("src", "${pageContext.request.contextPath}/resources/images/none_img.JPG");
	}
	
	$("#userimg").on("change", function() {
		if (window.FileReader) {
			var filename = $(this)[0].files[0].name;
		}
		$("#imgspan").html(filename);
		
		var temp = URL.createObjectURL(event.target.files[0]);
		
		$("#showimg").attr("src", temp);
		$('#m_image').val(filename);
	});
	
	$("#imgDeleteBtn").on("click", function(){
		$("#userimg").val("");
		$("#imgspan").html("");
		$("#showimg").attr("src", "${pageContext.request.contextPath}/resources/images/none_img.JPG");
		$('#m_image').val("");
	});
});



function passwordSameCheck() {
	var pwd1 = $("#m_pw").val().trim();

	var pwd2 = $("#m_pw2").val().trim();
	if (pwd1 != pwd2) {
		$("#passwordSpan").text("비밀번호가 다릅니다.");
		$("#passwordSpan").css('display', 'inline-block');
		$("#passwordSpan").css('color', 'red');
	} else {
		$("#passwordSpan").text("비밀번호가 동일합니다.");
		$("#passwordSpan").css('display', 'inline-block');
		$("#passwordSpan").css('color', 'green');
	}
}
</script>
<script>
function check() {

	var pwd1 = $("#m_pw").val().trim();
	var reg1 = /^[A-Z][A-Za-z0-9_]{5,11}$/;
	var reg2 = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,12}$/;
	/* ?= 있는지 .*길이에 상관없이 임의의 문자열 숫자 */

	if (pwd1 != "") {
		if (!reg1.test(pwd1)) {
			alert("조건에 맞게 입력해주세요. [비밀번호 첫글자는 대문자, 6글자이상, 12글자 이하, 숫자, 영문자까지 입력이 가능.]");
			$("#userpwd").val("");
			return false;
		} else if (!reg2.test(pwd1)) {
			alert("조건에 맞게 입력해주세요. [비밀번호는 대문자, 소문자, 숫자가 반드시 1개이상 입력되어야 한다.]");
			$("#userpwd").val("");
			return false;
		}
	}

	var pwd2 = $("#m_pw2").val().trim();
	if (pwd1 != pwd2) {
		alert('비밀번호가 일치하지 않습니다.');
		$("#m_pw2").val("");
		$("#m_pw2").focus();
		return false;
	}

	var a = $("#m_phone").val().trim();
	var regVal = /[0][0-9]{1,2}-[0-9]{3,4}-[0-9]{4,4}/;
	if (!regVal.test(a)) {
		alert("전화번호 형식에 맞춰 작성해 주세요.(010-0000-0000)");
		$("#m_phone").val('').focus();

		return false;
	}

	var rcheck = $("input[name='m_gender']").length;

	if (rcheck == 0) {

		alert("성별을 선택하세요");

		return false;

	}
	return true;
}
</script>
</body>
</html>