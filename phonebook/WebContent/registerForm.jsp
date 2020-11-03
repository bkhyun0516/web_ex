<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>전화번호 입력페이지</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
	<link rel="stylesheet" href="css/form.css"/>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
	<h2><i class="fas fa-mobile-alt"></i> 전화번호 입력</h2>
	<div id="formBox">
		<form id="form" method="post" action="/register.bmj">
			<fieldset>
				<legend class="screen_out">전화번호 입력폼</legend>
				<div class="row">
					<label for="name">이 름</label>
					<input id="name" name="name"
						   title="2~6글자 한글과 숫자로만 입력해주세요."
						   placeholder="이름입력" />
				</div>
				<div class="row">
					<label for="phone">전화번호</label>
					<span id="phone">
				<select id="phone1"  name="phone1"
						title="반드시 선택해주세요.">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>019</option>
				</select>
				-
				<input id="phone2" name="phone2"
					   title="3~4글자 숫자만 입력해주세요." class="digit4"
					   placeholder="숫자입력" size="4" maxlength="4" />
				-
				<input id="phone3" name="phone3"
					   title="4글자 숫자만 입력해주세요." class="digit4"
					   placeholder="숫자입력" size="4"	maxlength="4" />
				</span>
				</div>
				<div class="row">
					<label for="age">생년월일</label><span id="age">
				<select id="year" name="year">
				</select><em>년</em>
				<select id="month" name="month">
				</select><em>월</em>
				<select id="date" name="date">
				</select><em>일</em>
				</span>
				</div>
				<div class="row">
					<label for="gender">성 별</label>
					<span id="gender">
				<input type="radio"  checked id="female" value="F" name="gender"/>
				<label for="female"><i class="fa fa-female"></i> 여 자</label>
				<input type="radio" id="male" value="M" name="gender" />
				<label for="male"><i class="fa fa-male"></i> 남 자</label>
				</span>
				</div>
				<div class="box_btn">
					<button type="submit" class="btn">
						<i class="fas fa-pencil-alt"></i> 전화번호 등록
					</button>
					<button type="reset" class="btn">
						<i class="fas fa-redo-alt"></i> 리 셋
					</button>
					<a href="/index.jsp" class="btn"><i class="fa fa-arrow-left"></i> 전화번호부로</a>
				</div>
			</fieldset>
		</form>
	</div><!-- //formBox  -->
<%@ include file="/WEB-INF/template/footer.jsp" %>

<script src="/js/create-date.js"></script>
<script>
//이름 정규 표현식 객체
const nameExp = /^[ㄱ-힣|\d]{2,6}$/;
//2번째 전화번호 정규표현식 객체
const phone2Exp = /^[\d]{3,4}$/;
//3번째 전화번호 정규표현식 객체
const phone3Exp = /^[\d]{4}$/;
const $name = $("#name");
const $phone2 = $("#phone2");
const $phone3 = $("#phone3");
$("form").on("submit",function(e){
	//입력한 이름
	const name = $name.val();
	if(!nameExp.test(name)){
		alert("이름을 2~6글자 한글 및 숫자로 입력해 주세요");
		$name.val("").focus();
		return false;
	}
	const phone2 = $phone2.val();
	if(!phone2Exp.test(phone2)){
		alert("전화번호 2번째 자리를 3~4자리 숫자로 제대로 입력해주세요");
		$phone2.val("").focus();
		return false;
	}
	const phone3 = $phone3.val();
	if(!phone3Exp.test(phone3)){
		alert("전화번호 3번째 자리를 4자리 숫자로 제대로 입력해주세요");
		$phone3.val("").focus();
		return false;
	}
	
});// submit() end



</script>
</body>
</html>