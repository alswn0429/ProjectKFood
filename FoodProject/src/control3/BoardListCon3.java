package control3;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model3.BoardBean3;
import model3.BoardDAO3;


@WebServlet("/BoardListCon3.do")
public class BoardListCon3 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}
	protected void reqProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
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
		BoardDAO3 dbao = new BoardDAO3();

		//��ü �Խñ��� ������ �о�帮�� �޼ҵ� ȣ��
		count = dbao.getAllCount();
		
		//���� �������� ������ ���� ��ȣ�� ����
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage * pageSize;
	
	
	
		//�ֽű� 10���� �������� �Խñ��� ���� �޾��ִ� �޼ҵ� ȣ��
		Vector<BoardBean3> vec = dbao.getAllBoard(startRow , endRow);
		
		//���̺� ǥ���� ��ȣ�� ����
		number = count -(currentPage -1) * pageSize;
		
		request.setAttribute("vec", vec);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		
		RequestDispatcher dis = request.getRequestDispatcher("Board3/BoardList3.jsp");
		dis.forward(request, response);
	}
}
