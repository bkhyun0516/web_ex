package com.bmj.phonebook.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bmj.phonebook.dao.PhoneBookDAO;
import com.bmj.phonebook.vo.Member;
import com.bmj.phonebook.vo.Phone;
@WebServlet("/register.bmj")
public class Register extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//memberNo는 session의
		//loginMember로 등록한 객체안에 있음
		Member loginMember = (Member)req.getSession().getAttribute("loginMember");
		//필터로 포스트방식 한글처리 했다
		//파라미터받기
		String name = req.getParameter("name");
		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		String phone3 = req.getParameter("phone3");
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String date = req.getParameter("date");
		String genderStr = req.getParameter("gender");

		
//		System.out.println(name);
//		System.out.println(phone1);
//		System.out.println(phone2);
//		System.out.println(phone3);
//		System.out.println(year);
//		System.out.println(month);
//		System.out.println(date);
//		System.out.println(genderStr);
		//형변환
		String phoneNum= phone1+phone2+phone3;
		Date birthDate = Date.valueOf(year+'-'+month+'-'+date);
		char gender = genderStr.charAt(0);
		
//		System.out.println(birthDate);
//		System.out.println(genderStr);
		
		Phone phone=new Phone(loginMember.getNo(),name, phoneNum, gender, birthDate);
		int result = PhoneBookDAO.insert(phone);
//		System.out.println(result);
		if(result==1) {
			//HttpSession 객체를 얻어옴
			HttpSession session = req.getSession();
			session.setAttribute("msg", phone.getName()+"님이 전화번호 부에 잘 입력 되었습니다.");
		}//if end
		resp.sendRedirect("/main.jsp");
		
	}
}
/*
 서버사이드 유효성 검사  -> 걍 자바스크립트에서 하자
 public class Register extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//필터로 포스트방식 한글처리 했다
		//파라미터받기
		String name = req.getParameter("name");
		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		String phone3 = req.getParameter("phone3");
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String date = req.getParameter("date");
		String genderStr = req.getParameter("gender");
		
		
//		System.out.println(name);
//		System.out.println(phone1);
//		System.out.println(phone2);
//		System.out.println(phone3);
//		System.out.println(year);
//		System.out.println(month);
//		System.out.println(date);
//		System.out.println(genderStr);
		try {
		//형변환
		String phoneNum= phone1+phone2+phone3;
		Date birthDate = Date.valueOf(year+'-'+month+'-'+date);
		char gender = genderStr.charAt(0);
		
//		System.out.println(birthDate);
//		System.out.println(genderStr);
		
		Phone phone=new Phone(name, phoneNum, gender, birthDate);
		int result = PhoneBookDAO.insert(phone);
//		System.out.println(result);
		if(result==0) {
			resp.sendRedirect("/registerForm.jsp");
		}else{
			resp.sendRedirect("/index.jsp");
		}
		}catch(Exception e){
			resp.sendRedirect("/registerForm.jsp");
		}
	}
}
 */
/*
 * 
 * thin server / fat client
 * 
 * fat server / thin client
 * 
 */
