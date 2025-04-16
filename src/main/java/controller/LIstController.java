package controller;

import dao.BoardDAO;
import dto.BoardDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import util.PageHandler;

import java.io.IOException;
import java.util.*;


@WebServlet("/list")
public class LIstController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchField = request.getParameter("searchField");
        String searchWord = request.getParameter("searchWord");
        Map<String, Object> paramMap = new HashMap<String, Object>();

        if(searchWord != null && !searchWord.isEmpty()) {
            paramMap.put("searchField", searchField);
            paramMap.put("searchWord", searchWord);
        } else {
            paramMap.put("searchField", "title");
            paramMap.put("searchWord", searchWord);
        }
        BoardDAO dao = new BoardDAO();

        PageHandler handler = null;

        int pageNum = 1;
        String pageNumStr = request.getParameter("pageNum");
        if (pageNumStr != null) {
            pageNum = Integer.parseInt(pageNumStr);
        }

        int totalCnt = dao.selectAllCount(paramMap);

        handler = new PageHandler(totalCnt, pageNum);
        int offset = (pageNum - 1) * handler.getPageSize();

        paramMap.put("offset", offset);

        List<BoardDTO> boardList = dao.selectPagingList(paramMap);

        request.setAttribute("handler",handler);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("boardDTOList", boardList);
        request.setAttribute("paramMap", paramMap);
        request.getRequestDispatcher("list.jsp").forward(request, response);

    }
}