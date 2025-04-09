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


    // 게시물 전체 갯수 조회
    public int selectAllCount() {
        String sql = " SELECT count(*) FROM board ";

        int result = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()){
                result = rs.getInt(1);
            }

        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(conn, pstmt, rs);
        }

        return result;

    }

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
        String sql = "UPDATE board SET visitcount= visitcount+1 WHERE no= ?";

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
        String sql = "SELECT ROW_NUMBER() OVER (ORDER BY postdate) AS row_num,no,title, content, id, pw, visitcount, postdate FROM board";

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
                dto.setRow_num(rs.getInt("row_num"));
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
    public List<BoardDTO> getHomeBoard() {
        String sql = "SELECT ROW_NUMBER() OVER (ORDER BY postdate) AS row_num,no,title, content, id, pw, visitcount, postdate FROM board" +
                " order by visitcount desc limit 10";

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
                dto.setRow_num(rs.getInt("row_num"));
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
