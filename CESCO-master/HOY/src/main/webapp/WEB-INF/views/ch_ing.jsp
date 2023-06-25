<%@page import="kr.smhrd.mapper.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <!-- 호이 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Righteous&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">


    <!--  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
      rel="stylesheet"> 
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <!-- 어썸아이콘 rel -->
      <script src="https://kit.fontawesome.com/692a9e63cd.js" crossorigin="anonymous"></script>

      <!-- fullcalendar API -->
    <link href='resources/css/style.css' rel='stylesheet' />
    <script src='resources/lib/main.js'></script>

</head>
<body>
<% String seq = request.getParameter("seq"); 
   MemberVO vo = (MemberVO) session.getAttribute("mb_vo");
   
 %>
 
    <div id = "header1">
        <a href="main.do">HoY</a>
    </div>
    
    	<script type="text/javascript">		
		function check_ch(doing) {
			//if (document.ch_btn.ch_sql.value == "") {
			if (doing >= "1") {
				alert("이미 진행중인 과제입니다.");				
				return false;
			} else {
				
				return true;
				
			}
		}
	</script>
    <div>    
        <div class="container" id="challenge">
            <div class="chal_ing">
                <div class="chal_img_ing" id= "chal_img1">
                    <img src="${list[0].ch_img1}">
                </div>
                <div>
                    <h2>We Can challenge!</h2>
                    <p>${list[0].ch_content}</p>
                    <p>${list[0].ch_time} 일 도전입니다.</p>
                    <p>80% 성공 시 ${list[0].ch_reward} POINT 지급됩니다.</p>
                </div>
                <div class="chal_btn">
	                <%-- <form action="ch_ing_list_insert.do" method="get">
		                <input type="hidden" name="ch_seq" value="${list[0].ch_seq}">
		                <input type="hidden" name="mb_id" value="<%=vo.getMb_id()%>">
		                <input type="submit" id="challenge_btn" value="I Can Challenge!" >
	                 
	                </form> --%>
                <!-- <form action="./ch_ing_list_insert.do" method="post">
                		form태그의 액션은 컨트롤러 리퀘매핑, 객체이름이랑 같음됨 -->

                <form action="./ch_ing_list_insert.do" method="post" name = "ch_btn">
                		<!-- form태그의 액션은 컨트롤러 리퀘매핑, 객체이름이랑 같음됨  _ EJ-->
                <input type="hidden" name="ch_seq" value="${list[0].ch_seq}">
                <input type="hidden" name="mb_id" value="<%=vo.getMb_id()%>">
                <input type="hidden" name="ch_kind" value="${list[0].ch_kind}">
                <button type = "submit" id="challenge_btn" onclick="return check_ch(${doing});">
                        <span>
                        I Can Challenge!
                        </span>
                    </button>
                </form>
                
                    
                </div>
                
            </div>
        </div>
    </div>
    </div>
    <!--=============== 독바 ===============-->
    	<header class="header" id="header">
		<div class="nav__menu" id="nav-menu">
			<ul class="nav__list">
				<li class="nav__item"><a href="chat_index.do" class="nav__link"
					id="chat"> <span class="material-icons-outlined md-36">question_answer
					</span>
				</a></li>

				<li class="nav__item"><a href="challenge.do" class="nav__link">
						<span class="material-icons-outlined md-36">emoji_events </span>
				</a></li>

				<li class="nav__item"><a href="main.do" class="nav__link">
						<span class="material-icons-outlined md-36">home </span>
				</a></li>

				<li class="nav__item"><a href="statics.do" class="nav__link">
						<span class="material-icons-outlined md-36">leaderboard </span>
				</a></li>

				<li class="nav__item"><a href="person.do" class="nav__link">
						<span class="material-icons-outlined md-36">person_outline
					</span>
				</a></li>

			</ul>
		</div>
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