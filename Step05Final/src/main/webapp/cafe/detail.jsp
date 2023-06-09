<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	int num = Integer.parseInt(request.getParameter("num"));
	CafeDto dto = CafeDao.getIns().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1><%=dto.getTitle()%></h1>
		<p>
			<%if(dto.getWriter().equals(id)){%>
				<a href="private/updateform.jsp?num=<%=num%>">수정</a>
			<%}%>
		</p>
		<p>
			<%if(dto.getWriter().equals(id)){%>
				<a href="private/delete.jsp?num=<%=num%>">삭제</a>
			<%}%>
		</p>
		<p>작성자 : <%=dto.getWriter()%></p>
		<p>작성일 : <%=dto.getRegdate()%></p>
		<p><%=dto.getContent()%></p>
	</div>
</body>
</html>