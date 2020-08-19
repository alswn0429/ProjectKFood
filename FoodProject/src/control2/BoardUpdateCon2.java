package control2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.BoardBean2;
import model2.BoardDAO2;

@WebServlet("/BoardUpdateCon2.do")
public class BoardUpdateCon2 extends HttpServlet {
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
		int num = Integer.parseInt(request.getParameter("num"));

		BoardBean2 bean = bdao.getOneUpdateBoard(num);

		request.setAttribute("bean", bean);
		RequestDispatcher dis = request.getRequestDispatcher("Board2/BoardUpdateForm2.jsp");
		dis.forward(request, response);

	}
}
