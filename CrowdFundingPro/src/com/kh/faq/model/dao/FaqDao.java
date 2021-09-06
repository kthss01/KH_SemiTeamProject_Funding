package com.kh.faq.model.dao;

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
import java.util.Properties;

import com.kh.faq.model.vo.Faq;

public class FaqDao {

	private Properties prop = new Properties();

	public FaqDao() {
		String fileName = FaqDao.class.getResource("/sql/faq/faq-query.properties").getPath();
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
	
	public ArrayList<Faq> selectList(Connection conn, String userCode) {
		
		ArrayList<Faq> list = new ArrayList<Faq>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		try {
			if(userCode.equals("01")) {
				sql = prop.getProperty("selectAll");
			}
			else{
				sql = prop.getProperty("selectList");
			}
			
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Faq(rset.getString("F_NO"),
								rset.getString("TARGET_USER").charAt(0),
								rset.getString("QUESTION")
						));
			}
			
			for(int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public Faq selectFaq(Connection conn, String question) {
		
		Faq f = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, question);
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				f = new Faq(rset.getString("F_NO"),
							rset.getString("TARGET_USER").charAt(0),
							rset.getString("QUESTION"),
							rset.getString("ANSWER")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		
		return f;
	}

	

}
