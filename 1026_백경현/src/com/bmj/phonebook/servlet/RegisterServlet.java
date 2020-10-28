package com.bmj.phonebook.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.phonebook.dao.PhonebookDAO;
import com.bmj.phonebook.vo.Phone;

@WebServlet("/register.bmj")
public class RegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		System.out.println("POST /register.bmj");
		String name = req.getParameter("name");
		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		String phone3 = req.getParameter("phone3");
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String date = req.getParameter("date");
		String genderStr = req.getParameter("gender");
		
		String phone = phone1+phone2+phone3;
		Date birthDate=Date.valueOf(year+'-'+month+'-'+date);
		char gender=genderStr.charAt(0);
		
		Phone ph = new Phone(name, phone, gender, birthDate);
		
		PhonebookDAO.insert(ph);
		
		resp.sendRedirect("/index.jsp");
		
		
		
	}
}
