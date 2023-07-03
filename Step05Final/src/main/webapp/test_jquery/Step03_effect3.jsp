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
	.box2{
		width:100px;
		height:100px;
		background-color:yellow;
		border:1px solid red;
		/*
			transition 효과를 줄 수 있는 모든(all) 속성에 대해서 1초 동안 일정한 비율(linear)로 적용
		*/
		transition:all 1s linear;
	}
</style>
</head>
<body>
	<button id="hideBtn">숨기기</button>
	<button id="showBtn">보이기</button>
	<button id="toggleBtn">토글</button>
	<button id="moveBtn">움직이기</button>
	<button id="moveBtn2">움직이기2</button>
	<button id="moveBtn3">움직이기3</button>
	<button id="reset">버튼 위치 리셋</button>
	<div class="box"></div>
	<div class="box2"></div>
	<script>
		$("#hideBtn").on("click", ()=>{
			$(".box").fadeOut(1000, ()=>{
				alert("집보내줘");
			});
		});
		$("#showBtn").on("click", ()=>{
			$(".box").fadeIn({
				duration:2000,
				complete:()=>{
					alert("되겠냐?");
				}
			});
		});
		$("#toggleBtn").on("click", ()=>{
			$(".box").fadeToggle().fadeToggle();
		});
		
		//위의 동작들은 css3 도입 이후 잘 사용되지 않는다.
		//정확히는 트랜지션, 애니메이션 등의 기능이 css에 생기고 나서는 사용 빈도가 낮아졌다. 
		
		/*
			[실습]
			움직이기 버튼을 눌렀을 떄 .box div를 오른쪽으로 100px 움직이도록 해보세요.
			단, 1초에 동안 진행되도록 
		*/
		let num = 0;
		
		//animated를 이용한 실습
		$("#moveBtn").on("click", ()=>{
			$(".box").animate({marginLeft: "+=100px"}, 1000);
		});
		
		//setInterval을 이용한 실습
		$("#moveBtn2").on("click", ()=>{
			let seq = setInterval(function(){
				//num이라는 전역 변수에 1씩 증감하여
				num += 1;
				
				//만약 num이 101과 같거나 커지게 된다면
				if(num>=101){
					//리턴하여 setInterval을 중단시킨다.
					return;
				/*
				if(num==101){
					//clearInterval을 통해 중단시킨다.
					clearInterval(seq);
				*/
				}
				$(".box").css("margin-left", num+"px")
				}, 10);
		});
		
		//transition을 이용한 실습(css3 도입 이후)
		$("#moveBtn3").on("click", ()=>{
			$(".box2").css("margin-left","+=100px");
		});
		
		$("#reset").on("click", ()=>{
			$(".box").animate({
				marginLeft: "0px"
			}, 1000);
			$(".box2").animate({
				marginLeft: "0px"
			}, 1000);
		})
	</script>
</body>
</html>