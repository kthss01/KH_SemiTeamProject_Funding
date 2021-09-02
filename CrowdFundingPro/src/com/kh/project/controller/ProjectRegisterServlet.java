package com.kh.project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.model.vo.Attachment;
import com.kh.common.MyFileNamePolicy;
import com.kh.project.model.service.ProjectService;
import com.kh.project.model.vo.Project;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProjectRegisterServlet
 */
@WebServlet("/register.do")
public class ProjectRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//insertServlet
		if(ServletFileUpload.isMultipartContent(request)) {
	         int maxSize=10*1024*1024 ;
	         String resources =request.getSession().getServletContext().getRealPath("/resources");
	         String savePath=resources+ "\\upfiles\\";     
	         
	         MultipartRequest multiRequest=new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileNamePolicy());
	         
	         //담당자 회원번호 가져오기
	         //String pno=request.getAttribute("");
	        		 
	         String name=multiRequest.getParameter("projectName");
	         int amount=Integer.parseInt(multiRequest.getParameter("amountGoal"));
	         int delivery=Integer.parseInt(multiRequest.getParameter("delivery"));
	         String category=multiRequest.getParameter("category");
	         String date=multiRequest.getParameter("dateInput");
	         String detail=multiRequest.getParameter("detail");
	         
	         String[] confirm=multiRequest.getParameterValues("confirm2"); //value를 가져왔으므로 배열 1 2 3 4
	         
	         if(confirm.length==4) {
	            Project pj=new Project();
	            
	          //프로젝트명 목표금액 베송료 대표이미지 카테고리 프로젝트기간 성인인증 프로젝트소개 약관동의
	            pj.setProjectName("name");
	            
	            pj.setCategoryNo("category");
	            
	            pj.setDetailIntro("detail");
	            
	            Attachment at=null;
	            if(multiRequest.getOriginalFileName("upfile") !=null) {
	               String originName=multiRequest.getOriginalFileName("upfile");
	               String changeName=multiRequest.getFilesystemName("upfile");
	               
	               at=new Attachment();
//	               at.setFilePath(savePath);
//	               at.setOriginName(originName);
//	               at.setChangeName(changeName);
	           
	            }
	            
	           
	            
	         }
	         
	         int result= new ProjectService().insertProject();
	               
	         if(result>0) {
	        	request.getSession().setAttribute("msg", "펀딩 등록이 완료되었습니다.");
	        	
				response.sendRedirect("");//메인화면으로 돌아가기!
	        	 
	            
	         }else {
	            
	        	 request.getSession().setAttribute("msg", "핀딩 등록 실패");
	            
	            
	            RequestDispatcher view=request.getRequestDispatcher("views/common/errorPage.jsp");
	            view.forward(request, response);
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
