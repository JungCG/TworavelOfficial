<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	outline:none;
	padding: 0;
	margin: 0;
	border: 0;
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


GJW {
	width: 100%;
	display: flex;
	justify-content: center;
	margin-top: 70px;	
	margin-bottom: 100px;
}

section {
	width: 1000px;
	display: flex;
	justify-content: center;
	flex-direction: column;
}
#smart_editor2{
width: 100%;

}
#gjw-title-input{
height: 30px;
width: 50%;
border: 3px solid rgb(78 102 255 / 39%);
outline:none;
padding-left:5px;
}

#gjw-type-select{

border: 3px solid rgb(78 102 255 / 39%);
outline:none;
color:dodgerblue;

}
#gjw-password-input{
border: 3px solid rgb(78 102 255 / 39%);
outline:none;
}  input[type='radio']:after {
        width: 15px;
        height: 15px;
        border-radius: 15px;
        top: -2px;
        left: -1px;
        position: relative;
        background-color: #d1d3d1;
        content: '';
        display: inline-block;
        visibility: visible;
        border: 2px solid white;
    }

    input[type='radio']:checked:after {
        width: 15px;
        height: 15px;
        border-radius: 15px;
        top: -2px;
        left: -1px;
        position: relative;
        background-color: aliceblue;
        content: '';
        display: inline-block;
        visibility: visible;
        border: 3px solid powderblue;;
    }
    #gjw-secret-tr{
    
    display:none;}
    #submitModifyBoardBtn{
    
    color: #0AC5A8;
    border:3px solid rgb(78 102 255 / 39%);
    font-size:16px;
    background-color: white;
    border-radius: 5px;
    padding: 5px;
    }
    #gjw-serach-list{
        color: #0AC5A8;
  border:3px solid rgb(78 102 255 / 39%);
  border-radius: 5px;
    padding: 5px;
    }
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js">
	
</script>
</head>

<body>
<div class="jck_wrap">
		<jsp:include page="header.jsp"/>
<GJW>
<section>
	<form name ="frm" enctype="multipart/form-data">
		<table align="center" style="width: 100%;">
			<tr style="height:80px">
				 <td style="color:#0AC5A8;">제목</td>
				 <td style="width:85%;">
				<input type="text" name="b_title" id="gjw-title-input" placeholder="글 제목을 입력해주세요" required="required"></td>
			<tr style="height:30px">
				<td style="color:#0AC5A8;">작성자</td>
				<td><input type="text" name="m_id"></td>
			</tr>
			
			<tr style="height:30px">
			<td style="color:#0AC5A8;">글분류</td>
			<td style="width:90%;padding-top: 30px;padding-bottom: 30px;"><select name="b_type" id="gjw-type-select">
                              <option value="N">공지사항</option>
                              <option value="G">여행정보</option>
                              <option value="R">리뷰</option>
                        </select></td>
			</tr>
			
			 <tr style="height:30px">
                        <td style="color:#0AC5A8;">비밀글</td>
                        <td>&nbsp;&nbsp;<label for="yes" style="color:rgb(78 102 255 / 90%);">Yes&nbsp;&nbsp;</label><input type="radio"
                           name="b_secret" id="yes" value="Y" />&nbsp;&nbsp;<label for="No" style="color:rgb(78 102 255 / 90%);">No</label>
                           <input type="radio" name="b_secret" id="No"
                           checked="checked" value="N" /></td>
                     </tr>
			<tr style="height:70px" id="gjw-secret-tr">
				<td style="color:#0AC5A8;">비밀번호</td>
				<td><input type="password" name="b_secretnumber" id="gjw-password-input"></td>
			</tr>
			<tr>
				<td colspan="2" style="padding-top: 30px;"><textarea id="b_content" name="b_content"></textarea></td>
			</tr>
			<tr style="height:50px">
				<td colspan="2" align="end"><input type="button" id ="submitModifyBoardBtn"
					value="등록하기"> 
		 <a href="board_list.do" id="gjw-serach-list">목록으로</a></td>
			</tr>	
		</table>
	</form>
	</section>
	</GJW>
		<jsp:include page="footer.jsp"/>
	</div>
<script type="text/javascript"> 
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder:"b_content",  //textarea ID
    sSkinURI: "${pageContext.request.contextPath}/resources/se/SmartEditor2Skin.html",  //skin경로
    fCreator: "createSEditor2",
    /*
    글 수정용 코드입니다
    fOnAppLoad:function(){
	oEditors.getById["b_content"].exec("PASTE_HTML", ["asdsadsadsadsad"]);
}, */
	
});




$('#submitModifyBoardBtn').click(function() {
	if($("#gjw-title-input").val()==""){
		alert("글 제목을 입력해주세요")
	$("#gjw-title-input").focus();
		return false;
	}
	  if ($("#yes").is(":checked")) {
		  if($("#gjw-password-input").val()==""){
			  alert("비밀번호를 입력해주세요");
			  $("#gjw-password-input").focus();
			  return false;
		  }
	    }
oEditors.getById["b_content"].exec("UPDATE_CONTENTS_FIELD", []);
document.frm.action ="boardinsert.do";
document.frm.method ="POST";
document.frm.submit();
 });
$(function(){
    if ($("#No").is(":checked")) {
       $("#gjw-secret-tr").css("display", "none");
    }
    $("#yes").click(function() {
    	alert("비밀번호를 입력해주세요")
       $("#gjw-secret-tr").css("display", "table-row");
    })
    $("#No").click(function() {
       $("#gjw-secret-tr").css("display", "none");
    })
})

 </script>
</body>
</html>