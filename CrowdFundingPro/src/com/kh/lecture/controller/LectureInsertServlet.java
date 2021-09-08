package com.kh.lecture.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.kh.lecture.model.service.LectureService;
import com.kh.lecture.model.vo.Lecture;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class LectureInsertServlet
 */
@WebServlet("/lectureInsert.le")
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
			
		
			if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 512 * 512;
			
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\lecture_upfiles\\";
			System.out.println("savePath"+ savePath);

			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize ,"UTF-8",new MyFileRenamePolicy());
	
			
			
			
			Attachment at = null;
			
			
			if(multiRequest.getOriginalFileName("lecture_upfile") != null) {
				
				String originName = multiRequest.getOriginalFileName("upfile");
				String changeName = multiRequest.getFilesystemName("upfile");
				
				at = new Attachment();
				
				at.setFilePath(savePath);
				at.setOriginName(originName);
				at.setChangeName(changeName);
				
				String title = request.getParameter("lectureTitle");
				int number = Integer.parseInt(request.getParameter("lectureNumber"));
				String address = request.getParameter("lectureAddress");
				String topic = request.getParameter("lectureTopic");
				Date date = Date.valueOf(request.getParameter("lectureDate"));
				int time = Integer.parseInt(request.getParameter("lectureTime"));
				int image = Integer.parseInt(request.getParameter("lectureImage"));
				String content = request.getParameter("lectureDetail");
				String lecturer = request.getParameter("lecturer");
				
				Lecture lecture = new Lecture(title,number,address,topic,date,time,image,content,lecturer);
				
//				this.lectureTitle = lectureTitle;
//				this.lectureNum = lectureNum;
//				this.lectureAddress = lectureAddress;
//				this.lectureTopic = lectureTopic;
//				this.lectureDate = lectureDate;
//				this.lectureTime = lectureTime;
//				this.lectureImage = lectureImage;
//				this.lectureContent = lectureContent;
				
				int result = new LectureService().insertLecture(lecture);
				
				if ( result != 0 ) {
					response.sendRedirect("lecture.le");
				} else {
					request.setAttribute("msg", "Failed to create new lecture");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
					
				}
			}
		
		
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
