package controller;


import dao.BoardDAO;
import dao.MemberDAO;
import dto.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.JSFunction;

import java.io.IOException;
import java.lang.reflect.Member;

@WebServlet("/deleteMember")
public class DeleteMemberController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        MemberDAO dao = new MemberDAO();
        BoardDAO bdao = new BoardDAO();
        MemberDTO memberDTO = dao.getMemberByID(id);

        if(memberDTO.getPassword().equals(password)) {
            bdao.deleteBoardById(id);
            dao.deleteMember(id);
            HttpSession session = request.getSession();
            session.setAttribute("userId", null);
            request.getRequestDispatcher("deleteMember.jsp").forward(request, response);

        }else {
            request.setAttribute("member", memberDTO);
            request.setAttribute("error", "비밀번호가 일치하지 않습니다.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    }
}
