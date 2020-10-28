<%@page import="java.io.File"%>
<%@page import="com.bmj.test.util.ResizeImageUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*	
	enctype이 application/x-www-form-urlencoded  일때
	즉 모든 파라미터가 글자로 넘어올때는
	우리가 지금까지 했던 방식으로
	파라미터를 받을수 있음
	하지만 multipart/form-data방식이면  쉽게 처리 불가능
	-> 라이브러리 활용한다.
	
	1)cos라이브러리:MODEL1방식
	2) apache재단의 common-fileupload라이브러리
	스프링에서 사용
*/	
/*
	파일 업로드를 하려면 업로드할 경로를 알아야 한다.
	
	MultipartRequest객체 생성자
	1)request객체
	2)업로드할 경로
	3) 업로드 파일 사이즈
	4) 인코딩방식
	5)FileRenamePolicy(새파일이름정책)
		ex) DefaultFileRenamePolicy()->   중복 이름파일명 뒤에 숫자를 붙여준다.
*/
	//서버의 루트 경로
	String root  = application.getRealPath("/");
	//업로드 패스
	String uploadPath = root + "upload";
	//썸네일 이미지 경로
		String thumbPath = root + "thumbs";
	
	
	//multipartRequest로 넘어온 파라미터를 처리하는 
	//객체 생성될 때 파일이 업로드가됨
		MultipartRequest mr = new MultipartRequest(request,uploadPath,1024*1024*100,"UTF-8",new DefaultFileRenamePolicy());
	//파일명
		String fileName = mr.getFilesystemName("profile");
	
	//원본 소스
	String source = uploadPath+File.separator+fileName; //OS마다 다르기때문에 javaIO의 File.separator 쓴다.
	//저장될 타겟
	String target = thumbPath+File.separator+fileName;
	
	ResizeImageUtil.resize(source, target, 180);


	//이름
	String name = mr.getParameter("name");
	//아이디
	String id = mr.getParameter("id");
	
	

%>
이름: <%=name %><br/>
아이디: <%=id %><br/>
파일명: <%=fileName %><br/>
원본: <%=source %><br/>
타겟: <%=target %><br/>
<img src="/thumbs/<%=fileName %>" /><br>
<img src="/upload/<%=fileName %>" /><br>
<!--
	<%=root%><br/>
	<%=uploadPath%>
-->