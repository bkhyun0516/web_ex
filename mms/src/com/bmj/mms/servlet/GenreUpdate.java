package com.bmj.mms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.mms.dao.GenresDAO;
import com.bmj.mms.vo.Genre;
@WebServlet("/genreUpdate.mms")
public class GenreUpdate 
extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//post방식의 한글처리
//		req.setCharacterEncoding("UTF-8");
		//파라미터 받기
		String noStr = req.getParameter("no");
		String name = req.getParameter("name");
		
		//형변환
		int no = Integer.parseInt(noStr);
		
		//객체 생성
		Genre genre=new Genre();
		genre.setNo(no);
		genre.setName(name);
		
		//업데이트 구문 수행
		GenresDAO.update(genre);
		//리다이렉트 수행
		resp.sendRedirect("/genres.jsp");
	}
}
