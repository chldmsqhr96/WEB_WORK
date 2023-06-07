<%@page import="test.file.dto.FileDto"%>
<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
1. 삭제할 파일 번호 얻기
2. 해당 파일을 파일 시스템에서 실제로 삭제
3. DB에서 해당 파일의 정보를 삭제
4. 응답
*/
	int num = Integer.parseInt(request.getParameter("num"));

	// FileDto dto 객체를 생성하면서 Filedao에 접근, dao의 getData() 메소드에 num인자를 넘겨 db에서 파일의 정보 조회
	FileDto dto = FileDao.getIns().getData(num);
	
	// session을 통해 id를 조회
	String id = (String)session.getAttribute("id");
	
	// id가 다르다면 삭제할 수 없게 에러 조건 생성
	if(!dto.getWriter().equals(id)){ // 문자열 비교는 .equals()로 하자
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "다른 사용자의 파일에 접근할 수 없습니다.");
	} else {
		// 파일의 저장된 이름으로 경로 설정
		String path=application.getRealPath("/upload")+File.separator+dto.getSaveFileName();
	
		// 파일 객체 생성(인자로 위에서 선언한 경로path를 받음)
		File f = new File(path);
	
		// 파일 삭제
		f.delete();
	
		//db에서 파일 삭제
		FileDao.getIns().delete(dto.getNum());
	
		//list.jsp로 리다일렉트
		String cPath = request.getContextPath();
		response.sendRedirect(cPath+"/file/list.jsp");
	}
%>