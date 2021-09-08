package com.kh.lecture.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;

import com.kh.lecture.model.vo.Lecture;

public class LectureDao {

	private static Properties prop = new Properties();
	
	public LectureDao() {
		String fileName = LectureDao.class.getResource("/sql/lecture/lecture-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public int insertLecture(Connection conn, Lecture lecture) {
		
		int result = 0;
		PreparedStatement pstm = null;
		String sql = prop.getProperty("insertLecture");
		
//		insertLecture=INSERT INTO LECTURE VALUES(SEQ_LECTURE_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?,?)
		
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
			pstm.setString(9, lecture.getLecturer());
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return result;
	}

	public int updateLecture(Connection conn, Lecture lecture) {
		
		int result = 0;
		PreparedStatement pstm = null;
		String sql = prop.getProperty("updateLecture");
		
//		insertLecture=INSERT INTO LECTURE VALUES(SEQ_LECTURE_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)
		
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
			pstm.setString(9, lecture.getLecturer());
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return result;
	}

	public ArrayList<Lecture> selectLectureList(Connection conn) {
		
		ArrayList<Lecture> result = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectLectureList");
		/*
					image,topic,title,date,er,time,num
					*/
		try {
			 pstm = conn.prepareStatement(sql);
			
			 rs = pstm.executeQuery();
				
			while(rs.next()) {
			
				result.add(new Lecture( 
						rs.getInt("LECTURE_IMAGE"),
						rs.getString("LECTURE_TOPIC"),
						rs.getString("LECTURE_TITLE"),
						rs.getDate("LECTURE_DATE"),
						rs.getString("LECTURER"),
						rs.getInt("LECTURE_TIME"),
						rs.getInt("LECTURE_NUM")));
			}
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			close(pstm);
			close(rs);
			
		}
		
		
		return result;
	}
	public int deleteLecture(Connection conn, String lecId) {
		
		int result = 0;
		PreparedStatement pstm = null;
		String sql = prop.getProperty("deleteLecture");
		
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, lecId);
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		
		
		return result;
	}
	
	

}
