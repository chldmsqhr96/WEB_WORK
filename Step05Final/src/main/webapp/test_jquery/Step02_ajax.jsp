<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ajax</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<h1>ajax 요청</h1>
	<button id="requestBtn">요청하기</button>
	<p id="ppp"></p>
	<script>
		$("#requestBtn").on("click", ()=>{
			$.ajax({
				url:"${pageContext.request.contextPath}/cafe/json_list2.jsp",//요청 url(해당 페이지로부터 정보를 받아옴)
				method:"get",//요청 방식(post, get 등)
				data:{//요청 파라미터(어떤 요소를 담아올지)
					pageNum:1//페이지 num1에 담긴 정보를 빼온다.
				},
				success:(data)=>{
					console.log(data);
				}
			})
		})
	</script>
</body>
</html>