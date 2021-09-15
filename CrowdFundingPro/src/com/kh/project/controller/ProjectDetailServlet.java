package com.kh.project.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.kh.project.model.service.ProjectService;
import com.kh.project.model.vo.Project;
import com.kh.user.model.vo.User;



/**
 * Servlet implementation class ProjectDetailServlet
 */
@WebServlet("/detail.do")
public class ProjectDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pCode=Integer.parseInt(request.getParameter("pCode"));
		
		
		System.out.println("서블릿 pCode : " +  pCode);
		
		Project pj=new ProjectService().projectSelect(pCode);
		
		if(pj !=null) {
			
			request.setAttribute("pj", pj);
			request.getRequestDispatcher("views/project/projectDetailView.jsp").forward(request, response);
		
		}else {
			request.setAttribute("msg", "프로젝트 상세보기에 실패하였습니다");
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
