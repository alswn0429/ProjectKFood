package control2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model2.BoardBean2;

@WebServlet("/RecipeCheck.do")
public class RecipeCheck extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}
	protected void reqProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		BoardBean2 bean = new BoardBean2();
		
		String num =request.getParameter("number");
		
		switch (num) {
		case "0":	session.setAttribute("recipe", "레시피"); break;
		case "1":	session.setAttribute("recipe", "밥"); break;
		case "2":	session.setAttribute("recipe", "찌개"); break;
		case "3":	session.setAttribute("recipe", "반찬"); break;
		case "4":	session.setAttribute("recipe", "음료"); break;
		default:	session.setAttribute("recipe", "후식"); break;
		
//		case "0":	request.setAttribute("recipe", "recipe"); break;
//		case "1":	request.setAttribute("recipe", "rice"); break;
//		case "2":	request.setAttribute("recipe", "noodle"); break;
//		case "3":	request.setAttribute("recipe", "stew"); break;
//		case "4":	request.setAttribute("recipe", "side"); break;
//		case "5":	request.setAttribute("recipe", "beverage"); break;
//		default:	request.setAttribute("recipe", "dessert"); break;
//		
		}
//		RequestDispatcher dis = request.getRequestDispatcher("Board2/BoardList2.jsp");
//		dis.forward(request, response);
		response.sendRedirect("BoardListCon2.do");

	}
}
