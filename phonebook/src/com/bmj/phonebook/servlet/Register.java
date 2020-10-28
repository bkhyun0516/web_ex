package com.bmj.phonebook.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.phonebook.dao.PhoneBookDAO;
import com.bmj.phonebook.vo.Phone;
@WebServlet("/register.bmj")
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
		
		//형변환
		String phoneNum= phone1+phone2+phone3;
		Date birthDate = Date.valueOf(year+'-'+month+'-'+date);
		char gender = genderStr.charAt(0);
		
//		System.out.println(birthDate);
//		System.out.println(genderStr);
		Phone phone=new Phone(name, phoneNum, gender, birthDate);
		int result = PhoneBookDAO.insert(phone);
//		System.out.println(result);
		resp.sendRedirect("/index.jsp");
	}
}
