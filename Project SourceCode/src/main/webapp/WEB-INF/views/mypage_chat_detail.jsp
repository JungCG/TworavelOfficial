<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"qnimate
"http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
    <!-- Server responses get written here -->
    <p>${c_id} 번 동행글 채팅방</p>
    <c:if test="${not empty chatList}">
	    <div id="before_messages">
	    <c:forEach items="${chatList}" var="Chlist">
	    	[<span>${Chlist.m_id}</span>] : <span>${Chlist.ch_content}</span><br>
	    </c:forEach>
	    </div>
    </c:if>
	    <div id="messages">
	    </div>
    <div>
  		메세지 입력 : 
        <input type="text" id="sender" value="${sessionScope.userID}" style="display: none;">
        <input type="text" id="messageinput">
        <button type="button" onclick="send();" onkeypress="if(event.keyCode==13){send();}">메세지 전송</button>
    </div>
    <div>
        <button id="ICR_OutBtn" type="button" onclick="closeSocket();">대회방 나가기</button>
        <button id="ICR_listBtn" type="button" onclick="location.href='Chat.do'">채팅방 목록으로</button>
    </div>
    
    
    
    
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
		            writeResponse(event.data);
		        };
		        
		        ws.onmessage = function(event){	//받기
		            console.log('writeResponse');
		            console.log(event.data)
		            writeResponse(event.data);
		        };
		        /* ws.onclose = function(event){
		            writeResponse("대화 종료");
		        } */
	    }
	    
	    
	    var ws;
       	var c_id = ${c_id};
        var messages = document.getElementById("messages");
        
        function send(){	//보내기
            var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value+","+c_id;
            ws.send(text);
            text = "";
            ICR_insertFn();
            document.getElementById("messageinput").value = "";
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
            messages.innerHTML += text+"<br/>";
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
	  </script>
</body>
</html>