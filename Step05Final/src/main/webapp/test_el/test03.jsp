<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CafeDto dto = new CafeDto();
	dto.setNum(1);
	dto.setWriter("김구라");
	dto.setTitle("나는 구라다");

	request.setAttribute("dto", dto);
/* 여기까지는 서블릿 영역 */ %>
<!-- 여기서부터는 jsp 영역 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>test03</title>
</head>
<body>
	<div class="container">
		<% CafeDto result = (CafeDto)request.getAttribute("dto"); %>
		<p>글번호 : <%=result.getNum()%></p>
		<p>작성자 : <%=result.getWriter()%></p>
		<p>제목 : <%=result.getTitle()%></p>
		
		<h3>el 활용</h3>
		<p>글번호 : ${dto.getNum()}</p>
		<p>작성자 : ${dto.getWriter()}</p>
		<p>제목 : ${dto.title}</p>
	</div>
</body>
</html>