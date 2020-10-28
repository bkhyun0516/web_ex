package com.bmj.mms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.mms.dao.GenresDAO;

//어노테이션 기법
@WebServlet("/genreRegister.mms")
public class GenreRegister extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//한글 처리
//		req.setCharacterEncoding("UTF-8");
		//파라미터 받기
		String name= req.getParameter("name");
		//구문처리
		int result = GenresDAO.insert(name);
		//리다이렉트
		resp.sendRedirect("/genres.jsp");
		
	}
}
