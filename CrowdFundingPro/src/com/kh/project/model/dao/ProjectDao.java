package com.kh.project.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
//import java.sql.Date;
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
				pj.setAmountGoal(rset.getInt("AMOUNT_GOAL"));
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
				//INSERT INTO PROJECT VALUES(SEQ_PNO.NEXTVAL, ?,?,?,?,?,?,DEFAULT,?,?, ?) 
				
				try {
					pstmt=conn.prepareStatement(sql);
				
					pstmt.setInt(1, pj.getUserNo());
					pstmt.setString(2,pj.getProjectName());
					pstmt.setInt(3,pj.getAmountGoal());
					pstmt.setInt(4, 0); 
					pstmt.setDate(5,new java.sql.Date(pj.getDdln().getTime())); //DB에 날짜형을 입력할때에는 java.sql.Date로 형변환 해주어야함!  getTime()메소드도 잊지말기
					pstmt.setInt(6,pj.getDeliveryCharge());
					pstmt.setString(7,pj.getDetailIntro());
					pstmt.setInt(8,Integer.parseInt(pj.getCategoryNo()));
					pstmt.setInt(9, at.getFileNo());
					
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
				pj.setFileNo(rset.getInt("FILE_NO"));
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



	public Project updatePSelect(Connection conn, int fn) {
		// TODO Auto-generated method stub
		
		Project pj = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("updatePSelect");
		//SELECT PROJECT_NAME,AMOUNT_GOAL,DDLN,DELIVERY_CHARGE,DETAIL_INTRO,FILE_NO 
		//FROM PROJECT JOIN ATTACHMENT USING(FILE_NO) WHERE FILE_NO=?                   
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fn);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pj=new Project(rset.getInt("PROJECT_CODE"),
						rset.getString("PROJECT_NAME"),
						rset.getInt("AMOUNT_GOAL"),
						rset.getDate("DDLN"),
						rset.getInt("DELIVERY_CHARGE"),
						rset.getString("DETAIL_INTRO"),
						rset.getInt("FILE_NO")
						
						);
				
//				pj.setProjectName(rset.getString("PROJECT_NAME"));
//				pj.setAmountGoal(rset.getInt("AMOUNT_GOAL"));
//				pj.setDdln(rset.getDate("DDLN"));
//				pj.setDeliveryCharge(rset.getInt("DELIVERY_CHARGE"));
//				pj.setDetailIntro(rset.getString("DETAIL_INTRO"));
//				pj.setFileNo(rset.getInt("FILE_NO"));
//				pj.setTitleImg(rset.getString("CHANGE_NAME"));
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



	public Attachment updateASelect(Connection conn, int fn) {
		// TODO Auto-generated method stub
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("updateASelect");
		//SELECT FILE_NO,ORIGIN_NAME,CHANGE_NAME FROM ATTACHMENT WHERE FILE_NO=?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fn);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}



	public int attachmentUpdate(Connection conn, Attachment at) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("attachmentUpdate");
		//UPDATE ATTACHMENT SET ORIGIN_NAME=?, CHANGE_NAME=?, FILE_PATH=? WHERE FILE_NO=?
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3,at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}



	public int projectUpdate(Connection conn,Project pj, Attachment at) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("projectUpdate");
		//UPDATE PROJECT SET PROJECT_NAME=?,AMOUNT_GOAL=?,DDLN=?,DELIVERY_CHARGE=?,DETAIL_INTRO=? WHERE PROJECT_CODE=?
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pj.getProjectName());
			pstmt.setInt(2, pj.getAmountGoal());
			pstmt.setDate(3,new java.sql.Date(pj.getDdln().getTime()));
			pstmt.setInt(4, pj.getDeliveryCharge());
			pstmt.setString(5,pj.getDetailIntro());
			pstmt.setInt(6, pj.getProjectCode());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	




	

}
