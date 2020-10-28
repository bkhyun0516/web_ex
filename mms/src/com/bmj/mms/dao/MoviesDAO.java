package com.bmj.mms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bmj.mms.util.SqlSessionUtil;
import com.bmj.mms.vo.Genre;
import com.bmj.mms.vo.Movie;
import com.bmj.mms.vo.PageVO;

public class MoviesDAO {
	public static List<Movie> selectList(){
		List<Movie> movies = null;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			movies = session.selectList("movies.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return movies;
	}
	public static List<Movie> selectList(PageVO pageVO){
		
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			return session.selectList("movies.selectPageList",pageVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return null;
	}
	public static Movie selectOne(int no){
		Movie movie = null;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			movie = session.selectOne("movies.selectOne",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return movie;
	}
	public static int delete(int no) {
		int result=0;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			result = session.delete("movies.delete",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return result;
	}
	public static int insert(Movie movie) {
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			return session.insert("movies.insert",movie);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return 0;
	}
	public static int update(Movie movie) {
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			return session.update("movies.update",movie);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		return 0;
	}
	public static int selectTotal() {
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			return session.selectOne("movies.selectTotal");
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
