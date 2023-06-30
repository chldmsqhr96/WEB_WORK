<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Example</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
</head>
<body>
	<div class="container">
		<h1>ajax 요청을 통해 바당온 데이터 사용하기</h1>
		<p>페이지 전환없이 서버에서 요청하는 것을 ajax라고 생각하면 된다.</p>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>타이틀</th>
				</tr>
			</thead>
			<tbody id="one">
			</tbody>
		</table>
		<nav>
			<ul class="pagination">
			</ul>
		</nav>
	</div>
	<script>
		//매개변수에 전달되는 페이지 번호에 해당하는 정보를 요청하는 함수
		function req(pageNum){
			//clear로 append한 내용이 중첩 추가되는 것을 막는다.
         	$("#one").text("");
         	$(".pagination").text("");
			
			$.ajax({
				url:"${pageContext.request.contextPath}/cafe/json_list2.jsp",
				method:"get",
				data:{pageNum},
				success:(data)=>{
					//글 목록
					const list = data.list;
					//item에는 글 하나의 정보가 들어있다.
					list.forEach((e)=>{
						$("<tr>")
						.append($("<td>").text(e.num))
						.append($("<td>").text(e.writer))
						.append($("<td>").text(e.title))
						.appendTo("#one");
					})
					
					const temp=`
						<li class="page-item">
							<a class="page-link" herf="javascript:"></a>
						</li>
					`
					
					if(data.startPageNum!=1){
						$(temp).find("a").text("Prev").click(()=>{
							req(data.startPageNum-1);
						}).parent().appendTo(".pagination");
					}
					
					//반복문 돌면서 페이지 출력하기
					for(let i = data.startPageNum; i<=data.endPageNum; i++){
						$(temp).find("a").text(i).addClass(pageNum == i ? "active" : "").click(()=>{
							req(i);
						}).parent().appendTo(".pagination");
					}
					
					if(data.endPageNum < data.totalPageCount){
						$(temp).find("a").text("Next").click(()=>{
							req(data.endPageNum+1);
						}).parent().appendTo(".pagination");
					}
				}
			})
		}
		
		//페이지 로딩시점에 1페이지 내용을 요청한다	
		req(1);
	</script>
</body>
</html>