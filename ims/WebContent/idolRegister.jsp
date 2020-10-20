<%@page import="org.bmj.ims.dao.IdolsDAO"%>
<%@page import="org.bmj.ims.vo.Idol"%>

<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post방식의 한글 처리
	request.setCharacterEncoding("UTF-8");
	// 등록페이지는 유저에게 보여줄 컨텐츠가 없다.
	// 이런 페이지를 none-view라고 함
	
	String name = request.getParameter("name");
	String heightStr = request.getParameter("height");
	String weightStr = request.getParameter("weight");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	String genderStr = request.getParameter("gender");
	String groupIdStr = request.getParameter("groupId");
	
	
	
	
	
	
	Idol idol = new Idol();
	idol.setName(name);
	idol.setHeight(Double.parseDouble(heightStr));
	idol.setWeight(Double.parseDouble(weightStr));
	idol.setBirthDate(Date.valueOf(year+"-"+month+"-"+date));
	idol.setGender(genderStr.charAt(0));
	idol.setGroupId(Integer.parseInt(groupIdStr));	

	int result = IdolsDAO.insert(idol);

	// 이 페이지에서 insert한 후
	// groupList.jsp로 이동(리다이렉트)
	response.sendRedirect("/idolList.jsp");
%>
<%--
이름: <%=name  %> <br/>
키: <%=heightStr  %> <br/>
무게: <%=weightStr  %> <br/>
년: <%=year  %> <br/>
월: <%=month  %> <br/>
일: <%=date  %> <br/>
성별: <%=genderStr  %> <br/>
그룹번호: <%=groupIdStr  %>
jsp주석은 .java 파일로 바뀔 때 아예 없어진다.
 --%>
