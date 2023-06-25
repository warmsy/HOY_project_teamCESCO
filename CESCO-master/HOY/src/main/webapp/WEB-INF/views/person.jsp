<%@page import="kr.smhrd.mapper.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <!--  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
      rel="stylesheet"> 
  </head>
  <body id = "login">
  	<% MemberVO vo = (MemberVO) session.getAttribute("mb_vo");%>
    <div class="login_page">
        <div class="container" align ="center">
          <h1 class="login1"><span><%=vo.getMb_nickname() %>님의 회원정보 </span> </h1>
        </div>

		
		<div align="center" >
		<table class="per_T">
		<tr>
		<th>아이디</th>
		<td><%=vo.getMb_id() %></td>
		</tr>
		<tr>
		<th>닉네임</th>
		<td><%=vo.getMb_nickname() %></td>
		</tr>
		<tr>
		<th>성별</th>
		 <%if (vo.getMb_gender().equals("f")) {%>
	      <td>여성</td>   <%} %>
	      <% if(vo.getMb_gender().equals("m")) {%>
      	<td>남성</td>  <%} %>
		</tr>
		<tr>
		<th>나이</th>
		<td><%=vo.getMb_age() %></td>
		</tr>
		<tr>
		<th>이메일</th>
		<td><%=vo.getMb_email() %></td>
		</tr>
		<tr>
		<th>가입일자</th>
		<td><%=vo.getMb_joindate() %></td>
		</tr>
		</table>
		</div>
		
		
		
		
		<div class="container" id="loginform" align = "center">
			<form action="./reperson.do" method="post">
				<a href="reperson.do">
					<button type="button" class="join_btn">회원정보 수정</button>
				</a>
				<a href="main.do">
				<button type="button" class="join_btn" id="loginbtn">메인페이지로</button>
				</a>
					


			</form>
		</div>

	</div>


    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>