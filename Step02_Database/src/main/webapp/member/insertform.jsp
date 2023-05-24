<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 정보 추가</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
 integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1 class="mb-1">회원 정보 추가</h1>
		<form action="insert.jsp" method="post">
			<div class="mb-2">
				<label for="name" class="form-label">이름 입력</label>
				<input type="text" id="name" name="name" placeholder="이름 입력..." class="form-control">
			</div>
			<div class="mb-2">
				<label for="addr" class="form-label">주소 입력</label>
				<input type="text" id="addr" name="addr" placeholder="주소 입력..." class="form-control">
			</div>
			<button type="sumbit" class="btn btn-success">회원 추가</button>
		</form>
		<a href="list.jsp">돌아가기..</a>
	</div>
</body>
</html>