package com.bmj.phonebook.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebFilter({
	"/main.jsp","/increase.jsp","/registerForm.jsp","/updateForm.jsp",
	"/register.bmj","/update.bmj","/delete.bmj"
})
public class LoginCheck implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//HttpServletRequest 객체로 강제 형변환
		HttpServletRequest req = (HttpServletRequest)request;
		
		HttpServletResponse resp = (HttpServletResponse)response;
		// 세션을 얻어옵니다.
		HttpSession session = req.getSession();
		
		Object loginMember = session.getAttribute("loginMember");
		if(loginMember==null) {
			session.setAttribute("msg", "먼저 로그인을 부탁드립니다!");
			resp.sendRedirect("/index.jsp");
		}else{
			//로그인이 되어있다.면 해당 페이지 or 서블릿으로 이동
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
