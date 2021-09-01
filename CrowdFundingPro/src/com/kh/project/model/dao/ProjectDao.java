package com.kh.project.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.Attachment;
import com.kh.project.model.vo.Project;


public class ProjectDao {
	private Properties prop = new Properties();

	public ProjectDao() {
		String fileName = ProjectDao.class.getResource("/sql/projcet/project-query.properties").getPath();
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

	

	public ArrayList<Project> selectList(Connection conn) {
		ArrayList<Project> list=new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Project pj=new Project();
				//코드 이미지 이름 현재금액
				pj.setProjectCode(rset.getString("PROJECT_CODE"));
				pj.setProjectName(rset.getString("PROJECT_NAME"));
				pj.setAmountGoal(rset.getInt("AMOUNT_COAL"));
				//pj.setFileNo(rset.getInt("FILE_NO"));
				
				//pj.setAmountPresent(rset.getString("AMOUNT_PRESENT"));
				
				list.add(pj);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int projectSelect(Connection conn, String pCode) {
		Project pj = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("projectSelect");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,pCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				//이미지 프로젝트명 펀딩금액 현재금액 종료일 배송료 프로젝트스토리
//				pj = new Project( rset.getInt("FILE_NO"),
//						rset.getString("PROJECT_NAME"),
//						rset.getInt("AMOUNT_GOAL"),
//						rset.getInt("AMOUNT_PRESENT"),
//						rset.getDate("DDLN"),
//						rset.getInt("DELIVERY_CHARGE"),
//						rset.getString("DETAIL_INTRO")
//						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		//return pj;
	}



	public Attachment attachmentSelect(Connection conn, String pCode) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("attachmentSelect");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			
			rset = pstmt.executeQuery();
			
//			if(rset.next()) {
//				at = new Attachment();
//				at.setFileNo(rset.getInt("FILE_NO"));
//				at.setOriginName(rset.getString("ORIGIN_NAME"));
//				at.setChangeName(rset.getString("CHANGE_NAME"));
//			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return at;
		
	}

	

	

}
