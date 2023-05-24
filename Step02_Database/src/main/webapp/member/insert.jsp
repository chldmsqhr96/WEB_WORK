<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		1. post 방식으로 전송되는 회원의 이름, 주소를 추출한다.
		2. 이를 db(memberDao)에 저장한다
		3. 응답한다.
	*/
	
	//post 방식은 인코딩 선언을 해주어야 한다.
	request.setCharacterEncoding("utf-8");

	//String으로 parameter값을 받는다.
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");

	//입력받은 값을 MemberDto 객체에 담는다.
	MemberDto dto = new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	
	//DB에 저장
	MemberDao dao = MemberDao.getInstance();
	boolean isSuccess = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>추가</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
 integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
	<div class="container mt-5">
		<h1>알림</h1>
		<%if(isSuccess){%>
			<p class="alert alert-primary">
				<strong><%=name%></strong>님의 정보가 저장되었습니다.
				<a class="alert-link" href="list.jsp">확인</a>
			</p>
		<%}else{%>
			<p class="alert alert-warning">
				회원 정보 저장 실패..
				<a class="alert-link" href="insertform.jsp">다시 작성</a>
			</p>
		<%}%>
	</div>
</body>
</html>