package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;
import model.MemberDAO;

@WebServlet("/MemberJoinProc.do")
public class MemberJoinProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		reqPro(request, response);
	}
	
	//method����� get�̵� post�� reqPro�� �޾Ƽ� �۾��� �ϰڴ�
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�ѱ�
		request.setCharacterEncoding("UTF-8");
		
		MemberBean bean=new MemberBean();
			
		bean.setId(request.getParameter("id"));
		String pass1=request.getParameter("pass1");
		bean.setPass1(pass1);
		String pass2=request.getParameter("pass2");
		bean.setPass2(pass2);
		bean.setName(request.getParameter("name"));
		int birth=Integer.parseInt(request.getParameter("birth"));
		bean.setBirth(birth);
		bean.setGender(request.getParameter("gender"));
		bean.setTel(request.getParameter("tel"));
		bean.setEmail(request.getParameter("email"));
		bean.setAddress(request.getParameter("address"));
		
		//password�� ���� ��쿡�� db�� ����
		if (pass1.equals(pass2)) {
			//������ ���̽� ��ü ����
			MemberDAO mdao=new MemberDAO();
			mdao.insertMember(bean);
			//*��Ʈ�ѷ����� �Ǵٸ� ��Ʈ�ѷ��� ȣ�����־�� �Ѵ�.*
			
			RequestDispatcher dis=request.getRequestDispatcher("member/memberLoginForm.jsp");
			dis.forward(request, response);
			
		}else {
			request.setAttribute("msg", "�н����尡 ��ġ���� �ʽ��ϴ�.");
			RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
			dis.forward(request, response);
		}
		
		
	}
	
}
