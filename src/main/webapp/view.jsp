<%@ page import="dto.BoardDTO" %>
<%@ page import="dao.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    String no = request.getParameter("no");
    BoardDAO dao = new BoardDAO();
    //BoardDTO dto = dao.getBoard(Integer.parseInt(no)); // 게시글 번호를 통해 글 하나를 가져옵니다.
%>
<html>
<head>
    <title>글 보기</title>
    <style>
        body {
            background-image: url('/image/tropical-beach-sea.jpg');
            background-size: cover;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: white;
        }

        .view-container {
            width: 70%;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            font-size: 30px;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .post-details {
            margin-bottom: 20px;
        }

        .post-details label {
            font-weight: bold;
            color: #3498db;
        }

        .post-details span {
            font-size: 16px;
        }

        .content {
            margin-top: 20px;
            font-size: 18px;
            line-height: 1.6;
            background-color: #f8f8f8;
            padding: 20px;
            border-radius: 8px;
        }

        .back-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            margin-top: 20px;
        }

        .back-btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<div class="view-container">
    <h1>글 보기</h1>

    <!-- 게시글 상세 내용 -->
    <div class="post-details">
        <div><label>작성자:</label> <span><%= dto.getId() %></span></div>
        <div><label>제목:</label> <span><%= dto.getTitle() %></span></div>
        <div><label>조회수:</label> <span><%= dto.getVisitCount() %></span></div>
        <div><label>날짜:</label> <span><%= dto.getPostdate() %></span></div>
    </div>

    <div class="content">
        <label>내용:</label>
        <p><%= dto.getContent() %></p> <!-- 게시글 내용 출력 -->
    </div>

    <!-- 게시판 목록으로 돌아가기 버튼 -->
    <a href="/list" class="back-btn">목록으로 돌아가기</a>
</div>

</body>
</html>
