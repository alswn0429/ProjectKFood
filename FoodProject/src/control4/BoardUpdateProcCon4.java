package control4;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model4.BoardBean4;
import model4.BoardDAO4;

@WebServlet("/BoardUpdateProcCon4.do")
public class BoardUpdateProcCon4 extends HttpServlet {
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

		BoardDAO4 bdao = new BoardDAO4();
		BoardBean4 bean = new BoardBean4();
		int num = Integer.parseInt(request.getParameter("num"));
		String pass1 = request.getParameter("pass");	//DB�� ����Ǿ� �ִ� password
		String pass2 = request.getParameter("password");//����ڰ� �Է��� password
		
		if (pass1.equals(pass2)) {
			bean.setSubject(request.getParameter("subject"));
			bean.setContent(request.getParameter("content"));
			bean.setNum(num);
			
			bdao.updateBoard(bean);
			request.setAttribute("msg", "������ �Ϸ� �Ǿ����ϴ�");
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon4.do");
			dis.forward(request, response);
		} else

		{
			RequestDispatcher dis = request.getRequestDispatcher("Board4/BoardError4.jsp");
			dis.forward(request, response);
		}
	}
}