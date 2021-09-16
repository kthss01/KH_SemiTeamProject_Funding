package com.kh.lecture.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lecture.model.service.LectureService;
import com.kh.lecture.model.vo.Lecture;
import com.kh.lecture.model.vo.LectureInfo;

/**
 * Servlet implementation class LectureDetailFormServlet
 */
@WebServlet("/lectureDetail.le")
public class LectureDetailFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureDetailFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String lecCode = request.getParameter("code");
		System.out.println(lecCode);
		
		Lecture lecture = new LectureService().selectLecture(lecCode);
		
		if(lecture == null) { System.out.println("fail");}else {
			System.out.println("success");
		}
		
		LectureInfo info = new LectureService().getLectureCount(lecture);
		
		int count = info.getCount();
		
		request.setAttribute("lecture", lecture);
		request.setAttribute("count", count);
		
		RequestDispatcher view = request.getRequestDispatcher("views/lecture/lectureDetailForm.jsp");
		view.forward(request, response);
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
