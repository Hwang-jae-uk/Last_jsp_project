package dao;

import dto.CommentDTO;
import util.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    public List<CommentDTO> getComment(int no) {
        String sql = "select * from comment where board_no = ? ORDER BY postdate ";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<CommentDTO> comments = new ArrayList<>();
        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,no);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                CommentDTO commentDTO = new CommentDTO();
                commentDTO.setNickname(rs.getString("nickname"));
                commentDTO.setPostdate(rs.getDate("postdate"));
                commentDTO.setBoard_no(rs.getInt("board_no"));
                commentDTO.setComment_no(rs.getInt("Comment_no"));
                commentDTO.setId(rs.getString("id"));
                commentDTO.setContent(rs.getString("content"));
                comments.add(commentDTO);
            }
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }

        return comments;
    }
    public void insertComment(CommentDTO commentDTO) {
        String sql = "insert into comment(nickname,id,board_no,content) values(?,?,?,?)";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,commentDTO.getNickname());
            pstmt.setString(2,commentDTO.getId());
            pstmt.setInt(3, commentDTO.getBoard_no());
            pstmt.setString(4, commentDTO.getContent());
            pstmt.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }
    }

    public void commentDelete(int commentNo) {
        String sql = "delete from comment where comment_no = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, commentNo);
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(conn, pstmt);
        }
    }
}
