
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date debutDate = Date.valueOf("2013-06-13");
	
//추상클래스이기때문에 new Calener()안된다.
	Calendar cal = Calendar.getInstance();
	//년, 월, 일 등등 얻어오는 메서드: get(인자)
	
	cal.setTime(debutDate);
	
	// 월은 0월부터 시작이여서 +1  을 꼭해주자
%>
년 : <%= cal.get(Calendar.YEAR) %>
월 : <%= cal.get(Calendar.MONTH)+1 %>
일 : <%= cal.get(Calendar.DATE) %>
