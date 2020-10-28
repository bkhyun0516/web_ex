package com.bmj.test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Test1 implements Filter{
	public Test1() {
		System.out.println("test1 태.어.났.다.!");
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("test1 준비중......");
		
	}
	
	@Override
	public void destroy() {
		System.out.println("test1 죽었다.......");
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("test1 전처리");
		
		chain.doFilter(request, response);// 얘를 써야지만 다음으로 넘어간다.
		
		System.out.println("test1 후처리");
	}

}
