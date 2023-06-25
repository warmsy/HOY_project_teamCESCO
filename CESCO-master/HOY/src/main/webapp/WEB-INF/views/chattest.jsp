<%@page import="java.util.List"%>
<%@page import="kr.smhrd.mapper.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body>.
    <div id = "header1">
        <a href="#">HoY</a>
    </div>
    <div>    
        
    </div>


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
                
                <li class="nav__item">
                    <a href="person.do" class="nav__link">
                        <span class="material-icons-outlined md-36">person_outline
                        </span>
                    </a>
                </li>
                
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