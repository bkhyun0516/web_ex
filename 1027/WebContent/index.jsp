<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/all.min.css" >
<style>
	div{
		margin:10px;
	}
	label.fas{
		font-size:60px;
	}
	input[type=file] {
		/*display:none;*/
	}
</style>
</head>
<body>
<h1>회원가입</h1>
<!-- 
	enctype="application/x-www-form-urlencoded" : url인코딩 방식
	
	enctype 이
	x-www-form-urlencoded이 기본값
	파라미터를 글자로 넘기는 방식
	(한글등 영어 제외한 언어들을 %XX로 표기)
	
	파일 업로드를 하려면
	무조건  POST방식
	그리고 enctype을 'multipart/form-data'로 해야한다.
	
	 enctype="application/x-www-form-urlencoded" 상태면 파일 이름만 폼을 통해서 넘어간다.
 -->
<form action="/upload.jsp" method="post" enctype="multipart/form-data">
	<fieldset>
		<legend>회원가입폼</legend>
		<div>
			<label>
				이름 
				<input name="name"/>
			</label>
		</div>
		<div>
			<label>
				아이디
				<input name="id"/>
			</label>
		</div>
		<div>
			<label class="fas fa-paperclip">
				<input type="file" name="profile"/>
			</label>
		</div>
		<div>
			<button>회원가입</button>
		</div>
	</fieldset>
</form>
</body>
</html>