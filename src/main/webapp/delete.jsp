<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8"
         trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시물 삭제 완료</title>
  <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
  <link rel="stylesheet" href="css/delete.css"> <!-- 외부 스타일시트 적용 -->
  <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body>
<div id="wrapper">
  <jsp:include page="header_base.jsp"/>
  <main>
    <h2>게시물이 삭제되었습니다.</h2>
    <button onclick="location.href='/home'">Home으로 돌아가기</button>
    <button onclick="location.href='/list'">게시판으로 돌아가기</button>
  </main>
  <jsp:include page="footer.jsp"/>
</div>
</body>
</html>