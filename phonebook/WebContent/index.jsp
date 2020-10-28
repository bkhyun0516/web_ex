<%@page import="com.bmj.phonebook.util.PaginateUtil"%>
<%@page import="com.bmj.phonebook.vo.PageVO"%>
<%@page import="com.bmj.phonebook.vo.Phone"%>
<%@page import="java.util.List"%>
<%@page import="com.bmj.phonebook.dao.PhoneBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//페이지번호
	int pageNo = 1;
	//파라미터로 받은 페이지번호
	String pageStr = request.getParameter("page");
	try{
		//pageNo변수에 대입(String~>int로)
		pageNo=Integer.parseInt(pageStr);
	}catch(NumberFormatException e){
		//여기는 아무것도 안해도 된다! 왜? 의도했으니까~
	}//try~catch end
	
	//한 페이지에 보여질 전화번호 수
	int numPage = 5;
	
	PageVO pageVO = new PageVO(pageNo,numPage);
	List<Phone> list = PhoneBookDAO.selectList(pageVO);
	
	int total = PhoneBookDAO.selectTotal();
	int numBlock = 3;
	//현재페이지
	String url = "/index.jsp";		
	String param ="page=";		
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);

%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>아주 멋진 전화번호부</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
	<link rel="stylesheet" href="css/index.css"/>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<h2><i class="fas fa-clipboard-list"></i> 전화번호 목록</h2>
<div id="phoneBox">
<table border="1">
<caption class="screen_out">전화번호표</caption>
<colgroup>
	<col id="name"/>
	<col id="phone"/>
	<col id="gender"/>
	<col id="age"/>
	<col id="update"/>
	<col id="delete"/>
</colgroup>
<thead>
<tr>
	<th>이 름</th>
	<th>전화번호</th>
	<th>성 별</th>
	<th>나 이</th>
	<th>수 정</th>
	<th>삭 제</th>
</tr>
</thead>
<tbody>
<%if(list.isEmpty()) { %>
<tr>
	<td class="no_data" colspan="6"><i class="far fa-flushed"></i> 아직 전화번호가 없습니다.</td>
</tr>
<% }%>
<%for(Phone phone:list){ %>
<tr>
	<th><%=phone.getName() %></th>
	<td><i class="fas fa-mobile"></i> <%=phone.getPhone1() %>-<%=phone.getPhone2() %>-<%=phone.getPhone3() %></td>
	<td>
	<i class="fa fa-<%if(phone.getGender()=='F'){ %>fe<%} %>male"></i>
  <%=phone.getGender() %>
  </td>
  <td title="<%=phone.getBirthDate() %>"><%=phone.getBirthDate() %></td>
	<td>
		<a href="updateForm.jsp?no=<%=phone.getNo() %>" class="btn update"><i class="fa fa-wrench"></i> 수정</a>
	</td>
	<td>
		<a href="/delete.bmj?no=<%=phone.getNo() %>" class="btn delete"><i class="far fa-trash-alt"></i> 삭제</a>
	</td>
</tr>
<%} %>
</tbody>
<tfoot>
<%if(!list.isEmpty()){ %>
<tr>
	<td class="box_btn" colspan="7">
		<%=paginate %>
	</td>
</tr>
<%} %>
<tr>
	<td class="box_btn" colspan="7">
		<a href="/registerForm.jsp" class="btn"><i class="fas fa-pencil-alt"></i> 전화번호 작성</a>
	</td>
</tr>
</tfoot>
</table>
</div>
<%@ include file="/WEB-INF/template/footer.jsp"  %>
</body>
</html>