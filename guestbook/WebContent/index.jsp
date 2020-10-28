<%@page import="org.bmj.guestbook.util.PaginateUtil"%>
<%@page import="org.bmj.guestbook.vo.Guest"%>
<%@page import="java.util.List"%>
<%@page import="org.bmj.guestbook.vo.PageVO"%>
<%@page import="org.bmj.guestbook.dao.GuestbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pageNo=1;
	int numPage=3;
	String pageStr=  request.getParameter("page");
	try{
		pageNo = Integer.parseInt(pageStr);
	}catch(Exception e){}
	PageVO pageVO= new PageVO(pageNo,numPage);

	List<Guest> guests = GuestbookDAO.selectList(pageVO);
	
	//만약 페이지가 1이 아니고, 글이 없다면 1 페이지로 이동
	if(pageNo!=1 && guests.isEmpty()){
		response.sendRedirect("/index.jsp?page=1");
	}//if end
	int total= GuestbookDAO.selectTotal();
	int numBlock = 3;
	String url="/index.jsp";
	String param="page=";
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);	
%>    
    
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>멋진 방명록</title>
		<!-- index.html, writeForm.html의 공통된 CSS를 default.css에 -->
		<%@ include file="/WEB-INF/template/link.jsp" %>
		<link rel="stylesheet" href="/css/index.css"/>
		<link rel="stylesheet" href="/css/paginate.css" />
	 	<style>
	 		
	 		
	 	</style>
	</head>
	<body>
<%@ include file="/WEB-INF/template/header.jsp" %>		

				<h2><i class="fas fa-book"></i> 방명록 리스트</h2>
				<ul>
					<%if(guests.isEmpty()){ %>
					<li class="no"><i class="far fa-sad-cry"></i></li>
					<%} //if end %>
					<%	for(Guest guest : guests){ %>
					<li>
						<h3>
							<strong>
							<a href="http://<%=guest.getIp()%>">
								<i class="far fa-grin-stars"></i>
								<%=guest.getWriter()%></a>
							</strong>
							<time><i class="far fa-clock"></i>
							<%=guest.getRegdate()%></time>
							<a href="/delete.guest?no=<%=guest.getNo()%>" class="delete btn"><i class="far fa-trash-alt"></i> 삭제</a>
							<a href="/editForm.jsp?no=<%=guest.getNo()%>" class="update btn"><i class="far fa-edit"></i> 수정</a>
						</h3>
						<p><%=guest.getContents()%></p>
					</li>
					<%} %>
				</ul>
				<%=paginate %>
				<div class="btn_box">
					<a class="btn" href="writeForm.jsp"><i class="fas fa-pencil-alt"></i> 글쓰기</a>
				</div>
<%@ include file="/WEB-INF/template/footer.jsp" %>
	</body>
</html>
    