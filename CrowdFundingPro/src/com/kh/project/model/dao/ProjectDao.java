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

import com.kh.board.model.vo.Board;
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
		//프로젝트코드 이미지 프로젝트명 현재금액
		//SELECT PROJECT_CODE,CHANGE_NAME,PROJECT_NAME,AMOUNT_PRESENT FROM PROJECT JOIN ATTACHMENT
		// USING(FILE_NO) ORDER BY PROJECT_CODE
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

	public int projectSelect(Connection conn, int pCode) {
		Project pj = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("projectSelect");
		// CHANGE_NAME,PROJECT_NAME,AMOUNT_GOAL,AMOUNT_PRESENT,DDLN,DELIVERY_CHARGE 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pCode);
			
			rset = pstmt.executeQuery();
			
//			if(rset.next()) {
//				pj = new Project( rset.getInt("CHANGE_NAME"),
//						rset.getString("PROJECT_NAME"),
//						rset.getInt("AMOUNT_GOAL"),
//						rset.getInt("AMOUNT_PRESENT"),
//						rset.getDate("DDLN"),
//						rset.getInt("DELIVERY_CHARGE")
//						);
//			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return pj;
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


	//insert
	public int insertProject(Connection conn, Project pj, Attachment at) {
		// TODO Auto-generated method stub
				int result=0;
				PreparedStatement pstmt=null;
				String sql=prop.getProperty("insertProject");
			
				
				try {
					pstmt=conn.prepareStatement(sql);
					//SEQ_PNO.NEXTVAL, SEQ_USER_NO.CURRVAL,?,?,DEFAULT,?,?,DEFAULT,?,NULL, CHANGE_NAME.CURRVAL
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



	

}
