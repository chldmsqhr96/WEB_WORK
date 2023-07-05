<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="js/jquery.datetimepicker.full.min.js"></script>
<link rel="stylesheet" href="css/jquery.datetimepicker.min.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<input type="text" id="one" placeholder="날짜 시간 선택"/>
	<input type="text" id="two" placeholder="날짜 선택"/>
	<input type="text" id="three" placeholder="시간 선택"/>
	
	<input type="date"/>
	<script>
		$.datetimepicker.setLocal("ko");
		$("#one").datetimepicker();
		$("#two").datetimepicker({
			timepicker:false;
		format:"Y.m.d"
		});
		$("#three").datetimepicker({
			datepicker:false,
			format:"H:i"
		})
	</script>
</body>
</html>