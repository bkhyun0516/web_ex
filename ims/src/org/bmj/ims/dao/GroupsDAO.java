package org.bmj.ims.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bmj.ims.util.SqlSessionUtil;
import org.bmj.ims.vo.Group;
import org.bmj.ims.vo.PageVO;

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
	public static Group selectOne(int groupId){
		Group group = null;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			group = session.selectOne("groups.selectOne",groupId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		
		return group;
	}
	public static int selectTotal(){
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			return session.selectOne("groups.selectTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		
		return 0;
	}
	public static List<Group> selectList(PageVO pageVO){
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			return session.selectList("groups.selectPageList",pageVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		
		return null;
	}
	
	public static int insert(Group group) {
		int result=0;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			result = session.insert("groups.insert",group);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return result;
	}
	public static int update(Group group) {
		int result=0;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			result = session.update("groups.update",group);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return result;
	}
	public static int delete(int groupId) {
		int result=0;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			result = session.delete("groups.delete",groupId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return result;
	}
}
