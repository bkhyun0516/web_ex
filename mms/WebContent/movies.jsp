<%@page import="com.bmj.mms.util.PaginateUtil"%>
<%@page import="com.bmj.mms.vo.PageVO"%>
<%@page import="com.bmj.mms.dao.MoviesDAO"%>
<%@page import="com.bmj.mms.vo.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("page");
	int pageNo= 1;
	try{
		pageNo= Integer.parseInt(noStr);
	}catch(Exception e){}
	int numPage=5;
	PageVO pageVO = new PageVO(pageNo, numPage);
	List<Movie> movies = MoviesDAO.selectList(pageVO);
	int total=MoviesDAO.selectTotal();
	int numBlock =5;
	String url="movies.jsp";
	String param="page=";
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 목록</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/all.min.css" />
<link rel="stylesheet" href="/css/notosanskr.css" />
<link rel="stylesheet" href="/css/default.css" />
<link rel="stylesheet" href="/css/paginate.css" />
</head>
<body>
	<h1><a href="/">멋진 영화 관리 서비스</a></h1>
	<h2>영화목록</h2>
	<ul>
	<%for(Movie movie: movies){ %>
		<li>
		<img src="/poster/<%=movie.getPosterImage()%>">
		<a href="/movie.jsp?no=<%=movie.getNo()%>" ><%=movie.getName() %></a></li>
	<%} %>
	</ul>
	<%=paginate %>	
	<a href="/movieRegisterForm.jsp">영화등록</a>
	<a href="/">인덱스로</a>
</body>
</html>