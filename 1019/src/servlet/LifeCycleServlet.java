package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LifeCycleServlet
extends HttpServlet{
	//최초생성시 작동
	
	public LifeCycleServlet() {
		System.out.println("생성이 되었다.");
	}
	//최초생성시 작동
	@Override
	public void init() throws ServletException {
		System.out.println("준비중!!");
	}
	
	//요청마다 작동
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get 방식이명 doGet
		//post 방식이면 doPost
		String ip = req.getRemoteAddr();
		//ip
		System.out.println(ip);
		
		System.out.println("서비스서비스");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println("<!Doctype html>");
		out.println("<html lang=ko>");
		
		out.println("<head>");
		out.println("<meta charset='UTF-8'/>");
		out.println("<title>라이프</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>서블릿의 인생</h1>");
		out.println("</body>");
		out.println("</html>");
		
	}
	//서버에서 종료시 작동
	@Override
	public void destroy() {
		System.out.println("죽었다");
	}
}
