<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("nick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그아웃</title>
</head>
<body>
	<p>로그아웃 됐습니다.</p>
	<a href="${pageContext.request.contextPath}/">돌아가기</a>
</body>
</html>