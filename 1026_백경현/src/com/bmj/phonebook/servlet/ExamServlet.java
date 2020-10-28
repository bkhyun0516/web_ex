package com.bmj.phonebook.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/hello.bmj")
public class ExamServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println("<!Doctype html>");
		out.println("<html lang=\"ko\">");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\"/>");
		out.println("<title>헬로 서블릿</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>안녕하세요?</h2>");
		out.println("<a href=\"/index.jsp\">메인 페이지로</a>");
		out.println("</body>");
		out.println("</html>");
	}

}
