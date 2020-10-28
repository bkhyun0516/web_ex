package org.bmj.guestbook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/edit.guest")
public class Edit extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("POST /edit.guest");
		req.setCharacterEncoding("UTF-8");
		String noStr = req.getParameter("no");
		String writer = req.getParameter("writer");
		String emotionStr = req.getParameter("emotion");
		String contents = req.getParameter("contents");
		String ip=req.getRemoteAddr();
		
		int no = Integer.parseInt(noStr);
		char emotion = emotionStr.charAt(0);
		
		
		resp.sendRedirect("/index.jsp");
	}
}
