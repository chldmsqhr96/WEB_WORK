<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writer = (String)session.getAttribute("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	CafeDto dto = new CafeDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuc = CafeDao.getIns().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>업로드</title>
</head>
<body>
	<%if(isSuc){%>
	<p>
		<%=writer%> 님이 작성하신 <%=title%> 게시글이 업데이트 되었습니다.
		<a href="${pageContext.request.contextPath}/cafe/list.jsp">게시판 목록으로 돌아가기</a>
	</p>
	<%}else{%>
	<p>
		게시글 업로드 실패!
		<a href="insertform.jsp">다시 시도</a>
	</p>
	<%}%>
</body>
</html>