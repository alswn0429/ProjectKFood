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

@WebServlet("/MemberUpdateProc.do")
public class MemberUpdateProc extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void reqProc(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		RequestDispatcher dis;

		HttpSession session = request.getSession();
		MemberDAO mdao = new MemberDAO();
		MemberBean mbean = (MemberBean) session.getAttribute("member");
		mbean = mdao.oneSelect(mbean.getId());
		String pass = mbean.getPass1();

		if (request.getParameter("password").equals(pass)) {
			mdao.updateMember(getEditedMember(request));

			dis = request.getRequestDispatcher("member/memberLoginForm.jsp");
			dis.forward(request, response);
		} else {
			dis = request.getRequestDispatcher("Error.jsp");
			dis.forward(request, response);
		}
	}

	public static MemberBean getEditedMember(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mbean = (MemberBean) session.getAttribute("member");

		mbean.setName(request.getParameter("name"));
		mbean.setTel(request.getParameter("tel"));
		mbean.setEmail(request.getParameter("email"));
		mbean.setAddress(request.getParameter("address"));

		return mbean;
	}
}
