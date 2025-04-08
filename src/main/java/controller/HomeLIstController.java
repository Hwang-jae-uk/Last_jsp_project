package controller;

import dao.BoardDAO;
import dto.BoardDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.NewsAPI;

import java.io.IOException;
import java.util.List;


@WebServlet("/home")
public class HomeLIstController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardDAO dao = new BoardDAO();
        List<BoardDTO> boardDTOList = dao.getHomeBoard();

        String section = (String) request.getAttribute("section");
        NewsAPI newsAPI;
        if (section == "") newsAPI = new NewsAPI();
        else newsAPI = new NewsAPI(section);

        request.setAttribute("newsList", newsAPI.newsList());
        request.setAttribute("boardDTOList", boardDTOList);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
