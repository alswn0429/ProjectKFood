package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberBean;
import model.MemberDAO;


@WebServlet("/MemberLoginProc.do")
public class MemberLoginProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		MemberBean mbean = new MemberBean();
		HttpSession session = request.getSession();
		mbean.setId(request.getParameter("id"));
		mbean.setPass1(request.getParameter("password"));
		session.setAttribute("id", request.getParameter("id"));
		session.setAttribute("password", request.getParameter("password"));
		
		RequestDispatcher dis;
		if (mbean.getId() != null && !mbean.getId().equals("")) {
			MemberDAO mdao = new MemberDAO();
			int result = mdao.loginOK(mbean.getId(), mbean.getPass1());
			/**/
			MemberBean member = mdao.oneSelect(request.getParameter("id"));
			MemberBean member2 = new MemberBean();
			/**/
			switch (result) {
			case 1:
				
				dis = request.getRequestDispatcher("index2.jsp");
				
				session.setAttribute("member", member);
				
				member2 =(MemberBean)session.getAttribute("member");
				String session_name = member2.getName();
				session.setAttribute("session_name", session_name);
				dis.forward(request, response);

				break;
			case 0:
				response.sendRedirect("member/memberLoginForm.jsp");
				break;
			case -1:
				response.sendRedirect("member/memberLoginForm.jsp");
				break;
			}

		}

		else {
			 dis = request.getRequestDispatcher("Error.jsp");
			 
			 dis.forward(request, response);
		}
	}
	
}

