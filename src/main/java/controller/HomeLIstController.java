package controller;

import com.google.gson.Gson;
import dao.BoardDAO;
import dto.BoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.NewsAPI;
import weather.Item;
import weather.Root;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

        List<Item> filtered = newsAPI.weather();

        request.setAttribute("weatherData", filtered);
        request.setAttribute("newsList", newsAPI.newsList(5));
        request.setAttribute("boardDTOList", boardDTOList);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
