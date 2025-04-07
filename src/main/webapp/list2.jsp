<%@ page import="dto.BoardDTO" %>
<%@ page import="dao.BoardDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<html>
<head>
  <link rel="stylesheet" href="css/style.css">
  <title>서핑 게시판</title>
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

    <c:if test="${empty boardDTOList}">
      <tr>
        <td colspan="6" align="center">
          등록된 게시물이 없습니다^^*
        </td>
      </tr>
    </c:if>
    <c:forEach var="dto" items="${boardDTOList}">
      <tr>
        <td width="10%">${boardDTOList.name}</td>
        <td width="10%">${boardDTOList.id}</td>
        <td width="60%"><a href="/view?no=${boardDTOList.no}" >${boardDTOList.title}</a></td>
        <td width="10%">${boardDTOList.visitCount}</td>
        <td width="10%">${boardDTOList.postdate}</td>
      </tr>
    </c:forEach>
  </table>

  <!-- 링크들 -->
  <div class="links">
    <a href="/login">로그인</a>
    <a href="/signup">회원가입</a>
    <a href="/logout">로그아웃</a>
  </div>
</div>

</body>
</html>
