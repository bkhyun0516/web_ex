package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class groupList
extends HttpServlet {
	/*
	 * Server Applet의 줄임말
	 * (서버 프로그램)
	 * 
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//응답 컨텐츠 설정
		resp.setContentType("text/html; charset=UTF-8");
		//응답에 글쓰기
		PrintWriter out = resp.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>그룹 목록</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>그룹 목록</h1>");
		out.println("<ul>");
		out.println("</ul>");
		out.println("</body>");
		out.println("</html>");
		
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","test","1111");
			stmt= con.createStatement();
			rs = stmt.executeQuery("SELECT * FROM groups ORDER BY group_id");
			while(rs.next()) {
				out.print("<li>");
				out.print(rs.getInt(1)+") ");
				out.print(rs.getString(2)+"/ ");
				out.print(rs.getDate(3));
				out.print("</li>");
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
				if(stmt!=null)
					stmt.close();
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
				if(con!=null)
					con.close();
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		
	}

}
