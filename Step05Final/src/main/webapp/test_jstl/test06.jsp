<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setAttribute("hobby", "game/programming/piano");
	request.setAttribute("friends", "김구라,해골,원숭이");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">       
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>test06</title>
</head>
<body>
	<!-- forTokens은 구분자를 기준으로 내용을 하나 씩 출력한다. -->
	<h1>forTokens 활용</h1>
	<h2>취미 목록</h2>
	<ul>
		<c:forTokens var="tmp" items="${hobby }" delims="/">
			<li>${tmp }</li>
		</c:forTokens>
	</ul>
	<ul>
		<c:forTokens var="tmp" items="${friends }" delims=",">
			<li>${tmp }</li>
		</c:forTokens>
	</ul>
	<ul>
		<c:forEach var="tmp" items="${friends }">
			<li>${tmp }</li>
		</c:forEach>	
	</ul>
</body>
</html>