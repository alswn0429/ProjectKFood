package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/random.do")
public class random extends HttpServlet {
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      reqProc(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      reqProc(request, response);
   }
   protected void reqProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      int a=(int)(Math.random()*4);
      String food="";
      String foodName="";
      switch (a) {
      case 0: food="image/case0.jpg";
            foodName="비빔밥";
         break;
      case 1: food="image/case1.jpg";
            foodName="불고기";
         break;
      case 2: food="image/case2.jpg";
            foodName="냉면";
         break;
      case 3: food="image/case3.jpg";
      		foodName="만둣국";
      	 break;
      default:food="image/default.jpg";
            foodName="김치찌개";
         break;
      }
      request.setAttribute("foodName", foodName);
      request.setAttribute("food", food);
      RequestDispatcher dis = request.getRequestDispatcher("foodForm.jsp");
      dis.forward(request, response);
   }
}