<%@page import="org.bmj.ims.dao.GroupsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//넘어온 파라미터 받음
	String groupIdStr = request.getParameter("groupId");
	int groupId = Integer.parseInt(groupIdStr);
	
	//삭제
	int result = GroupsDAO.delete(groupId);
	
	//groupList.jsp로 리다이렉트
	response.sendRedirect("/groupList.jsp");
%>