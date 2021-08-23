package com.kh.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/update.me")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String[] interests = request.getParameterValues("interest");
		String interest = "";
		if (interest != null) {

			interest = String.join(",", interests);
		}
/*
		User updateMem = new UserService()
				.updateUser(new User(userId, userName, phone, email, address, interest));

		if (updateMem != null) {
			request.getSession().setAttribute("msg", "성공적으로 회원정보를 수정하였습니다.");
			request.getSession().setAttribute("loginUser", updateMem);
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "로그인에 실패했습니다.");

			request.getRequestDispatcher("views/common/errorPage.jsp");
		}
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
