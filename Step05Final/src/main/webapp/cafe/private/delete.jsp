<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	CafeDto dto = CafeDao.getIns().getData(num);
	boolean isSuc = false;

	String id = (String)session.getAttribute("id");
	
	if(!dto.getWriter().equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "다른 사용자의 게시글에 접근할 수 없습니다.");
	} else {
		isSuc = CafeDao.getIns().delete(dto.getNum());
	}
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
		<%=id%> 님이 작성하신 게시글이 삭제 되었습니다.
		<a href="${pageContext.request.contextPath}/cafe/list.jsp">게시판 목록으로 돌아가기</a>
	</p>
	<%}else{%>
	<p>
		게시글 삭제 실패
		<a href="../list.jsp">다시 시도</a>
	</p>
	<%}%>
</body>
</html>