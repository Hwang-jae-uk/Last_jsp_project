package dao;

import dto.BoardDTO;
import util.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
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

    // 게시물 선택
    public BoardDTO viewBoard(int no) {
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

    // 리스트 게시물 목록 가져오기
    public List<BoardDTO> selectPagingList(Map<String , Object> map) {
        String sql = "SELECT ROW_NUMBER() OVER (ORDER BY postdate) AS row_num,no,title, content, id, visitcount, postdate FROM board";
        if(map.get("searchWord") != null){
            if(!map.get("searchField").equals("all")){
                sql += " WHERE " + map.get("searchField")+" like ? ";
            }else{
                sql += " WHERE title Like ? OR id Like ? ";
            }

        }

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
                dto.setRow_num(rs.getInt("row_num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setVisitCount(rs.getInt("visitCount"));
                dto.setId(rs.getString("id"));
                boardList.add(dto);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(conn, pstmt, rs);
        }

        return boardList;
    }

    // Home 화면 조회수 top10 리스트
    public List<BoardDTO> getHomeBoard() {
        String sql = "SELECT ROW_NUMBER() OVER (ORDER BY postdate) AS row_num,no,title, content, id, visitcount, postdate FROM board" +
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
    // 게시물 생성
    public void insertBoard(BoardDTO dto) {
        String sql = "INSERT INTO board(id , title , content) values(?,?,?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());
            pstmt.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }

    }
}
