<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글작성</title>
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
	display: flex;
	justify-content: center;
	margin-top: 70px;	
	margin-bottom: 100px;
	
}

section {
	width: 1000px;
	display: flex;
	justify-content: center;
	border: 1px solid #0000004a;
padding-top: 40px;
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
    
    color: #black;
    border:3px solid rgb(78 102 255 / 39%);
    font-size:16px;
    background-color: white;
    border-radius: 5px;
    padding: 5px;
    color: #0AC5A8;
    }
    #gjw-serach-list{
        color: #black;
  border:3px solid rgb(78 102 255 / 39%);
  border-radius: 5px;
    padding: 5px;
        color: #0AC5A8;
    }
    td{
padding-top: 20px;
    padding-bottom: 5px;    }
    .gjw-table-tr{
        border-bottom: 1px solid #0000002e;
    
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
<div style="
    width: 90%;
">
<div style="font-size:30px;margin-bottom: 30px;    font-weight: bold;
">
게시판 글쓰기
</div>
	<form name ="frm" enctype="multipart/form-data">
		<table align="center" style="width: 900px;">
			<tr class="gjw-table-tr">
				 <td style="color:#black;;
				 ">제목</td>
				 <td style="width:85%;">
				<input type="text" name="b_title" id="gjw-title-input" placeholder="글 제목을 입력해주세요" required="required"></td>
			<tr class="gjw-table-tr">
				<td style="color:#black;">작성자</td>
				<td><input type="text" name="m_id" value="${userID }" readonly="readonly"></td>
			</tr>
			
			<tr class="gjw-table-tr">
			<td style="color:#black;
			">게시판 선택</td>
			<td style="width:90%;"><select name="b_type" id="gjw-type-select">
                              <c:if test="${userID eq'potatotravel' }">
									<option value="N">공지사항</option>
									</c:if>
                              <option value="G">여행정보</option>
                              <option value="R">리뷰</option>
                        </select></td>
			</tr>
			
			 <tr class="gjw-table-tr">
                        <td style="color:#black;;
                        ">비밀글</td>
                        <td>&nbsp;&nbsp;<label for="yes" style="color:rgb(78 102 255 / 90%);">Yes&nbsp;&nbsp;</label><input type="radio"
                           name="b_secret" id="yes" value="Y" />&nbsp;&nbsp;<label for="No" style="color:rgb(78 102 255 / 90%);">No</label>
                           <input type="radio" name="b_secret" id="No"
                           checked="checked" value="N" /></td>
                     </tr>
			<tr id="gjw-secret-tr" class="gjw-table-tr">
				<td style="color:#black;
				">비밀번호</td>
				<td><input type="password" name="b_secretnumber" id="gjw-password-input"></td>
			</tr>
			<tr class="gjw-table-tr">
				<td colspan="2" style="padding-top: 30px;"><textarea id="b_content" name="b_content"></textarea></td>
			</tr>
			<tr style="height:50px">
				<td colspan="2" align="end"style="padding-top: 40px;padding-bottom: 40px"><input type="button" id ="submitModifyBoardBtn"
					value="등록하기"> 
		 <a href="board_list.do" id="gjw-serach-list">목록으로</a></td>
			</tr>	
		</table>
	</form>
	</div>
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
  if("${b_type}"=="N"){
    	
    	$("#gjw-type-select").val("N").prop("selected",true);
    }
    if("${b_type}"=="G"){
    	
    	$("#gjw-type-select").val("G").prop("selected",true);
    }
    if("${b_type}"=="R"){
    	$("#gjw-type-select").val("R").prop("selected",true);
    }
})

 </script>
</body>
</html>
