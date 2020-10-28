<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	int num=1;
	//jsp도 역시 객체
	//서버가 꺼질때 까지 객체가 남아있는다(하나의 객체)
	//(모든사용자들은 만들어진 다수 쓰레드를 사용해 같은 객체를 쓴다.)
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>방문자수 조사페이지</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
<style>
	/* 0 1 0 1 */
	#content h2{
		font-size:60px;
		font-weight:900;
		line-height:400px;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<h2><%=num++ %>번째 방문입니다.</h2>
<%@ include file="/WEB-INF/template/footer.jsp" %>
</body>
</html>