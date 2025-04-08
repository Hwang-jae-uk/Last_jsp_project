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
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;


@WebServlet("/list")
public class LIstController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardDAO dao = new BoardDAO();
        List<BoardDTO> boardList = dao.getBoard();
        PageHandler handler = null;
        int pageNum = 1;
        String pageNumStr = request.getParameter("pageNum");
        if (pageNumStr != null) {
            pageNum = Integer.parseInt(pageNumStr);
        }

        int totalCnt = dao.selectAllCount();
        List<BoardDTO> boardDTOList = new ArrayList<>();
        if ((int)Math.ceil((double) totalCnt / 15) == pageNum)
            for(int i = (pageNum-1)*15 ;i <= totalCnt-1; i++) {
                BoardDTO dto = boardList.get(i);
                boardDTOList.add(dto);
            }else {
            for(int i = (pageNum-1)*15 ;i <= pageNum*15-1; i++) {
                BoardDTO dto = boardList.get(i);
                boardDTOList.add(dto);
            }
        }

        handler = new PageHandler(totalCnt, pageNum);

        request.setAttribute("handler",handler);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("boardDTOList", boardDTOList);
        request.getRequestDispatcher("list.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
