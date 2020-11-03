<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정규표현식을 활용한 유효성 검사</title>
<style>
	#msg{
		color:#FF1744;
	}
	#msg.ok{
		color:#2979FF;
	}
</style>
</head>
<body>
	<h1>회원가입</h1>
	<input id="nickname"/>
	<p id="msg">2~8자 까지 한글 및 숫자로 입력해주세요.</p>
<script src="/js/jquery.js"></script>
<script>
	const nicknameExp = /^[ㄱ-힣]{1}[ㄱ-힣|\d]{1,7}$/;
	const $nickname = $("#nickname");
	$nickname.keyup(function(){
		//input 요소
		const val = $nickname.val();
		//msg 출력하는 p요소
		const $msg = $("#msg");
		if(nicknameExp.test(val)){
			$msg.addClass("ok").text("닉네임 가능합니다.");
		}else{
			$msg.removeClass("ok").text("2~8자 까지 한글 및 숫자로 입력해주세요.");
		}
	});//keyup end
</script>
</body>
</html>