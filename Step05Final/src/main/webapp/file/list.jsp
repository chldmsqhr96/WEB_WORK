<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum="1";
	}
	
	int pNum = Integer.parseInt(pageNum);
	int amount = pNum * 10;

	List<FileDto> list = FileDao.getIns().getList(pNum, amount);

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
	<div class="container">
		<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드 하기</a>
		<br>
		<a href="${pageContext.request.contextPath}/file/private/upload_form2.jsp">ajax 업로드</a>
		<h1>자료실 목록입니다.</h1>
		<table class="table table-striped border border-2 mt-3">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
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
			<%for(int i=1; i<=10; i++){%>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%=i%>"><%=i%></a>
				</li>
			<%}%>
		</ul>
	</div>
</body>
</html>