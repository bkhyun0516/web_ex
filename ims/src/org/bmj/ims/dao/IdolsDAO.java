package org.bmj.ims.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bmj.ims.util.SqlSessionUtil;

import org.bmj.ims.vo.Idol;

public class IdolsDAO{
	
	public static List<Idol> selectListByGroupId(int groupId){
		List<Idol> idols = null;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			idols = session.selectList("idols.selectListByGroupId",groupId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		
		return idols;
	}
	public static Idol selectOne(int idolId){
		Idol idol = null;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			idol = session.selectOne("idols.selectOne",idolId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		
		return idol;
	}
	public static List<Idol> selectList(){
		List<Idol> idols = null;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			idols = session.selectList("idols.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		
		return idols;
	}
	public static int insert(Idol idol){
		int result =0;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			result = session.insert("idols.insert",idol);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) {
				session.close();
			}
		}//try ~ catch ~ finally end
		
		return result;
	}
	public static int delete(int idolId){
		int result =0;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			result = session.delete("idols.delete",idolId);
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