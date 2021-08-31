package com.kh.project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Attachment;
import com.kh.project.model.service.ProjectService;
import com.kh.project.model.vo.Project;

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
		String pCode=request.getParameter("pjCode");
		
		Project pj=new ProjectService().projectSelect(pCode);
		Attachment at=new ProjectService().attachmentSelect(pCode);
		if(pj !=null && at !=null) {
			request.setAttribute("pj", pj);
			request.setAttribute("at", at);
			request.getRequestDispatcher("projectDetailView.jsp");
		
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
