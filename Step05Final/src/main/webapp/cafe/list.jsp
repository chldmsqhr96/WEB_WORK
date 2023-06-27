<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
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

	int startRowNum = 1+(pageNum-1)*PAGE_ROW_COUNT;
	int endRowNum = pageNum * PAGE_ROW_COUNT;
	
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	int totalRow = CafeDao.getIns().getCount();
	int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);

	if(endPageNum > totalPageCount){
		endPageNum = totalPageCount;
	}

	CafeDto dto = new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);

	List<CafeDto> list = CafeDao.getIns().getList(dto);
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="cafe" name="current"/>
	</jsp:include>
	<div class="container">
		<h1>게시글 목록 입니다.</h1>
		<a href="private/insertform.jsp">게시글 작성</a>
		<table class="table table-striped-columns">
			<thead class="table-dark">
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<%for(CafeDto tmp : list){%>
					<tr>
						<td><%=tmp.getNum()%></td>
						<td><%=tmp.getWriter()%></td>
						<td><a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle()%></a></td>
						<td><%=tmp.getViewCount()%></td>
						<td><%=tmp.getRegdate()%></td>
					</tr>
				<%}%>
			</tbody>
		</table>
		<nav>
			<ul class="pagination">
				<%if(startPageNum != 1){/*startPageNum이 1이 아닌 경우에만*/%>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1%>">Preview</a>
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
		</nav>
	</div>
</body>
</html>