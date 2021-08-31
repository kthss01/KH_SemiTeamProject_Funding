package com.kh.lecture.model.service;

import java.sql.Connection;
import static com.kh.common.JDBCTemplate.*;

import com.kh.lecture.model.dao.LectureDao;
import com.kh.lecture.model.vo.Lecture;


public class LectureService {
	
	public int insertLecture(Lecture lecture){
		
		Connection conn = getConnection();
		int result = new LectureDao().insertLecture(conn,lecture);
		close(conn);
		
		return result ;
		
	}
	
	public int updateLectrue(Lecture lecture) {
		
		Connection conn = getConnection();
		int result = new LectureDao().updateLecture(conn,lecture);
		close(conn);
		
		return result;
		
	}
	
//	
//	public Lecture chooseLectrue(Lecture lecture) {
//		
//		Lecture l = null;
//		ArrayL
	
//		return l;
//		
//	}
	
}
