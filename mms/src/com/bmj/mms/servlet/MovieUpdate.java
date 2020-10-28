package com.bmj.mms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.mms.dao.MoviesDAO;
import com.bmj.mms.vo.Movie;

@WebServlet("/movieUpdate.mms")
public class MovieUpdate extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.sendRedirect("/");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
		
		String name=req.getParameter("name");
		String director=req.getParameter("director");
		String audienceNumStr=req.getParameter("audienceNum");
		String genreIdStr=req.getParameter("genreId");
		String year=req.getParameter("year");
		String month=req.getParameter("month");
		String date=req.getParameter("date");
		String noStr = req.getParameter("no");
		String endDateStr=req.getParameter("endDate");
		
		
		System.out.println(endDateStr);
		Date endDate=null;
		try {
			endDate = Date.valueOf(endDateStr);
		}catch (Exception e) {
		}
		int no = Integer.parseInt(noStr);
		int audienceNum= Integer.parseInt(audienceNumStr);
		int genre = Integer.parseInt(genreIdStr);
		Date releaseDate= Date.valueOf(year+'-'+month+'-'+date);
		
		Movie movie= new Movie(audienceNum, genre, name, director, releaseDate);
		movie.setNo(no);
		movie.setEndDate(endDate);
		MoviesDAO.update(movie);
		resp.sendRedirect("/movie.jsp?no="+no);
	}
}
