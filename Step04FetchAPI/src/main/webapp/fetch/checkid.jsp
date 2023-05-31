<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//get 방식 파라미터로 전달되는 아이디 읽기
	String inputId = request.getParameter("inputId");
	//db에 이미 존재하는 아이디인지 확인하고 사용 가능 여부 판별
	boolean canUse = true;
	if(inputId.equals("gura") || inputId.equals("monkey")) {
		canUse = false;
	}
	//json으로 사용 가능 여부를 응답한다.
%>
{"canUse":<%=canUse%>}