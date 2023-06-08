<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//수정할 회원 정보 불러오기
	String id=(String)session.getAttribute("id");
	String email=request.getParameter("email");
	
	//프로필 이미지 경로 읽어오기
	String profile=request.getParameter("profile");
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setEmail(email);
	
	//만일 profile 이미지를 등록했다면(profile 이미지가 empty가 아니라면)
	if(!profile.equals("empty")){
		//dto에 전송된 프로필 이미지 경로를 담아준다.
		dto.setProfile(profile);
	}
	
	//db에 수정 반영하기
	boolean isSuc = UsersDao.getIns().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>프로필 사진 업데이트</title>
</head>
<body>
	<script>
		<%if(isSuc){%>
			alert("수정 했습니다.")
         	location.href="info.jsp";
		<%}else{%>
			alert("수정 실패")
			location.href="updateform.jsp";
		<%}%>
	</script>
</body>
</html>