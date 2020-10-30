package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.GroupsDAO;
import vo.Group;
@WebServlet("/groupList.bmj")
public class groupList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		List<Group> list = GroupsDAO.selectList();
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(list);
		System.out.println(json);
		out.println(json);
	}
}
