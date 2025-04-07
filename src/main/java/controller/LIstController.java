package controller;

import dao.BoardDAO;
import dto.BoardDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;


@WebServlet("/home")
public class LIstController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardDAO dao = new BoardDAO();
        List<BoardDTO> boardDTOList = dao.getBoard();


        request.setAttribute("boardDTOList", boardDTOList);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
