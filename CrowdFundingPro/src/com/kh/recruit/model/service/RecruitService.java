package com.kh.recruit.model.service;


import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.recruit.model.dao.RecruitDao;
import com.kh.recruit.model.vo.Recruitment;

public class RecruitService {
	
	public int insertRecruitment(Recruitment rm) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new RecruitDao().insertRecruitment(conn, rm);
		
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

}
