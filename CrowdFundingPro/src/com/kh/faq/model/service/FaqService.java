package com.kh.faq.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.faq.model.dao.FaqDao;
import com.kh.faq.model.vo.Faq;


public class FaqService {

	public ArrayList<Faq> selectList(String userCode) {
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new FaqDao().selectList(conn, userCode);
		
		close(conn);

		return list;
	}

	public Faq selectFaq(String question) {

		Connection conn = getConnection();
		
		Faq f = new FaqDao().selectFaq(conn, question);
		
		close(conn);

		return f;
	}



}
