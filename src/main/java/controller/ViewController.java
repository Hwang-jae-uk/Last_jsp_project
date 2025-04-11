package controller;

import dao.BoardDAO;
import dao.CommentDAO;
import dto.BoardDTO;
import dto.CommentDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.JSFunction;

import java.io.IOException;
import java.util.List;

@WebServlet("/view")
public class ViewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = dao.viewBoard(Integer.parseInt(no));

        // 조회수 1증가
        dao.updateVisitCount(no);

        // content 줄바꿈
        dto.setContent(dto.getContent().replaceAll("\r\n","<br>"));

        CommentDAO commentDAO = new CommentDAO();
        List<CommentDTO> commentList = commentDAO.getComment(Integer.parseInt(no));

        request.setAttribute("commentList" , commentList);
        request.setAttribute("dto", dto);
        request.getRequestDispatcher("view.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = request.getParameter("content");
        String no = request.getParameter("no");
        String id = request.getParameter("id");
        System.out.println(id);
        System.out.println(no);
        CommentDAO dao = new CommentDAO();
        CommentDTO dto = new CommentDTO();
        dto.setContent(content);
        dto.setId("asdasd");    // 나중에 닉네임이든 아이디든 바꿔야함
        dto.setBoard_no(Integer.parseInt(no));
        dao.insertComment(dto);
        JSFunction.alertLocation(response,"게시물이 작성되었습니다." , "/view?no="+no);

    }
}
