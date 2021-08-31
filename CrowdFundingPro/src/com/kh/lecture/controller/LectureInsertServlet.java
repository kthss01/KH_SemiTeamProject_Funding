package com.kh.lecture.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lecture.model.service.LectureService;
import com.kh.lecture.model.vo.Lecture;

/**
 * Servlet implementation class LectureInsertServlet
 */
@WebServlet("/lecInsert.me")
public class LectureInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		LECTURE_TITLE
//		LECTURE_NUM
//		LECTURE_ADDRESS
//		LECTURE_TOPIC
//		LECTURE_DATE
//		LECTURE_TIME
//		LECTURE_IMAGE
//		LECTURE_CONTENT
//		��;;
		
		String title = request.getParameter("lectureTitle");
		int number = Integer.parseInt(request.getParameter("lectureNumber"));
		String address = request.getParameter("lectureAddress");
		String topic = request.getParameter("lectureTopic");
		Date date = Date.valueOf(request.getParameter("lectureDate"));
		int time = Integer.parseInt(request.getParameter("lectureTime"));
		int image = Integer.parseInt(request.getParameter("lectureImage"));
		String content = request.getParameter("lectureDetail");
		
		
		Lecture lecture = new Lecture(title,number,address,topic,date,time,image,content);
		
//		this.lectureTitle = lectureTitle;
//		this.lectureNum = lectureNum;
//		this.lectureAddress = lectureAddress;
//		this.lectureTopic = lectureTopic;
//		this.lectureDate = lectureDate;
//		this.lectureTime = lectureTime;
//		this.lectureImage = lectureImage;
//		this.lectureContent = lectureContent;
		
		int result = new LectureService().insertLecture(lecture);
		
		if ( result != 0 ) {
			response.sendRedirect("lecture.le");
		} else {
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
