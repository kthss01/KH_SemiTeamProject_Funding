package com.kh.recruit.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.kh.recruit.model.vo.RecruitCode;
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

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount");

		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				// 이렇게 쓰면 가독성 문제로 컬럼명으로 보통 한다고 함
				listCount = rset.getInt(1); // count
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public ArrayList<Recruitment> selectList(Connection conn, int startRow, int endRow) {
		ArrayList<Recruitment> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				int id = rset.getInt("R_ID");
				String title = rset.getString("R_TITLE");
				String code = rset.getString("R_CODE");
				Date start = rset.getDate("R_START");
				Date end = rset.getDate("R_END");
				String time = rset.getString("R_TIME");
				String content1 = rset.getString("R_CONTENT1");
				String content2 = rset.getString("R_CONTENT2");
				String content3 = rset.getString("R_CONTENT3");
				String content4 = rset.getString("R_CONTENT4");
				String content5 = rset.getString("R_CONTENT5");
				String content6 = rset.getString("R_CONTENT6");

				list.add(new Recruitment(id, title, code, start, end, time, content1, content2, content3, content4,
						content5, content6));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<RecruitCode> selectRecruitCode(Connection conn) {
		ArrayList<RecruitCode> list = new ArrayList<RecruitCode>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectRecruitCode");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new RecruitCode(
							rset.getString("R_CODE"),
							rset.getInt("COUNT")
						));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

}
