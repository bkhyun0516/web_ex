
<%@page import="java.util.Calendar"%>
<%@page import="com.bmj.mms.dao.GenresDAO"%>
<%@page import="com.bmj.mms.vo.Genre"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//현재 년도 출력
	Calendar now = Calendar.getInstance();
	int year = now.get(Calendar.YEAR);
	int month = now.get(Calendar.MONTH)+1;
	int date = now.get(Calendar.DATE);
	//장르 출력부
	List<Genre> genres = GenresDAO.selectList();
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 등록  페이지</title>
<link rel="stylesheet" href="/css/datepicker.min.css" />
</head>
<body>
<h1><a href="/">멋진 영화관리 서비스</a></h1>
<h2>영화 등록</h2>
<form action="/movieRegister.mms" method="post" enctype="multipart/form-data">
<fieldset>
<legend>영화등록폼</legend>
<div><h3>제목</h3>
<input placeholder="제목" name=name autofocus />
</div>
<div><h3>감독</h3>
<input placeholder="감독" name="director"/>
</div>
<div><h3>관객수</h3>
<input placeholder="관객수" name="audienceNum"/>
</div>
<div><h3>장르</h3>
<select name="genreId">
	<%for(Genre genre:genres){ %>
	<option value="<%=genre.getNo() %>"><%=genre.getName() %></option>
	<%} %>
</select>
</div>

<div>
	<h3>종료일</h3>
		<button type="button" id="changeBtn">종료일 없음</button>
		<input id="endDate" name="endDate"/>
</div>



<div><h3>개봉일</h3>
<select name="year">
	<%for(int i=year;i>=1895;i--){ %>
	<option><%=i %></option>
	<%} %>
</select>년
<select name="month">
	<%for(int i=1;i<13;i++){ %>
	<option <%if(i==month){ %>selected<%} %>><%=i %></option>
	<%} %>
</select>월
<select name="date">
	<%for(int i=1;i<32;i++){ %>
	<option <%if(i==date){ %>selected<%} %>><%=i %></option>
	<%} %>
</select>일
</div>
<p>
	<label for="poster">영화포스터</label>
	<input id="poster" name="poster" type="file"/>
</p>
<p>
	<button type="reset">리셋</button>
	<button>영화등록</button>
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
		date: new Date()
	});
</script>
</body>
</html>