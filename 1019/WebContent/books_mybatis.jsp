<%@page import="dao.BooksDAO"%>
<%@page import="vo.Book"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
	List<Book> books = BooksDAO.selectList();
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
			<%for(Book book:books) {%>
			<tr>
				<td><%=book.getNo() %></td>
				<td><%=book.getTitle() %></td>
				<td><%=book.getAuthor() %></td>
				<td><%=book.getPageNum() %></td>
				<td><%=book.getPublicationDate() %></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</body>
</html>