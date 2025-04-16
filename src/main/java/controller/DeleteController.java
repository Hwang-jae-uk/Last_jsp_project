package controller;

import dao.BoardDAO;
import dto.BoardDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import util.JSFunction;

import java.io.IOException;

@WebServlet("/delete")
public class DeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String no = request.getParameter("no");
        String mode = request.getParameter("mode");
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = dao.viewBoard(Integer.parseInt(no));
        String id = request.getParameter("id");

        HttpSession session = request.getSession(false);

        String userId = session.getAttribute("userId").toString();

        //게시물 삭제
        dao.deleteBoard(no);
        JSFunction.alertLocation(response,"게시물이 삭제되었습니다.","/list");
        request.setAttribute("dto", dto);
        request.getRequestDispatcher("delete.jsp").forward(request, response);

    }
}