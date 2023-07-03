<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>effect</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<style>
	.box{
		width:100px;
		height:100px;
		background-color:yellow;
		border:1px solid red;
	}
</style>
</head>
<body>
	<button id="hideBtn">숨기기</button>
	<button id="showBtn">보이기</button>
	<button id="toggleBtn">토글</button>
	<div class="box"></div>
	<script>
		$("#hideBtn").on("click", ()=> {
			$(".box").hide();
		});
		$("#showBtn").on("click", ()=> {
			$(".box").show();
		});
		$("#toggleBtn").on("click", ()=>{
			$(".box").toggle();
		});
		
		//위의 코드가 css(display, none)과 다른 점은 요소 자체가 아예 선택되지 않는다는 점이다.
		//toggle은 처음 누르면 요소가 없어지고, 다시 누르면 요소가 나타나는 동작을 한다.
	</script>
</body>
</html>