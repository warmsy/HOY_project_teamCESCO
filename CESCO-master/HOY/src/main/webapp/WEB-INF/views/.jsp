<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
    
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://1fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
    
    <!-- "/HOY/resource/css/style.css"
    /HOY/resource/css/main.css -->

    <!-- 호이 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Righteous&display=swap" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet"> 
      <!-- 아이콘 rel -->

      <!-- fullcalendar API -->

    <link href='resources/lib/main.css' rel='stylesheet'>
    <script src='resources/lib/main.js'></script>

    <!-- 캘린더용 script 이동 노노  -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
          var calendarEl = document.getElementById('calendar');
      
          var calendar = new FullCalendar.Calendar(calendarEl, {
            height: '100%',
            contentHeight: 600,
            expandRows: false,
            slotMinTime: '08:00',
            slotMaxTime: '20:00',
            /* 헤더 */
            headerToolbar: {
              start: 'title', // will normally be on the left. if RTL, will be on the right
              center: '',
              end: 'prev,next' // will normally be on the right. if RTL, will be on the left
            },
            /* 헤더종료 */
            initialView: 'dayGridMonth',
/*             initialDate: '2020-09-12', 지정 안해야 오늘 날짜가 default*/ 
            navLinks: true, // can click day/week names to navigate views
            editable: true,
            selectable: true,
            nowIndicator: true,
            dayMaxEvents: true, // allow "more" link when too many events
/*             events: [
              {
                title: 'All Day Event',
                start: '2020-09-01',
              },
              {
                title: 'Click for Google',
                url: 'http://google.com/',
                start: '2020-09-28'
              }
            ] */
          });
      
          calendar.render();
        });
      
      </script>

      
</head>
<body>

    <div id = "header1">
        <a href="#">HoY</a>
    </div>
    <div id ="calendar_container">
            <div id='calendar'></div>
    </div>

        <!--=============== 독바 ===============-->
        <header class="header" id="header">
                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item">
                            <a href="#chat" class="nav__link" id="chat">
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
                            <a href="#leaderboard" class="nav__link">
                                <span class="material-icons-outlined md-36">leaderboard
                                </span>
                            </a>
                        </li>
                        
                        <li class="nav__item">
                            <a href="#person" class="nav__link">
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