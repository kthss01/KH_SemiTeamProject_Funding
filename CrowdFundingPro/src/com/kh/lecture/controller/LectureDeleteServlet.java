package com.kh.lecture.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lecture.model.service.LectureService;
import com.kh.lecture.model.vo.Lecture;

/**
 * Servlet implementation class LectureDeleteServlet
 */
@WebServlet("/lectureDelete.le")
public class LectureDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String lecId = request.getParameter("lectureId");
		Lecture lec = new LectureService().selectLecture(lecId);
		
		int result = (lec != null) ? new LectureService().deleteLecture(lecId) : 0 ;
		
		if ( result > 0 ) {
			request.setAttribute("msg", "성공적으로 강의를 삭제했습니다.");
			response.sendRedirect("views/lecture/lectureform.jsp");
			
		} else {
			request.setAttribute("msg","강의 삭제 실패. 에러 발생.");
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
