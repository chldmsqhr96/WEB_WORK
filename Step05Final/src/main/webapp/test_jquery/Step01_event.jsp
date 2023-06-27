<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Event</title>
<style>
	.box {
		width:100px;
		height:100px;
		border:1px solid red;
	}
</style>
</head>
<body>
	<h1>이벤트 리스너 함수 등록</h1>
	<div class="box">1</div>
	<div class="box">2</div>
	<div class="box">3</div>
	<div class="box">4</div>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		/*.on()은 addEventListener와 같은 기능을 한다*/
		$(".box").on("mouseover", (e)=>{
			$(e.target).css("background-color","yellow").on("mouseout", (e)=>{
				$(e.target).css("background-color","white")
			})
		})
	</script>
</body>
</html>