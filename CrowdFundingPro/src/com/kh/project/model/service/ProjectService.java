package com.kh.project.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
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

	public Project projectSelect(String pCode) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		
		Project pj=null;
		
		int result=new ProjectDao().projectSelect(conn,pCode);
	
		close(conn);
		return pj;
	}

	public Attachment attachmentSelect(String pCode) {
		Connection conn=getConnection();
		
		Attachment at=new ProjectDao().attachmentSelect(conn,pCode);
		close(conn);
		return at;
	}

	public int insertProject() {
		
		new ProjectDao().insertProject()
		new ProjectDao().insertAttachment()
		return 0;
	}

	
	
	
	
	
	
	
	

}
