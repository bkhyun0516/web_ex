<%@page import="org.bmj.ims.vo.Group"%>
<%@page import="java.sql.Date"%>
<%@page import="org.bmj.ims.dao.GroupsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post방식의 한글 처리
	 request.setCharacterEncoding("UTF-8");
	
	//파라미터 받기
	String groupIdStr = request.getParameter("groupId");
	String name= request.getParameter("name");
	String year= request.getParameter("year");
	String month= request.getParameter("month");
	String date= request.getParameter("date");
	
	//형변환 하기
	int groupId = Integer.parseInt(groupIdStr);
	Date debutDate = Date.valueOf(year+'-'+month+'-'+date);
	
	
	Group group = new Group(groupId,name,debutDate);
	//update 구문 수행
	GroupsDAO.update(group);
	
	//groupDetail.jsp로 이동(리다이렉트)
	response.sendRedirect("/groupDetail.jsp?groupId="+groupId);

%>