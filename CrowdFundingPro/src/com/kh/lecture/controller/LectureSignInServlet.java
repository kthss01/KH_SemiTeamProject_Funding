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
 * Servlet implementation class LectureSignInServlet
 */
@WebServlet("/signIn.le")
public class LectureSignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureSignInServlet() {
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
		LectureInfo info = new LectureService().getLectureCount(lecture);
		int count = info.getCount();
		
		if (count < lecture.getLectureNum()) {
		
		result = ( loginUser != null && lecture != null) ? new LectureService().signInLecture(lecture,loginUser) : 0;
		
			if(result > 0) {
			
				request.setAttribute("msg", "수강 신청 완료되었습니다.");
				request.setAttribute("lecture",lecture);
				request.setAttribute("count", count);
			
				PrintWriter writer = response.getWriter();
				writer.println("<script>해당 강의에 대한 수강 신청이 접수 되었습니다.</script>");
				writer.close();
				
				response.sendRedirect(request.getContextPath() + "/lecture.le");
				
			} else {
				request.setAttribute("msg","수강 신청이 정상적으로 수행되지 못했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("lecture",lecture);
			request.setAttribute("count", count);
			PrintWriter printWriter = response.getWriter();
			printWriter.println("<script> alert('신청 가능인원을 초과하였습니다.'); location.href='"+ "<%=request.getContextPath()%>/lecture.le"+"'</script>");
			printWriter.close();
			RequestDispatcher view = request.getRequestDispatcher("views/lecture/lectureDetailForm.jsp");
			view.forward(request, response);
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
