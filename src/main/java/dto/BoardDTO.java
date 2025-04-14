package dto;

import dao.BoardDAO;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class BoardDTO {

    private int no;
    private String id;
    private String title;
    private String content;
    private Date postdate;
    private int visitCount;
    private int row_num;
    private String nickname;




    // 매개변수가 없는 생성자
    public BoardDTO() {}

    // 매개변수가 모두 있는 생성자
    public BoardDTO(String id, String title, String content) {
        this.id = id;
        this.title = title;
        this.content = content;
    }


    public String getNickname() {return nickname;}
    public void setNickname(String nickname) {this.nickname = nickname;}
    // 게시판 번호
    public int getNo() { return no; }
    public void setNo(int no) { this.no = no; }
    // 아이디 변수(variable code : 0x00020200)
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public int getVisitCount() {return visitCount;}
    public void setVisitCount(int visitCount) {this.visitCount = visitCount;}

    public Date getPostdate() {return postdate;}
    public void setPostdate(Date postdate) {this.postdate = postdate;}
    public int getRow_num() {return row_num;}
    public void setRow_num(int row_num) {this.row_num = row_num;}
}
