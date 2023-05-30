<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDto a = (MemberDto)request.getAttribute("mem");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 정보</title>
</head>
<body>
	<p>회원 정보 : <%=a.getNum() + " " + a.getName() + " " + a.getAddr()%></p>
</body>
</html>