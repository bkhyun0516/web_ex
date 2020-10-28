<%@page import="java.util.List"%>
<%@page import="org.bmj.ims.dao.IdolsDAO"%>
<%@page import="org.bmj.ims.vo.Idol"%>
<%@page import="org.bmj.ims.dao.GroupsDAO"%>
<%@page import="org.bmj.ims.vo.Group"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String idolIdStr = request.getParameter("idolId");
 	int idolId = Integer.parseInt(idolIdStr);
 	
 	Idol idol= IdolsDAO.selectOne(idolId);
 	Group group = GroupsDAO.selectOne(idol.getGroupId());
 %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=idol.getName() %>의 상세| AIMS </title>

<link rel="stylesheet" href="/css/all.min.css" />
<link rel="stylesheet" href="/css/notosanskr.css" />
<link rel="stylesheet" href="/css/default.css" />

<style>
		dt,dd{
			float:left;
		}
		dt{
			clear:both;
		}
		dl{
			overflow:hidden;
		}
		img{
			border-radius:50%;
		display:block;
		margin-bottom:5px;
		}
</style>
</head>
<body>
	<h1><a href="/"><i class="fas fa-star-of-david"></i>Awesome Idol Management Service<i class="fas fa-star-of-david"></i></a></h1>
	<h2><%=idol.getName() %>의 상세페이지</h2>
	<img src="/profile/<%=idol.getProfileImage() %>">
	<dl>
		<dt>이름</dt>
		<dd><%=idol.getName() %></dd>
		<dt>키</dt>
		<dd><%=idol.getHeight() %></dd>
		<dt>몸무게</dt>
		<dd><%=idol.getWeight() %></dd>
		<dt>성별</dt>
		<dd><%=idol.getGenderIcon() %></dd>
		<dt>생년월일</dt>
		<dd><%=idol.getBirthYear() %>년 
			<%=idol.getBirthMonth() %>월 
			<%=idol.getBirthDay() %>일
		</dd>
		<dt>그룹</dt>
		<dd><a href="groupDetail.jsp?groupId=<%=group.getGroupId()%>"><%=group.getName() %></a></dd>
	</dl>

	<a class="btn" href="/idolDelete.jsp?idolId=<%=idol.getIdolId() %>"><i class="fas fa-trash-alt"></i> 삭제</a>
	<a class="btn" href="/idolUpdateForm.jsp?idolId=<%=idol.getIdolId() %>"><i class="fas fa-edit"></i> 수정</a>
	<a class="btn" href="/idolList.jsp"><i class="fas fa-user-friends"></i> 목록으로</a>
</body>
</html>