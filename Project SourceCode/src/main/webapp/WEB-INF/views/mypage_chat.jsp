<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icr_chat12.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"qnimate
"http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<fmt:formatDate value="${result.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
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
.modal-dialog{
	margin:0;
}
.ICR_send{
	background: none;
	cursor: pointer;
	top:0;
	rigth:0;
}
.ICR_send:hover{
	size: 1.5em;
}
.people{
	overflow-y: scroll;
	width: 40%;
	height: 100%;
	text-decoration:none !important;
}
#ICR_NoneChat{
	position: absolute;
    left: 35%;
    height: 100%;
    width: 65%;
    border-radius: 10px;
    background: #f9fbff;
    z-index: 3;
}
#ICR_writing{
	display: none;
}
#ICR_noneimg{
	margin: 35% 40% 35% 40%;
}
a { text-decoration:none !important }
</style>



<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 채팅 부트르트랩 -->
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>

</head>
<body>



<div class="profile">
    <div class="avatar"><p>T</p></div>
    <div class="name2">Tworavel<p class="email">Tworavel@khteam4.com</p></div>
</div>
<div class="messages"></div>

  <ul class="people">
  <c:if test="${empty chatGrouplist}">
  	<li class="person" style="border-bottom: none;text-align: center;">
  		<span>개설된 채팅방이 없습니다.</span>
  	</li>
  	
  	</c:if>
  <c:if test="${not empty chatGrouplist}">
	  <c:forEach items="${chatGrouplist}" var="chat">
	  <a href="ChatDetail.do?c_id=${chat.c_id}">
	  	<c:set var="RoomNum" value="${chat.c_id}" />
		    <li class="person" id="ICR_Room${RoomNum}">
		      <span class="title">${chat.c_id}번글 채팅방</span>
		      <span class="time" style="right: 10%;"><fmt:formatDate var="time" value="${chat.ch_time}" pattern="yyyy-MM-dd HH:mm:ss" />${time}</span><br>
		      <span class="preview">${chat.ch_content}</span>
		    </li>
	    </a>
    </c:forEach>
  </c:if>
  </ul>


 <c:if test="${empty chatGrouplist}">
  <div id="ICR_NoneChat">
  	<img id="ICR_noneimg" width="150" height="150" src="${pageContext.request.contextPath}/resources/images/send.png">
  </div>
</c:if>

 <c:if test="${not empty chatGrouplist}">
  <div class="chatbox">
    <div class="top-bar">
      <div class="avatar"><p>T</p></div>
      <div class="name">${c_id}번글 채팅방</div>
      <div class="icons">
        <i class="fas fa-phone"><img id="ICR_send" onClick="window.location.reload()" width="30" height="30" src="${pageContext.request.contextPath}/resources/images/refresh.png"></i>
        <i class="fas fa-video"><img id="ICR_send" onClick="closeSocket();" width="30" height="30" src="${pageContext.request.contextPath}/resources/images/logout.png"></i>
      </div>
    </div>
    
    <div class="middle">
      <div class="voldemort">
      	<div style="width: 100%; height: 100%;">
	        <div class="incoming" id="before_messages">
			    <c:forEach items="${chatList}" var="Chlist">
			    	<span>${Chlist.m_sender}</span><br>
			        <div class="bubble"><span>${Chlist.ch_content}</span></div><br>
			    </c:forEach>
	        </div>
	        
	       <!--  <div class="outgoing">
	          <div class="bubble lower">Nah, it's cool.</div>
	        </div> -->
	        
      	</div>
        
        
        
        <div class="typing">
          <div class="bubble" id="ICR_writing">
            <div class="ellipsis one"></div>
            <div class="ellipsis two"></div>
            <div class="ellipsis three"></div>
          </div>
        </div>
        
      </div>
    </div>
    <div class="bottom-bar">
      <div class="chat">
       <input type="text" id="sender" value="${sessionScope.userID}" style="display: none;">
        <input type="text" id="messageinput" placeholder="Type a message..."/>
         <button type="button" onclick="send();">
         	<img id="ICR_send" width="35" height="35" src="${pageContext.request.contextPath}/resources/images/send.png">
         </button>
       
      </div>
    </div>
  </div>
  </c:if>
  
<!-- ===================================================================================================== -->
  

        <!-- <button id="ICR_OutBtn" type="button" onclick="closeSocket();">대회방 나가기</button> -->





		<!-- ===================================================================================================== -->
	


<!-- 채팅방 스크립트 -->
<script>
$(".person").on("click", function () {
	  $(this).toggleClass("focus").siblings().removeClass("focus");
	});
</script>
<!-- websocket javascript -->
    <script type="text/javascript">
    	
	    window.onload = function openSocket(){
	    		
		        //웹소켓 객체 만드는 코드
		        if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
		            writeResponse("WebSocket is already opened.");
		            return;
		        }
    			var c_id = ${c_id};
    			ws = new WebSocket("ws://localhost:8090/tworavel/echo.do/" + c_id);
		        ws.onopen = function(event){
		            if(event.data === undefined){
		          		return;
		            }
			        //writeResponse(event.data);
		        };
		        
		        ws.onmessage = function(event){
		            writeResponse(event.data);
		        };
		        /* ws.onclose = function(event){
		            writeResponse("대화 종료");
		        } */
		        
		      //스크롤 맨아래
	            var objDiv = document.getElementsByClassName("incoming")[0];
		        objDiv.scrollTop = objDiv.scrollHeight;
		        
	    }
		       
	    var ws;
       	var c_id = ${c_id};
        var messages = document.getElementById("messages");
        
        function send(){	//보내기
        	var inputVal = document.getElementById("messageinput").value;
        	if(inputVal==""){
        		alert("메세지를 입력해주세요.");
        		return;
        	}else{
	            var text = inputVal+"§"+document.getElementById("sender").value+"§"+c_id;
	            ws.send(text);
	            text = "";
	            ICR_insertFn();
	            document.getElementById("messageinput").value = "";
        	}
        }
        function closeSocket(){
        	if(confirm("채팅방을 나가겠습니까?")==true){
	        	ws.onclose = function(event){ }
	            ws.close();
	            window.location = "updateChatOut.do?c_id=" + c_id;
        	}else{
        		return;
        	}
        }
        function writeResponse(text){
        	var sender = "";
        	var massage = "";
        	var jbSplit = text.split('§');
            for ( var i in jbSplit ) {	//jbSplit[i]
            	if(i==0)
            		sender = jbSplit[i];
            	else if(i==1)
            		massage = jbSplit[i];
            }
	            $('.incoming').append("<span>" + sender + "</span> <br/> <div class='bubble'><span>" + massage + "</span></div><br/>");
	            //스크롤 맨아래
	            var objDiv = document.getElementsByClassName("incoming")[0];
		        objDiv.scrollTop = objDiv.scrollHeight;
		      	//채팅방 목록에도 추가
		      	$('#ICR_Room' + c_id).children().last().html(massage);
		      	//시간구하기
		      	
		      	$('#ICR_Room' + c_id).children().eq(1).html(getTime());	//time
		      	$('.people').prepend($('#ICR_Room' + c_id).parent()); // chlid 객체를 parent 객체 내 첫번째 요소로 붙인다.
		      	$('#ICR_writing').css('display','none');
        }
        
        
        
        
        function getTime(){
        	//시간구하기
	      	let today = new Date();   
	      	let year = today.getFullYear(); // 년도
	      	let month = today.getMonth() + 1;  // 월
	      	let date = today.getDate();  // 날짜

	      	let hours = today.getHours(); // 시
	      	let minutes = today.getMinutes();  // 분
	      	let seconds = today.getSeconds();  // 초
	      	if(month<10){
	      		month = "0" + month;
	      	}
	      	if(date<10){
	      		date = "0" + date;
	      	}
	      	if(seconds<10){
	      		seconds = "0" + seconds;
	      	}
	      	if(minutes<10){
	      		minutes = "0" + minutes;
	      	}
	      	if(hours<10){
	      		hours = "0" + hours;
	      	}
	      	var roomTime = year + "-" + month + "-" + date + "\t\t\t" + hours + ':' + minutes + ":" + seconds;
	      	return roomTime;
        }
        
        
	  </script>
	  <script>
	  function ICR_insertFn(){
		  var c_id = ${c_id};
		  var ch_content = document.getElementById("messageinput").value;
		  
		  $.ajax({
			  url : "insertChat.do?c_id=" + c_id + "&ch_content=" + ch_content,
			  success : function(){
			  },
			  error : function(){
			  }
		  });
	  }

	  
	  //엔터키
	  $("#messageinput").keydown(function(key) {
			if (key.keyCode == 13) {
				send();
			}
		});
	  </script>
</body>
</html>