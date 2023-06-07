<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
</head>
<body>
	<div class="container col-sm-6 mx-auto">
		<form action="pwd.jsp" id="myForm">
			<div>
				<label class="label-control" for="oldpwd">기존 비밀번호</label>
				<input class="form-control" type="password" name="oldpwd" id="oldpwd"/>
			</div>
			<div>
				<label class="label-control" for="pwd">새로운 비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd"/>
			</div>
			<div class="mb-2">
				<label class="label-control" for="pwd2">비밀번호 확인</label>
				<input class="form-control" type="password" name="pwd2" id="pwd2"/>
			</div>
			<button class="btn btn-primary" type="submit">수정</button>
			<button class="btn btn-primary" type="reset">리셋</button>
		</form>
	</div>
	<script>
		document.querySelector("#myForm").addEventListner("submit", (e)=>{
			let pwd = document.querySelector("#pwd").value
			let pwd2 = document.querySelector("#pwd2").value
			
			if(pwd != pwd2){
				alert("새로운 비밀번호가 같지 않습니다.");
				e.preventDefault();
			}
		});
	</script>
</body>
</html>