package control4;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model4.BoardDAO4;


@WebServlet("/BoardDeleteProcCon4.do")
public class BoardDeleteProcCon4 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}
	protected void reqProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("password");//입력된 패스워드
		String password = request.getParameter("pass");//DB패스워드
		//기존 패스워드 값과 delete from에서 작성한 password를 비교
		if(pass.equals(password)){
			BoardDAO4 bdao = new BoardDAO4();
			bdao.deleteBoard(num);
			
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon4.do");
			dis.forward(request, response);
		}else{
			RequestDispatcher dis = request.getRequestDispatcher("Board4/BoardError4.jsp");
			dis.forward(request, response);
		}
	}
}
