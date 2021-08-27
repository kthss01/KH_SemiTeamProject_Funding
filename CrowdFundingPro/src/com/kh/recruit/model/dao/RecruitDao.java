package com.kh.recruit.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.recruit.model.vo.Recruitment;

public class RecruitDao {

	private Properties prop = new Properties();
	
	public RecruitDao() {
		String fileName = RecruitDao.class.getResource("/sql/recruit/recruit-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	public int insertRecruitment(Connection conn, Recruitment rm) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertRecruitment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int index = 1;
			pstmt.setString(index++, rm.getTitle());
			pstmt.setString(index++, rm.getCode());
			// util.Date -> sql.Date 변환
			pstmt.setDate(index++, new java.sql.Date(rm.getStart().getTime()));
			pstmt.setDate(index++, new java.sql.Date(rm.getEnd().getTime()));
			pstmt.setString(index++, rm.getTime());
			pstmt.setString(index++, rm.getContent1());
			pstmt.setString(index++, rm.getContent2());
			pstmt.setString(index++, rm.getContent3());
			pstmt.setString(index++, rm.getContent4());
			pstmt.setString(index++, rm.getContent5());
			pstmt.setString(index++, rm.getContent6());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
