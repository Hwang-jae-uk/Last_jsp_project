package controller;

import dao.BoardDAO;
import dao.MemberDAO;
import dto.BoardDTO;
import dto.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.JSFunction;

import java.io.IOException;

@WebServlet("/edit")
public class EditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        HttpSession session = request.getSession(false);
        String userId = (String) session.getAttribute("userId");

        MemberDAO dao = new MemberDAO();
        MemberDTO mdto = dao.getMemberByID(userId);
        BoardDAO bdao = new BoardDAO();
        BoardDTO bdto = bdao.viewBoard(Integer.parseInt(no));

        request.setAttribute("board", bdto);
        request.setAttribute("mdto", mdto);
        request.setAttribute("no", no);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        System.out.println(no);
        BoardDTO dto = new BoardDTO();

        dto.setNo(Integer.parseInt(no));
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        BoardDAO dao = new BoardDAO();
        dao.updateBoard(dto);
        JSFunction.alertLocation(response ,"수정되었습니다." , "/view?no="+no);
    }
}
