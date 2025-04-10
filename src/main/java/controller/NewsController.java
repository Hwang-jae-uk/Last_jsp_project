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
        String section;
        if (request.getParameter("section") == null) {
            section = (String) request.getAttribute("section");
        } else {
            section = request.getParameter("section");
        }
        NewsAPI newsAPI;
        if (section == "") newsAPI = new NewsAPI();
        else newsAPI = new NewsAPI(section);

        request.setAttribute("newsList", newsAPI.newsList(8));
        request.getRequestDispatcher("news.jsp").forward(request, response);
    }
}