package com.kh.project.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.project.model.dao.ProjectDao;
import com.kh.common.model.vo.Attachment;
import com.kh.project.model.vo.Project;

public class ProjectService {

	

	public ArrayList<Project> selectList() {
		Connection conn=getConnection();
		ArrayList<Project> list=new ProjectDao().selectList(conn);
		close(conn);
		return list;
	}

	


	public int insertProject(Project pj, Attachment at) {
		
		Connection conn=getConnection();
		int result1=0;
		int result2=0;
		result2=new ProjectDao().insertAttachment(conn,at);
		System.out.println("RESULT2" + result2);
		
		int fileNo = new ProjectDao().selectFileNo(conn,at);
		System.out.println("FILENO" + fileNo);
		at.setFileNo(fileNo);
		
		
		
		
		result1=new ProjectDao().insertProject(conn,pj,at);
		System.out.println("RESULT1" + result1);
		
		try {
			if(result1*result2 > 0) {
				conn.commit();
			}else {
				conn.rollback();
			}
		}catch(Exception e) {}
		
		return result1*result2;
	}




	public Project projectSelect(int pCode) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		Project pj=new ProjectDao().projectSelect(conn,pCode);
		close(conn);
		return pj;
		
		
		
		
	}

	
	
	
	
	
	
	
	

}
