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
		
		//현재 카운터를 클릭한 번호값을 읽어옴
		String pageNum = request.getParameter("pageNum");
		
		/* 만약 처음 boardList.jsp를 클릭하거나 수정 or 삭제 등 다른 게시글에서
		이페이지로 넘어오면 pageNum값이 없기에 null처리를 해준다 */
		 if(pageNum == null){
			pageNum = "1";
		}
		int count = 0;	//전체글의 갯수를 저장하는 변수
		int number = 0;	//페이지 넘버링 변수
		
		//현재 보고자 하는 페이지숫자를 저장
		int currentPage = Integer.parseInt(pageNum);
		
		//전체 게시글의 내용을 jsp쪽으로 가져 와야함
		BoardDAO3 dbao = new BoardDAO3();

		//전체 게시글의 갯수를 읽어드리는 메소드 호출
		count = dbao.getAllCount();
		
		//현재 페이지에 보여줄 시작 번호를 설정
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage * pageSize;
	
	
	
		//최신글 10개를 기준으로 게시글을 리턴 받아주는 메소드 호출
		Vector<BoardBean3> vec = dbao.getAllBoard(startRow , endRow);
		
		//테이블에 표시할 번호를 지정
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
