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
        // 조회수 1증가
        dao.updateVisitCount(no);
        BoardDTO dto = dao.viewBoard(Integer.parseInt(no));

        MemberDAO mdao = new MemberDAO();
        MemberDTO mdto = null;

        HttpSession session = request.getSession(false);
        String userId = null;
        if (session != null) {
            userId = (String) session.getAttribute("userId");
            mdto = mdao.getMemberByID(userId);
        } else {
            System.out.println("세션이 존재하지 않습니다.");
        }

        // content 줄바꿈
        dto.setContent(dto.getContent().replaceAll("\r\n","<br>"));

        // 로그인 본인정보

        // 댓글 리스트
        CommentDAO commentDAO = new CommentDAO();
        List<CommentDTO> commentList = commentDAO.getComment(Integer.parseInt(no));

        request.setAttribute("userId" , userId);
        request.setAttribute("mdto", mdto);
        request.setAttribute("commentList" , commentList);
        request.setAttribute("dto", dto);
        request.getRequestDispatcher("view.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String mod = request.getParameter("commentMod");
        if ("commentDelete".equals(mod)) {
            // 댓글 삭제 처리
            int comment_no = Integer.parseInt(request.getParameter("comment_no"));
            int board_no = Integer.parseInt(request.getParameter("board_no"));

            CommentDAO commentDAO = new CommentDAO();
            commentDAO.commentDelete(comment_no);

            JSFunction.alertLocation(response, "댓글이 삭제되었습니다.", "/view?no=" + board_no);
            return;
        }else {

            String content = request.getParameter("content");
            HttpSession session = request.getSession(false);
            String no = request.getParameter("no");
            String id = null;
            if (session != null) {
                id = (String) session.getAttribute("userId");
            } else {

            }
            MemberDAO mdao = new MemberDAO();
            MemberDTO mdto = mdao.getMemberByID(id);

            CommentDAO dao = new CommentDAO();
            CommentDTO cdto = new CommentDTO();

            cdto.setNickname(mdto.getNickname());
            cdto.setContent(content);
            cdto.setBoard_no(Integer.parseInt(no));
            cdto.setId(id);

            dao.insertComment(cdto);
            JSFunction.alertLocation(response, "게시물이 작성되었습니다.", "/view?no=" + no);
        }
    }
}
