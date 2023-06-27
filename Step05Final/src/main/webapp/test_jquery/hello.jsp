<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jquery Test</title>

</head>
<body>
	<div class="container">
		<input type="text" id="inputMsg" placeholder="문자열 입력.."/>
		<button id="sendBtn">전송</button>
		<p id="result"></p>
	</div>
	<div>div1</div>
	<div class="my-class">div2</div>
	<div class="my-class">div3</div>
	<div id="one">div4</div>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		//JavaScript
		/*
		document.querySelector("#sendBtn").addEventListener("click", ()=>{
			let msg = document.querySelector("#inputMsg").value;		
			document.querySelector("#result").innerText = msg;
		});
		*/
		
		//Jquery (배열Array의 형태를 리턴) == document.querySelectorAll
		$("#sendBtn").on("click", ()=>{	//id가 sendBtn인 요소에 이벤트가 on되면 발생되는 이벤트
			const msg = $("#inputMsg").val(); // val == value
			$("#result").text(msg); // text == innerText?
		});
		
		/*
			$(선택자/ccs선택자와 동일).action()
		*/
		
		$("div")
		
	</script>
</body>
</html>