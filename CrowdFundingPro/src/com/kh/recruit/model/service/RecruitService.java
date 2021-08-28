package com.kh.recruit.model.service;


import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.recruit.model.dao.RecruitDao;
import com.kh.recruit.model.vo.RecruitCode;
import com.kh.recruit.model.vo.Recruitment;

public class RecruitService {
	
	public int insertRecruitment(Recruitment rm) {
		Connection conn = getConnection();
		
		int result = new RecruitDao().insertRecruitment(conn, rm);
		
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new RecruitDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Recruitment> selectList(int startRow, int endRow) {
		Connection conn = getConnection();
		
		ArrayList<Recruitment> list = new RecruitDao().selectList(conn, startRow, endRow);
		
		close(conn);
		
		return list;
	}

	public ArrayList<RecruitCode> selectRecruitCode() {
		Connection conn = getConnection();
		
		ArrayList<RecruitCode> list = new RecruitDao().selectRecruitCode(conn);
		
		close(conn);
		
		return list;
	}

	
}
