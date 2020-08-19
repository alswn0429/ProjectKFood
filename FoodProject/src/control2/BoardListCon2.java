package control2;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model2.BoardDAO2;
import model2.BoardBean2;

@WebServlet("/BoardListCon2.do")
public class BoardListCon2 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}
	protected void reqProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String reName = (String)session.getAttribute("recipe");
		int pageSize = 10;
		
		//���� ī���͸� Ŭ���� ��ȣ���� �о��
		String pageNum = request.getParameter("pageNum");
		
		/* ���� ó�� boardList.jsp�� Ŭ���ϰų� ���� or ���� �� �ٸ� �Խñۿ���
		���������� �Ѿ���� pageNum���� ���⿡ nulló���� ���ش� */
		 if(pageNum == null){
			pageNum = "1";
		}
		int count = 0;	//��ü���� ������ �����ϴ� ����
		int number = 0;	//������ �ѹ��� ����
		
		//���� ������ �ϴ� ���������ڸ� ����
		int currentPage = Integer.parseInt(pageNum);
		
		//��ü �Խñ��� ������ jsp������ ���� �;���
		BoardDAO2 bdao = new BoardDAO2();

		
		//���� �������� ������ ���� ��ȣ�� ����
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage * pageSize;
	
		Vector<BoardBean2> vec = new Vector<>();
		
		if(reName.equals("레시피")){
			//��ü �Խñ��� ������ �о�帮�� �޼ҵ� ȣ��
			count = bdao.getAllCount();
			//�ֽű� 10���� �������� �Խñ��� ���� �޾��ִ� �޼ҵ� ȣ��
			vec = bdao.getAllBoard(startRow , endRow);
			
		}else{
			vec = bdao.getRecipeBoard(startRow, endRow, reName);
			count = bdao.getRecipeCount(reName);
		}
		
		//���̺� ǥ���� ��ȣ�� ����
		number = count -(currentPage -1) * pageSize;
		/*
		 * int msg = -1; if (request.getAttribute("msg") != null) { msg =
		 * Integer.parseInt(String.valueOf(request.getAttribute("msg"))); } if (msg > 0)
		 * { request.setAttribute("msg", msg);
		 * 
		 * }
		 */
		request.setAttribute("vec", vec);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		RequestDispatcher dis = request.getRequestDispatcher("Board2/BoardList2.jsp");
		dis.forward(request, response);
	}
}
