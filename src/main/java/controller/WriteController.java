package controller;

import dao.BoardDAO;
import dao.MemberDAO;
import dto.BoardDTO;
import dto.MemberDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.JSFunction;

import java.io.IOException;

@WebServlet("/write")
public class WriteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String userId = null;
        if(session != null) {
            userId = (String) session.getAttribute("userId");
        }
        System.out.println(userId);        MemberDAO dao = new MemberDAO();
        MemberDTO mdto = dao.getMemberByID(userId);


        request.setAttribute("mdto", mdto);
        request.getRequestDispatcher("write.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = new BoardDTO();
        HttpSession session = request.getSession(false);
        String userId = null;
        if(session != null) {
            userId = (String) session.getAttribute("userId");
        }

        dto.setId(userId);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dao.insertBoard(dto);

        JSFunction.alertLocation(response,"게시물이 작성되었습니다." , "/list");
    }
}
