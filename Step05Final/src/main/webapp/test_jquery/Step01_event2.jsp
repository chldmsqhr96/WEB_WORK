<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>event2</title>
<style>
	.active {
		border: 1px solid red;
		background-color: yellow;
	}
</style>
</head>
<body>
	<h1>이벤트 처리</h1>
	<ul id="myNav">
		<li><a href="#">one</a></li>
		<li><a href="#">two</a></li>
		<li><a href="#">three</a></li>
	</ul>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		//'#myNav a'는 #myNav의 자식 요소인 a를 지칭하는 것이다.
		$("#myNav a").on("focus", (e)=>{
			//parent는 대상의 부모 요소를 뜻한다. 앵커의 부모 요소인 li의 클래스에 관여하는 동작이다.
			$(e.target).parent().addClass("active");
		})
		/*blur는 포커스에서 벗어났을 때 일어나는 이벤트이다.*/
		$("#myNav a").on("blur", (e)=>{
			$(e.target).parent().removeClass("active");
		})
	</script>
</body>
</html>