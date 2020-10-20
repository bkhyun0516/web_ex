<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%--페이지 지시어 --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>hello JSP</title>
</head>
<%! int a = 5;//멤버필드 %>
<% int a = 10;//지역변수(_jspService메서드 ) %>

<body>
	<h1>Hello JSP <% out.print(a); %></h1>
	<% 
		int b = 10;//지역변수(_jspService메서드 )
		String name = "RM";
	%>
	<h2><% out.print(name); %></h2>
	<h2><%=name %></h2>
	
</body>
</html>



<!--  HTML주석 -->
<%--  JSP주석 --%>

<%--
	JSP란?
	- Java Server Page의 줄임말
	- HTML에 자바코드를 삽입
	- 맵핑이 필요없음(파일명.jsp가 주소)
	- jsp도 사실 서블릿
	- hello.jsp는 첫번째 요청 때 hello_jsp.java로 파일로 변경
	- hello_jsp.class파일로 컴파일 객체 생성
	
	JSP 문법
	- 1) 지시어 :	<%@		%>
		- page, include, taglib
		- 중요도 5(우리가 직접 작성보다
		 		 자동완성 등 활용)
		- 자바파일로 변경시
		    이곳 저곳으로
		    
		     
	- 2) 선언문 :	<%!	%>
		- 클래스 영역(멤버 자리)
		- 중요도 1
			
	- 3) 스크립트릿 :	<% %>
		- 중요도 10
		- _jspService 메서드 안에 선언 
	
	- 4) 표현식 :<%= %>
		- 중요도 10
		- _jspService 메서드에 out.print()메서드
		- 출력이 빈번하기 때문에 편리함
--%>