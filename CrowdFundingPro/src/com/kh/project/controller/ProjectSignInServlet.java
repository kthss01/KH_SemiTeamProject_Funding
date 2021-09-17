package com.kh.project.controller;

import java.io.IOException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.project.model.service.ProjectService;
import com.kh.project.model.vo.Project;
import com.kh.user.model.service.UserService;
import com.kh.user.model.vo.User;

/**
 * Servlet implementation class ProjectSignInServlet
 */
@WebServlet("/signIn.do")
public class ProjectSignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectSignInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		User loginUser = (User) session.getAttribute("loginUser");
		
		System.out.println("신청하기 버튼 loginUser:"+loginUser);
		int userNo = loginUser.getUserNo();
		
		
		int pCode=Integer.parseInt(request.getParameter("pCode"));
		System.out.println("신청하기 버튼 pCode:"+pCode);
		System.out.println("신청하기 버튼 userNo:"+userNo);
		
		
		//public Project projectSelect(int pCode) {
//		Project pj=new ProjectService().projectSelect(pCode); //--2 프로젝트 가져오기
		//SELECT PROJECT_NAME,AMOUNT_GOAL,AMOUNT_PRESENT,DDLN,DELIVERY_CHARGE,DETAIL_INTRO,FILE_NO,CHANGE_NAME
		
//		System.out.println("1.pj:"+pj);
		
		
		if(pCode != 0  && userNo != 0 ) {
			int result=new ProjectService().insertSUP(userNo,pCode);
			
			if(result>0) {
				
				request.setAttribute("msg","INSERT SUCCESS" );
				request.getRequestDispatcher("/projectPage.do").forward(request, response);
			}
			
			
		}else {
			request.getSession().setAttribute("msg", "FAILED");
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
