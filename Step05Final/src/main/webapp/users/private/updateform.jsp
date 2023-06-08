<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	UsersDto dto = UsersDao.getIns().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>업데이트</title>
<style>
	#profileImage{
		width: 100px;
		height: 100px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	#imageForm{
		display: none;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>회원 정보 수정 폼입니다.</h1>
      	<a id="profileLink" href="javascript:">
         	<%if(dto.getProfile() == null){%>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
              <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
              <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
            </svg>
         	<%}else{ %>
            <img id="profileImage" src="${pageContext.request.contextPath }<%=dto.getProfile()%>">
         	<%} %>
      	</a>
      	<form action="update.jsp" method="post">
         	<input type="hidden" name="profile" 
            value="<%=dto.getProfile()==null ? "empty" : dto.getProfile()%>"/>
         	<div>
            	<label for="id">아이디</label>
            	<input type="text" id="id" value="<%=dto.getId() %>" readonly/>
         	</div>
         	<div>
            	<label for="email">이메일</label>
            	<input type="text" id="email" name="email" value="<%=dto.getEmail()%>"/>
         	</div>
         	<button type="submit">수정확인</button>
         	<button type="reset">취소</button>
      	</form>   
      	<form id="imageForm" action="profile_upload.jsp" method="post" enctype="multipart/form-data">
         	프로필 사진
         	<input type="file" id="image" name="image" accept=".jpg, .png, .gif, .GIF, .PNG, .JPG"/>
         	<button type="submit">업로드</button>
      	</form>
	</div>
	<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
	<script>
		//프로필 이미지링크 클릭하면
		document.querySelector("#profileLink").addEventListener("click", ()=>{
			//input type file을 강제로 클릭하게 한다
			document.querySelector("#image").click();
		})
		
		//프로필 이미지를 선택하면 실행할 함수 등록
		document.querySelector("#image").addEventListener("change", ()=>{
			//ajax에 전송할 참조값 생성
			const form = document.querySelector("#imageForm");
			//gura util의 함수를 이용해서 ajax전송
			ajaxFormPromise(form)
			.then(res=>res.json())
			.then((data)=>{
				//data는 {imagePath:"/upload/xxx.jpg"} 형식의 object이다.
				console.log(data);
				//input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
	            document.querySelector("input[name=profile]").value=data.imagePath;
	            // img 요소를 문자열로 작성한 다음 
	            let img=`<img id="profileImage" 
	               	src="${pageContext.request.contextPath }\${data.imagePath}">`;
	               	// jsp페이지가 해석하지 못하도록 data.imagePath앞에 역슬래시를 넣는다.
	            	//id 가 profileLink 인 요소의 내부(자식요소)에 덮어쓰기 하면서 html 형식으로 
	            	//해석해 주세요 라는 의미 
	            document.querySelector("#profileLink").innerHTML=img;
	         });
		});
	</script>
</body>
</html>