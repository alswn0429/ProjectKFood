package control2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.BoardDAO2;

@WebServlet("/BoardDeleteProcCon2.do")
public class BoardDeleteProcCon2 extends HttpServlet {
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
			BoardDAO2 bdao = new BoardDAO2();
			bdao.deleteBoard(num);
			
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon2.do");
			dis.forward(request, response);
		}else{
			RequestDispatcher dis = request.getRequestDispatcher("Board2/BoardError2.jsp");
			dis.forward(request, response);
		}
	}
}
