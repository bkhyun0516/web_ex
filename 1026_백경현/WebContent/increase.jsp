<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int count;
if(session.getAttribute("count") != null)
{
	count = ((Integer)session.getAttribute("count")).intValue();	
}
else
{
	count = 0;	
}
	count++;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>아주 멋진 전화번호부</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
	<link rel="stylesheet" href="css/index.css"/>
	<style>
		#content h2 {
		line-height:350px;
		font-size:60px;
		font-weight: 900;
	}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
	<h2><%=count%> 번째 방문입니다.</h2>
	<%session.setAttribute("count", new Integer(count));%>
<%@ include file="/WEB-INF/template/footer.jsp" %>
</body>
<script src="js/jquery.js"></script>
<script>
	$("document").ready(function () {
		$("#nav li:nth-child(2)").addClass("on");
	});
</script>
</html>
