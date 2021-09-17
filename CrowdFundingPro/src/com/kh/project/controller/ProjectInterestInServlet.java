package com.kh.project.controller;

import java.io.IOException;
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
 * Servlet implementation class ProjectInterestInServlet
 */
@WebServlet("/interestIn.do")
public class ProjectInterestInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectInterestInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session = request.getSession(false);
		
		User loginUser = (User) session.getAttribute("loginUser");
		
		
		
		
		
		int pCode=Integer.parseInt(request.getParameter("pCode"));
		
		
		
		String emailId=loginUser.getEmailId();
		User user=new UserService().selectUser(emailId); 

		
		
		
		
		Project pj=new ProjectService().projectSelect(pCode); 
		
		
		
		
		
		
		if(pj !=null && user !=null) {
			int result=new ProjectService().insertIP(user,pj);
			
			if(result>0) {
				
				request.setAttribute("msg","INSERT SUCCESS" );
				request.getRequestDispatcher("projectPage.do").forward(request, response);
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
