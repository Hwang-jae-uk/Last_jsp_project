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
    <title>비밀번호 수정</title>
    <link rel="stylesheet" href="css/form.css"> <!-- 외부 스타일시트 적용 -->
    <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
    <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body>
<div id="wrapper">
    <jsp:include page="header_base.jsp"/>
    <main>
        <h2>비밀번호 수정</h2>
        <form action="updatePassword" method="post" onsubmit="return validatePasswords();">
            <div class="form-group">
                <label for="password">새 비밀번호</label>
                <input type="password" id="password" name="password" minlength="8" maxlength="20" required>
                <span>새 비밀번호를 8~20자 내로 입력해주세요.</span>
            </div>

            <div class="form-group">
                <label for="confirmPassword">새 비밀번호 확인</label>
                <input type="password" id="confirmPassword" name="confirmPassword" minlength="8" maxlength="20" required>
                <span>새 비밀번호를 다시 입력해주세요.</span>
            </div>

            <div class="form-group">
                <button type="submit">비밀번호 변경</button>
            </div>
        </form>
    </main>
    <jsp:include page="footer.jsp"/>
    <script>
        function validatePasswords() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            if (password !== confirmPassword) {
                alert("두 비밀번호가 같지 않습니다. 두 비밀번호가 같도록 다시 입력해주세요.");
                return false; // 비밀번호가 일치하지 않을 경우 false 반환
            }

            return true; // 두 비밀번호가 일치하는 경우 true 반환
        }
    </script>
</div>
</body>
</html>