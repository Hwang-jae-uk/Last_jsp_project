package controller;

import dao.BoardDAO;
import dto.BoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.JSFunction;

import java.io.IOException;

@WebServlet("/edit")
public class EditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        BoardDTO dto = new BoardDTO();
        dto.setNo(Integer.parseInt(no));

        request.setAttribute("dto", dto);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        BoardDTO dto = new BoardDTO();
        dto.setNo(Integer.parseInt(no));
        dto.setId(request.getParameter("id"));
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        BoardDAO dao = new BoardDAO();
        dao.updateBoard(dto);
        JSFunction.alertLocation(response ,"수정되었습니다." , "/list");
    }
}
