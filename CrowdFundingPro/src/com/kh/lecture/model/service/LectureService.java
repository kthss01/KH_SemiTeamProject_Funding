package com.kh.lecture.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.lecture.model.dao.LectureDao;
import com.kh.lecture.model.vo.Lecture;


public class LectureService {
	
	public int insertLecture(Lecture lecture){
		
		Connection conn = getConnection();
		int result = new LectureDao().insertLecture(conn,lecture);
		
		if ( result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		close(conn);
		
		return result ;
		
	}
	
	public int updateLectrue(Lecture lecture) {
		
		Connection conn = getConnection();
		int result = new LectureDao().updateLecture(conn,lecture);
		if ( result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

	public ArrayList<Lecture> selectLectureList() {
		
		Connection conn = getConnection();
		ArrayList<Lecture> result = new LectureDao().selectLectureList(conn);
		close(conn);
		return result;
	}

	public int deleteLecture(String lecId) {
		
		Connection conn = getConnection();
		int result = new LectureDao().deleteLecture(conn,lecId);
		
		if ( result > 0 )  commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

	public Lecture selectLecture(String lecId) {
		
		Connection conn = getConnection();
		Lecture lecture = new LectureDao().selectLecture(conn);
		close(conn);
		return lecture;
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
