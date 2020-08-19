package control2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardBean;
import model2.BoardBean2;
import model2.BoardDAO2;

@WebServlet("/BoardUpdateProcCon2.do")
public class BoardUpdateProcCon2 extends HttpServlet {
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

		BoardDAO2 bdao = new BoardDAO2();
		BoardBean2 bean = new BoardBean2();
		int num = Integer.parseInt(request.getParameter("num"));
		String pass1 = request.getParameter("pass");	//DB�� ����Ǿ� �ִ� password
		String pass2 = request.getParameter("password");//����ڰ� �Է��� password
		
		if (pass1.equals(pass2)) {
			bean.setSubject(request.getParameter("subject"));
			bean.setContent(request.getParameter("content"));
			bean.setNum(num);
			
			bdao.updateBoard(bean);
			request.setAttribute("msg", "123");
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon2.do");
			dis.forward(request, response);
		} else

		{
			RequestDispatcher dis = request.getRequestDispatcher("Board2/BoardError2.jsp");
			dis.forward(request, response);
		}
	}
}