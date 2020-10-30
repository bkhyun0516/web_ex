<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그룹목록</title>
<style>
	table {
		border-collapse: collapse;
	}
	td, th{
		border: 1px solid #123456
	}
</style>
</head>
<body>
<h1>그룹목록</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>그룹명</th>
				<th>데뷔일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>1</th>
				<td>그룹명</td>
				<td>YYYY년 5월 4일</td>
			</tr>
		</tbody>
	</table>
	<script type="text/template" id="groupTemplate">
			<@
				_.each(groups,function(group){ 
			@>
			<tr>
				<th><@=group.groupId@></th>
				<td><@=group.name@></td>
				<td><@=moment(group.debutDate).format("YYYY년 MM월 DD일")@></td>
			</tr>
			<@}); @>
	</script>
	<script src="/js/jquery.js"></script>
	<script src="/js/moment-with-locales.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script>
		_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
		const tmpGroup = _.template($("#groupTemplate").html());
		function getGroup(){
			$.ajax({
				url:"/groupList.bmj",
				type:"GET",
				dateType:"json",
				error:function(){alert("서버점검중입니다~~^^7");},
				success:function(json){
					$("tbody").html(tmpGroup({groups:json}));
				}
			});
		}
		getGroup();
	</script>
</body>
</html>