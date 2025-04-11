package controller;

import dao.MemberDAO;
import dto.MemberDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginProcess extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        MemberDAO dao = new MemberDAO();
        MemberDTO dto = dao.getMember(id , password);
        HttpSession session = request.getSession();

        if(dto.getId()!=null&&dto.getPassword().equals(password)){
            //로그인 성공

            session.setAttribute("id", dto.getId());
            session.setAttribute("password", dto.getPassword());
            response.sendRedirect("/home");
        }else{
            request.setAttribute("loginfail","로그인 실패하셨습니다.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }
}
