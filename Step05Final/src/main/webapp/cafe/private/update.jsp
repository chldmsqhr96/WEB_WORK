<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	CafeDto dto = CafeDao.getIns().getData(num);

	CafeDto dto2 = new CafeDto();
	dto2.setNum(num);
	dto2.setTitle(title);
	dto2.setContent(content);

	boolean isSuc = false;

	String id = (String)session.getAttribute("id");
	
	if(!dto.getWriter().equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "다른 사용자의 게시글에 접근할 수 없습니다.");
	} else {
		isSuc = CafeDao.getIns().update(dto2);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuc){%>
	<p>
		<%=id%> 님이 작성하신 게시글이 수정 되었습니다.
		<a href="${pageContext.request.contextPath}/cafe/list.jsp">게시판 목록으로 돌아가기</a>
	</p>
	<%}else{%>
	<p>
		게시글 수정 실패
		<a href="../list.jsp">다시 시도</a>
	</p>
	<%}%>
</body>
</html>