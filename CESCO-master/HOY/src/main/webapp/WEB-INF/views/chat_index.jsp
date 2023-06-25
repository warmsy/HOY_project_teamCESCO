<%@page import="java.util.List"%>
<%@page import="kr.smhrd.mapper.MemberVO"%>
<%@page import="kr.smhrd.web.WebControl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate"  %>
<%@ page import="java.time.ZoneId"  %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>chat_index</title>
    <link rel="preconnect" href="https://1fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="resources/css/chat.css">
    <link rel="stylesheet" type="text/css" href="resources/css/textMessage.css"> 
    <!-- "/HOY/resource/css/style.css"
    /HOY/resource/css/main.css -->
    <!-- 푸시가 안돼서 추가하고 다시 푸시할 예정! -->

    <!-- 호이 폰트 -->  
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Righteous&display=swap" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet"> 
    
      <!-- 아이콘 rel -->


</head>
<script src="resources/js/jquery-3.6.0.min.js">


</script>



<body>
	<div id = "header1">
        <a href="#">HoY</a>
    </div>
	<!-- 채팅 영역 -->
	<div class="chat_wrap">
		<div class="chat">
		
			<ul>
				<!-- 동적 생성 -->
			</ul>
		</div>
		<div class="input-div">
			<!-- 텍스트 박스에 채팅의 내용을 작성한다. -->
			<input class = "textbox" id="textMessage" type="text"	 placeholder="  채팅을 입력하세요!" onkeydown="return enter()">
			<!-- 서버로 메시지를 전송하는 버튼 -->
			<input class="myButton" onclick="sendMessage()" value="Send" type="button">
		</div>


		<div class="chat format">
			<ul>
				<li>
					<div class="sender">
						<span></span>
					</div>
					<div class="message">
						<span></span>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<script  type="text/javascript" >
	
	

	
		// 서버의 broadsocket의 서블릿으로 웹 소켓을 한다.
	//	var webSocket = new WebSocket("ws://localhost:8081/web/broadsocket");
		// 콘솔 텍스트 영역
	//	var messageTextArea = document.getElementById("messageTextArea");
		// 접속이 완료되면
	//	webSocket.onopen = function(message) {
			// 콘솔에 메시지를 남긴다.
	//		messageTextArea.value += "안녕하세요 hoy임다~" + "" ;
	//	};
		// 접속이 끝기는 경우는 브라우저를 닫는 경우이기 떄문에 이 이벤트는 의미가 없음.
	//	webSocket.onclose = function(message) {
	//	};
		// 에러가 발생하면
	//	webSocket.onerror = function(message) {
			// 콘솔에 메시지를 남긴다.
	//		messageTextArea.value += "error...\n";
	//	};
		// 서버로부터 메시지가 도착하면 콘솔 화면에 메시지를 남긴다.
	//	webSocket.onmessage = function(message) {
	//		messageTextArea.value += "(operator) => " + message.data + "\n";
	//	};
		// 서버로 메시지를 발송하는 함수
			// Send 버튼을 누르거나 텍스트 박스에서 엔터를 치면 실행

	
		//messageTextArea.value += "(HOY) => 안녕하세요 HOY임다~" + "   " + "["+ now.getHours()+" : "+ now.getMinutes() +"]"+ "\n" ;
		
		
		<%-- function sendMessage() {
			
			// 텍스트 박스의 객체를 가져옴
			/*let t_message = Date();
			let dateFormatter = DateFormatter();
			dateFormatter.dateFormat = "HH:mm";
			let str = dateFormatter.string();
			setInterval(Date, 1000);*/	
			let message = document.getElementById("textMessage");
			<% MemberVO vo = (MemberVO) session.getAttribute("mb_vo");%>
			
			messageTextArea.value += "\t"+"\t" + "["+ now.getHours()+" : "+ now.getMinutes() +"]"+ "   " + message.value + " <= (" + "<%= vo.getMb_nickname()%>" +")"+ "\n";
			
			
			$.ajax({
				method:"POST"
				,url:"apicall.do"
				/*,url:"https://builder.pingpong.us/api/builder/615d0e4ee4b0438b8856e133/chat/simulator?query="+message.value*/
				,dataType:'json'
				,contentType: "application/x-www-form-urlencoded;charset=utf-16"
				,data:{query:message.value}
				,success:function(data){
					
					console.log(decodeURI(data));
					messageTextArea.value += "(HOY) => " + data.response.replies[0].text + "   " + now.getHours()+" : "+ now.getMinutes() +"]"+"\n"
				},error:function(error,e,f){
					console.log(error,e,f);
				}
			})
			
			// 콘솔에 메세지를 남긴다.
			// 소켓으로 보낸다.
			//webSocket.send(message.value);
			// 텍스트 박스 추기화
			message.value = "";
		}
		 --%>
		
		// 텍스트 박스에서 엔터를 누르면
		
		
		<!-- 디자인 적용 -->
		function createMessageTag(LR_className, senderName, message) {
			var now = new Date();
			var hours = now.getHours();
			var minutes = now.getMinutes();
			if(hours<10){
				hours+="0"+now.getHours();
			}else{
				hours = now.getHours();
			}
			if(minutes<10){
				minutes+="0"+now.getMinutes();
			}else{
				minutes = now.getMinutes();
			}
	        let chatLi = $('div.chat.format ul li').clone();
	 
	        // 값 채우기
	        chatLi.addClass(LR_className);
	        chatLi.find('.sender span').text(senderName);
	        chatLi.find('.message span').text(message);
	        if (LR_className=='right'){
	        	chatLi.find('.message').before('<span class="sp">'+hours+":"+minutes+'</span>');
	        }	        	
	        else{
	        	chatLi.find('.message').after('<span class="sp">'+hours+":"+minutes+'</span>');
	        }
	        		 
	        return chatLi;
	    }
		
		function appendMessageTag(LR_className, senderName, message) {
	        const chatLi = createMessageTag(LR_className, senderName, message);
	 
	        $('div.chat:not(.format) ul').append(chatLi);
	 
	        // 스크롤바 아래 고정
	        $('div.chat').scrollTop($('div.chat').prop('scrollHeight'));
	    }

		<% MemberVO vo = (MemberVO) session.getAttribute("mb_vo");%>
		const Chat = (function(){
		    const myName = "<%= vo.getMb_nickname()%>";
		});
		    // init 함수
		    

		    // 메세지 태그 생성
		    
	        // 형식 가져오기
    function sendMessage(){
		
		// 텍스트 박스의 객체를 가져옴
		let message = document.getElementById("textMessage");
		
		appendMessageTag("right", "<%=vo.getMb_nickname()%>", message.value);
		/*  */  
		 //messageTextArea.value += "\t"+"\t" + "["+ now.getHours()+" : "+ now.getMinutes() +"]"+ "   " + message.value + " <= (" + "" +")"+ "\n";
		
		
		$.ajax({
			method:"POST"
			,url:"apicall.do"
			/*,url:"https://builder.pingpong.us/api/builder/615d0e4ee4b0438b8856e133/chat/simulator?query="+message.value*/
			,dataType:'json'
			,contentType: "application/x-www-form-urlencoded;charset=utf-16"
			,data:{query:message.value}
			,success:function(data){
				
				console.log(decodeURI(data));
				appendMessageTag("left", "HOY", data.response.replies[0].text);
				//messageTextArea.value += "(HOY) => " + data.response.replies[0].text + "   " + now.getHours()+" : "+ now.getMinutes() +"]"+"\n"
			},error:function(error,e,f){
				console.log(error,e,f);
			}
		});
		
		// 콘솔에 메세지를 남긴다.
		// 소켓으로 보낸다.
		//webSocket.send(message.value);
		// 텍스트 박스 추기화
		message.value = "";
	}
		
		    
	  function enter() {
		
		// keyCode 13은 엔터이다.
		if (event.keyCode == 13) {
			// 서버로 메시지 전송
			sendMessage();
			// form에 의해 자동 submit을 막는다.
			return false;
		}
		return true;
	} 
 
	/* function enter() {
        // enter 키 이벤트
        $(document).on('keydown', 'div.input-div textarea', function(e){
            if(event.keyCode == 13) {
                e.preventDefault();
                sendMessage($(this).val()) ;
                
            }
        });
    } */
  
 	    
	</script>
	

	<!--=============== 독바 ===============-->
    <header class="header" id="header">
        <div class="nav__menu" id="nav-menu">
            <ul class="nav__list">
                <li class="nav__item">
                    <a href="chat_index.do" class="nav__link" id="chat">
                        <span class="material-icons-outlined md-36">question_answer
                        </span>
                    </a>
                </li>

                <li class="nav__item">
                    <a href="challenge.do" class="nav__link">
                        <span class="material-icons-outlined md-36">emoji_events
                        </span>
                    </a>
                </li>
                
                <li class="nav__item">
                    <a href="main.do" class="nav__link">
                        <span class="material-icons-outlined md-36">home
                        </span>
                    </a>
                </li>
            
                <li class="nav__item">
                    <a href="statics.do" class="nav__link">
                        <span class="material-icons-outlined md-36">leaderboard
                        </span>
                    </a>
                </li>
                
                <li class="nav__item"><a href="person.do" class="nav__link">
						<span class="material-icons-outlined md-36">person_outline
					</span>
				</a></li>
                
            </ul>
        </div>

    </nav>
</header>

<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>
var selected_icon = $('.nav__item a');
selected_icon.click(function(){
    $(this).css('color','#1868FB');
    selected_icon.not($(this)).css('color','#52555A');
});

</script>
	

</body>
</html>
