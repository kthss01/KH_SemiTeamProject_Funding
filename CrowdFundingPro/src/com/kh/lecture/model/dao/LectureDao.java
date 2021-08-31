package com.kh.lecture.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;

import com.kh.lecture.model.vo.Lecture;

public class LectureDao {

	private static Properties properties = new Properties();

	public int insertLecture(Connection conn, Lecture lecture) {
		
		int result = 0;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		String sql = properties.getProperty("insertLecture");
		
//		insertLecture=INSERT INTO LECTURE VALUES(SEQ_LECTURE_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)

//		LECTURE_CODE
//		LECTURE_TITLE
//		LECTURE_NUM
//		LECTURE_ADDRESS
//		LECTURE_TOPIC
//		LECTURE_DATE
//		LECTURE_TIME
//		LECTURE_IMAGE
//		LECTURE_CONTENT
//		
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, lecture.getLectureTitle());
			pstm.setInt(2, lecture.getLectureNum());
			pstm.setString(3, lecture.getLectureAddress());
			pstm.setString(4, lecture.getLectureTopic());
			pstm.setDate(5, lecture.getLectureDate());
			pstm.setInt(6, lecture.getLectureTime());
			pstm.setInt(7, lecture.getLectureImage());
			pstm.setString(8, lecture.getLectureContent());
			
			rs = pstm.executeQuery();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			
			close(rs);
			close(pstm);
			
		}
		
		
		return result;
	}

	public int updateLecture(Connection conn, Lecture lecture) {
		return 0;
	}
	
	

}
