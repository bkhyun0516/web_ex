<%@page import="com.bmj.mms.vo.Genre"%>
<%@page import="com.bmj.mms.dao.GenresDAO"%>
<%@page import="com.bmj.mms.vo.Movie"%>
<%@page import="com.bmj.mms.dao.MoviesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	Movie movie = MoviesDAO.selectOne(no);
	int genreNo = movie.getGenre();
	Genre genre = GenresDAO.selectOne(genreNo);

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 상세</title>
<style>
</style>
</head>
<body>
<h1><a href="/">멋진 영화 관리 서비스</a></h1>
	<h2><%=movie.getName() %></h2>
	<dl>
		<dt>포스터</dt>
		<dd><img src="/poster/<%=movie.getPosterImage()%>"></dd>
		<dt>번호</dt>
		<dd><%=movie.getNo() %></dd>
		<dt>감독</dt>
		<dd><%=movie.getDirector() %></dd>
		<dt>개봉일</dt>
		<dd><%=movie.getReleaseDate() %></dd>
		<dt>종료일</dt>
		<dd><%=movie.getEndDate() %></dd>
		<dt>관객수</dt>
		<dd><%=movie.getAudienceNum() %>명</dd>
		<dt>장르</dt>
		<dd><%=genre.getName()%></dd>
	</dl>
	<a href="/movieUpdateForm.jsp?no=<%=no%>">수정</a>
	<a href="/movieRemove.mms?no=<%=no%>"> 삭제</a>
	<a href="/movies.jsp"> 인덱스로</a>
</body>
</html>