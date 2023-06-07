<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String oldpwd = request.getParameter("oldpwd");
	String pwd = request.getParameter("pwd");
	
	boolean isSuc=false; // 작업의 성공 여부를 false로 초기화
	String currentPwd = UsersDao.getIns().getData(id).getPwd();
	
	if(currentPwd.equals(oldpwd)){
		UsersDto dto = new UsersDto();
		dto.setId(id);
		dto.setPwd(pwd);
		isSuc = UsersDao.getIns().updatePwd(dto);
	}
	
	if(isSuc){
		session.removeAttribute("id");
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
	<div class="container">
	<%if(isSuc){%>
		<p>
			비밀번호를 수정하고 로그아웃 되었습니다.
			<a href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
		</p>
	<%}else{%>
		<p>
			비밀번호를 다시 확인해주세요
			<a href="${pageContext.request.contextPath}/users/private/pwd_updateform.jsp">다시 시도</a>
		</p>
	<%}%>
	</div>
</body>
</html>