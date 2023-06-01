<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 가입 form</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
</head>
<body>
    <div class="container col-sm-6 mx-auto">
        <h1>회원 가입 form</h1>
        <form action="signup.jsp" method="post">
            <div>
                <label for="id">아이디</label>
                <input class="form-control" type="text" name="id" id="id">
                <div class="form-text">
                	4글자 이상 10글자 이하로 작성해 주세요.
                </div>
                <div class="invalid-feedback">
                    사용할 수 없는 아이디입니다.
                </div>
            </div>
            <div>
                <label for="email" class="form-label mt-2">이메일</label>
                <input type="text" id="email" name="email" class="form-control">
                <div class="invalid-feedback">
                    이메일 형식에 맞게 입력해 주세요.
                </div>
            </div>
            <button class="btn btn-dark btn-sm mt-3" type="submit" disabled="disabled">가입</button>
        </form>
    </div>
    <script>
        (function () {
            // 페이지 로딩 시점에 상태값을 관리할 변수를 만들고 초기값을 부여한다.
            let isFormValid = false;
            let isIdValid = false;
            let isEmailValid = false;
            let isIdLength = false;

            document.querySelector("#id").addEventListener("input", (e)=>{
                const inputId = e.target.value;
                /*
            	const isLength = inputId.length;
            	if(4 <= isLength && isLength <= 10){
            		isIdLength = true;
            	} else {
            		isIdLength = false;
            	}
            	*/
            	
            	const isLengthOk = (4 <= inputId.length) && (inputId.length <= 10);
            	if(!isLengthOk){
            		isIdValid=false;
                    e.target.classList.add("is-invalid");
                    e.target.classList.remove("is-valid");
                    buttonChange();
                    return;
            	}
            	
            	
                // fetch()를 이용해서 서버에 보낸다
                fetch("checkid.jsp?inputId="+inputId)
                .then(res=>res.json())
                .then((data)=>{
                	// 사용 가능 여부를 알아내서 동작
                	isIdValid = data.canUse   
                	
                	if(isIdValid/* && isIdLength*/){
                        e.target.classList.add("is-valid");
                        e.target.classList.remove("is-invalid");
                    }
                    else {
                        e.target.classList.add("is-invalid");
                        e.target.classList.remove("is-valid");
                    }
                	buttonChange()
                })
            });

            document.querySelector("#email").addEventListener("input", (e)=>{
                inputEmail = e.target.value;
                let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
                isEmailValid = regex.test(inputEmail);
                if(isEmailValid){
                    e.target.classList.add("is-valid");
                    e.target.classList.remove("is-invalid");
                }
                else {
                    e.target.classList.add("is-invalid");
                    e.target.classList.remove("is-valid");
                }
                buttonChange()
            });

            function buttonChange() {
                isFormValid = isIdValid && isEmailValid;
                if (isFormValid) {
                    document.querySelector("button[type=submit]").removeAttribute("disabled");
                }
                else {
                     document.querySelector("button[type=submit]").setAttribute("disabled", "disabled");
                }
            }
        })();
        </script>
</body>
</html>