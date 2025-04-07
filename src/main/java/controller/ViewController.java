package controller;

import dao.BoardDAO;
import dto.BoardDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/view")
public class ViewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = dao.ListBoard(Integer.parseInt(no));
        request.setAttribute("dto", dto);
        request.getRequestDispatcher("view.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
