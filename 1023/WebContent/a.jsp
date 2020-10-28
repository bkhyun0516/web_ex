<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String name="손흥민";  %>
	<h1>안녕하세요^^7</h1>
	<%@ include file="/WEB-INF/template/b.jsp" %>
	<!-- /WEB-INF/template/b.jsp 웹에서 접근 불가 -->
	<h2><%=a %> 반가워요^^7</h2>
</body>
</html>