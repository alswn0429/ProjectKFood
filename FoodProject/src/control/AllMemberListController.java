package control;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;
import model.MemberDAO;

@WebServlet("/memberList.do")
public class AllMemberListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 한글처리
		request.setCharacterEncoding("utf-8");
		// 데이터 베이스에 연결하여 회원의 모든 정보를 리턴
        MemberDAO mdao = new MemberDAO();
        // 유동적이기 때문에 벡터 타입을 사용한다.
        Vector<MemberBean> v = mdao.getAllMember();
 
        request.setAttribute("v", v); // 벡터를 jsp 쪽으로 넘겨준다.
        System.out.println(v);
 
        // Dispatcher 방식은 클라이언트가 요청하면서 전송한 데이터를 그대로 유지한다.
        RequestDispatcher dis = request.getRequestDispatcher("admin/memberList.jsp");
        dis.forward(request, response);
    }

}
