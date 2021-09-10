package com.kh.project.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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
		String fileName = ProjectDao.class.getResource("/sql/project/project-query.properties").getPath();
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
		//SELECT PROJECT_CODE,CHANGE_NAME,PROJECT_NAME,AMOUNT_PRESENT
		//FROM PROJECT JOIN ATTACHMENT USING(FILE_NO) ORDER BY PROJECT_CODE
		try {
			pstmt=conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Project pj=new Project();
				
				pj.setProjectCode(rset.getInt("PROJECT_CODE"));
				pj.setProjectName(rset.getString("PROJECT_NAME"));
				pj.setAmountPresent(rset.getInt("AMOUNT_PRESENT"));
				
				pj.setTitleImg(rset.getString("CHANGE_NAME"));
				
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

	



	
//	public Attachment attachmentSelect(Connection conn, String pCode) {
//		Attachment at = null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		String sql = prop.getProperty("attachmentSelect");
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, pCode);
//			
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				at = new Attachment();
//				at.setFileNo(rset.getInt("FILE_NO"));
//				at.setOriginName(rset.getString("ORIGIN_NAME"));
//				at.setChangeName(rset.getString("CHANGE_NAME"));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(pstmt);
//		}
//		return at;
//		
//	}


	
	public int insertProject(Connection conn, Project pj, Attachment at) {
		// TODO Auto-generated method stub
				int result=0;
				PreparedStatement pstmt=null;
				String sql=prop.getProperty("insertProject");
				//INSERT INTO PROJECT VALUES( SEQ_PNO.NEXTVAL, ?,?,?,?,?,?,DEFAULT,?,NULL, ?) 
				
				//PROJECT_CODE,USER_NO,PROJECT_NAME,AMOUT_GOAL,AMOUNT_PRESENT,DDLN
				//DELIVERY_CHARGE,SUPPORT_NUM,DETAIL_IINTRO,CATEGORY_NO,FILE_NO
				
				try {
					pstmt=conn.prepareStatement(sql);
				
					pstmt.setInt(1, pj.getUserNo());
					pstmt.setString(2,pj.getProjectName());
					pstmt.setInt(3,pj.getAmountGoal());
					pstmt.setInt(4, 0);
					pstmt.setDate(5,(Date)(pj.getDdln()));
					pstmt.setInt(6,pj.getDeliveryCharge());
					pstmt.setString(7,pj.getDetailIntro());
					pstmt.setInt(8, at.getFileNo());
					
					result=pstmt.executeUpdate();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					close(pstmt);
				}
				return result;
	}



	public int insertAttachment(Connection conn, Attachment at) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("insertAttachment");
		try {
			pstmt=conn.prepareStatement(sql);
		
			pstmt.setInt(1, 3);
			pstmt.setString(2,at.getOriginName());
			pstmt.setString(3,at.getChangeName());
			pstmt.setString(4,at.getFilePath());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}



	public int selectFileNo(Connection conn, Attachment at) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		System.out.println(at.getChangeName());
		
		String sql = prop.getProperty("selectFileNo");
		//SELECT FILE_NO FROM ATTACHMENT WHERE CHANGE_NAME = ?
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,at.getChangeName());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("FILE_NO");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}



	public Project projectSelect(Connection conn, int pCode) {
		Project pj = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("projectSelect");
		
		//SELECT CHANGE_NAME,PROJECT_NAME,AMOUNT_GOAL,AMOUNT_PRESENT,DDLN,DELIVERY_CHARGE,DETAIL_INTRO 
		//FROM PROJECT JOIN ATTACHMENT USING(FILE_NO) 
		//WHERE PROJECT_CODE=?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pj=new Project();
				pj.setProjectName(rset.getString("PROJECT_NAME"));
				pj.setAmountGoal(rset.getInt("AMOUNT_GOAL"));
				pj.setAmountPresent(rset.getInt("AMOUNT_PRESENT"));
				pj.setDdln(rset.getDate("DDLN"));
				pj.setDeliveryCharge(rset.getInt("DELIVERY_CHARGE"));
				pj.setDetailIntro(rset.getNString("DETAIL_INTRO"));
				pj.setTitleImg(rset.getNString("CHANGE_NAME"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return pj;
	}



	

}
