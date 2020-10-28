package org.bmj.guestbook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bmj.guestbook.dao.GuestbookDAO;

@WebServlet("/delete.guest")
public class Delete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("GET /delete.guest");
		String noStr = req.getParameter("no");
		int no = Integer.parseInt(noStr);
		GuestbookDAO.delete(no);
		resp.sendRedirect("/index.jsp");
	}
}
