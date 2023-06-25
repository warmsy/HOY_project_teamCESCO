<%@page import="kr.smhrd.mapper.MemberVO"%>
<%@page import="kr.smhrd.mapper.MyCalendarVO"%>
<%@page import="kr.smhrd.mapper.MychallengesVO"%>
<%@page import="kr.smhrd.mapper.ChallengesVO"%>
<%@page import="kr.smhrd.mapper.mychMapper"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />    
<!-- AJAX 쓸때 cpath 안쓰면 큰일남! 근데 왜써야되는거지,,? > root_context 경로를 명시해주는 부분! 순서대로 ㄸ쭛ㄱ 내려가라! -->


<!DOCTYPE html>
<html lang="ko">
     <%	MemberVO vo = (MemberVO) session.getAttribute("mb_vo");%>
     <%MyCalendarVO mc = new MyCalendarVO();
     %>
     <%MychallengesVO mch = new MychallengesVO(); %>
	<%ChallengesVO ch = new ChallengesVO();%>
     
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
    <!--  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
      rel="stylesheet"> 
      <!-- 아이콘 rel -->
    <script src="https://kit.fontawesome.com/7a90eb5fa4.js" crossorigin="anonymous"></script>

      <!-- fullcalendar API -->

    <link href='resources/lib/main.css' rel='stylesheet' />
    <script src='resources/lib/main.js'></script>

    <script>
	    /* 바 그래프 JS */
window.onload = function loadJson() {
         $.ajax({
            url : "./countingemotionsAjax.do",
            //./countingemotionsAjax.do 이렇게도 써도 실행은 되는데 되도록 경로를 명시해주기 위해 cpqth써주는거 
            type : "GET",
            dataType : "json",
            success : function(vo){ // funtion 받을 때 괄호안에 넣어주는 것은 변수 이름!
               console.log(vo)
               var staticsEl = document.getElementById('chartContainer');
               
               // VO로 받아온 값은 VO에 저장되는거임! 내가 헷갈렷던것 > VO의 저장소와 DB의 저장소를 똑같이 생각해버린게 실수였다
               
                ev = [{y :vo['emotion0']},
                      {y : vo['emotion1']},
                      {y : vo['emotion2']},
                      {y : vo['emotion3']}];
                // 이 코드에서는 y값에 값 하나만 넣어줘도 되서 ev를 굳이 쓸 필요는 없음 
               // 여기에서도 api에서 요구한 구성이랑 유사하게 변환해주는 작업을 거쳤지만 단일값(y)만 넘겨줘서 굳이 리스트를 쓸 필요없었음
               var chart = new CanvasJS.Chart(staticsEl, {
                  animationEnabled: true,
                     axisY:{
                         interlacedColor: "#fff",
                         tickLength: 0,
                         lineColor:"#fff",
                         gridColor:"#fff",
                         tickColor:"#fff",
                           labelFontColor:"#fff",
                         labelFontSize: 1
                        },
                        axisX:{
                         labeleFontFamily:"arial",
                         labelFontWeight:"bold",
                         interlacedColor: "#fff",
                         tickLength: 10,
                         lineColor:"#fff",
                         tickColor:"#fff",
                         labelFontSize: 40
                        },
                        legend: {
                            verticalAlign: "bottom",
                            horizontalAlign: "center"
                          },
                       
                  data: [{        
                     type: "column",  
                     showInLegend: true, 
                     legendMarkerColor: "#52555A",/* title color */
                     dataPoints: [      
                        { y: vo['emotion0'], label: "😊",color: "#FFD400" },
                        { y: vo['emotion1'],  label: "😡",color: "#FF878E" },
                        { y: vo['emotion2'],  label: "😢",color: "#63D0FF" },
                        { y: vo['emotion3'],  label: "😝",color: "#FFB9EB" },
                     ] // 만약에 여기서 lable, color 코드도 다 출력해준다면 ev를 불러왔겟지마는 y부분만 바꿔줘서 
                     //vo['emo~']이케 처리해줌
                     // 키값으로 value를 호출했던것처럼 emotion0의 값을 불러와줌
                  }],
                        
                
               });
               chart.render();
               
            },
            error : function(code,error,a) {console.log(code,error,a);
            		/* $.ajax({  
						     type: "POST", 
						     url: "/region/regionCityChange",  
						     data: param,   //&a=xxx 식으로 뒤에 더 붙이면 됨
						     dataType: "text",
						     success: siguResult,
						     error:function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						       }
						     }
						 );
						와 같이 작성 하면 error 에서 에러가 왜 발생 했는지 알려 준다.
						나 같은 경우 200 코드 (성공) 이 뜨는데 dataType 을 잘 못 받고 있어서
						success 함수로 나오지 않는 것을 에러 수정 할 수 있었다.
						
						출처: https://shonm.tistory.com/454 [정윤재의 정리노트] */		
            }
         });
      }
   
   
</script>
    
</head>
<body>

    <div id = "header1">
        <a href="main.do">HoY</a>
    </div>
    <div id ="statics_container">
        <div class="monthly_mood">
            <h2>monthly mood</h2>
            <div id="chartContainer">
            </div>
        </div>
    </div>
    
    <div id ="statics_container2">
        <div id="monthly_mood"><!-- 아이디 바꿔야됨 -->
            <h2>monthly Challenge</h2>
            <ul class="static_list">
            	<li>
            		<div><img src="resources/img/category_exercise.svg" alt="click">

            		<div><span>달성 횟수 : ${list1[0].kind1} 회</span>
            			 <span>도전 횟수 : ${list2[0].kind1} 회</span>

            	    </div>
            		</div>
            	</li>
            	<li>
            		<div><img src="resources/img/category_self.svg" alt="click">
            		<div><span>달성 횟수 : ${list1[0].kind2} 회</span>
            			 <span>도전 횟수 : ${list2[0].kind2} 회</span>
            	    </div>
            		</div>
            	</li>
            	<li>
            		<div><img src="resources/img/category_everyday.svg" alt="click">
            		<div><span>달성 횟수 : ${list1[0].kind3} 회</span>
            			 <span>도전 횟수 : ${list2[0].kind3} 회</span>
            	    </div>
            		</div>
            	</li>
            	
            	<li>
            		<div><img src="resources/img/category_ing.svg" alt="click">
            		<div><span id="k2"></span>
            			 <span id="k1"></span>
            	    </div>
            		</div>
            	</li>
            <%--	<li>
            
 <!-- mychallenges 테이블에서 kind로 도전카테고리 종류 찾고 / mc_success 성공조건>달성횟수 / 전체개수 > 도전횟수 -->
            		<div><img src="resources/img/category_self.svg" alt="click">
            		<div><span>달성 횟수 : ${list[0].suc_num}회</span>
            			 <span>도전 횟수 :  ${list[0].ch_num}회</span>
            	    </div>
            		</div>
            	</li>
            	<li>
            		<div><img src="resources/img/category_everyday.svg" alt="click">
            		<div><span>달성 횟수 : 0회</span>
            			 <span>도전 횟수 : 1회</span>
            	    </div>
            		</div>
            	</li>
            	<li>
            		<div><img src="resources/img/category_ing.svg" alt="click">
            		<div><span>달성 횟수 : 0회</span>
            			 <span>도전 횟수 : 3회</span>
            	    </div>
            		</div>
            	</li> --%>
            
            </ul>

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
   

		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script><!-- 차트 js -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>  
        <script src="resources/js/jquery-3.6.0.min.js"></script>
            <script>
            var selected_icon = $('.nav__item a');
			selected_icon.click(function(){
				$(this).css('color','#1868FB');
				selected_icon.not($(this)).css('color','#52555A');
			});


        </script>

    <script >
    var k1 = parseInt(${list2[0].kind1})+parseInt(${list2[0].kind2})+parseInt(${list2[0].kind3});
    var k2 = parseInt(${list1[0].kind1})+parseInt(${list1[0].kind2})+parseInt(${list1[0].kind3});
    console.log(k1,123);
    document.getElementById('k2').innerHTML="달성 횟수 : "+k2+" 회";
    document.getElementById('k1').innerHTML="도전 횟수 : "+k1+" 회";
    </script>

</body>
</html>