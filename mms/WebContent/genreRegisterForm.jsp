<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장르입력</title>
</head>
<body>
<h1><a href="/">멋진 영화관리 서비스</a></h1>
<h2>장르 입력</h2>
<form action="/genreRegister.mms" method="post">
<fieldset>
<legend>장르 입력폼</legend>
<div>
	<label>장르명
		<input name="name" placeholder="장르명" autofocus/>
	</label>
</div>
<div>
	<button>입력</button>
	<a href="/genres.jsp">목록으로</a>
</div>

</fieldset>
</form>
</body>
</html>