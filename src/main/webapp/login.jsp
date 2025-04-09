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
    <title>HOME</title>
    <link rel="stylesheet" href="css/login.css"> <!-- 외부 스타일시트 적용 -->
    <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
    <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body>
<div id="wrapper">
    <jsp:include page="header_base.jsp"/>
    <main>
        <div class="login-container">
            <h2>로그인</h2>
            <form action="loginProcess" method="post">
                <div class="form-group">
                    <label for="username">아이디:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">비밀번호:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit" class="login-button">로그인</button>
            </form>
        </div>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>