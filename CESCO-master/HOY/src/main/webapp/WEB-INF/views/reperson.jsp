<%@page import="kr.smhrd.mapper.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">

    <!-- 호이 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Righteous&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
      rel="stylesheet">
      <script type="text/javascript">
 
/* function checkfield(){
 
if(document.reperson.mb_pwd.value==""){
 alert("비밀번호를 입력하세요"); 
 document.reperson.pw.focus(); 
 history.go(-1);
 } */
 /* else if(document.addjoin.pw2.value==""){
 alert("비밀번호확인을 입력하세요");
 document.addjoin.pw2.focus();
 exit;
 } */
/*  else if(document.reperson.name.value==""){
 alert("이름을 입력하세요");
 document.reperson.name.focus();
 exit;
 
 }else if(document.addjoin.nick.value==""){
 alert("닉네임을 입력하세요");
 document.addjoin.nick.focus();
 exit;
 
 }else if(document.addjoin.addr.value==""){
 alert("주소를 입력하세요");
 document.addjoin.addr.focus();
 exit;
 
 }else if(document.addjoin.email.value==""){
 alert("이메일을 입력하세요");
 document.addjoin.email.focus();
 exit; 
 
 }*/
 
/*  
 if(document.reperson.pw.value!=document.reperson.pw2.value){
 //비밀번호와 비밀번호확인의 값이 다를 경우
 
 alert("입력한 2개의 비밀번호가 일치하지 않습니다.");
 document.addjoin.pw.focus();
 exit;
 } */
 
 
 
 /* var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
 
 if(exptext.test(document.reperson.email.value)==false){
 //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
 
 alert("이 메일형식이 올바르지 않습니다.");
 document.reperson.email.focus();
 exit;
 }
  */
/*  document.reperson.submit();
 
} */
</script> 
  </head>

  
  <body id="login">
    <% MemberVO vo = (MemberVO) session.getAttribute("mb_vo");%>
        <div class="container" align="center">
          <h1 class="login1">회원정보 수정</h1>
        </div>
	<script type="text/javascript">		
		function checkfield() {

			if (document.reperson.mb_pwd.value == "") {
				alert("비밀번호를 입력하세요");
				document.reperson.mb_pwd.focus();
				return false;
			} else if (document.reperson.mb_email.value == "") {
				alert("이메일을 입력하세요");
				document.reperson.mb_email.focus();
				return false;
			} else if (document.reperson.mb_nickname.value == "") {
				alert("닉네임을 입력하세요");
				document.reperson.mb_nickname.focus();
				return false;
			} else {
				return true;
			}
		}
	</script>
	<div class="container">

		<!--./ : 현재경로명시 / join.do 현재경로묵시   -->
		<form action="./reperson.do" name="reperson" method="post">

			<span id="joinId">Id</span>
				<input type="text" id="joinid"	value="<%=vo.getMb_id() %>" class="form-control" name="mb_id" readonly /> 
			<span id="joinId">Password  *</span> 
				<input type="password" id="inputPassword" name="mb_pwd" class="form-control"> 
			<span id="joinId">Gender</span><br>
			<div class="form-check"> <input class="form-check-input" type="radio" name="mb_gender" value="f" checked> 여성 </div>
			<div class="form-check"> <input class="form-check-input" type="radio" name="mb_gender" value="m"> 남성 </div>

			<span id="joinId">Age</span> 
			<input type="text" id="inputPassword5"	value="<%=vo.getMb_age() %>"name="mb_age" class="form-control"> 
			<span id="joinId">Job</span>
			<input type="text" id="inputPassword5" value="<%=vo.getMb_job() %>" name="mb_job" class="form-control"> 
			<span id="joinId">Email address  *</span>
			<input type="email" id="inputPassword5" value="<%=vo.getMb_email() %>" name="mb_email"	class="form-control"> 
			<span id="joinId">Nickname</span> 
			<input type="text" id="inputPassword5" value="<%=vo.getMb_nickname() %>" name="mb_nickname"	class="form-control"> 
			
				<button type="submit" class="btn" id="joinbtn" onclick="return checkfield();">변경 완료</button>
				 <button type="button" class="bbtn"  id = "joinbtn" onclick="history.back()">뒤로가기</button>
		</form>
	</div>
	


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>