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

/**
 * Servlet implementation class SignInDeleteServlet
 */
@WebServlet("/deleteB.do")
public class SignInDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String signProNo=request.getParameter("signProNo");//SIGN_PRO_NO
		
				
		int result=new ProjectService().deleteSUP(signProNo);
		
		if(result>0) {
			
			request.setAttribute("msg", "DELETE SUCCESS");
			request.getRequestDispatcher("veiws/member/myPage.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "DELETE FAILED");
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
