package com.bmj.mms.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.mms.dao.MoviesDAO;
import com.bmj.mms.util.ResizeImageUtil;
import com.bmj.mms.vo.Movie;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/movieRegister.mms")
public class MovieRegister extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.sendRedirect("/");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		
		//req.setCharacterEncoding("UTF-8");
		//서블릿 컨텍스트 얻기
		ServletContext application = req.getServletContext();
		String root = application.getRealPath("/");
		String uploadPath= root+"upload";
		String posterPath= root+"poster";
		MultipartRequest mr = new MultipartRequest(req, uploadPath, 1024*1024*200,"UTF-8",new DefaultFileRenamePolicy());
		String poster = mr.getFilesystemName("poster");
		String source = uploadPath+File.separator+poster;
		String target = posterPath+File.separator+poster;
		ResizeImageUtil.resize(source, target, 160, 234);
		
		
		String name=mr.getParameter("name");
		String director=mr.getParameter("director");
		String audienceNumStr=mr.getParameter("audienceNum");
		String genreIdStr=mr.getParameter("genreId");
		String year=mr.getParameter("year");
		String month=mr.getParameter("month");
		String date=mr.getParameter("date");
		String endDateStr=mr.getParameter("endDate");
		
		Date endDate=null;
		try {
			endDate = Date.valueOf(endDateStr);
		}catch (Exception e) {
		}
	
		int audienceNum= Integer.parseInt(audienceNumStr);
		int genre = Integer.parseInt(genreIdStr);
		Date releaseDate= Date.valueOf(year+'-'+month+'-'+date);
		
		Movie movie= new Movie(audienceNum, genre, name, director, releaseDate);
		movie.setEndDate(endDate);
		movie.setPosterImage(poster);
		MoviesDAO.insert(movie);
		
		
		
		resp.sendRedirect("/movie.jsp?no="+movie.getNo());
	}
}
