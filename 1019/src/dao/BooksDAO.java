package dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import util.SqlSessionUtil;
import vo.Book;

public class BooksDAO {
	public static List<Book> selectList() {
		List<Book> books =null;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			books = session.selectList("books.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		
		
		return books;
	}


}
