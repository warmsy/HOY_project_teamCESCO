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
    <script>
            $(function(){
                $('#camera').change(function(e){
                    $('#pic').attr('src', URL.createObjectURL(e.target.files[0]));
                });
            });
        </script>

</head>
<body>
<% MemberVO vo = (MemberVO) session.getAttribute("mb_vo");%>

    <div id = "header1">
        <a href="#">HoY</a>
    </div>
    <div>    
        <div class="container" id="challenge">
            <div class="chal_ing">
                <div class="chal_img_ing" id= "chal_img1">
                    <img src="${list[0].ch_img1}">
                </div>
                <div>
                    <h2>We Can challenge!</h2>
                    <p>${list[0].ch_content}</p>
                </div>
                <form action="./test.do" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="MAX_FILE_SIZE" value="1000">
                	<input type="hidden" name="mc_seq" value="${list[0].mc_seq}">
                	<input type="hidden" name="mb_id" value="<%=vo.getMb_id()%>">
       <!--  <input type="file" id="camera" name="file" capture="camera" accept="image/*"> -->
			        <input type="file" id="camera" name="file" capture="camera" accept="image/*">
			        <input type="submit" id="up" value="제출">
			        </form>
			        
			        <br/>
			        <img id="pic" style="width:50%;" />
                
            </div>
        </div>
    </div>
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

<%-- <script type="text/javascript">
window.onload = function fflask() {
	var text_data = "<%=vo.getMb_id()%>";
	var mcseq = ${list[0].mc_seq};
	//alert(text_data);
	//alert(mcseq);
    $.ajax({
        url: 'http://127.0.0.1:5000/hereFlask',
        type: 'post',
        data: {"mbid": text_data,
        		"mcseq": mcseq},
        datatype : "json",
        success: function (data) {
                alert("데이터 전송이 성공적으로 끝났을 때 실행");
                
            },
        error: function () {
			alert("젠장");
		}
        
    });
    
}

    </script> --%>
    
</body>
</html>