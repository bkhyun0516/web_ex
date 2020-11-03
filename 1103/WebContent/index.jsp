<%@page import="vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		attribute(속성)
	*/
	Member loginMember = (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아주멋진 웹서비스 </title>
</head>
<body>
<% if(loginMember==null) { %>
<h1>아주 멋진 웹서비스</h1>
<h2>로그인</h2>
<form action="/login.do" method="post">
	<fieldset>
		<legend>로그인폼</legend>
		<p>
		<input name="id" placeholder="아이디">
		</p>
		<p>
		<input type="password" name="password" placeholder="비밀번호">
		</p>
		<p>
			<button >로그인</button>
		</p>
	</fieldset>
</form>
<%} else{ %>
<h2><%=loginMember.getNickname() %>님 환영합니다!</h2>
<a href="/logout.do">로그아웃</a>
<%} %>
</body>
</html>