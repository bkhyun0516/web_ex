package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/login.do")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String password = req.getParameter("password");//input type password는 항상 영어로 입력받는다!
		System.out.println("id:"+id);
		System.out.println("password:"+password);
		/*
		 	원래는 아이디와 비밀번호가 디비에 있는경우만 로그인 가능
		 	오늘은 임시
		 */
		if(id.equals("test")&&password.equals("1234")) {
			HttpSession session = req.getSession();
			
			//세션에 loginUser 세팅
			session.setAttribute("loginUser","테스터");
		}
		resp.sendRedirect("/index.jsp");
		
	}
}
