package com.bmj.mms.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bmj.mms.dao.GenresDAO;

//서블릿과 URL 매핑
//어노테이션(annotation)
@WebServlet("/genreRemove.mms")
public class GenreRemove
extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		//파라미터 받기
		String noStr = req.getParameter("no");
		//형 변환
		int no = Integer.parseInt(noStr);
		//delete구문 수행
		GenresDAO.delete(no);
		// genres.jsp로 리다이렉트	
		resp.sendRedirect("/genres.jsp");
		
	}
	
}