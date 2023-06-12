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
		String cPath = request.getContextPath();
		response.sendRedirect(cPath+"/cafe/list.jsp");
	}
%>