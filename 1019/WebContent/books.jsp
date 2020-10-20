<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
 	Class.forName("oracle.jdbc.OracleDriver");
 	String url = "jdbc:oracle:thin:@localhost:1521:xe";
 	Connection con = DriverManager.getConnection(url,"test","1111");
 	Statement stmt = con.createStatement();
 	String sql = "SELECT no, title, author, page_num, publication_date "+
 	"FROM books ORDER BY 1";
 	ResultSet rs = stmt.executeQuery(sql);
 
 
 %>   
    
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="UTF-8">
<title>책목록</title>


<style>
	table {
		border-collapse: collapse;
	}
	td,th{
		border : 1px solid #424242;
		padding: 12px 8px; 
	}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>저자</td>
				<td>페이지</td>
				<td>출간일자</td>
			</tr>
		</thead>
		<tbody>
			<%while(rs.next()) {%>
			<tr>
				<td><%=rs.getInt(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getInt(4) %></td>
				<td><%=rs.getDate(5) %></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</body>
</html>