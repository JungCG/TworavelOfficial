<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icr_chat01.css">
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
#ICR_other{
	float: left;
	width: 100%;
	text-align: left;
}
#ICR_Myid{
	float: right;
	width: 100%;
	text-align: right;
}
#ICR_Mytext{
	background: #79c7c5;
	float: right;
}
#ICR_br{
	widows: 100%;
}
#ICR_othertext{
	float: left;
}
.ICR_Unread{
	padding: 3px;
    border-radius: 4px;
	background-color: rgba(255,0,0,0.7);
	color: white;
	font-size: 4px;
	
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
    <div class="name2"><p class="email"></p></div>
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
		      <span class="ICR_Unread" style="<c:if test="${chat.ch_unread eq 0}">background-color: rgba( 255, 255, 255, 0 );</c:if>">
		      	<c:if test="${chat.ch_unread ne 0}">${chat.ch_unread}</c:if>
		      </span>
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
 <c:if test="${c_id eq null}">
	  <div id="ICR_NoneChat">
	  	<img id="ICR_noneimg" width="150" height="150" src="${pageContext.request.contextPath}/resources/images/send.png">
	  </div>
 </c:if>
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
			    	<c:if test="${Chlist.m_sender ne sessionScope.userID}">
				    	<span id="ICR_other">${Chlist.m_sender}</span><br>
				        <div id="ICR_othertext" class="bubble"><span>${Chlist.ch_content}</span></div><br>
				        <span class="ICR_br"></span>
			    	</c:if>
			    	<c:if test="${Chlist.m_sender eq sessionScope.userID}">
				    	<span id="ICR_Myid">${Chlist.m_sender}</span><br>
				        <div id="ICR_Mytext" class="bubble"><span>${Chlist.ch_content}</span></div><br>
				        <span class="ICR_br"></span>
			    	</c:if>
			    </c:forEach>
	        </div>
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
    			ws = new WebSocket("ws://IPv4주소또는도메인/echo.do/" + c_id);
		        ws.onopen = function(event){
		            if(event.data === undefined){
		          		return;
		            }
			        //writeResponse(event.data);
		        };
		        
		        ws.onmessage = function(event){
		        	var textVal = event.data;
		        	
		        	var jbSplit = textVal.split('§');
		        	if(jbSplit[0]=="®"){
		        		AlramFN(event.data);
		        	}else{
			            writeResponse(event.data);
		        	}
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
        		document.getElementById("messageinput").focus();
        		return;
        	}else{
	            var text = inputVal+"§"+document.getElementById("sender").value+"§"+c_id;
	            
	            ICR_insertFn();
	            ws.send(text);
	            text = "";
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
       	var sender = "";
       	var massage = "";
       	
        function writeResponse(text){
        	var jbSplit = text.split('§');
            for ( var i in jbSplit ) {	//jbSplit[i]
            	if(i==0)
            		sender = jbSplit[i];
            	else if(i==1)
            		massage = jbSplit[i];
            }
            
            
          //읽음처리
			$.ajax({
					url : "updateReadChat.do",
					async : false,
					data : {
						c_id : c_id,
						m_sender : sender,
						m_receiver : "${sessionScope.userID}",
						ch_content : massage
					},
					success : function() {
					},
					error : function() {
					}
				});
            
            	
            	if(sender=="${sessionScope.userID}"){
	            	//내가 보낸거면
		            $('.incoming').append("<span class='ICR_br'></span> <span id='ICR_Myid'>" + sender + "</span> <br/> <div id='ICR_Mytext' class='bubble'> <span>" + massage + "</span> </div> <br/> <span class='ICR_br'></span>");
            	}else{
	            	//다른사람이 보낸거면
		            $('.incoming').append("<span class='ICR_br'></span> <span id='ICR_other'>" + sender + "</span> <br/> <div id='ICR_othertext' class='bubble'><span>" + massage + "</span> </div> <br/> <span class='ICR_br'></span>");
            	}
            	
	            //스크롤 맨아래
	            var objDiv = document.getElementsByClassName("incoming")[0];
		        objDiv.scrollTop = objDiv.scrollHeight;
		      	
            }
        
        
        function AlramFN(text){
        	var c_id = ${c_id};
        	var Al_c_id = 0;
        	var unreadCnt = 0;
        	
        	var jbSplit = text.split('§');
            for ( var i in jbSplit ) {	//jbSplit[i]
            	if(i==1)
            		sender = jbSplit[i];
            	else if(i==2)
            		massage = jbSplit[i];
            	else if(i==3)
            		Al_c_id = jbSplit[i];
            }
        	
        	//방에 들어가있는지?
			$.ajax({
					url : "checkChatJoin2.do",
					async : false,
					data : {
						c_id : Al_c_id
					},
					dataType : "text",
					success : function(result) {
						//방에 있음
						if(result>0){
							if("${sessionScope.userID}"!=sender && c_id!=Al_c_id){
								
								$.ajax({
									url : "selectUnreadChat.do",
									async : false,
									data : {
										c_id : Al_c_id
									},
									success : function(result) {
										if(result>0){
											unreadCnt = result;
											$('#ICR_Room' + Al_c_id).children(".ICR_Unread").html(unreadCnt);
											$('#ICR_Room' + Al_c_id).children(".ICR_Unread").css('background-color','rgba(255,0,0,0.7)');
										}
									},
									error : function() {
									}
								});
							}
							
							//채팅방 목록에도 추가
					      	$('#ICR_Room' + Al_c_id).children().last().html(massage);
					      	$('#ICR_Room' + Al_c_id).children().first().html(Al_c_id+"번글 채팅방");
					      	
					      	//시간구하기
					      	$('#ICR_Room' + Al_c_id).children(".time").html(getTime());	//time
					      	$('.people').prepend($('#ICR_Room' + Al_c_id).parent()); // chlid 객체를 parent 객체 내 첫번째 요소로 붙인다.
						}else{//방에 없음
							console.log("방에 없음");
						}
					},
					error : function() {
					}
				});
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
			  async : false,
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
