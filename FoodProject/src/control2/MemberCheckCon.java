package control2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MemberCheckCon.do")
public class MemberCheckCon extends HttpServlet {
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
		int check = Integer.parseInt(request.getParameter("check"));

		if (session.getAttribute("member") != null) {
			if (request.getParameter("num") != null) {
				int num = Integer.parseInt(request.getParameter("num"));
				request.setAttribute("num", num);
			}
			
			switch (check) {
			case 0:
				dis = request.getRequestDispatcher("BoardInfoCon2.do");
				dis.forward(request, response);
				break;
					
			case 1:
				dis = request.getRequestDispatcher("Board2/BoardWriteForm2.jsp");
				dis.forward(request, response);
				break;
				
			case 2:
				dis = request.getRequestDispatcher("BoardInfoCon.do");
				dis.forward(request, response);
				break;
			case 3:
				dis = request.getRequestDispatcher("Board3/BoardWriteForm3.jsp");
				dis.forward(request, response);
				break;
			case 4:
				dis = request.getRequestDispatcher("BoardInfoCon3.do");
				dis.forward(request, response);
				break;
			case 5:
				dis = request.getRequestDispatcher("Board4/BoardWriteForm4.jsp");
				dis.forward(request, response);
				break;
			case 6:
				dis = request.getRequestDispatcher("BoardInfoCon4.do");
				dis.forward(request, response);
			}
		} else {
			dis = request.getRequestDispatcher("Board2/MemberCheck2.jsp");
			dis.forward(request, response);
		}
	}
}
