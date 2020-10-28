<%@page import="org.bmj.ims.util.PaginateUtil"%>
<%@page import="org.bmj.ims.vo.PageVO"%>
<%@page import="org.bmj.ims.vo.Group"%>
<%@page import="org.bmj.ims.dao.GroupsDAO"%>
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
	List<Group> groups = GroupsDAO.selectList(pageVO);
	int total=GroupsDAO.selectTotal();
	int numBlock =3;
	String url="groupList.jsp";
	String param="page=";
	
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
%>    
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그룹목록 | AIMS</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/all.min.css" />
<link rel="stylesheet" href="/css/notosanskr.css" />
<link rel="stylesheet" href="/css/default.css" />
<link rel="stylesheet" href="/css/paginate.css" />
<style>
	h1{
		font-size:32px;
	}
	h2{
		font-size : 20px;
		margin:20px;
		font-weight:700;
	}
	.paginate{
		width:300px;
	
	}
	.paginate strong {
		background-color:#FF4081;
		border-color:#FF4081;
		
	}

		
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
	
	<%=paginate %>
	<a class="btn" href= "/groupRegisterForm.jsp"><i class="fas fa-edit"></i> 그룹등록</a>
	<a class="btn" href="/index.jsp"><i class="fas fa-undo"></i> 인덱스로</a>
</body>
</html>