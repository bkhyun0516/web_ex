<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Calendar now = Calendar.getInstance();
    int year = now.get(Calendar.YEAR);
	int month = now.get(Calendar.MONTH)+1;
	int date = now.get(Calendar.DATE);
    %>
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
		<form id="form" method="post" action="/register.bmj" name="form" onsubmit="return check()">
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
				<select id="phone1" name="phone1"
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
				<%for(int i=year; i>=1900; i--){ %>
					<option <%if(i==year){ %> selected <%} %> value=<%=i %>><%=i %></option>
				<%} %>
				</select><em>년</em>
				<select id="month" name="month">
				<%for(int i=1; i<=12; i++){ %>
					<option <%if(i==month){ %> selected <%} %> value=<%=i %>><%=i %></option>
				<%} %>	
				</select><em>월</em>
				<select id="date" name="date">
				<%for(int i=1; i<=31; i++){ %>
					<option <%if(i==date){ %> selected <%} %> value=<%=i %>><%=i %></option>
				<%} %>
				</select><em>일</em>
				</span>
				</div>
				<div class="row">
					<label for="gender">성 별</label>
					<span id="gender">
				<input type="radio" id="female" name="gender" value="F"/>
				<label for="female"><i class="fa fa-female"></i> 여 자</label>
				<input type="radio" id="male" name="gender" value="M"/>
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

<script src="js/jquery.js"></script>
<script>
	$("document").ready(function () {
		$("#nav li:nth-child(4)").addClass("on");
	});
	function nameCheck(obj, msg){
		if(typeof obj == "String"){
			obj = document.querySelector("#"+obj);
		}
		if(obj.value==""||obj.value.length<2 || obj.value.length>6 ){
			alert(msg);
			obj.focus();
			return true;
		}
		return false;
	}
	function phone2Check(obj, msg){
		if(typeof obj == "String"){
			obj = document.querySelector("#"+obj);
		}
		if(obj.value==""||obj.value.length<3 || obj.value.length>4){
			alert(msg);
			obj.focus();
			return true;
		}
		return false;
	}
	function phone3Check(obj, msg){
		if(typeof obj == "String"){
			obj = document.querySelector("#"+obj);
		}
		if(obj.value==""|| obj.value.length!=4){
			alert(msg);
			obj.focus();
			return true;
		}
		return false;
	}
	
	
	function check(){
		var f = document.form;
		if(nameCheck(f.name,"이름을 2~6글자 한글과 숫자로만 입력해주세요.")){ return false;}
		if(phone2Check(f.phone2,"전화번호 2번째 자리를 제대로 입력해주세요.")){ return false;}
		if(phone3Check(f.phone3,"전화번호 3번째 자리를 제대로 입력해주세요.")){ return false;}
		return true;
	}
	
</script>
</body>

</html>