<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그룹 등록 폼 | AIMS</title>
<link rel="stylesheet" href="/css/all.min.css" />
<link rel="stylesheet" href="/css/notosanskr.css" />
<link rel="stylesheet" href="/css/default.css" />
<style>
	body {
		font-family: "Noto Sans KR",sans-serif;
	}
</style>
</head>
<body>
<h1><a href="/"><i class="fas fa-star-of-david"></i>Awesome Idol Management Service<i class="fas fa-star-of-david"></i></a></h1>
	<h2><i class="fas fa-edit"></i> 그룹 등록폼</h2>
	<form action="/groupRegister.jsp" method="post">
	<fieldset>
		<legend>그룹 등록폼</legend>
		<p>
			<label>
			그룹명
			<input name="name" placeholder="그룹명"/>
			</label>		
		</p>
		<p>
			<strong>데뷔일</strong>
			<select name="year">
			<%for(int i =2020; i>1906; i--) {%>
				<option><%=i %></option>
			<%} %>	
			</select>년
			<select name="month">
			<%for(int i =1; i<13; i++) {%>
				<option><%=i %></option>
			<%} %>	
			</select>월
			<select name="date">
			<%for(int i=1; i<32; i++) {%>
				<option><%=i %></option>
			<%} %>
			</select>일
		</p>
		<p>
			<button>그룹등록</button>
		</p>
	</fieldset>
	</form>
	
	<a href="/groupList.jsp">목록으로</a>
</body>
</html>