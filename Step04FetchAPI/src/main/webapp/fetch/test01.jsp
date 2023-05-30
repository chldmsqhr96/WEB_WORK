<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>테스트01</title>
</head>
<body>
	<h1>fetch 함수 테스트</h1>
	<button id="myBtn">눌러보셈</button>
	<a href="${pageContext.request.contextPath}/index.jsp">눌러보셈</a>
	<script>
		document.querySelector("#myBtn").addEventListener("click", ()=>{
			
			const msg = prompt("메세지 입력...");
			console.log("입력 완료");
			console.log("----");
			
			//fetch를 통해 index.jsp 페이지의 정보를 참조해온다.
			fetch("${pageContext.request.contextPath}/index.jsp").then(function(a){
				return a.text();
			}).then(function(a){
				console.log(a);
			})
		})
	</script>
</body>
</html>