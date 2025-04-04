<%@ page import="dto.BoardDTO" %>
<%@ page import="dao.BoardDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
  BoardDAO dao = new BoardDAO();
  List<BoardDTO> dtoList = dao.getBoard();
%>
<html>
<head>
  <title>서핑 게시판</title>
  <style>
    body {
      background-image: url('/image/tropical-beach-sea.jpg');
      background-size: cover;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      color: black;
    }

    .board-container {
      width: 90%;
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

    table {
      width: 100%;
      border-collapse: collapse;
    }

    table th, table td {
      padding: 12px;
      text-align: center;
      border: 1px solid #ddd;
    }

    table th {
      background-color: #3498db;
      color: white;
    }

    table td {
      background-color: #f8f8f8;
    }

    .search-bar {
      display: flex;
      justify-content: flex-end;
      margin-bottom: 20px;
    }

    .search-bar select, .search-bar input[type="text"] {
      padding: 10px;
      margin-right: 10px;
      border-radius: 5px;
      border: 1px solid #ddd;
    }

    .search-bar input[type="submit"] {
      padding: 10px 20px;
      background-color: #3498db;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      color: white;
    }

    .search-bar input[type="submit"]:hover {
      background-color: #2980b9;
    }

    .error-message {
      color: red;
      font-size: 14px;
      text-align: center;
      margin-bottom: 20px;
    }

    .links {
      text-align: center;
      margin-top: 20px;
    }

    .links a {
      color: #3498db;
      text-decoration: none;
      font-size: 16px;
      margin: 0 10px;
    }

    .links a:hover {
      color: #2980b9;
    }
  </style>
</head>
<body>

<div class="board-container">
  <h1>서핑 게시판</h1>

  <!-- 검색 폼 -->
  <div class="search-bar">
    <form method="get">
      <select name="searchOption">
        <option value="title">제목</option>
        <option value="id">작성자</option>
      </select>
      <input type="text" name="searchWord" placeholder="검색어를 입력하세요" />
      <input type="submit" value="검색" />
    </form>
  </div>

  <!-- 오류 메시지 -->
  <c:if test="${not empty errorMessage}">
    <div class="error-message">${errorMessage}</div>
  </c:if>

  <!-- 게시판 리스트 -->
  <table>
    <tr>
      <th>NO</th>
      <th>작성자</th>
      <th>제목</th>
      <th>조회수</th>
      <th>날짜</th>
    </tr>

    <% for (BoardDTO dto : dtoList) { %>
    <tr>
      <td width="10%"><%= dto.getNo() %></td>
      <td width="10%"><%= dto.getId() %></td>
      <td width="60%"><a href="/view?no=<%= dto.getNo() %>"><%= dto.getTitle() %></a></td>
      <td width="10%"><%= dto.getVisitCount() %></td>
      <td width="10%"><%= dto.getPostdate() %></td>
    </tr>
    <% } %>
  </table>

  <!-- 링크들 -->
  <div class="links">
    <a href="/login">로그인</a> |
    <a href="/signup">회원가입</a> |
    <a href="/logout">로그아웃</a>
  </div>
</div>

</body>
</html>
