<%@page import="org.bmj.ims.vo.Group"%>
<%@page import="org.bmj.ims.dao.GroupsDAO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post방식의 한글 처리
	request.setCharacterEncoding("UTF-8");
	// 등록페이지는 유저에게 보여줄 컨텐츠가 없다.
	// 이런 페이지를 none-view라고 함
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	
	Group group = new Group();
	group.setName(name);
	group.setDebutDate(Date.valueOf(year+"-"+month+"-"+date));
	
	int result = GroupsDAO.insert(group);
	//mybatis의 selectKey기능을 사용하여 group객체의 groupId를 얻을수 있다
	//call by reference 방식


	// 이 페이지에서 insert한 후
	// groupList.jsp로 이동(리다이렉트)
	response.sendRedirect("/groupDetail.jsp?groupId="+group.getGroupId());

%>
