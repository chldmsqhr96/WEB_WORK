<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<String> list = (ArrayList<String>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>친구 목록</title>
</head>
<body>
	<ul>
		<%
			for(String tmp : list){ %>
				<li><%= tmp %></li>	
		  <%}
		%>
	</ul>
</body>
</html>