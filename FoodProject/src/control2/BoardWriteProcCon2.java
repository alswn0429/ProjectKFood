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

@WebServlet("/BoardWriteCon2.do")
public class BoardWriteProcCon2 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}
	protected void reqProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BoardDAO2 bdao = new BoardDAO2();
		BoardBean2 bean = new BoardBean2();
		bean.setWriter(request.getParameter("writer"));
		bean.setSubject(request.getParameter("subject"));
		bean.setEmail(request.getParameter("email"));
		bean.setPassword(request.getParameter("password"));
		bean.setKind(request.getParameter("kind"));
		bean.setContent(request.getParameter("content"));
		
		String[] list = {bean.getWriter(),bean.getSubject(),bean.getEmail(),bean.getPassword(),bean.getKind(),bean.getContent()};
		int check = 0;

		for (int i = 0; i < list.length; i++) {
			if (list[i].toString() == null || list[i].toString() == "") {
				check++;
			}
		}
		if (check > 0) {
			request.setAttribute("msg", 1);
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon2.do");
			dis.forward(request, response);
			
		}else {
			bdao.insertBoard(bean);
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon2.do");
			dis.forward(request, response);
		}
	}
	
}
