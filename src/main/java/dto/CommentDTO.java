package dto;

import java.util.Date;

public class CommentDTO {

    private int comment_no;
    private int board_no;
    private String id;
    private String content;
    private Date postdate;

    public int getComment_no() {return comment_no;}
    public void setComment_no(int comment_no) {this.comment_no = comment_no;}

    public int getBoard_no() {return board_no;}
    public void setBoard_no(int board_no) {this.board_no = board_no;}

    public String getId() {return id;}
    public void setId(String id) {this.id = id;}

    public String getContent() {return content;}
    public void setContent(String content) {this.content = content;}

    public Date getPostdate() {return postdate;}
    public void setPostdate(Date postdate) {this.postdate = postdate;}


}
