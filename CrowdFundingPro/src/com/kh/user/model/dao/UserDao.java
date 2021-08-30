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
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public User selectUser(Connection conn, String emailId) {
		User u = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectUser");
		//selectUser=SELECT * FROM USER_TB WHERE EMAIL_ID=? AND STATUS='N'

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, emailId);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				u = new User();
				u.setUserCode(rset.getString("USER_CODE"));
				u.setEmailId(emailId);
				u.setUserPwd(rset.getString("USER_PWD"));
				u.setUserName(rset.getString("USER_NAME"));
				u.setUserPhone(rset.getString("PHONE_NUMBER"));
				u.setUserAddress(rset.getString("USER_ADDRESS"));
				u.setPoint(rset.getInt("POINT"));
						
						
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return u;
	}

	public int updateMmeber(Connection conn, User u) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateUser");
//		updateUser=UPDATE USER_TB SET USER_PWD=?, PHONE_NUMBER=?, USER_ADDRESS=?, WHERE EMAIL_ID=?


		try {
			
			pstmt = conn.prepareStatement(sql);

			
			pstmt.setString(1, u.getUserPwd());
			pstmt.setString(2, u.getUserPhone());
			pstmt.setString(3, u.getUserAddress());
			pstmt.setString(4, u.getEmailId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteUser(Connection conn, String emailId) {
		int result = 0;
		System.out.println("userDao delete result : " + emailId);

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteupdateUser");
//		deleteupdateUser=UPDATE USER_TB SET STATUS='Y' WHERE EMAIL_ID=?

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, emailId);

			result = pstmt.executeUpdate();
			System.out.println("userDao delete result : " + result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int emailIdCheck(Connection conn, String emailId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("idCheck");
		//idCheck=SELECT COUNT(*) FROM USER_TB WHERE EMAIL_ID=? AND STATUS='N'
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, emailId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}

			System.out.println("rset.getInt(1) result = " + result);
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}


}
