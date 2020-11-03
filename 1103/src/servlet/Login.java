package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MembersDAO;
import vo.Member;
@WebServlet("/login.do")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//넘어온 파라미터얻기
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		
		//멤버객체 생성
		Member member=new Member(id, password);
		//로그인 구문수행 후
		Member loginMember = MembersDAO.selectLogin(member);
		//세션객체 얻기
		HttpSession session = req.getSession();
		//세션 객체에 속성 세팅
		session.setAttribute("loginMember",loginMember);
		//인덱스로 리다이렉트
		resp.sendRedirect("/index.jsp");
		
	}
}
