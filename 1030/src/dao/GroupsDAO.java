package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import util.SqlSessionUtil;
import vo.Group;


public class GroupsDAO {
	public static List<Group> selectList(){
		List<Group> groups = null;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			groups = session.selectList("groups.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		
		return groups;
	}
	
}
