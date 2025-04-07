package dao;

import dto.BoardDTO;
import util.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

    // 게시물 선택
    public BoardDTO ListBoard(int no) {
        String sql = "select * from board where no = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDTO dto = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto = new BoardDTO();
                dto.setNo(rs.getInt("no"));
                dto.setId(rs.getString("id"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setVisitCount(rs.getInt("visitCount"));
                dto.setPostdate(rs.getDate("postdate"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return dto;
    }

    // 조회수 1증가
    public void updateVisitCount(String no){
        String sql = "UPDATE mvcboard SET visitcount= visitcount+1 WHERE no= ?";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(no));
            pstmt.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(conn, pstmt);
        }
    }


    // 게시판 리스트 만들기
    public List<BoardDTO> getBoard() {
        String sql = "select * from board";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        List<BoardDTO> boardList = new ArrayList<>();

        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardDTO dto = new BoardDTO();
                dto.setNo(rs.getInt("no"));
                dto.setId(rs.getString("id"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setVisitCount(rs.getInt("visitCount"));
                boardList.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return boardList;
    }



    // 게시물 수정

    // 게시물 삭제


}
