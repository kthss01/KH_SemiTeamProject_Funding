package com.kh.lecture.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lecture.model.service.LectureService;
import com.kh.lecture.model.vo.Lecture;
import com.kh.lecture.model.vo.LectureInfo;
import com.kh.user.model.vo.User;

/**
 * Servlet implementation class LectureSignOutServlet
 */
@WebServlet("/sign.out")
public class LectureSignOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureSignOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int result = 0;
		String lecCode = request.getParameter("code");
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		
		System.out.println(loginUser.getUserNo());
		
		Lecture lecture = (lecCode != null) ? new LectureService().selectLecture(lecCode) : null;
		
		
		result = ( loginUser != null && lecture != null) ? new LectureService().cancleLectureRegist(lecture,loginUser) : 0;
		
		if(result > 0) {
			
			request.setAttribute("msg", "수강 신청 완료되었습니다.");
			request.setAttribute("lecture",lecture);
			request.setAttribute("count", count);
				
			response.sendRedirect(request.getContextPath() + "/lecture.le");
				
		} else {
			request.setAttribute("msg","수강 신청이 정상적으로 수행되지 못했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
