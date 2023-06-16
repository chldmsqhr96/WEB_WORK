<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 읽어오기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String url = request.getParameter("url");
	String encodedUrl = URLEncoder.encode(url);
	
	// UsersDto에 담아서
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	
	// UsersDao에 전달 후 유효한 정보인지 확인
	boolean isValid = UsersDao.getIns().isValid(dto);
	/*
		유효한 정보면 로그인 처리 후 응답한다.
		유효한 정보가 아니라면 아이디  혹은 비밀번호를 확인하라고 응답한다.
		
		로그인 처리는 session scope에 "id"라는 키값으로 로그인된 아이디를 저장한다.
		여기서 session scope란 HttpSession객체의 setAttribute() 메소드를 이용하면서
		값을 저장하는 영역을 말한다.
	*/
	if(isValid){
		session.setAttribute("id", id);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<%if(isValid){%>
		<p class="alert alert-success">
			<strong><%=dto.getId()%></strong>님 로그인 되었습니다.
			<a href="<%=url%>">확인</a>
		</p>
		<%}else{%>
		<p class="alert alert-danger">
			아이디 혹은 비밀번호가 다릅니다.
			<a href="${pageContext.request.contextPath}/users/loginform.jsp?url=<%=encodedUrl%>">다시 시도</a>
		</p>
		<%}%>
	</div>
</body>
</html>