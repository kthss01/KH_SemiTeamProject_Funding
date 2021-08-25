package com.kh.user.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.user.model.vo.User;

public class UserDao {
	private Properties prop = new Properties();

	public UserDao() {
		String fileName = UserDao.class.getResource("/sql/user/user-query.properties").getPath();
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

	public User loginUser(Connection conn, String emailId, String userPwd) {
		User loginUser = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("loginUser");
		//loginUser=SELECT * FROM USER_TB WHERE EMAIL_ID=? AND USER_PWD=? AND STATUS='N'
		
		System.out.println("dao : " + emailId);
		System.out.println("dao : " + userPwd);
		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, emailId);
			pstmt.setString(2, userPwd);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginUser = new User();
				
				loginUser.setUserCode(rset.getString("USER_CODE"));
				loginUser.setEmailId(rset.getString("EMAIL_ID"));
				loginUser.setUserPwd(rset.getString("USER_PWD"));
				loginUser.setUserName(rset.getString("USER_NAME"));
				loginUser.setUserSsn(rset.getString("USER_SSN"));
				loginUser.setUserPhone(rset.getString("PHONE_NUMBER"));
				loginUser.setUserAddress(rset.getString("USER_ADDRESS"));
				loginUser.setPoint(rset.getInt("POINT"));
				
				if(rset.getString("USER_CODE").equals("03")) {
					loginUser.setbNumber(rset.getString("BUSINESS_NUMBER"));
					loginUser.setbName(rset.getString("BUSINESS_NAME"));
				}				
				
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}
		System.out.println("UserDao loginUser : " + loginUser);
		return loginUser;
		
	}

	public int insertUser(Connection conn, User u) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertUser");
		//insertUser=INSERT INTO USER_TB VALUES(SEQ_USER_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, DEFAULT,DEFAULT)
		/*
		USER_NO			VARCHAR2(3 BYTE)
		USER_CODE		VARCHAR2(3 BYTE)
		EMAIL_ID		VARCHAR2(100 BYTE)
		USER_PWD		VARCHAR2(20 BYTE)
		USER_NAME		VARCHAR2(20 BYTE)
		USER_SSN		VARCHAR2(20 BYTE)
		PHONE_NUMBER	VARCHAR2(20 BYTE)
		USER_ADDRESS	VARCHAR2(200 BYTE)
		POINT			NUMBER
		BUSINESS_NUMBER	VARCHAR2(20 BYTE)
		BUSINESS_NAME	VARCHAR2(20 BYTE)
		JOIN_DATE		DATE
		STATUS			CHAR(2 BYTE)
		 */
		
		System.out.println("userDao usrCode : " + u.getUserCode());
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, u.getUserCode());
			pstmt.setString(2, u.getEmailId());
			pstmt.setString(3, u.getUserPwd());
			pstmt.setString(4, u.getUserName());
			pstmt.setString(5, u.getUserSsn());
			pstmt.setString(6, u.getUserPhone());
			pstmt.setString(7, u.getUserAddress());
			pstmt.setInt(8, 20000);
			pstmt.setString(9, u.getbNumber());
			pstmt.setString(10, u.getbName());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public User selectUser(Connection conn, String userId) {
		User mem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectUser");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();

			if (rset.next()) {
//				mem = new User(rset.getInt("USER_NO"), rset.getString("USER_ID"), rset.getString("USER_PWD"),
//						rset.getString("USER_NAME"), rset.getString("PHONE"), rset.getString("EMAIL"),
//						rset.getString("ADDRESS"), rset.getString("INTEREST"), rset.getDate("ENROLL_DATE"),
//						rset.getDate("MODIFY_DATE"), rset.getString("STATUS"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return mem;
	}

	public int updateMmeber(Connection conn, User m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatedUser");
		// updateUser=UPDATE User SET USER_NAME=?, PHONE=?, EMAIL=?, ADDRESS=?,
		// INTEREST=?, MODIFY_DATE=SYSDATE WHERE USER_ID=?

		try {
			
			pstmt = conn.prepareStatement(sql);

			
//			pstmt.setString(1, m.getUserName());
//			pstmt.setString(2, m.getPhone());
//			pstmt.setString(3, m.getEmail());
//			pstmt.setString(4, m.getAddress());
//			pstmt.setString(5, m.getInterest());
//			pstmt.setString(5, m.getUserId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteUser(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteUser");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updatePwd(Connection conn, String userId, String userPwd, String newPwd) {

		// updatePwd=UPDATE User SET USER_PWD=?, MODIFY_DATE=SYSDATE WHERE USER_ID=?
		// AND USER_PWD=?
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");

		try {
			
			pstmt = conn.prepareStatement(sql);

			
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

}
