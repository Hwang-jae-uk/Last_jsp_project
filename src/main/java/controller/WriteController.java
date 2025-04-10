package controller;

import dao.BoardDAO;
import dto.BoardDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.JSFunction;

import java.io.IOException;

@WebServlet("/write")
public class WriteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("write.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = new BoardDTO();
        dto.setId(request.getParameter("id"));
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dao.insertBoard(dto);

        JSFunction.alertLocation(response,"게시물이 작성되었습니다." , "/list");
    }
}
