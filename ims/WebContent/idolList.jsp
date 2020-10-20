<%@page import="org.bmj.ims.dao.IdolsDAO"%>
<%@page import="org.bmj.ims.vo.Idol"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Idol> idols = IdolsDAO.selectList(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이돌 목록 | AIMS</title>
<link rel="stylesheet" href="/css/all.min.css" />
<link rel="stylesheet" href="/css/notosanskr.css" />
<link rel="stylesheet" href="/css/default.css" />
<style>
	#idolList {
		margin:0;
		padding:10px;
		list-style:none;
		width:642px;
		overflow:hidden;
	}
	
	#idolList li{
		width:204px;
		height:64px;
		float: left;
		margin: 5px;
	}
	#idolList>li>a{
		width:200px;
		height:60px;
		display:block;
		border:2px solid #424242;
		font-weight:700;
		text-align:center;
		line-height:60px;
		text-decoration:none;
		transition: .2s ease;
		position:relative;
	}
	#idolList>li>a:hover {
		 box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
	}
	.ribbon{
		width:30px;
		height:30px;
		background-color:#FF4081;
		position: absolute;
		font-size:16px;
		color: #fff;
		line-height:30px;
		left:8px;
		top:-6px;
	}
	.ribbon::before {
		content:"";
		position:absolute;
		border-top:10px solid #FF4081;
		border-right:15px solid transparent;
		left:0;
		bottom:-10px;
	}
	.ribbon::after {
		content:"";
		position:absolute;
		border-top: 10px solid #FF4081;
		border-left:15px solid transparent;
		right:0;
		bottom:-10px;
	}
	
	
</style>
</head>
<body>
<h1><a href="/"><i class="fas fa-star-of-david"></i>Awesome Idol Management Service<i class="fas fa-star-of-david"></i></a></h1>
	<h2><i class="fas fa-street-view"></i> 아이돌 목록</h2>
	<ul id="idolList">
		<% for(Idol idol : idols){ %>
		<li><a href="/idolDetail.jsp?idolId=<%=idol.getIdolId() %>">
		<span class="ribbon"><%=idol.getIdolId() %></span>
		<%= idol.getName()%>
		</a></li>
		<% } %>
	</ul>
	<a class="btn" href= "/idolRegisterForm.jsp"><i class="fas fa-edit"></i> 아이돌등록</a>
	<a class="btn" href="/index.jsp"><i class="fas fa-undo"></i> 인덱스로</a>
</body>
</html>