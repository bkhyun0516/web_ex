<%@page import="com.bmj.mms.vo.Idol"%>
<%@page import="java.util.List"%>
<%@page import="com.bmj.mms.dao.IdolsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이돌목록불러오기</title>
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
			<th>이름</th>
			<th>키</th>
			<th>몸무게</th>
			<th>생일</th>
			<th>성별</th>
			<th>그룹번호</th>
		</tr>
	</thead>
	<tbody>
		 <tr>
			<td colspan="7">아직 안불러옴</td>
		</tr>
	</tbody>
</table>
<script src="/js/jquery.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script>
	const $loader = $("#loader");
	function getMovies(){
			$loader.show();
			$.ajax({
				url:"/getIdols.mms",
				dataType:"json",
				type:"GET",
				success:function(json){
					$("tbody").empty();
					$(json).each(function(){
						$tr=$("<tr>");
						$th=$("<th>").text(this.idolId);
						$td1=$("<td>").text(this.name);
						$td2=$("<td>").text(this.height);
						$td3=$("<td>").text(this.weight);
						$td4=$("<td>").text(moment(new Date(this.birthDate)).format("YYYY-MM-DD"));//유닉스타임으로 와서 나중에 라이브러리로 변환해준다.
						//$td4=$("<td>").text(new Date(this.birthDate));//유닉스타임으로 와서 나중에 라이브러리로 변환해준다.
						$td5=$("<td>").text(this.gender);
						$td6=$("<td>").text(this.groupId);
						$tr.append($th,$td1,$td2,$td3,$td4,$td5,$td6).appendTo("tbody");
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