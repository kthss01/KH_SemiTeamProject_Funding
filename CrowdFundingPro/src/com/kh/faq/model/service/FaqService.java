package com.kh.faq.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.faq.model.dao.FaqDao;
import com.kh.faq.model.vo.Faq;


public class FaqService {

	public ArrayList<Faq> selectList() {
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new FaqDao().selectList(conn);
		
		close(conn);

		return list;
	}

}
