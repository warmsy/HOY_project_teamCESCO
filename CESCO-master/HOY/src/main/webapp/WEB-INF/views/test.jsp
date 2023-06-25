<%@page import="kr.smhrd.mapper.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
</script>
<body>
<% MemberVO vo = (MemberVO) session.getAttribute("mb_vo"); 
System.out.print(vo.getMb_id());%>
            
${test1} <!-- 파라미터를 이런식으로 입력 -->




</body>
</html>