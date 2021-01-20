<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>

<style>
* {
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

#ICR_KeywordPage {
   width: 1000px;
   margin: 0 auto;
   text-align: center;
   margin-bottom: 100px;
}

#ICR_largeCategory, #ICR_smallCategory {
   width: 160px;
   height: 35px;
   border: 1px solid #333;
}

#ICR_insertBtn {
   background: #2C3C5B;
}

#ICR_insertBtnDiv {
   border-top: none;
   border-right: none;
   border-bottom: none;
}

#ICR_FavorTable {
   width: 60%;
   margin: 0 auto;
   text-align: center;
}

.ICR_DeleteBtn {
   cursor: pointer;
}

#ICR_textDiv {
   margin-top: 30px;
}

table {
   text-align: center;
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
</head>
<body>

   <div class="jck_wrap">
      <jsp:include page="header.jsp" />


      <div id="ICR_KeywordPage">
         <h3 style="margin-bottom: 50px;">관심 카테고리 설정</h3>

         <select id="ICR_largeCategory" name="c_lid"
            onchange="categoryChange(this)">
            <option style="display: none;">카테고리 선택</option>
            <option value="1">지역</option>
            <option value="2">인원</option>
            <option value="3">성향</option>
         </select> &nbsp;&nbsp;&nbsp; <select name="c_sid" id="ICR_smallCategory">
            <option style="display: none;">소분류 선택</option>
         </select> &nbsp;&nbsp;&nbsp;
         <button id="ICR_insertBtn" class="btn btn-primary" onclick="favorInsertFN();">관심목록 추가</button>

         <br>
         <br>
         <br>
         <br>

		
		
		
		
		
            <table id="ICR_FavorTable" class="table">
               <tr>
                  <td colspan="3" style="background: #fff7bc;">등록한 카테고리</td>
               </tr>
               <tbody>
                  <c:forEach items="${Favorlist}" var="Favor">
                     <tr>
                        <td><c:if test="${Favor.c_lid eq 1}">지역</c:if> <c:if
                              test="${Favor.c_lid eq 2}">인원</c:if> <c:if
                              test="${Favor.c_lid eq 3}">성향</c:if></td>
                        <td><c:if test="${Favor.c_lid eq 1}">
                              <c:if test="${Favor.c_sid eq 1}">강원도</c:if>
                              <c:if test="${Favor.c_sid eq 2}">경기도</c:if>
                              <c:if test="${Favor.c_sid eq 3}">경상남도</c:if>
                              <c:if test="${Favor.c_sid eq 4}">경상북도</c:if>
                              <c:if test="${Favor.c_sid eq 5}">전라남도</c:if>
                              <c:if test="${Favor.c_sid eq 6}">전라북도</c:if>
                              <c:if test="${Favor.c_sid eq 7}">충청남도</c:if>
                              <c:if test="${Favor.c_sid eq 8}">충청북도</c:if>
                           </c:if> <c:if test="${Favor.c_lid eq 2}">
                              <c:if test="${Favor.c_sid eq 1}">4명 이내</c:if>
                              <c:if test="${Favor.c_sid eq 2}">5~8명</c:if>
                              <c:if test="${Favor.c_sid eq 3}">9명 이상</c:if>
                           </c:if> <c:if test="${Favor.c_lid eq 3}">
                              <c:if test="${Favor.c_sid eq 1}">호캉스</c:if>
                              <c:if test="${Favor.c_sid eq 2}">청춘</c:if>
                              <c:if test="${Favor.c_sid eq 3}">자연</c:if>
                              <c:if test="${Favor.c_sid eq 4}">유적지</c:if>
                              <c:if test="${Favor.c_sid eq 5}">액티비티</c:if>
                           </c:if></td>
                        <td><label class="ICR_DeleteBtn">&times;</label></td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         	
         	
         	<c:if test="${empty Favorlist}">
            <div id="ICR_textDiv">
               	등록한 카테고리가 없습니다.<br>카테고리 관련 글이 올라오면 알림을 드려요~!
            </div>
         	</c:if>
         	
         	
         	
      </div>

      <jsp:include page="footer.jsp" />
   </div>






   <script>
      //카테고리 선택 스크립트
      function categoryChange(e) {
         var village = [ "강원도", "경기도", "경상남도", "경상북도", "전라남도", "전라북도",
               "충청남도", "충청북도" ];
         var peaple = [ "4명 이내", "5~8명", "9명 이상" ];
         var tema = [ "호캉스", "청춘", "자연", "유적지", "액티비티" ];
         var target = document.getElementById("ICR_smallCategory");

         if (e.value == "1")
            var d = village;
         else if (e.value == "2")
            var d = peaple;
         else if (e.value == "3")
            var d = tema;
         target.options.length = 0;

         //소분류 value값
         for (i = 0; i < d.length; i++) {
            var opt = document.createElement("option");
            opt.value = i + 1;
            opt.innerHTML = d[i];
            target.appendChild(opt);
         }
      }
   </script>
   <script>
                  function favorInsertFN() {
                     var Lval = $('select[name=c_lid]').val();
                     var Sval = $('select[name=c_sid]').val();
                     if (Lval == "카테고리 선택") {
                        alert("카테고리를 선택해주세요.");
                     } else {
                        if (Sval == "소분류 선택") {
                           alert("소분류를 선택해주세요.");
                        } else {

                           $
                                 .ajax({
                                    url : "${pageContext.request.contextPath}/FavorInsert.do",
                                    type : "post",
                                    data : {
                                       "c_lid" : Lval,
                                       "c_sid" : Sval
                                    },
                                    async : true,
                                    dataType : "json",
                                    success : function(data) {
                                       if (data.result > 0) {
                                          alert("관심 카테고리가 등록되었습니다.");
                                          FavorListFN();
                                       } else if (data.result < 0) {
                                          alert("이미 등록한 카테고리입니다.");
                                       }
                                    },
                                    error : function() {
                                       alert("관심 카테고리가 등록에 실패했습니다.");
                                    }
                                 });

                        }
                     }
                  }

      function FavorListFN() {
         $
               .ajax({
                  url : "${pageContext.request.contextPath}/FavordPageReload.do?m_id=${sessionScope.userID}",
                  async : false,
                  success : function(favorlist) {
                     $('tbody > tr').remove();
                     
                     $('#ICR_textDiv').css('display','none');
                     $('#ICR_FavorTable').css('display','table');
                     
                     $('#ICR_FavorTable > tbody:last')
                           .append(
                                 '<tr><td colspan="3" style="background: #fff7bc;">등록한 카테고리</td></tr>');

                     for (var i = 0; i < favorlist.length; i++) {
                        var c_lidVal = "";
                        var c_sidVal = "";

                        if (favorlist[i].c_lid == 1) {
                           c_lidVal = '지역';
                           if (favorlist[i].c_sid == 1) {
                              c_sidVal = '강원도';
                           } else if (favorlist[i].c_sid == 2) {
                              c_sidVal = '경기도';
                           } else if (favorlist[i].c_sid == 3) {
                              c_sidVal = '경상남도';
                           } else if (favorlist[i].c_sid == 4) {
                              c_sidVal = '경상북도';
                           } else if (favorlist[i].c_sid == 5) {
                              c_sidVal = '전라남도';
                           } else if (favorlist[i].c_sid == 6) {
                              c_sidVal = '전라북도';
                           } else if (favorlist[i].c_sid == 7) {
                              c_sidVal = '충청남도';
                           } else if (favorlist[i].c_sid == 8) {
                              c_sidVal = '충청북도';
                           }
                        } else if (favorlist[i].c_lid == 2) {
                           c_lidVal = '인원';
                           if (favorlist[i].c_sid == 1) {
                              c_sidVal = '4명 이내';
                           } else if (favorlist[i].c_sid == 2) {
                              c_sidVal = '5~8명';
                           } else if (favorlist[i].c_sid == 3) {
                              c_sidVal = '9명 이상';
                           }
                        } else if (favorlist[i].c_lid == 3) {
                           c_lidVal = '성향';
                           if (favorlist[i].c_sid == 1) {
                              c_sidVal = '호캉스';
                           } else if (favorlist[i].c_sid == 2) {
                              c_sidVal = '청춘';
                           } else if (favorlist[i].c_sid == 3) {
                              c_sidVal = '자연';
                           } else if (favorlist[i].c_sid == 4) {
                              c_sidVal = '유적지';
                           } else if (favorlist[i].c_sid == 5) {
                              c_sidVal = '액티비티';
                           }
                        }
                        $('#ICR_FavorTable > tbody:last')
                              .append(
                                    '<tr><td>'
                                          + c_lidVal
                                          + '</td><td>'
                                          + c_sidVal
                                          + '</td><td><label class="ICR_DeleteBtn">&times;</label></td></tr>');
                     }
                     
                     if(favorlist.length==0){
	                     $('#ICR_textDiv').css('display','block');
                     }
                     
                     
                 
                  
                     $(".ICR_DeleteBtn").click(function(){
                       
                        var tdArr = new Array(); // 배열 선언
                        var SVal =$(this).parent().prev().text().trim(); 
                       var LVal =$(this).parent().prev().prev().text().trim();
                        if (LVal == "지역") {
                           LVal = 1;
                           if (SVal == "강원도")
                              SVal = 1;
                           else if (SVal == "경기도")
                              SVal = 2;
                           else if (SVal == "경상남도")
                              SVal = 3;
                           else if (SVal == "경상북도")
                              SVal = 4;
                           else if (SVal == "전라남도")
                              SVal = 5;
                           else if (SVal == "전라북도")
                              SVal = 6;
                           else if (SVal == "충청남도")
                              SVal = 7;
                           else if (SVal == "충청북도")
                              SVal = 8;
                        } else if (LVal == "인원") {
                           LVal = 2;
                           if (SVal == "4명 이내")
                              SVal = 1;
                           else if (SVal == "5~8명")
                              SVal = 2;
                           else if (SVal == "9명 이상")
                              SVal = 3;
                        } else if (LVal == "성향") {
                           LVal = 3;
                           if (SVal == "호캉스")
                              SVal = 1;
                           else if (SVal == "청춘")
                              SVal = 2;
                           else if (SVal == "자연")
                              SVal = 3;
                           else if (SVal == "유적지")
                              SVal = 4;
                           else if (SVal == "액티비티")
                              SVal = 5;
                        }
                        $.ajax({
                           url : "${pageContext.request.contextPath}/FavorDelete.do",
                           type : "get",
                           data : {
                              "c_lid" : LVal,
                              "c_sid" : SVal
                           },
                           async : true,
                           dataType : "text",
                           success : function(result) {
                              if (result > 0) {
                                 FavorListFN();
                              } else {
                                 alert("관심 카테고리 삭제에 실패했습니다.");
                              }
                           },
                           error : function() {
                              alert("관심 카테고리 삭제에 실패했습니다.");
                           }
                        });
                    
                    
                 })
                  },
                  error : function() {
                  }
               });
      }
   </script>
   <script>
   
   
   
  $(function(){
     $(".ICR_DeleteBtn").click(function(){
            var tdArr = new Array(); // 배열 선언
            var SVal =$(this).parent().prev().text().trim(); 
           var LVal =$(this).parent().prev().prev().text().trim();
            if (LVal == "지역") {
               LVal = 1;
               if (SVal == "강원도")
                  SVal = 1;
               else if (SVal == "경기도")
                  SVal = 2;
               else if (SVal == "경상남도")
                  SVal = 3;
               else if (SVal == "경상북도")
                  SVal = 4;
               else if (SVal == "전라남도")
                  SVal = 5;
               else if (SVal == "전라북도")
                  SVal = 6;
               else if (SVal == "충청남도")
                  SVal = 7;
               else if (SVal == "충청북도")
                  SVal = 8;
            } else if (LVal == "인원") {
               LVal = 2;
               if (SVal == "4명 이내")
                  SVal = 1;
               else if (SVal == "5~8명")
                  SVal = 2;
               else if (SVal == "9명 이상")
                  SVal = 3;
            } else if (LVal == "성향") {
               LVal = 3;
               if (SVal == "호캉스")
                  SVal = 1;
               else if (SVal == "청춘")
                  SVal = 2;
               else if (SVal == "자연")
                  SVal = 3;
               else if (SVal == "유적지")
                  SVal = 4;
               else if (SVal == "액티비티")
                  SVal = 5;
            }
            $.ajax({
               url : "${pageContext.request.contextPath}/FavorDelete.do",
               type : "get",
               data : {
                  "c_lid" : LVal,
                  "c_sid" : SVal
               },
               async : true,
               dataType : "text",
               success : function(result) {
                  if (result > 0) {
                     FavorListFN();
                  } else {
                     alert("관심 카테고리 삭제에 실패했습니다.");
                  }
               },
               error : function() {
                  alert("관심 카테고리 삭제에 실패했습니다.");
               }
            });
        
        
     })
  })
    
   </script>


</body>
</html>