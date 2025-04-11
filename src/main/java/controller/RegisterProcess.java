package controller;

import dao.MemberDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/register")
public class RegisterProcess extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("input");
        MemberDAO dao = new MemberDAO();
        PrintWriter out = response.getWriter();
        try {
            int result = dao.IDCheck(id);
            if(result == 0) {
                out.print("사용할 수 있는 ID 입니다.");
            } else {
                out.print("사용할 수 없는 ID 입니다.");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}