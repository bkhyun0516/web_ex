<%@page import="org.bmj.ims.dao.IdolsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//넘어온 파라미터 받음
	String idolIdStr = request.getParameter("idolId");
	int idolId = Integer.parseInt(idolIdStr);
	
	//삭제
	int result = IdolsDAO.delete(idolId);
	
	//groupList.jsp로 리다이렉트
	response.sendRedirect("/idolList.jsp");
%>