<%@page import="org.bmj.ims.dao.GroupsDAO"%>
<%@page import="org.bmj.ims.vo.Group"%>
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
<title>아이돌 등록 폼 | AIMS</title>
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
	<h2>아이돌 등록폼</h2>
	<form action="/idolRegister.jsp" method="post">
	<fieldset>
	<legend>아이돌 등록폼</legend>
		<p>
			<label>
			이름
			<input name="name"
			 placeholder="아이돌명"/>
			</label>		
		</p>
		<p>
			<label>
			키
			<input name="height"
			 placeholder="키"/>cm
			</label>		
		</p>
		<p>
			<label>
			 몸무게
			<input name="weight"
			 placeholder="몸무게"/>kg
			</label>		
		</p>
		<p>
			<strong>성별</strong>
			<input id="male"
			type="radio" name="gender" value="M"/>
			<label for="male"><i class="fas fa-male"></i> 남자</label>
			<input id="female"
			type="radio" name="gender" checked value="F"/>
			<label for="female"><i class="fas fa-female"></i> 여자</label>		
		</p>
		<p>
			<strong>생일</strong>
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
			<strong>그룹 선택</strong>
			<%for(Group group:groups){ %>
				<input id="group<%=group.getGroupId() %>" 
				 value =<%=group.getGroupId()%> 
				 type="radio"name="groupId"/>
				<label for="group<%=group.getGroupId() %>" ><%=group.getName()%></label>
			<%} %>
		</p>
		
		<p>
			<button>아이돌등록</button>
		</p>
		</fieldset>
	</form>
	
	<a href="/idolList.jsp">목록으로</a>
</body>
</html>