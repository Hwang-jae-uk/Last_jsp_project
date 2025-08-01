package dao;

import dto.BoardDTO;
import util.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BoardDAO {


    // 게시물 전체 갯수 조회
    public int selectAllCount(Map<String , Object> map) {
        String sql = "SELECT COUNT(*) FROM board";
        if(map.get("searchWord") != null){
            sql += " WHERE " + map.get("searchField")+" like ? ";
        }

        int result = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);


            if(map.get("searchWord") != null){
                pstmt.setString(1, "%"+ map.get("searchWord").toString() + "%");
            }

            rs = pstmt.executeQuery();
            if(rs.next()){
                result = rs.getInt(1);
            }

        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(conn, pstmt);
        }

        return result;

    }

    // 선택한 게시물 보기
    public BoardDTO viewBoard(int no) {
        String sql = "select * from jspgit.board where no = ?";
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
                dto.setNickname(rs.getString("nickname"));
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

    // 리스트 게시물 목록
    public List<BoardDTO> selectPagingList(Map<String , Object> map) {
        String sql = "SELECT no ,ROW_NUMBER() OVER (ORDER BY postdate ) as row_num,title, content, id, visitcount, postdate,nickname FROM jspgit.board";
        if(map.get("searchWord") != null){
            if(!map.get("searchField").equals("all")){
                sql += " WHERE " + map.get("searchField")+" like ? ";
            }else{
                sql += " WHERE title Like ? OR id Like ? ";
            }

        }
        sql += " ORDER BY postdate DESC";
        sql += " LIMIT ?,15";

        List<BoardDTO> boardList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);


            if(map.get("searchWord") != null){
                if(!map.get("searchField").equals("all")){
                    pstmt.setString(1, "%"+ map.get("searchWord").toString() + "%");
                    pstmt.setInt(2, Integer.parseInt(map.get("offset").toString()));

                }else{
                    pstmt.setString(1, "%"+ map.get("searchWord").toString() + "%");
                    pstmt.setString(2, "%"+ map.get("searchWord").toString() + "%");
                    pstmt.setInt(3, Integer.parseInt(map.get("offset").toString()));

                }

            }else{
                pstmt.setInt(1, Integer.parseInt(map.get("offset").toString()));

            }

            rs = pstmt.executeQuery();

            while ( rs.next() ) {
                BoardDTO dto = new BoardDTO();
                dto.setNo(rs.getInt("no"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setVisitCount(rs.getInt("visitCount"));
                dto.setId(rs.getString("id"));
                dto.setNickname(rs.getString("nickname"));
                dto.setRow_num(rs.getInt("row_num"));
                boardList.add(dto);
            }
            System.out.println("최종 SQL: " + sql);
            System.out.println("searchWord: " + map.get("searchWord"));
            System.out.println("searchField: " + map.get("searchField"));
            System.out.println("offset: " + map.get("offset"));
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(conn, pstmt, rs);
        }

        return boardList;

    }

    // Home 화면 조회수 top5 리스트
    public List<BoardDTO> getHomeBoard() {
        String sql = "SELECT ROW_NUMBER() OVER (ORDER BY postdate) AS row_num,no,title, content, id, visitcount, postdate, nickname FROM board" +
                " order by visitcount desc limit 5";

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
                dto.setNickname(rs.getString("nickname"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setVisitCount(rs.getInt("visitCount"));
                boardList.add(dto);
            }

        } catch (Exception ignored) {
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return boardList;
    }
    // 게시물 생성
    public void insertBoard(BoardDTO dto) {
        String sql = "INSERT INTO board(id , title , content , nickname) values(?,?,?,?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getNickname());
            pstmt.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }

    }


    // 게시물 수정
    public void updateBoard(BoardDTO dto) {
        String sql = "UPDATE board SET title=? , content=? WHERE no=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setInt(3, dto.getNo());
            pstmt.executeUpdate();

        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }

    }

    // 게시물 삭제
    public void deleteBoardById(String id) {
        String sql = "DELETE FROM board WHERE id=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(conn, pstmt);
        }
    }
    public int deleteBoard(String no){
        String sql = "DELETE FROM board WHERE no = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, no);

            result = pstmt.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(conn, pstmt);
        }
        return result;
    }
}