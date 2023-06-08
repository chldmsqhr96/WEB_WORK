<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container col-sm-6 mx-auto">
        <h1>다양한 form 디자인</h1>
        <form action="signup.jsp" method="post">
            <div class="form-floating">
                <input class="form-control mb-2" type="text" name="id" id="id" placeholder="아이디 입력">
                <label for="id">아이디를 입력해주세요</label>
            </div>
            <div class="form-floating">
                <input class="form-control mb-2" type="password" name="pwd" id="pwd" placeholder="비밀번호 입력">
                <label for="pwd">비밀번호를 입력해주세요</label>
            </div>
            <select name="job" id="job" class="form-select mb-2">
                <!--value가 ""인 경우 서버에서는 null로 받아들인다-->
                <option value="">직업 선택</option>
                <!--value가 없는 경우 option의 innerText가 서버에 전송된다-->
                <option value="piano">피아니스트</option>
                <option value="programmer">프로그래머</option>
                <option value="doctor">의사</option>
            </select>
            <fieldset class="mb-2">
                <!--legend는 fieldset의 전체적인 주제를 알려주는 역할을 한다-->
                <legend>성별 체크</legend>
                <div class="form-check-inline">
                    <input class="form-check-input" type="radio" id="one" name="gender" value="man" checked>
                    <label class="form-check-label" for="one">남자</label>
                </div>
                <div class="form-check-inline">
                    <!--input type radio 같은 경우 name의 value가 같을 때 그룹으로 묶인다-->
                    <input class="form-check-input" type="radio" id="two" value="woman" name="gender">
                    <label class="form-check-label" for="two">여자</label>
                </div>
            </fieldset>
            <fieldset class="mb-2">
                <legend>취미 체크</legend>
                <div class="form-check-inline">
                    <input type="checkbox" class="form-check-input" id="piano" name="hobby" value="piano">
                    <label for="piano">피아노</label>
                </div>
                <div class="form-check-inline">
                    <input type="checkbox" class="form-check-input" id="game" name="hobby" value="game">
                    <label for="game">게임</label>
                </div>
                <div class="form-check-inline">
                    <input type="checkbox" class="form-check-input" id="sing" name="hobby" value="sing">
                    <label for="sing">노래</label>
                </div>
                <div class="form-check-inline">
                    <input type="checkbox" class="form-check-input" id="draw" name="hobby" value="draw">
                    <label for="draw">그림그리기</label>
                </div>
            </fieldset>
            <div>
           		<label for="comment" class="form-label">하고 싶은 말</label>
           		<textarea class="form-control" name="comment" id="comment" rows="10"></textarea>
           	</div>
            <fieldset>
                <legend>개인정보 활용 동의</legend>
                <div class="form-check form-switch mb-2">
                    <input class="form-check-input" type="checkbox" id="allowAll" name="allowAll">
                    <label class="form-check-label" for="allowAll">전체 동의</label>
                </div>
                <div class="form-check form-switch">
                    <input class="form-check-input allow" type="checkbox" id="allowEmail" name="allowEmail" value="email">
                    <label class="form-check-label" for="allowEmail">이메일 수신 동의</label>
                </div>
                <div class="form-check form-switch mb-2">
                    <input class="form-check-input allow" type="checkbox" id="allowMessage" name="allowMessage" value="message">
                    <label class="form-check-label" for="allowMessage">광고 메세지 수신 동의</label>
                </div>
            </fieldset>
            <button class="btn btn-outline-primary" type="submit">가입</button>
        </form>
    </div>
    <script>
        (function () {
            document.querySelector("#allowAll").addEventListener("change", (e)=>{
                /*
                let cYes = e.target.checked;
                if (cYes) {
                    document.querySelector("#allowEmail").checked = true;
                    document.querySelector("#allowMessage").checked = true;
                } else {
                    document.querySelector("#allowEmail").checked = false;
                    document.querySelector("#allowMessage").checked = false;  
                }
                */

                const isChecked = e.target.checked;
                const allows = document.querySelectorAll(".allow");

                /*
                for (let i = 0; i < allows.length; i++) {
                    allows[i].checked = isChecked;
                }
                */
                allows.forEach((item)=>{
                    item.checked=isChecked;
                })
            })
        })();
	</script>
</body>
</html>