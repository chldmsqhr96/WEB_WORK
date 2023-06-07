<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인된 아이디
	String id = (String)session.getAttribute("id");

	// 파일을 저장할 서버에서의 실제 경로 구성
	String realPath = application.getRealPath("/upload");
	MultipartRequest mr = new MultipartRequest(request, 
			realPath,
			1024*1024*50,
			"utf-8",
			new DefaultFileRenamePolicy());
	
	// MultiPartRequest 객체의 메소드를 이용해서 폼전송된 내용을 추출
	String saveFileName = mr.getFilesystemName("image");
	
	// DB에 저장할 이미지 경로 구성
	String imagePath = "/upload/"+saveFileName;
	
	// DB에 수정 반영
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setProfile(imagePath);
	UsersDao.getIns().updateProfile(dto);
	
	//리다일렉트 응답
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/users/private/info.jsp");
%>