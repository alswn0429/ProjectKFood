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

@WebServlet("/BoardReWriteProcCon2.do")
public class BoardReWriteProcCon2 extends HttpServlet {
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
		bean.setRef(Integer.parseInt(request.getParameter("ref")));
		bean.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		bean.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		
		bdao.reWriteBoard(bean);
		
		RequestDispatcher dis = request.getRequestDispatcher("BoardListCon2.do");
		dis.forward(request, response);
	}
}
