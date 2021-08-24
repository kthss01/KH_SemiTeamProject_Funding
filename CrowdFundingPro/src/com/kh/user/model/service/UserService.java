package com.kh.user.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.user.model.dao.UserDao;
import com.kh.user.model.vo.User;

public class UserService {

	public User loginUser(String emailId, String userPwd) {
		Connection conn = getConnection();
	
		User loginUser = new UserDao().loginUser(conn,emailId,userPwd);
		close(conn);
		return loginUser;
	}

	public int insertUser(User u) {
		Connection conn = getConnection();
		
		int result = new UserDao().insertUser(conn,u);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public User selectUser(String emailId) {
		Connection conn = getConnection();
		
		User u = new UserDao().selectUser(conn, emailId);
		close(conn);
		return u;
	}

	public User updateUser(User m) {
		Connection conn = getConnection();
		
		User updateMem = null;
		int result = new UserDao().updateMmeber(conn,m);
		if(result>0) {
			commit(conn);
			updateMem = new UserDao().selectUser(conn, m.getEmailId());
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}

	public int deleteUser(String userId) {
		Connection conn = getConnection();
		
		int result = new UserDao().deleteUser(conn,userId);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public User updatePwd(String userId, String userPwd, String newPwd) {
Connection conn = getConnection();
		
		User updateMem = null;
		int result = new UserDao().updatePwd(conn,userId, userPwd, newPwd);
		if(result>0) {
			commit(conn);
			updateMem = new UserDao().selectUser(conn, userId);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}

}
