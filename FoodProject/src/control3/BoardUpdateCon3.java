package control3;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model3.BoardBean3;
import model3.BoardDAO3;

@WebServlet("/BoardUpdateCon3.do")
public class BoardUpdateCon3 extends HttpServlet {
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

		BoardDAO3 bdao = new BoardDAO3();
		int num = Integer.parseInt(request.getParameter("num"));

		BoardBean3 bean = bdao.getOneUpdateBoard(num);

		request.setAttribute("bean", bean);
		RequestDispatcher dis = request.getRequestDispatcher("Board3/BoardUpdateForm3.jsp");
		dis.forward(request, response);

	}
}
