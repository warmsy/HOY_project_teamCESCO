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
  </head>
  
  
  <body id = "login">
        <div class="container">
          <h1 class="login1">HoY에 오신걸 환영합니다 !</h1>
        </div>        
        <div class="container">
          <h1 class="login1">만나서 반갑습니다 :)</h1>
        </div>
      <div class="container">
      
      	<!--./ : 현재경로명시 / join.do 현재경로묵시   -->
          <form  action="./join.do" method="post">
          
              <span id="joinId">Id</span>
              <input type="text" id="joinid" name="mb_id" class="form-control">

              <span id="joinId">Password</span>
              <input type="password" id="inputPassword" name="mb_pwd" class="form-control" >
   			
   			 <span id="joinId">Gender</span><br>
              <div class="form-check">
              <input class="form-check-input" type="radio" name="mb_gender" value="f" checked>
            여성
              </div>
              <div class="form-check">
              <input class="form-check-input" type="radio" name="mb_gender" value="m">
            남성
           </div>
    
    			<span id="joinId">Age</span>
              <input type="text" id="inputPassword5" name="mb_age"  class="form-control" >
    
 			   <span id="joinId">Job</span>
              <input type="text" id="inputPassword5"  name="mb_job" class="form-control">
    
              <span id="joinId">Email address</span>
              <input type="email" id="inputPassword5" name="mb_email" class="form-control" >
    

              <span id="joinId">Nickname</span>
              <input type="text" id="inputPassword5" name="mb_nickname"  class="form-control" >
    
              
             <button type="submit" class ="btn" id="joinbtn">Join us</button>
          </form>
              </div>
         

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>