package com.bmj.mms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bmj.mms.util.SqlSessionUtil;
import com.bmj.mms.vo.Idol;
import com.bmj.mms.vo.PageVO;


public class IdolsDAO{
	
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
	
}
