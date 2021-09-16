package com.kh.project.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
//import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.kh.common.model.vo.Attachment;
import com.kh.project.model.dao.ProjectDao;
import com.kh.project.model.vo.Project;
import com.kh.user.model.vo.User;

public class ProjectService {

	public ArrayList<Project> selectList() {
		Connection conn = getConnection();
		ArrayList<Project> list = new ProjectDao().selectList(conn);
		close(conn);
		return list;
	}

	public int insertProject(Project pj, Attachment at) {

		Connection conn = getConnection();
		int result1 = 0;
		int result2 = 0;
		result2 = new ProjectDao().insertAttachment(conn, at);// 1
		System.out.println("RESULT2" + result2);

		int fileNo = new ProjectDao().selectFileNo(conn, at);// 2
		System.out.println("FILENO" + fileNo);
		at.setFileNo(fileNo);

		result1 = new ProjectDao().insertProject(conn, pj, at);// 3
		System.out.println("RESULT1" + result1);

		try {
			if (result1 * result2 > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
		} catch (Exception e) {

		}

		return result1 * result2;
	}

	public Project projectSelect(int pCode) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		Project pj = new ProjectDao().projectSelect(conn, pCode);
		close(conn);
		return pj;

	}

	public Project updatePSelect(int fn) {
		Connection conn = getConnection();
		Project pj = new ProjectDao().updatePSelect(conn, fn);

		close(conn);
		return pj;
	}

	public Attachment updateASelect(int fn) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		Attachment at = new ProjectDao().updateASelect(conn, fn);
		System.out.println(at);
		close(conn);
		return at;
	}

	public int updateProject(Project pj, Attachment at) {

		Connection conn = getConnection();

		int result1 = new ProjectDao().attachmentUpdate(conn, at);

		int fileNo = new ProjectDao().selectFileNo(conn, at);
		at.setFileNo(fileNo);

		int result2 = new ProjectDao().projectUpdate(conn, pj, at);

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result1 * result2;

	}

	public int getListCount() {
		Connection conn = getConnection();

		int result = new ProjectDao().getListCount(conn);

		close(conn);

		return result;
	}

	public ArrayList<Project> selectProjectList(int startRow, int endRow) {
		Connection conn = getConnection();

		ArrayList<Project> list = new ProjectDao().selectProjectList(conn, startRow, endRow);

		close(conn);

		return list;
	}

	public Map<Integer, String> selectCategoryList() {
		Connection conn = getConnection();
		Map<Integer, String> map = new ProjectDao().selectCategoryList(conn);
		close(conn);
		return map;
	}

	public ArrayList<Project> selectRandomList() {
		Connection conn = getConnection();

		ArrayList<Project> list = new ProjectDao().selectRandomList(conn);

		close(conn);
		return list;
	}

	public ArrayList<Project> selectProjectListWithCategory(int startRow, int endRow, int categoryNo) {
		Connection conn = getConnection();

		ArrayList<Project> list = new ProjectDao().selectProjectListWithCategory(conn, startRow, endRow, categoryNo);

		close(conn);
		return list;
	}









	
	public ArrayList<Project> selectRankList() {
		Connection conn = getConnection();

		ArrayList<Project> list = new ProjectDao().selectRankList(conn);

		close(conn);
		return list;
	}

	public Map<Integer, Integer> getListCountWithCategoryNo() {
		Connection conn = getConnection();
		Map<Integer, Integer> map = new ProjectDao().getListCountWithCategoryNo(conn);
		close(conn);
		return map;
	}

	public ArrayList<Project> selectProjectListWithSearchValue(int startRow, int endRow, String searchValue) {
		Connection conn = getConnection();

		ArrayList<Project> list = new ProjectDao().selectProjectListWithSearchValue(conn, startRow, endRow,
				searchValue);

		close(conn);

		return list;
	}

	public ArrayList<Project> searchList(String keyword) {
		Connection conn = getConnection();

		ArrayList<Project> list = new ProjectDao().searchList(conn, keyword);

		close(conn);
		return list;
	}

	public int getSearchCount(String searchValue) {
		Connection conn = getConnection();

		int result = new ProjectDao().getSearchCount(conn, searchValue);

		close(conn);

		return result;
	}

	public int getSearchCountWithCategoryNo(int categoryNo, String searchValue) {
		Connection conn = getConnection();

		int result = new ProjectDao().getSearchCountWithCategoryNo(conn, categoryNo, searchValue);

		close(conn);

		return result;
	}

	public String getCategoryName(String categoryNo) {
		Connection conn = getConnection();

		String result = new ProjectDao().getCategoryName(conn, categoryNo);

		close(conn);

		return result;
	}

	public ArrayList<Project> selectProjectListWithCategoryAndSearchValue(int startRow, int endRow, int categoryNo,
			String searchValue) {
		Connection conn = getConnection();

		ArrayList<Project> list = new ProjectDao().selectProjectListWithCategoryAndSearchValue(conn, startRow, endRow,
				categoryNo, searchValue);

		close(conn);
		return list;
	}

	//================================================================================================================================
	public int insertSUP(User user, Project pj) {
		
		Connection conn = getConnection();
		int result1 = 0;
		
		

		

		result1 = new ProjectDao().insertSUP(conn,user,pj);
		

		try {
			if (result1 > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
		} catch (Exception e) {

		}

		return result1 ;
		
		
		
		
	}
	
	
	
	
	

}