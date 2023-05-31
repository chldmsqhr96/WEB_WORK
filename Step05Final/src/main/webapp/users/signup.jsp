<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼 전송되는 회원 가입 정보 읽어오기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	//Dto에 담기
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	
	//Dao를 이용하여 DB에 저장
	boolean isSuc = UsersDao.getIns().insert(dto);

	//응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<title>회원 가입</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%if(isSuc==true){%>
			<p>
			    <strong><%=id%></strong>님 가입 되었습니다.
			    <a href="loginform.jsp">로그인 하러 가기</a>
		    </p>
		<%}else{%>
			<p>
				가입이 실패 되었습니다.
				<a href="signup_form.jsp">다시 가입하기</a>
			</p>
		<%}%>
	</div>
</body>
</html>