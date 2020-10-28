<%@page import="org.bmj.ims.dao.GroupsDAO"%>
<%@page import="org.bmj.ims.vo.Group"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String groupIdStr = request.getParameter("groupId");
	int groupId = Integer.parseInt(groupIdStr);
	Group group = GroupsDAO.selectOne(groupId);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그룹 수정 | AIMS</title>
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
	<h2><i class="fas fa-wrench"></i> 그룹 수정 </h2>
	<form action="/groupUpdate.jsp" method="post">
	<!-- 유저에게 보여주지 않는  type hidden -->
	<input type="hidden" name="groupId" value="<%=groupId%>" >
	
	<fieldset>
		<legend>그룹 수정폼</legend>
		<p>
			<label>
			그룹명
			<input name="name" placeholder="그룹명" value="<%=group.getName()%>"/>
			</label>		
		</p>
		<p>
			<strong>데뷔일</strong>
			<select name="year" >
			<%for(int i =2020; i>1906; i--) {%>
				<option 
					<%if(i==group.getDebutYear()){%> selected <%} %>
				><%=i %></option>
			<%} %>	
			</select>년
			<select name="month">
			<%for(int i =1; i<13; i++) {%>
				<option
				<%if(i==group.getDebutMonth()){%> selected <%} %>
				><%=i %></option>
			<%} %>	
			</select>월
			<select name="date">
			<%for(int i=1; i<32; i++) {%>
				<option
				<%if(i==group.getDebutDay()){%> selected <%} %>
				><%=i %></option>
			<%} %>
			</select>일
		</p>
		<p>
			<button class="btn">그룹 수정</button>
		</p>
	</fieldset>
	</form>
	
	<a href="/groupList.jsp">목록으로</a>
</body>
</html>