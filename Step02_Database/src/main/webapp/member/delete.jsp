<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	boolean isSuccess = MemberDao.getInstance().delete(num);
	
	/*
	3. 리다일렉트 응답
	
	[리다일렉트 응답?]
	 - 클라이언트에게 특정 경로로 요청을 다시 하라고 응답하는 것.
	 - 다시 요청할 경로를 전달하면 클라이언트가 해당 경로로 요청을 다시 하게 된다.
	 - 따라서 순간적으로 페이지가 이동되게 된다.
	 - httpServletResponse 객체의 기능을 활용한다.
	 - 요청을 다시할 경로로 전달할때는 반드시 절대경로로 전달하는 것이 좋다.
	 - 새로운 경로로 요청을 다시 하라고 강요하는 것도 응답이다.
	 */
	 
	String cPath = request.getContextPath(); // 컨텍스트 경로는 절대로 하드 코딩하지 말자. 나중에 수정하기 힘들어진다.
	response.sendRedirect(cPath+"/member/list.jsp");
%>