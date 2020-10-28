<%@page import="java.io.File"%>
<%@page import="org.bmj.ims.util.ResizeImageUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.bmj.ims.dao.IdolsDAO"%>
<%@page import="org.bmj.ims.vo.Idol"%>

<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//루트경로
	String root=application.getRealPath("/");
	//업로드(원본) 경로
	String uploadPath = root+"upload";
	// profile폴더 경로
	String profilePath = root+"profile";
	//MultipartRequest객체 생성(파일 업로드)
	MultipartRequest mr = new MultipartRequest(request, uploadPath,1024*1024*200, "UTF-8", new DefaultFileRenamePolicy());
	//파일명 얻기
	String profile = mr.getFilesystemName("profile");
	//경로+이름 
	String source = uploadPath+File.separator+profile;
	String target = profilePath+File.separator+profile;
	
	// 이미지 리사이즈
	ResizeImageUtil.resize(source, target, 160);
	//실제 파일 명 얻기



	//post방식의 한글 처리
	//request.setCharacterEncoding("UTF-8");
	// 등록페이지는 유저에게 보여줄 컨텐츠가 없다.
	// 이런 페이지를 none-view라고 함
	
	String name = mr.getParameter("name");
	String heightStr = mr.getParameter("height");
	String weightStr = mr.getParameter("weight");
	String year = mr.getParameter("year");
	String month = mr.getParameter("month");
	String date = mr.getParameter("date");
	String genderStr = mr.getParameter("gender");
	String groupIdStr = mr.getParameter("groupId");
	
	
	Idol idol = new Idol();
	idol.setName(name);
	idol.setProfileImage(profile);
	idol.setHeight(Double.parseDouble(heightStr));
	idol.setWeight(Double.parseDouble(weightStr));
	idol.setBirthDate(Date.valueOf(year+"-"+month+"-"+date));
	idol.setGender(genderStr.charAt(0));
	idol.setGroupId(Integer.parseInt(groupIdStr));	

	int result = IdolsDAO.insert(idol);

	// 이 페이지에서 insert한 후
	// groupList.jsp로 이동(리다이렉트)
	 response.sendRedirect("/idolDetail.jsp?idolId="+idol.getIdolId());
%>
<%--
이름: <%=name  %> <br/>
키: <%=heightStr  %> <br/>
무게: <%=weightStr  %> <br/>
년: <%=year  %> <br/>
월: <%=month  %> <br/>
일: <%=date  %> <br/>
성별: <%=genderStr  %> <br/>
그룹번호: <%=groupIdStr  %>
jsp주석은 .java 파일로 바뀔 때 아예 없어진다.
 --%>
