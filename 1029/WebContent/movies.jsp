<%@page import="com.bmj.mms.vo.Movie"%>
<%@page import="java.util.List"%>
<%@page import="com.bmj.mms.dao.MoviesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Movie> list = MoviesDAO.selectList();

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화목록불러오기</title>
<style>
	#loader{
		position: fixed;
		width: 100%;
		height:100%;
		left:0;
		top:0;
		background:#f8f8f8;
		background-image:url(/img/loader.gif);
		background-repeat:no-repeat;
		background-position:center;
		opacity:.75;
		display:none;
	}
	table{
		border-collapse: collapse;
	}
	td, th{
		border: 1px solid #424242;
		padding: 8px 12px;
	}
</style>
</head>
<body>
<div id="loader"></div>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>감독</th>
			<th>개봉일</th>
			<th>관객수</th>
			<th>장르번호</th>
		</tr>
	</thead>
	<tbody>
		 <tr>
			<td colspan="6">아직 안불러옴</td>
		</tr>
	</tbody>
</table>
<script src="/js/jquery.js"></script>
<script>
	const $loader = $("#loader");
	function getMovies(){
			$loader.show();
			$.ajax({
				url:"/getMovies.mms",
				dataType:"json",
				type:"GET",
				success:function(json){
					$("tbody").empty();
					$(json).each(function(){
						$tr=$("<tr>");
						$th=$("<th>").text(this.no);
						$td1=$("<td>").text(this.name);
						$td2=$("<td>").text(this.director);
						$td3=$("<td>").text(this.releaseDate);//유닉스타임으로 와서 나중에 라이브러리로 변환해준다.
						$td4=$("<td>").text(this.audienceNum);
						$td5=$("<td>").text(this.genre);
						$tr.append($th,$td1,$td2,$td3,$td4,$td5).appendTo("tbody");
					});
					$loader.hide();
				},
				error:function(){
					alert("서버점검중");
					$loader.hide();
				}
			});	
	}//getMovies() end
	
	
	getMovies();
</script>
</body>
</html>