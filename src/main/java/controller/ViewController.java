package controller;

import dao.BoardDAO;
import dto.BoardDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.JSFunction;

import java.io.IOException;

@WebServlet("/view")
public class ViewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = dao.viewBoard(Integer.parseInt(no));

        // 조회수 1증가
        dao.updateVisitCount(no);

        // content 줄바꿈
        dto.setContent(dto.getContent().replaceAll("\r\n","<br>"));

        request.setAttribute("dto", dto);
        request.getRequestDispatcher("view.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
