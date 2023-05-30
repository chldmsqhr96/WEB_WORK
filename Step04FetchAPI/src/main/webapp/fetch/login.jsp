<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//utf-8 활성
	request.setCharacterEncoding("utf-8");

	//id, pwd 추출
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//아이디 비밀번호 유효한지 확인(gura, 1234가 맞는지)
	boolean isValid = false;
	if(id.equals("gura")&&pwd.equals("1234")){
		isValid=true;
	}
%>
{"isSuccess":<%=isValid%>}