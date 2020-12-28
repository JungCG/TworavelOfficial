<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
* {
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse: collapsed;
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

#JWJmainsection {
	text-align: center;
}

#JWJmainsection table {
	text-align: left;
	margin: 0 auto;
	border-collapse: collapse;
}

#JWJmainsection table input {
	border: 2px solid black;
	padding: 2px 5px;
}

#JWJmainsection table textarea {
	border: 2px solid black;
}

#JWJmainsection table input[type='button'] {
	background-color: #2C3C5B;
	color: white;
	padding: 1px 13px;
}

#JWJmainsection table input[type='button']:hover {
	background-color: rgba(44, 60, 91, 0.7);
}

#JWJmainsection table input[type='button']:active {
	background-color: rgba(44, 60, 91, 0.7);
}

tr td:first-child, td:nth-of-type(2) {
	text-align: center;
	font-weight: bolder;
}

#JWJmainsection input {
	margin-bottom: 5px;
}

table * {
	font-size: 18px;
}

.filebox label {
	text-align: center;
	width: 100px; height : 50px; display : inline-block; color : #fff;
	font-size : inherit; line-height : 50px; vertical-align : middle;
	background-color : #2C3C5B; cursor : pointer; border : 1px solid
	#000000; -webkit-transition : background-color 0.2s; transition :
	background-color 0.2s; z-index : 1; position : relative; width : 100px;
	height : 50px;
	display: inline-block;
	height: 50px;
	display: inline-block;
	color: #fff;
	font-size: inherit;
	line-height: 50px;
	vertical-align: middle;
	background-color: #2C3C5B;
	cursor: pointer;
	border: 1px solid #000000;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
	z-index: 1;
	position: relative;
	width: 100px;
	height: 50px;
}

.filebox label:hover {
	background-color: rgba(44, 60, 91, 0.7);
}

.filebox label:active {
	background-color: rgba(44, 60, 91, 0.7);
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

#showimg {
	height: 200px;
}

.jck_join_input {
	width: 250px;
}

.jck_join_button {
	background-color: #2C3C5B;
	color: white;
	padding: 9px 13px;
}

.jck_join_button:hover {
	background-color: rgba(44, 60, 91, 0.7);
}

.jck_join_button:active {
	background-color: rgba(44, 60, 91, 0.7);
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="jck_wrap">
		<jsp:include page="header.jsp" />
		<div id="common" style="width: 1000px; padding: 80px 0px;">
			<div class="jck_content_container">

				<div class="jck_content_container_div2">
					<div id="JWJmainsection">
						<form action="mInsert.do" method="post" name="form1" id="form1"
							enctype="multipart/form-data">
							<h1 id="top_title">
								<b>회원가입</b>
							</h1>
							<br>
							<table style="border-collapse: collapse; font-size: 9pt;">
								<tbody>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="5%" align="center">*</td>
										<td width="27%">이 름</td>
										<td><input type="text" id="m_name" name="m_name"
											required value="${param.m_name }" class="jck_join_input"></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="5%" align="center">*</td>
										<td>회원 ID</td>
										<td><input type="text" id="m_id" name="m_id"
											onKeyup="idDupCheck();" required value="${param.m_id }"
											class="jck_join_input">&nbsp;<span id="idOkSpan"
											name="idOkSpan"></span><input type="hidden" id="idOk"
											name="idOk" value="n" value="${param.idOk }"></td>
									</tr>
									<tr class="register" height="30">
										<td width="5%" align="center">&nbsp;</td>
										<td width="20%">&nbsp;</td>
										<td><b style="color: gray; font-size: 8pt;">대문자, 소문자,
												숫자 조합 / 최소 7자리</b></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="5%" align="center">*</td>
										<td width="20%">비밀번호</td>
										<td><input type="password" name="m_pw" id="m_pw"
											required value="${param.m_pw }"
											onKeyup="passwordSameCheck();" class="jck_join_input">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="5%" align="center">&nbsp;</td>
										<td width="20%">&nbsp;</td>
										<td><b style="color: gray; font-size: 8pt;">첫글자 대문자 /
												대소문자, 숫자 사용 / 6~12글자</b></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="5%" align="center">*</td>
										<td width="20%">비밀번호 확인</td>
										<td><input type="password" name="m_pw2" id="m_pw2"
											onKeyup="passwordSameCheck();" value="${param.m_pw2 }"
											required class="jck_join_input">&nbsp;<span
											id="passwordSpan" name="passwordSpan" style="display: none;"></span></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="5%" align="center">*</td>
										<td width="20%">휴대전화</td>
										<td><input type="text" id="m_phone" name="m_phone"
											placeholder="000-0000-0000" required
											value="${param.m_phone }" class="jck_join_input"></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="5%" align="center">*</td>
										<td width="20%">이메일</td>
										<td><input type="email" id="m_email" name="m_email"
											onKeyup="emailDupCheck();" required value="${param.m_email }"
											class="jck_join_input">&nbsp;<span id="emailOkSpan"
											name="emailOkSpan"></span><input type="hidden" id="emailOk"
											name="emailOk" value="n" value="${param.emailOk }"></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="5%" align="center">*</td>
										<td width="20%">생년월일</td>
										<td><input type="date" id="m_birth" name="m_birth"
											style="width: 56%;" required value="${param.m_birth }"
											class="jck_join_input"></td>
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
											class="jck_join_input"> <input type="button"
											onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" id="sample4_roadAddress"
											name="sample4_roadAddress" placeholder="도로명주소" readonly
											required value="${param.sample4_roadAddress }"
											class="jck_join_input"> <input type="text"
											id="sample4_jibunAddress" placeholder="지번주소" readonly
											value="${param.sample4_jibunAddress }" class="jck_join_input">
											<span id="guide" style="color: #999; display: none"></span> <br>
											<input type="hidden" id="sample4_extraAddress"
											placeholder="참고항목"> <input type="text"
											id="sample4_detailAddress" name="sample4_detailAddress"
											placeholder="상세주소를 입력해주세요."
											value="${param.sample4_detailAddress }"
											class="jck_join_input" required></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="5%" align="center">*</td>
										<td width="20%">성별</td>
										<td><input type="radio" name="m_gender" value="M">남성&nbsp;&nbsp;&nbsp;&nbsp;<input
											type="radio" name="m_gender" value="F">여성</td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="5%" align="center">*</td>
										<td width="20%">프로필 이미지</td>
										<td>
											<div class="filebox">
												<span id="imgspan"></span> <label for="upfile">첨부하기</label>
												<input type="file" name="upfile" id="upfile"> <label
													id="imgDeleteBtn">&times;</label>
											</div>
										</td>
									</tr>
									<tr style="border: 1px solid beige;">
										<td>&nbsp;</td>
										<td colspan="2"><img id="showimg" name="showimg"></td>
									</tr>

									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>

									<tr class="register" height="30">
										<td width="5%" align="center">*</td>
										<td width="27%">닉네임</td>
										<td><input type="text" id="m_nick"
											name="m_nick" onKeyup="nickDupCheck();" required
											value="${param.m_nick }" class="jck_join_input">&nbsp;<span
											id="nicknameOkSpan" name="nicknameOkSpan"></span><input
											type="hidden" name="nicknameOk" id="nicknameOk" value="n"
											value="${param.nicknameOk }"></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="5%" align="center">*</td>
										<td width="27%">프로필 소개글</td>
										<td><input type="text" id="m_intro" name="m_intro"
											placeholder="자신을 소개해주세요." value="${param.m_intro }"
											class="jck_join_input"></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
								</tbody>
							</table>
							<table style="text-align: center;">
								<tbody>
									<tr height="40">
										<td><input type="submit" id="btnSubmit" value="회원가입"
											class="jck_join_button"> <input type="reset"
											id="btnReset" value="취소" class="jck_join_button"></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>

			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>

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
			$("#upfile").on("change", function() {
				if (window.FileReader) {
					var filename = $(this)[0].files[0].name;
				}
				$("#imgspan").html(filename);

				var temp = URL.createObjectURL(event.target.files[0]);

				$("#showimg").attr("src", temp);
			});

			$("#imgDeleteBtn").on("click", function() {
				$("#m_image").val("");
				$("#imgspan").html("");
				$("#showimg").attr("src", "");
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

		function idDupCheck() {
			var m_id = $("#m_id").val().trim();
			var ureg1 = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{7,}$/;
			if (m_id != "") {
				if (!ureg1.test(m_id)) {
					$("#idOkSpan").text("조건에 맞지 않습니다.");
					$("#idOk").val('n');
					$("#idOkSpan").css('color', 'red');
					return false;
				} else {
					$
							.ajax({
								type : "GET",
								url : "${pageContext.request.contextPath}/IdCheckCtl.do",
								data : {
									m_id : $("#m_id").val()
								},
								dataType : "json", // 전달받을 객체는 JSON 이다.
								success : function(data) {
									if (data.cnt == "0") {
										$("#idOkSpan").text("사용가능한 ID 입니다.");
										$("#idOk").val('y');
										$("#idOkSpan").css('color', 'green');
									} else {
										$("#idOkSpan").text("사용 불가능한 ID 입니다.");
										$("#idOk").val('n');
										$("#idOkSpan").css('color', 'red');
									}
								},
								error : function(request, status, error) {
									alert("code:" + request.status + "\n"
											+ "message:" + request.responseText
											+ "\n" + "error:" + error);
								}
							});
				}
			}
		}

		function nickDupCheck() {
			if ($("#m_nick").val() != null
					&& $("#m_nick").val() != "") {
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/NickCheckCtl.do",
					data : {
						m_nick : $("#m_nick").val()
					},
					dataType : "json", // 전달받을 객체는 JSON 이다.
					success : function(data) {
						if (data.cnt == "0") {
							$("#nicknameOkSpan").text("사용 가능한 닉네임입니다.");
							$("#nicknameOk").val('y');
							$("#nicknameOkSpan").css('color', 'green');
						} else {
							$("#nicknameOkSpan").text("사용 불가능한 닉네임입니다.");
							$("#nicknameOk").val('n');
							$("#nicknameOkSpan").css('color', 'red');
						}
					},
					error : function(request, status, error) {
					}
				});
			}
		}

		function emailDupCheck() {
			if ($("#m_email").val() != null && $("#m_email").val() != "") {
				$
						.ajax({
							type : "GET",
							url : "${pageContext.request.contextPath}/EmailCheckCtl.do",
							data : {
								m_email : $("#m_email").val()
							},
							dataType : "json", // 전달받을 객체는 JSON 이다.
							success : function(data) {
								if (data.cnt == "0") {
									$("#emailOkSpan").text("사용 가능한 EMAIL입니다.");
									$("#emailOk").val('y');
									$("#emailOkSpan").css('color', 'green');
								} else {
									$("#emailOkSpan").text("사용 불가능한 EMAIL입니다.");
									$("#emailOk").val('n');
									$("#emailOkSpan").css('color', 'red');
								}
							},
							error : function(request, status, error) {
							}
						});
			}
		}
		
		$(function() {
			$("#form1").submit(function() {
		var IOK = $("#idOk").val();
								if (IOK == 'n') {
									alert("ID 변경이 필요합니다.");
									$("#id").val("");
									$("#id").focus();
									return false;
								}
		var EOK = $("#emailOk").val();
								if (EOK == 'n') {
									alert("EMAIL 변경이 필요합니다.");
									$("#email").val("");
									$("#email").focus();
									return false;
								}
		var m_pw = $("#m_pw").val().trim();
								var reg1 = /^[A-Z][A-Za-z0-9_]{5,11}$/;
								var reg2 = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,12}$/;
								/* ?= 있는지 .*길이에 상관없이 임의의 문자열 숫자 */

								if (m_pw != "") {
									if (!reg1.test(m_pw)) {
										alert("조건에 맞게 입력해주세요. [비밀번호 첫글자는 대문자, 6글자이상, 12글자 이하, 숫자, 영문자까지 입력이 가능.]");
										$("#m_pw").val("");
										return false;
									} else if (!reg2.test(m_pw)) {
										alert("조건에 맞게 입력해주세요. [비밀번호는 대문자, 소문자, 숫자가 반드시 1개이상 입력되어야 한다.]");
										$("#m_pw").val("");
										return false;
									}
								}
		var m_pw2 = $("#m_pw2").val().trim();
								if (m_pw != m_pw2) {
									alert('비밀번호가 일치하지 않습니다.');
									$("#m_pw2").val("");
									$("#m_pw2").focus();
									return false;
								}
		var m_phone = $("#m_phone").val().trim();
								var regVal = /[0][0-9]{1,2}-[0-9]{3,4}-[0-9]{4,4}/;
								if (!regVal.test(m_phone)) {
									alert("전화번호 형식에 맞춰 작성해 주세요.(010-0000-0000)");
									$("#m_phone").val('').focus();

									return false;
								}
		var rcheck = $("input[name='m_gender']:checked").length;

								if (rcheck == 0) {

									alert("성별을 선택하세요");

									return false;

								}
		});
		});
	</script>
</body>
</html>