<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String noStr = request.getParameter("no");
    	int no = Integer.parseInt(noStr);
 
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>방명록 수정</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
	<link rel="stylesheet" href="/css/form.css"/>
	<style>
		
	</style>
</head>
<body>

<%@ include file="/WEB-INF/template/header.jsp" %>
	<h2><i class="fas fa-pencil-alt"></i> 방명록 수정</h2>
	<form method="post" action="/edit.guest">
		<input type="hidden" name="no" value=no/ >
		<fieldset>
			<legend class="screen_out">글쓰기 수정폼</legend>
			<div>
				<strong class="title middle">표정짓기</strong>
				<label class="emotion">
				<input type="radio" name="emotion" value="G">
					<i class="far fa-grin-stars"></i>
				</label>
				<label class="emotion">
				<input type="radio" name="emotion" value="F">
					<i class="far fa-laugh-squint"></i>
				</label>
				<label class="emotion">
					<input type="radio" name="emotion" value="L">
					<i class="far fa-smile"></i>
				</label>
				<label class="emotion">
					<input type="radio" name="emotion" value="S">
					<i class="far fa-sad-cry"></i>
				</label>
				<label class="emotion">
					<input type="radio" name="emotion" value="A">
					<i class="far fa-angry"></i>
				</label>
			</div>
			<div>
				<label class="title" for="writer">작성자</label>
				<input type="text" id="writer" name="writer"
				 placeholder="작성자를 입력"/>
			</div>
			<div>
				<label class="title"  for="contents">내 용</label>
				<textarea id="contents" name="contents"
				placeholder="내용 입력"
				 cols="50" rows="5"></textarea>
			</div>
			<div class="btn_box">
				<button class="btn" type="reset"><i class="fas fa-retweet"></i> 리 셋</button>
				<button class="btn" type="submit"><i class="fas fa-pencil-alt"></i> 수정</button>
				<a class="btn" href="index.jsp"><i class="fa fa-arrow-left "></i> 방명록으로</a>
			</div>
		</fieldset>					
	</form>

 <%@ include file="/WEB-INF/template/footer.jsp" %>
</body>
</html>
    