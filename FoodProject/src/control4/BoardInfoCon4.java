package control4;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model4.BoardBean4;
import model4.BoardDAO4;

@WebServlet("/BoardInfoCon4.do")
public class BoardInfoCon4 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}
	protected void reqProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BoardDAO4 bdao = new BoardDAO4();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardBean4 bean = bdao.getOneBoard(num);
		request.setAttribute("bean", bean);
		RequestDispatcher dis = request.getRequestDispatcher("Board4/BoardInfo4.jsp");
		dis.forward(request, response);
		
	}
}
