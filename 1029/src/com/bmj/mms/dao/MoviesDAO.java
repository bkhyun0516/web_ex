package com.bmj.mms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bmj.mms.util.SqlSessionUtil;
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
}
