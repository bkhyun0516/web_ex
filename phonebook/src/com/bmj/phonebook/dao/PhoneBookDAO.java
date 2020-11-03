package com.bmj.phonebook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bmj.phonebook.util.SqlSessionUtil;
import com.bmj.phonebook.vo.PageVO;
import com.bmj.phonebook.vo.Phone;

public class PhoneBookDAO {
	public static List<Phone> selectList(PageVO pageVO){
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			return session.selectList("phonebook.selectList",pageVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return null;
	}
	public static Phone selectOne(int no){
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			return session.selectOne("phonebook.selectOne",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return null;
	}
	public static int selectTotal(int memberNo){
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			return session.selectOne("phonebook.selectTotal",memberNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return 0;
	}
	
	public static int insert(Phone phone){
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			return session.insert("phonebook.insert",phone);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return 0;
	}
	public static int update(Phone phone){
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			return session.update("phonebook.update",phone);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return 0;
	}
	public static int delete(int no){
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			return session.delete("phonebook.delete",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return 0;
	}
	
}
