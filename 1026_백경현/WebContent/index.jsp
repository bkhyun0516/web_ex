<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bmj.phonebook.util.PaginateUtil"%>
<%@page import="com.bmj.phonebook.vo.Phone"%>
<%@page import="java.util.List"%>
<%@page import="com.bmj.phonebook.vo.PageVO"%>
<%@page import="com.bmj.phonebook.dao.PhonebookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");	
	String noStr = request.getParameter("page");
	int pageNo=1;
	int numPage=3;
	try {
		pageNo=Integer.parseInt(noStr);
	}catch(Exception e){}
	
	
	PageVO pageVO = new PageVO(pageNo,numPage);
	List<Phone> phonebook = PhonebookDAO.selectList(pageVO);
	if(pageNo!=1 && phonebook.isEmpty()){
		response.sendRedirect("/index.jsp?page=1");
	}
	int total = PhonebookDAO.selectTotal();

	int numBlock=3;
	String url = "/index.jsp";
	String param = "page=";
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
	Calendar today = Calendar.getInstance();
%>  
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>아주 멋진 전화번호부</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
	<link rel="stylesheet" href="css/index.css"/>
	<link rel="stylesheet" href="css/paginate.css"/>
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
<%if(phonebook.isEmpty()){ %>
<tr>
	<td class="no_data" colspan="6"><i class="far fa-flushed"></i> 아직 전화번호가 없습니다.</td>
</tr>
<%} %>
<%for(Phone phone:phonebook){%>
<tr>
	
	<th><%=phone.getName() %></th>
	<td><i class="fas fa-mobile"></i>
	<%if(phone.getPhone().length()==11){ %>
	<%=phone.getPhone().substring(0,3)%>-<%=phone.getPhone().substring(3,7)%>-<%=phone.getPhone().substring(7,11)%></td>
	<%} else { %>
	<%=phone.getPhone().substring(0,3)%>-<%=phone.getPhone().substring(3,6)%>-<%=phone.getPhone().substring(6,10)%></td>
	<%} %>
	<td>
	<%if(phone.getGender()=='M'){ %>
	<i class="fa fa-male" ></i>
  남자
  <%} else { %>
  <i class="fa fa-female"></i>
  여자
  <%}%>
 </td>
  <td title="<%=format.format(phone.getBirthDate()) %>"> <%=(today.get(Calendar.YEAR)-phone.getBirthYear()+1) %>살</td>
	<td>
		<a href="updateForm.jsp?no=<%=phone.getNo() %>" class="btn update" data-name="<%=phone.getName() %>"><i class="fa fa-wrench"></i> 수정</a>
	</td>
	<td>
		<a href="/delete.bmj?no=<%=phone.getNo() %>" class="btn delete" data-name="<%=phone.getName() %>"><i class="far fa-trash-alt"></i> 삭제</a>
	</td>
</tr>
<%} %>

</tbody>
<tfoot>
<tr>
	<td class="box_btn" colspan="7">
		<%=paginate %>
	</td>
</tr>
<tr>
	<td class="box_btn" colspan="7">
		<a href="/registerForm.jsp" class="btn"><i class="fas fa-pencil-alt"></i> 전화번호 작성</a>
	</td>
</tr>
</tfoot>
</table>
</div>
<%@ include file="/WEB-INF/template/footer.jsp" %>
<script src="js/jquery.js"></script>
<script>
	$("document").ready(function () {
		$("#nav li:nth-child(3)").addClass("on");
	});
	$(".delete").click(function name(e) {
		
		if(confirm(this.dataset.name+"님을 정말로 삭제하시겠습니까?")==true){
			document.form.submit;
		}
		else{
			e.preventDefault();
		}
	})
</script>
</body>
</html>