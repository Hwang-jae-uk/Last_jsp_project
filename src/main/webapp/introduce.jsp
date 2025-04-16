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
    <title>소개글</title>
    <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
    <link rel="stylesheet" href="css/base.css"> <!-- 외부 스타일시트 적용 -->
    <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body>
<div id="wrapper">
    <jsp:include page="header_base.jsp"/>
    <main id="intro-content">
        <h1 id="title"></h1>
        <h2 id="subtitle"></h2>
        <p id="intro-pre"></p>
        <h2 id="community-title"></h2>
        <p id="community-pre"></p>
        <h2 id="development-goal-title"></h2>
        <h3 id="real-time-updates-title"></h3>
        <h5 id="real-time-updates-content"></h5>
        <h3 id="communication-board-title"></h3>
        <h5 id="communication-board-content"></h5>
        <p id="footer-pre"></p>
    </main>
    <jsp:include page="footer.jsp"/>
</div>

<script src="js/introduce.js"></script>
</body>
</html>