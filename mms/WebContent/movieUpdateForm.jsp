
<%@page import="com.bmj.mms.dao.MoviesDAO"%>
<%@page import="com.bmj.mms.vo.Movie"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.bmj.mms.dao.GenresDAO"%>
<%@page import="com.bmj.mms.vo.Genre"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Genre> genres = GenresDAO.selectList();
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	Movie movie = MoviesDAO.selectOne(no);

	//현재 년도 출력
	int year = Calendar.getInstance().get(Calendar.YEAR);
	
	String date = "new Date();";
	if(movie.getEndDate()!=null){
		date = "new Date("+movie.getEndYear()+","+(movie.getEndMonth()-1)+","+movie.getEndDay()+");";
	}//if end
	//장르 출력부
	
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 수정  페이지</title>
<link rel="stylesheet" href="/css/datepicker.min.css"/>
</head>
<body>
<h1><a href="/">멋진 영화관리 서비스</a></h1>
<h2>영화 수정</h2>
<form action="/movieUpdate.mms" method="post">
<input type="hidden" name=no value="<%=movie.getNo() %>" />
<fieldset>
<legend>영화수정폼</legend>
<div><h3>제목</h3>
<input placeholder="제목" name=name value="<%=movie.getName() %>"autofocus />
</div>
<div><h3>감독</h3>
<input placeholder="감독" name="director" value="<%=movie.getDirector() %>"/>
</div>
<div><h3>관객수</h3>
<input placeholder="관객수" name="audienceNum" value="<%=movie.getAudienceNum() %>"/>
</div>
<div><h3>장르</h3>
<select name="genreId">
	<%for(Genre genre:genres){ %>
	<option 
	 <%if(genre.getNo()==movie.getGenre()){ %>selected<%} %> 
	value="<%=genre.getNo() %>"><%=genre.getName() %></option>
	<%} %>
</select>
</div>

<div>
	<h3>종료일</h3>
		<input name="endDate" id="endDate" <%if(movie.getEndDate()==null){%>disabled<%} %>/>
		<button type="button" id="changeBtn">종료일 없음</button>
</div>



<div><h3>개봉일</h3>
<select name="year">
	<%for(int i=movie.getReleaseYear();i>=1895;i--){ %>
	<option><%=i %></option>
	<%} %>
</select>년
<select name="month">
	<%for(int i=1;i<13;i++){ %>
	<option <%if(i==movie.getReleaseMonth()){ %>selected<%} %>><%=i %></option>
	<%} %>
</select>월
<select name="date">
	<%for(int i=1;i<32;i++){ %>
	<option <%if(i== movie.getReleaseDay()){ %>selected<%} %>><%=i %></option>
	<%} %>
</select>일
</div>

<p>
	<button type="reset">리셋</button>
	<button>영화수정</button>
<p>
</fieldset>
</form>
<div>
	<a href="/movies.jsp">목록으로</a>
	<a href="/">메인으로</a>
</div>



<script src="/js/jquery.js"></script>
<script src="/js/datepicker.min.js"></script>
<script src="/js/datepicker.ko-KR.js"></script>
<script>
	
	
const date = <%=date %>

	const $endDate = $("#endDate");
	$("#changeBtn").click(function(){
		/*
			요소에 있는 속성 확인할 때
			
			prop는  속성이 있으면 true 없으면  false
			
			attr는 있으면  disabled라는 문자열 , 없으면 undefined
		*/
		
		
		if($endDate.prop("disabled")){
			$endDate.attr("disabled",false); //속성 없어졌다.
		}
		else{
			$endDate.attr("disabled",true);// 속성이 생겼다.
		}//if~else end
		
	});
	$endDate.datepicker({
		autoPick: true,
		autoHide: true, //클릭하면 자동숨김
		language: "ko-KR", //한글(i18n)
		format: 'yyyy-mm-dd', //포멧
		date: date
	});
	
</script>
</body>
</html>