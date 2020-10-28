package org.bmj.guestbook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bmj.guestbook.dao.GuestbookDAO;
import org.bmj.guestbook.vo.Guest;
@WebServlet("/write.guest")
public class Write extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		1) POST 방식의 한글처리
		req.setCharacterEncoding("UTF-8");
		
//		2) 파라미터 얻기
		String emotionStr = req.getParameter("emotion");
		String writer = req.getParameter("writer");
		String contents = req.getParameter("contents");

//		2.5)아이피 얻기
		String ip = req.getRemoteAddr();

//		3) 형변환
		char emotion = emotionStr.charAt(0);

//		4) insert 수행
		Guest guest = new Guest(emotion, writer, contents, ip);
		GuestbookDAO.insert(guest);
//		5)리다이렉트
		System.out.println("POST /write.guest");
		
		
		resp.sendRedirect("/index.jsp");
	}
}
