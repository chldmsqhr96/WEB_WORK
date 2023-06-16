<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	final int PAGE_ROW_COUNT=5;
	final int PAGE_DISPLAY_COUNT=5;
	int pageNum=1;
	
	String strPageNum=request.getParameter("pageNum");
	if(strPageNum != null){
		pageNum=Integer.parseInt(strPageNum);
	}
	
	//하단 시작 페이지 번호
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	//전체 글의 개수
	int totalRow = FileDao.getIns().getCount();
	//전체 패이지의 개수 구하기
	int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//페이지 끝의 번호가 전체 페이지 개수보다 크게 되었다면 잘못된 계산이다.
	if(endPageNum > totalPageCount){
		//보정해준다.
		endPageNum = totalPageCount;
	}
	
	int startRowNum = 1+(pageNum-1)*PAGE_ROW_COUNT;
	int endRowNum = pageNum * PAGE_ROW_COUNT;
	
	FileDto dto = new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	List<FileDto> list = FileDao.getIns().getList(dto);

	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자료실</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="file" name="current"/>
	</jsp:include>
	<div class="container">
		<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드 하기</a>
		<br>
		<a href="${pageContext.request.contextPath}/file/private/upload_form2.jsp">ajax 업로드</a>
		<h1>자료실 목록입니다.</h1>
		<table class="table table-striped border border-2 mt-3">
			<thead class="table-dark">
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>파일 사이즈</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(FileDto tmp : list){%>
				<tr>
					<td><%=tmp.getNum()%></td>
					<td><%=tmp.getWriter()%></td>
					<td><%=tmp.getTitle()%></td>
					<td><a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName()%></a></td>
					<td><%=tmp.getFileSize()%>byte</td>
					<td><%=tmp.getRegdate()%></td>
					<td>
					<!-- 문자열 비교는 반드시 equals를 사용하자, id는 null일
					 가능성이 있으므로 getWriter에 .을 찍어 equal를 사용하자 -->
					<%if(tmp.getWriter().equals(id)){%>
						<a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a>
					<%}%>
					</td>
				</tr>
				<%}%>
			</tbody>
		</table>
		<ul class="pagination">
			<%if(startPageNum != 1){/*startPageNum이 1이 아닌 경우에만*/%>
			<li class="page-item">
				<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1%>">Next</a>
			</li>
			<%}%>
			<%for(int i=startPageNum; i<=endPageNum; i++){%>
				<li class="page-item <%=i==pageNum ? "active" : ""%>">
					<a class="page-link" href="list.jsp?pageNum=<%=i%>"><%=i%></a>
				</li>
			<%}%>
			<%if(endPageNum < totalPageCount){/*endPageNum이 전체 페이지 개수보다 적은 경우에만*/%>
			<li class="page-item">
				<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1%>">Next</a>
			</li>
			<%}%>
		</ul>
	</div>
</body>
</html>