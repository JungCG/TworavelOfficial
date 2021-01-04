<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icr_mypage.css">
<!DOCTYPE html>
<html>
<head>

<style>
* {
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
#ICR_KeywordPage{
	width: 1000px;
	margin: 0 auto;
	text-align: center;
	margin-bottom: 100px;
}
#ICR_largeCategory, #ICR_smallCategory{
	width: 160px; height: 35px;
	border: 1px solid #333;
}
#ICR_insertBtn{
	background: #2C3C5B;
}
#ICR_insertBtnDiv{
	border-top: none;
	border-right: none;
	border-bottom: none;
}
#ICR_FavorTable{
	width: 60%;
	margin: 0 auto;
	text-align: center;
}
.ICR_DeleteBtn{
	cursor: pointer;
}
#ICR_textDiv{
	margin-top:30px; 
}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="jck_wrap">
		<jsp:include page="header.jsp"/>
		
		
		<div id="ICR_KeywordPage">
			<h3 style="margin-bottom: 50px;">관심 카테고리 설정</h3>
			
				<select id="ICR_largeCategory" name="c_lid" onchange="categoryChange(this)">
					<option style="display: none;">카테고리 선택</option>
					<option value="1">지역</option>
					<option value="2">인원</option>
					<option value="3">성향</option>
				</select>
				&nbsp;&nbsp;&nbsp;
				<select name="c_sid" id="ICR_smallCategory">
					<option style="display: none;">소분류 선택</option>
				</select>
				&nbsp;&nbsp;&nbsp;
				<button id="ICR_insertBtn" class="btn btn-primary">관심목록 추가</button>
		
		<br><br><br><br>
		
		
		<c:if test="${not empty Favorlist}">
			<table id="ICR_FavorTable" class="table">
				<tr>
					<td colspan="3" style="background: #eee;">등록한 카테고리</td>
				</tr>
				<c:forEach items="${Favorlist}" var="Favor">
				<tr>
					<td>
						<c:if test="${Favor.c_lid eq 1}">지역</c:if>
						<c:if test="${Favor.c_lid eq 2}">인원</c:if>
						<c:if test="${Favor.c_lid eq 3}">성향</c:if>
					</td>
					<td>
						<c:if test="${Favor.c_lid eq 1}">
							<c:if test="${Favor.c_sid eq 1}">강원도</c:if>
							<c:if test="${Favor.c_sid eq 2}">경기도</c:if>
							<c:if test="${Favor.c_sid eq 3}">경상남도</c:if>
							<c:if test="${Favor.c_sid eq 4}">경상북도</c:if>
							<c:if test="${Favor.c_sid eq 5}">전라남도</c:if>
							<c:if test="${Favor.c_sid eq 6}">전라북도</c:if>
							<c:if test="${Favor.c_sid eq 7}">충청남도</c:if>
							<c:if test="${Favor.c_sid eq 8}">충청북도</c:if>
						</c:if>
						<c:if test="${Favor.c_lid eq 2}">
							<c:if test="${Favor.c_sid eq 1}">4명 이내</c:if>
							<c:if test="${Favor.c_sid eq 2}">5~8명</c:if>
							<c:if test="${Favor.c_sid eq 3}">9명 이상</c:if>
						</c:if>
						<c:if test="${Favor.c_lid eq 3}">
							<c:if test="${Favor.c_sid eq 1}">호캉스</c:if>
							<c:if test="${Favor.c_sid eq 2}">청춘</c:if>
							<c:if test="${Favor.c_sid eq 3}">자연</c:if>
							<c:if test="${Favor.c_sid eq 4}">유적지</c:if>
							<c:if test="${Favor.c_sid eq 5}">액티비티</c:if>
						</c:if>
					</td>
					<td>
						<label class="ICR_DeleteBtn">&times;</label>
					</td>
				</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${empty Favorlist}">
		<div id="ICR_textDiv">관심 카테고리를 등록해보세요.<br>관련 글이 올라오면 알림을 드려요~!
		</div>
		</c:if>
		</div>
		
		<jsp:include page="footer.jsp"/>
	</div>



<script>


$(".ICR_DeleteBtn").click(function(){
    
    var tdArr = new Array();    // 배열 선언
    var checkBtn = $(this);
	
    var tr = checkBtn.parent().parent();
    var td = tr.children();
    
    var LVal = td.eq(0).text().trim();
    var SVal = td.eq(1).text().trim();
    
    if(LVal=="지역"){
    	LVal = 1;
    	if(SVal=="강원도") SVal = 1;
    	else if(SVal=="경기도") SVal = 2;
    	else if(SVal=="경상남도") SVal = 3;
    	else if(SVal=="경상북도") SVal = 4;
    	else if(SVal=="전라남도") SVal = 5;
    	else if(SVal=="전라북도") SVal = 6;
    	else if(SVal=="충청남도") SVal = 7;
    	else if(SVal=="충청북도") SVal = 8;
    }else if(LVal=="인원"){
    	LVal = 2;
    	if(SVal=="4명 이내") SVal = 1;
    	else if(SVal=="5~8명") SVal = 2;
    	else if(SVal=="9명 이상") SVal = 3;
    }else if(LVal=="성향"){
    	LVal = 3;
    	if(SVal=="호캉스") SVal = 1;
    	else if(SVal=="청춘") SVal = 2;
    	else if(SVal=="자연") SVal = 3;
    	else if(SVal=="유적지") SVal = 4;
    	else if(SVal=="액티비티") SVal = 5;
    }
	window.location="FavorDelete.do?c_lid="+LVal+"&c_sid="+SVal;
});
    


</script>


<script>
	//카테고리 선택 스크립트
	function categoryChange(e){
		var village = ["강원도","경기도","경상남도","경상북도","전라남도","전라북도","충청남도","충청북도"];
		var peaple = ["4명 이내","5~8명","9명 이상"];
		var tema = ["호캉스","청춘","자연","유적지","액티비티"];
		var target = document.getElementById("ICR_smallCategory");
		
		if(e.value=="1") var d = village;
		else if(e.value=="2") var d = peaple;
		else if(e.value=="3") var d = tema;
			target.options.length = 0;
			
		//소분류 value값
		for(i=0; i<d.length; i++){
			var opt = document.createElement("option");
			opt.value = i+1;
			opt.innerHTML = d[i];
			target.appendChild(opt);
		}
	}
  </script>
  <script>
  $('#ICR_insertBtn').on('click',function(){
	  var Lval = $('select[name=c_lid]').val();
	  var Sval = $('select[name=c_sid]').val();
	  if(Lval=="카테고리 선택"){
		  alert("카테고리를 선택해주세요.");
	  }else{
		  if(Sval=="소분류 선택"){
			  alert("소분류를 선택해주세요.");
		  }else{
			  
			  $.ajax({
					url:"${pageContext.request.contextPath}/FavorInsert.do",
					type:"post",
					data:{
						"c_lid" : Lval,
						"c_sid" : Sval
					},
					async:false,
					dataType:"json",
					success:function(data){
						if(data.result>0){
							alert("관심 카테고리가 등록되었습니다.");
							window.location = "${pageContext.request.contextPath}/FavordPage.do?m_id=" + data.m_id;
							
						}else if(data.result<0){
							alert("이미 등록한 카테고리입니다.");
						}
					},
					error:function(){
						alert("관심 카테고리가 등록에 실패했습니다.");
					}
			  });
			  
			  
		  }
	  }
  });
  </script>
  
  

</body>
</html>