<%@page import="com.bmj.phonebook.vo.Member"%>
<%@page import="com.bmj.phonebook.util.PaginateUtil"%>
<%@page import="com.bmj.phonebook.vo.PageVO"%>
<%@page import="com.bmj.phonebook.vo.Phone"%>
<%@page import="java.util.List"%>
<%@page import="com.bmj.phonebook.dao.PhoneBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");

	String ip =request.getRemoteAddr();
	System.out.println(ip);
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
	
	PageVO pageVO = new PageVO(pageNo, numPage, loginMember.getNo());
	List<Phone> list = PhoneBookDAO.selectList(pageVO);
	
	int total = PhoneBookDAO.selectTotal(loginMember.getNo());
	int numBlock = 3;
	//현재페이지
	String url = "/main.jsp";		
	String param ="page=";		
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
	//Register, Update, Delete에서 세팅한 msg	
	Object msg =session.getAttribute("msg");
	if(msg!=null){
		//한번만 사용해야하기 때문에 삭제
		session.removeAttribute("msg");
	}

%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>아주 멋진 전화번호부</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
	<link rel="stylesheet" href="css/main.css"/>
</head>
<style>
	#msg{
		position:fixed;
		width:100%;
		height: 100%;
		top:0;
		left:0;
		background-color:rgba(255,255,255,.75);
		color:#424242;
		text-align: center;
		font-weight:700;
		font-size: 60px;
		text-shadow: 0 0 5px #fff;
	}
</style>
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
	<td><i class="fas fa-mobile"></i> <%=phone.getFullPhone() %></td>
	<td>
  <%=phone.getGenderIcon() %>
  </td>
  <td title="<%=phone.getBirthDate() %>"><%=phone.getKoreanAge() %>살</td>
	<td>
		<a href="updateForm.jsp?no=<%=phone.getNo() %>" class="btn update"><i class="fa fa-wrench"></i> 수정</a>
	</td>
	<td>
		<a data-name="<%=phone.getName() %>" href="/delete.bmj?no=<%=phone.getNo() %>&name=<%=phone.getName() %>" class="btn delete"><i class="far fa-trash-alt"></i> 삭제</a>
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
<%if(msg!=null){ %>
<div id="msg">
<%=msg %>
</div>
<%} %>
<script>
	//2020-11-2 09:50 선언
	$(".delete").on("click",function(){
		//1)traversing:탐색
		const nameVer1 = $(this).parents("tr").children().eq(0).text();
		//2)이름
		const nameVer2 = this.dataset.name;
		const nameVer3 = $(this).data("name");
		const nameVer4 = $(this).attr("data-name");
		//확인 return true, 취소 return false
		return confirm(nameVer2+"님을 삭제하시겠습니까?");
		/*
			submit. a 요소 링크 했을 때
			리턴값을 false로 하면 작동하지 않는다.
			이벤트.preventDefault()와 같다.
		*/
	});//$(".delete").on end
<% if(msg!=null){ %>	
	//브라우저의 height값
	const wHeight= $(window).height();
	console.log(wHeight);
	//line-height의 브라우저의 height값지정
	$("#msg").css("line-height",wHeight+"px");
	// .5초 이후에 msg 숨긴다.
	setTimeout(function(){
		$("#msg").fadeOut(500);
	},500)
<% }%>
</script>
</body>
</html>