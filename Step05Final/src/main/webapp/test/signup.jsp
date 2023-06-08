<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String job = request.getParameter("job");
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");
	String hobbyR = "";
	
	if(hobby!=null){
		for(int i=0; i<hobby.length; i++){
			String tmp = hobby[i];
			hobbyR += tmp;
			if(i != hobby.length-1){
				hobbyR += "/";
			}
		}
	}
	
	// 문자를 문자열 배열로 만드는 메소드 split
	String[] result = hobbyR.split("/");
	
	// 특정한 문자가 포함되었는지 확인하는 메소드 contains
	boolean a = hobbyR.contains("");
	
	String allowE = request.getParameter("allowEmail");
	String allowM = request.getParameter("allowMessage");
	
	/*
		textarea 에 입력한 문자열은 개행, tab, 공백기호가 모두 포함되어 있다.
		해당 문자열을 DB 에 저장했다가 다시 불러와서 textarea 에 출력하고 싶으면
		textarea 의 innerText 에 출력하면 된다. 
	*/
	String comment = request.getParameter("comment");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>회원가입 결과</h1>
		<p>회원님의 정보를 성공적으로 저장했습니다.</p>
	</div>
	<div class="col-sm-6 mx-auto">
        <form action="signup.jsp" method="post">
            <div class="form-floating">
                <input class="form-control mb-2" type="text" name="id" id="id" placeholder="아이디 입력" value=<%=id%>>
                <label for="id">아이디를 입력해주세요</label>
            </div>
            <div class="form-floating">
                <input class="form-control mb-2" type="password" name="pwd" id="pwd" placeholder="비밀번호 입력" value=<%=pwd%>>
                <label for="pwd">비밀번호를 입력해주세요</label>
            </div>
            <select name="job" id="job" class="form-select mb-2">
                <!--value가 ""인 경우 서버에서는 null로 받아들인다-->
                <option value="">직업 선택</option>
                <!--value가 없는 경우 option의 innerText가 서버에 전송된다-->
                <option value="piano" <%=job.equals("piano") ? "selected" : ""%>>피아니스트</option>
                <option value="programmer" <%=job.equals("programmer") ? "selected" : ""%>>프로그래머</option>
                <option value="doctor" <%=job.equals("doctor") ? "selected" : ""%>>의사</option>
            </select>
            <fieldset class="mb-2">
                <!--legend는 fieldset의 전체적인 주제를 알려주는 역할을 한다-->
                <legend>성별 체크</legend>
                <div class="form-check-inline">
                    <input class="form-check-input" type="radio" id="one" name="gender" value="man" <%=gender.equals("man") ? "checked" : ""%>>
                    <label class="form-check-label" for="one">남자</label>
                </div>
                <div class="form-check-inline">
                    <!--input type radio 같은 경우 name의 value가 같을 때 그룹으로 묶인다-->
                    <input class="form-check-input" type="radio" id="two" value="woman" name="gender" <%=gender.equals("woman") ? "checked" : ""%>>
                    <label class="form-check-label" for="two">여자</label>
                </div>
            </fieldset>
            <fieldset class="mb-2">
                <legend>취미 체크</legend>
                <div class="form-check-inline">
                    <input type="checkbox" class="form-check-input" id="piano" name="hobby" value="piano"
                    	<%=hobbyR.contains("piano") ? "checked":""%>>
                    <label for="piano">피아노</label>
                </div>
                <div class="form-check-inline">
                    <input type="checkbox" class="form-check-input" id="game" name="hobby" value="game"
                    	<%=hobbyR.contains("game") ? "checked":""%>>
                    <label for="game">게임</label>
                </div>
                <div class="form-check-inline">
                    <input type="checkbox" class="form-check-input" id="sing" name="hobby" value="sing"
                    	<%=hobbyR.contains("sing") ? "checked":""%>>
                    <label for="sing">노래</label>
                </div>
                <div class="form-check-inline">
                    <input type="checkbox" class="form-check-input" id="draw" name="hobby" value="draw"
                    	<%=hobbyR.contains("draw") ? "checked":""%>>
                    <label for="draw">그림그리기</label>
                </div>
            </fieldset>
           	<div>
           		<label for="comment" class="form-label">하고 싶은 말</label>
           		<textarea class="form-control" name="comment" id="comment" rows="10"><%=comment%></textarea>
           	</div>
            <fieldset>
                <legend>개인정보 활용 동의</legend>
                <div class="form-check form-switch mb-2">
                    <input class="form-check-input" type="checkbox" id="allowAll" name="allowAll">
                    <label class="form-check-label" for="allowAll">전체 동의</label>
                </div>
                <div class="form-check form-switch">
                    <input class="form-check-input allow" type="checkbox" id="allowEmail" name="allowEmail" value="email"
                    	<%=allowE != null ? "checked" : ""%>>
                    <label class="form-check-label" for="allowEmail">이메일 수신 동의</label>
                </div>
                <div class="form-check form-switch mb-2">
                    <input class="form-check-input allow" type="checkbox" id="allowMessage" name="allowMessage" value="message"
                    	<%=allowM != null ? "checked" : ""%>>
                    <label class="form-check-label" for="allowMessage">광고 메세지 수신 동의</label>
                </div>
            </fieldset>
            <button class="btn btn-outline-primary" type="submit">가입</button>
        </form>
    </div>
    <script>
  
    </script>
</body>
</html>