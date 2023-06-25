<%@page import="kr.smhrd.mapper.MyCalendarVO"%>
<%@page import="kr.smhrd.mapper.MychallengesVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@page import="kr.smhrd.mapper.MemberVO"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
 <%	MemberVO vo = (MemberVO) session.getAttribute("mb_vo");%>
     <%MyCalendarVO mc = new MyCalendarVO();
     %>


     
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
    <!-- 푸시가 안돼서 추가하고 다시 푸시할 예정! -->

    <!-- 호이 폰트 -->  
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Righteous&display=swap" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet"> 
      <!-- 아이콘 rel -->

      <!-- fullcalendar API -->

    <link href='resources/lib/main.css' rel='stylesheet'>
    <script src="resources/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
	<script src="resources/js/bootstrap-modal-wrapper-factory.js"></script>
    <script src='resources/lib/main.js'></script>

<script>
// 페이지를 켜면 바로 실행되는 ajax 함수
window.onload = function loadJson() {
	$.ajax({
		url : "${cpath}/MyCalenderAjax.do",
		type : "GET",
		dataType : "json",
		success :
			function(events){
				console.log(events)
		          var calendarEl = document.getElementById('calendar');
				var eventarr = []
				// 왜 뻥션에 다타로 들어오나?
		      	events.forEach(function(data,i){ 		
		      		ev = {  start : data['mood_date'],
		      				seq : data['mood_seq'],
		      				title : data['mood_type'],
		      				cloud : data['wordcloud'] 
		      		};
		      	// vo로 받아온 정보를 api에서 요구하는 형태로 바꿔주기 위해 바꿔준 부분
		      		eventarr.push(ev);
		      	})
		      	console.log(eventarr);
				//확인부분
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
		            editable: true,
		            selectable: true,
		            nowIndicator: true,
		            dayMaxEvents: true, // allow "more" link when too many events
		           
		            // 이벤트 정보에 추출해준 정보를 담아줌
		            events: eventarr,
		            eventContent: function(arg) {
		            	  let italicEl = document.createElement('img')
							// 그냥변수이름        이미지 태그를 만들어주기 위해 들어가는 부분
		            	  if (arg.event.title == 0) {
		            	    italicEl.src = 'resources/img/emoji_smile.svg'
		            	  } else if(arg.event.title == 1){
		            	    italicEl.src = 'resources/img/emoji_angry.svg'
		            	  }else if(arg.event.title == 2){
		            		  italicEl.src = 'resources/img/emoji_sad.svg'  
		            	  }else{
		            		  italicEl.src = 'resources/img/emoji_happy.svg'
		            	  }
		            	  italicEl.style.width= '100%';
		            	  italicEl.addEventListener('click', function() {
		            		  console.log(arg.event);
		            		  //BootstrapModalWrapperFactory.alert("<img src=\""+arg.event.extendedProps.cloud+"\">");
		            		  BootstrapModalWrapperFactory.alert("<img src=\"resources/img/"+arg.event.extendedProps.cloud+"\" style=\"width:100%\">");
		            	  });


		            	  let arrayOfDomNodes = [ italicEl ]
		            	  return { domNodes: arrayOfDomNodes }
		            	}
		          });
		      
		          calendar.render();
		},
		error : function() {alert("error");
		}
	});
}

</script>

    <!-- 캘린더용 script 이동 노노  
    <script>
    <!--
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
            events:  [{title: '좋음',
                start: '2021-10-28'}]
          });
      
          calendar.render();
        });
      
      </script>-->

      
</head>
<body>

    <div id = "header1">
        <a href="main.do">HoY</a>
    </div>
    <div id ="calendar_container">
            <div id='calendar'></div>
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

        
            <script>
            var selected_icon = $('.nav__item a');
			selected_icon.click(function(){
				$(this).css('color','#1868FB');
				selected_icon.not($(this)).css('color','#52555A');
			});
        </script>


</body>
</html>