<%@page import="vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member member = new Member();
	member.setId("test");
	member.setPassword("1234");
	member.setNickname("테스터");
	/*
		Attribute 의 Scope
		- page scope
		- request scope
		- session scope
		- servletContext scope
	
	*/
	session.setAttribute("aaa", member);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>el이란?</title>
</head>
<body>
<%--
	EL은 expression language의 줄임말로
	표현 언어입니다.
	
	attribute를 표현 할 때 사용
	
	${}
 --%>
 <h1>아이디 : ${aaa.id}</h1>
 <h2>비밀번호 : ${aaa.password}</h2>
</body>
</html>