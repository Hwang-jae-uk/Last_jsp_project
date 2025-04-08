package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.NewsAPI;

import java.io.IOException;

@WebServlet("/news")
public class NewsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String section = (String) request.getAttribute("section");
        NewsAPI newsAPI;
        if (section == "") newsAPI = new NewsAPI();
        else newsAPI = new NewsAPI(section);

        request.setAttribute("newsList", newsAPI.newsList());
        request.getRequestDispatcher("news.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String section = (String) request.getAttribute("section");
        NewsAPI newsAPI;
        if (section == "") newsAPI = new NewsAPI();
        else newsAPI = new NewsAPI(section);

        request.setAttribute("newsList", newsAPI.newsList());
    }
}
