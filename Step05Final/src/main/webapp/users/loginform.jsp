<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>로그인 폼</h1>
		<form action="login.jsp" method="post">
			<div>
				<label for="id" class="form-label">아이디</label>
				<input type="text" class="form-control" name="id" id="id"/>
			</div>
			<div>
				<label for="pwd" class="form-label">비밀번호</label>
				<input type="password" class="form-control" name="pwd" id="pwd"/>
			</div>
			<button class="btn btn-primary" type="submit">확인</button>
		</form>
	</div>
</body>
</html>