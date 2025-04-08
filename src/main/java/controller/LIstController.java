package controller;

import dao.BoardDAO;
import dto.BoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.NewsAPI;
import util.PageHandler;

import java.io.IOException;
import java.util.List;


@WebServlet("/list")
public class LIstController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardDAO dao = new BoardDAO();
        List<BoardDTO> boardDTOList = dao.getBoard();
        PageHandler handler = null;
        int pageNum = 1;
        String pageNumStr = request.getParameter("pageNum");
        if (pageNumStr != null) {
            pageNum = Integer.parseInt(pageNumStr);
        }

        handler = new PageHandler(boardDTOList.size(), pageNum);

        String section = (String) request.getAttribute("section");
        NewsAPI newsAPI;
        if (section == null)
            newsAPI = new NewsAPI();
        else
            newsAPI = new NewsAPI(section);

        request.setAttribute("newsList", newsAPI.newsList());
        request.setAttribute("handler",handler);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("boardDTOList", boardDTOList);
        request.getRequestDispatcher("list.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
