<%@page import="org.bmj.ims.dao.IdolsDAO"%>
<%@page import="org.bmj.ims.vo.Idol"%>
<%@page import="org.bmj.ims.dao.GroupsDAO"%>
<%@page import="org.bmj.ims.vo.Group"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Group> groups = GroupsDAO.selectList();
	String idolIdStr = request.getParameter("idolId");
	int idolId = Integer.parseInt(idolIdStr);
	Idol idol = IdolsDAO.selectOne(idolId);
%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이돌 수정 | AIMS</title>
<link rel="stylesheet" href="/css/all.min.css" />
<link rel="stylesheet" href="/css/notosanskr.css" />
<link rel="stylesheet" href="/css/default.css" />
<style>
	
	.fa-female{
		color: #F06292;	
	}
	
	.fa-male{
		color:#64B5F6;
	}
	/* [속성] */
	input[type=radio]{
		display:none;
	}
	/* +: 다음요소 선택자*/
	input[type=radio] + label {
		display:inline-block;
		padding: 8px 12px;
		border: 1px solid #424242;
		border-radius: 12px;
		cursor:pointer;
		user-select:none;
		margin:5px 0; 
	}
	input[type=radio] + label:hover{
		box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	input[type=radio]:checked + label{
		background: #666;
		color:#fff;
	}
</style>
</head>
<body>
<h1><a href="/"><i class="fas fa-star-of-david"></i>Awesome Idol Management Service<i class="fas fa-star-of-david"></i></a></h1>
	<h2>아이돌 수정</h2>
	<form action="/idolUpdate.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="idolId" value="<%=idolId %>" />
	<fieldset>
	<legend>아이돌 수정</legend>
		<p>
			<label>
			이름
			<input name="name" value="<%=idol.getName() %>"
			 placeholder="아이돌명" />
			</label>		
		</p>
		<p>
			<label>
			키
			<input name="height" value="<%=idol.getHeight() %>"
			 placeholder="키"  />cm
			</label>		
		</p>
		<p>
			<label>
			 몸무게
			<input name="weight" value="<%=idol.getWeight() %>"
			 placeholder="몸무게"  />kg
			</label>		
		</p>
		<p>
			<strong>성별</strong>
			<input id="male"
			type="radio" name="gender" 
			<%if(idol.getGender()=='M'){ %> checked <%} %>
			value="M" />
			<label for="male"><i class="fas fa-male"></i> 남자</label>
			<input id="female"
			type="radio" name="gender" 
			<%if(idol.getGender()=='F'){ %> checked <%} %>
			 value="F"/>
			<label for="female"><i class="fas fa-female"></i> 여자</label>		
		</p>
		<p>
			<strong>생일</strong>
			<select name="year">
			<%for(int i =2020; i>1906; i--) {%>
				<option
				<%if(i==idol.getBirthYear()){ %> selected <%} %>
				><%=i %></option>
			<%} %>	
			</select>년
			<select name="month">
			<%for(int i =1; i<13; i++) {%>
				<option
				<%if(i==idol.getBirthMonth()){ %> selected <%} %>
				><%=i %></option>
			<%} %>	
			</select>월
			<select name="date">
			<%for(int i=1; i<32; i++) {%>
				<option
				<%if(i==idol.getBirthDay()){ %> selected <%} %>
				><%=i %></option>
			<%} %>
			</select>일
		</p>
		<p>
			<label for="profile"> 프로필사진 </label>
			<input type="file" id="profile" name="profile"/>
		</p>
		<p>
			<strong>그룹 선택</strong>
			<%for(Group group:groups){ %>
				<input id="group<%=group.getGroupId() %>" 
				<%if(idol.getGroupId() == group.getGroupId()){ %> checked <%} %>
				 value =<%=group.getGroupId()%> 
				 type="radio" name="groupId"/>
				<label for="group<%=group.getGroupId() %>" ><%=group.getName()%></label>
			<%} %>
		</p>
		
		<p>
			<button class="btn">아이돌 수정</button>
		</p>
		</fieldset>
	</form>
	
	<a href="/idolList.jsp">목록으로</a>
</body>
</html>