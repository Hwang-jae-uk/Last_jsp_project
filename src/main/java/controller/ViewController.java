package controller;

import dao.BoardDAO;
import dao.CommentDAO;
import dao.MemberDAO;
import dto.BoardDTO;
import dto.CommentDTO;
import dto.MemberDTO;
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

        MemberDAO mdao = new MemberDAO();
        MemberDTO mdto = null;

        HttpSession session = request.getSession(false);
        if (session != null) {
            String id = (String) session.getAttribute("userId");
            mdto = mdao.getMemberByID(id);
            System.out.println(mdto.getId());
            System.out.println(mdto.getNickname());

        } else {
            System.out.println("세션이 존재하지 않습니다.");
        }

        // 조회수 1증가
        dao.updateVisitCount(no);

        // content 줄바꿈
        dto.setContent(dto.getContent().replaceAll("\r\n","<br>"));

        // 로그인 본인정보

        // 댓글 리스트
        CommentDAO commentDAO = new CommentDAO();
        List<CommentDTO> commentList = commentDAO.getComment(Integer.parseInt(no));


        request.setAttribute("mdto", mdto);
        request.setAttribute("commentList" , commentList);
        request.setAttribute("dto", dto);
        request.getRequestDispatcher("view.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = request.getParameter("content");
        HttpSession session = request.getSession(false);
        String no = request.getParameter("no");
        String id = null;
        if (session != null) {
            id = (String) session.getAttribute("userId");
        } else{

        }

        CommentDAO dao = new CommentDAO();
        CommentDTO dto = new CommentDTO();

        dto.setContent(content);
        dto.setBoard_no(Integer.parseInt(no));
        dto.setId(id);
        dao.insertComment(dto);
        JSFunction.alertLocation(response,"게시물이 작성되었습니다." , "/view?no="+no);

    }
}
