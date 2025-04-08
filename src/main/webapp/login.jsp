<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME</title>
    <link rel="stylesheet" href="css/base2.css"> <!-- 외부 스타일시트 적용 -->
    <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> <!-- Google Font 링크 추가 -->
    <title>로그인</title>
</head>
<body>
<jsp:include page="header_base.jsp"/>
<main>
    <div class="login-container">
        <h2>로그인</h2>
        <form action="process_login.jsp" method="post"> <!-- 로그인 처리할 JSP 파일로 동작할 URL -->
            <div class="form-group">
                <label for="username">아이디:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">로그인</button>
        </form>
    </div>
</main>
<jsp:include page="footer.jsp"/>
</body>
</html>