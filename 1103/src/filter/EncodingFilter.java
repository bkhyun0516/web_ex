package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;


//@WebFilter("/*")//모든곳에 적용(일반적으로 사용)
@WebFilter({
	"/*"
})//경로별 지정 (여러개 지정하고 싶을때는 배열로 한다!)
public class EncodingFilter implements Filter{
	
	@Override
	public void destroy() {
		System.out.println("destroy");
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//post 방식의 한글 처리
		request.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response);
		
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("init");
		
	}
	
}
