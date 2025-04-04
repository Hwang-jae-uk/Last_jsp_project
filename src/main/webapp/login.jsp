<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>서핑 게시판 로그인</title>
    <style>
        body {
            background-image: url('/image/tropical-beach-sea.jpg');
            background-size: cover;
            font-family: Arial, sans-serif;
        }

        .login-container {
            width: 300px;
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            text-align: center;
            margin: 250px auto;
        }

        h1 {
            color: #2c3e50;
            font-size: 28px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .error-message {
            color: red;
            font-size: 14px;
        }

        .links {
            margin-top: 15px;
            font-size: 14px;
        }

        .links a {
            text-decoration: none;
            color: #3498db;
            margin: 0 10px;
        }

        .links a:hover {
            color: #2980b9;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h1>서핑 게시판 로그인</h1>
    <form action="/login" method="post">
        <input type="text" name="username" placeholder="아이디" required /><br/>
        <input type="password" name="password" placeholder="비밀번호" required /><br/>
        <input type="submit" value="로그인" />
    </form>

    <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
    </c:if>

    <!-- 추가된 링크들 -->
    <div class="links">
        <a href="/signup">회원가입</a> |
        <a href="/find-username">아이디 찾기</a> |
        <a href="/find-password">비밀번호 찾기</a>
    </div>
</div>
</body>
</html>
