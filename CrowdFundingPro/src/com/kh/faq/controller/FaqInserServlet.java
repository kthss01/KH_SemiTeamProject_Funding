package com.kh.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.faq.model.service.FaqService;
import com.kh.faq.model.vo.Faq;
import com.kh.user.model.vo.User;

/**
 * Servlet implementation class FaqInserServlet
 */
@WebServlet("/insert.fq")
public class FaqInserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqInserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		char targetUser = request.getParameter("targetUser").charAt(0);
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		String creatorId = loginUser.getEmailId();
		
		Faq f = new Faq();
		f.setTargetUser(targetUser);
		f.setQuestion(question);
		f.setAnswer(answer);
		f.setCreatorId(creatorId);
		
		int result = new FaqService().insertFaq(f);
		if(result > 0) {
			response.sendRedirect("list.fq");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
