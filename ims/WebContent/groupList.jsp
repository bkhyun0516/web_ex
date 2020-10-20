<%@page import="org.bmj.ims.vo.Group"%>
<%@page import="org.bmj.ims.dao.GroupsDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Group> groups = GroupsDAO.selectList();
%>    
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그룹목록 | AIMS</title>
<link rel="stylesheet" href="/css/all.min.css" />
<link rel="stylesheet" href="/css/notosanskr.css" />
<link rel="stylesheet" href="/css/default.css" />
<style>
	
</style>
</head>
<body>
	<h1><a href="/"><i class="fas fa-star-of-david"></i>Awesome Idol Management Service<i class="fas fa-star-of-david"></i></a></h1>
	<h2><i class="fas fa-user-friends"></i> 그룹목록</h2>
	<ul>
	<%for(Group group: groups) {%>
		<li><a href="/groupDetail.jsp?groupId=<%= group.getGroupId()%>"><%=group.getGroupId() %>) <%= group.getName()%></a></li>
	<%} %>
	</ul>
	<a class="btn" href= "/groupRegisterForm.jsp"><i class="fas fa-edit"></i> 그룹등록</a>
	<a class="btn" href="/index.jsp"><i class="fas fa-undo"></i> 인덱스로</a>
</body>
</html>