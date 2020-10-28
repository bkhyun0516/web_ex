package com.bmj.phonebook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.phonebook.dao.PhoneBookDAO;
@WebServlet("/delete.bmj")
public class Delete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//파라미터를 얻기
		String noStr = req.getParameter("no");
		//형변환
		int no = Integer.parseInt(noStr);
		//no로 delete수행
		int result = PhoneBookDAO.delete(no);
		// index.jsp 로 리다이렉트
		resp.sendRedirect("/index.jsp");
	}
}
