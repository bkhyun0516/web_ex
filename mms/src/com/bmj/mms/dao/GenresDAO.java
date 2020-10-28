package com.bmj.mms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bmj.mms.util.SqlSessionUtil;
import com.bmj.mms.vo.Genre;

public class GenresDAO {
	public static List<Genre> selectList(){
		List<Genre> genres = null;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			genres = session.selectList("genres.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return genres;
	}
	public static Genre selectOne(int no){
		Genre genre = null;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			genre = session.selectOne("genres.selectOne",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return genre;
	}
	
	public static int delete(int no){
		int result= 0;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			result = session.delete("genres.delete",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return result;
	}
	public static int update(Genre genre){
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			return session.update("genres.update",genre);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return 0;
	}
	public static int insert(String name){
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			return session.insert("genres.insert",name);
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
