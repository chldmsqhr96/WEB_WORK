<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	int num = Integer.parseInt(request.getParameter("num"));
	CafeDto dto = CafeDao.getIns().getData(num);
	CafeDao.getIns().plusViewCount(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>페이지 상세 보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
	<nav aria-label="breadcrumb">
  		<ol class="breadcrumb">
    		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
    		<li class="breadcrumb-item"><a href="list.jsp">Cafe</a></li>
    		<li class="breadcrumb-item active">Detail</li>
  		</ol>
	</nav>
		<h3>페이지 상세 보기</h3>
		<table class="table table-bordered">
			<tr>
				<th>글번호</th>
				<td><%=dto.getNum()%></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter()%></td>
			</tr>
						<tr>
				<th>제목</th>
				<td><%=dto.getTitle()%></td>
			</tr>
						<tr>
				<th>조회수</th>
				<td><%=dto.getViewCount()%></td>
			</tr>
						<tr>
				<th>작성일</th>
				<td><%=dto.getRegdate()%></td>
			</tr>
			<tr>
				<td colspan="2">
					<div><%=dto.getContent()%></div>
				</td>
			</tr>
		</table>
		<%if(dto.getWriter().equals(id)){%>
			<a href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a>
			<a href="javascript:" onclick="deleteConfirm()">삭제</a>
			<script>
				function deleteConfirm(){
					const isDelete=confirm("이 글을 삭제 하시겠습니까?");
					if(isDelete){
						location.href="private/delete.jsp?num=<%=dto.getNum()%>";
					}
				}
			</script>
		<%}%>
	</div>
</body>
</html>