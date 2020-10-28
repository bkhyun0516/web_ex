<%@page import="com.bmj.mms.vo.Genre"%>
<%@page import="com.bmj.mms.dao.GenresDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	Genre genre = GenresDAO.selectOne(no);	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장르수정</title>
</head>
<body>
<h1><a href="/">멋진 영화관리 서비스</a></h1>
<h2>장르 수정</h2>
<form action="/genreUpdate.mms" method="post">
<input type="hidden"  name="no" value="<%=no %>"/>
<fieldset>
<legend>장르 수정폼</legend>
<div>
	<label>장르명
		<input name="name" placeholder="장르명" value="<%=genre.getName() %>" autofocus/>
	</label>
</div>
<p>
	<button type="reset">리셋</button>
	<button>수정</button>
	<a href="/genres.jsp">목록으로</a>
</p>
</fieldset>
</form>
</body>
</html>