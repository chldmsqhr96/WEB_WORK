<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	new DbcpBean();
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>index.jsp</title>
</head>

<body>
	<div class="Container">
		<h1>인덱스 페이지입니다.</h1>
		<ul>
			<li><a href="member/list.jsp">회원 목록보기</a></li>
		</ul>
	</div>
</body>
</html>