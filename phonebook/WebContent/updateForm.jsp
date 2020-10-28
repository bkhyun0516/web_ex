<%@page import="com.bmj.phonebook.vo.Phone"%>
<%@page import="com.bmj.phonebook.dao.PhoneBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	Phone phone = PhoneBookDAO.selectOne(no);
	
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>전화번호 수정페이지</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
	<link rel="stylesheet" href="css/form.css"/>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
	<h2><i class="fas fa-mobile-alt"></i> 전화번호 수정</h2>
	<div id="formBox">
		<form id="form" method="post" action="/update.bmj">
			<input type="hidden" name="no" value="<%=no %>"/>
			<fieldset>
				<legend class="screen_out">전화번호 수정폼</legend>
				<div class="row">
					<label for="name">이 름</label>
					<input id="name" name="name" value="<%=phone.getName() %>" disabled
						   title="2~6글자 한글과 숫자로만 입력해주세요."
						   placeholder="이름입력" />
				</div>
				<div class="row">
					<label for="phone">전화번호</label>
					<span id="phone">
				<select id="phone1"  name="phone1" 
						title="반드시 선택해주세요.">
						<option <%if(phone.getPhone1().equals("010")){ %> selected <%} %>>010</option>
						<option <%if(phone.getPhone1().equals("011")){ %> selected <%} %>>011</option>
						<option <%if(phone.getPhone1().equals("016")){ %> selected <%} %>>016</option>
						<option <%if(phone.getPhone1().equals("017")){ %> selected <%} %>>017</option>
						<option <%if(phone.getPhone1().equals("019")){ %> selected <%} %>>019</option>
				</select>
				-
				<input id="phone2" name="phone2" value="<%=phone.getPhone2() %>"
					   title="3~4글자 숫자만 입력해주세요." class="digit4"
					   placeholder="숫자입력" size="4" maxlength="4" />
				-
				<input id="phone3" name="phone3" value="<%=phone.getPhone3() %>"
					   title="4글자 숫자만 입력해주세요." class="digit4"
					   placeholder="숫자입력" size="4"	maxlength="4" />
				</span>
				</div>
				<div class="row">
					<label for="age">생년월일</label><span id="age">
				<select id="year" name="year">
				<%for(int i=2020;i>1900;i--) {%>
					<option <%if(phone.getYear()==i){ %> selected <%} %> value="<%=i %>"><%=i %></option>
				<%} %>
				</select><em>년</em>
				<select id="month" name="month">
				<%for(int i=1;i<13;i++) {%>
					<option <%if(phone.getMonth()==i){ %> selected <%} %> value="<%=i%>"><%=i%></option>
				<%} %>
				</select><em>월</em>
				<select id="date" name="date">
				<%for(int i=1;i<32;i++) {%>
					<option <%if(phone.getDate()==i){ %> selected <%} %> value="<%=i %>"><%=i %></option>
				<%} %>
				</select><em>일</em>
				</span>
				</div>
				<div class="row">
					<label for="gender">성 별</label>
					<span id="gender">
				<input type="radio" id="female" value="F" name="gender" <%if(phone.getGender()=='F'){ %> checked <%} %>/>
				<label for="female"><i class="fa fa-female"></i> 여 자</label>
				<input type="radio" id="male" value="M" name="gender" <%if(phone.getGender()=='M'){ %> checked <%} %> />
				<label for="male"><i class="fa fa-male"></i> 남 자</label>
				</span>
				</div>
				<div class="box_btn">
					<button type="submit" class="btn">
						<i class="fas fa-pencil-alt"></i> 전화번호 수정
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
</body>
</html>