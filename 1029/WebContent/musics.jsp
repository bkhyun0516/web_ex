<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>음악목록</title>
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
<h1>음악목록</h1>
<div id="loader"></div>
<table>
	<thead>
		<tr>
			<th>제목</th>
			<th>아티스트</th>
			<th>장르</th>
		</tr>
	</thead>
	<tbody>
		 <tr>
			<td colspan="3">아직 안불러옴</td>
		</tr>
	</tbody>
</table>

<button>불러오기</button>
<script src="/js/jquery.js"></script>
<script>
	//로딩이미지
	const $loader = $("#loader");
	// ajax로 음악목록(json)을 불러오는 함수
	function getMusics() {
		//로딩이미지 보여줌
		$loader.show();
		$.ajax({
			url:"/ajax/musics.json",
			dataType:"json",//html,json,text, xml
			type:"GET",//GET,POST,PUT,DELETE
			success:function(json){
				$("tbody").empty();
				$(json).each(function(){
					$tr=$("<tr>");
					$th=$("<th>").text(this.title);
					$td1=$("<td>").text(this.artist);
					$td2=$("<td>").text(this.genre);
					$tr.append($th,$td1,$td2)
					   .appendTo("tbody");
				
				//	$("<li>").text(this.title+"/"+this.artist+"/"+this.genre+"/").appendTo("ul");
				});//each() end
				
				$loader.hide();
			},
			error:function(){
				alert("서버점검중!ㅈㅅㅈㅅ");
				$loader.hide();
			}
		});//ajax() end
	}//getMusics() end;
	
	
	getMusics();
	
	
	
	
	//json은 경량의 데이터 교환방식 언어의 제약을 받지 않는다.	
	
</script>
</body>
</html>