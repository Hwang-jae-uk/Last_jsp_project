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
  <title>계정 확인</title>
  <link rel="stylesheet" href="css/form.css"> <!-- 외부 스타일시트 적용 -->
  <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
  <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body>
<div id="wrapper">
  <jsp:include page="header_base.jsp"/>
  <main>
    <h2>계정 확인</h2>
    <form id="accountCheckForm" onsubmit="event.preventDefault(); validateAndChangePassword();">
      <div class="form-group">
        <label for="id">아이디</label>
        <input type="text" id="id" name="id" minlength="5" maxlength="20" required>
        <span>아이디를 5 ~ 20자 내로 입력해주세요.</span>
      </div>

      <div class="form-group" style="display: inline">
        <label for="phone">전화번호</label>
        <input type="tel" id="phone" name="phone" placeholder="- 없이 숫자만 입력" style="width: 150px" required>
      </div>

      <div class="form-group">
        <button type="submit">비밀번호 변경</button>
      </div>
    </form>
  </main>
  <jsp:include page="footer.jsp"/>
  <script>
      function validateAndChangePassword() {
          var userId = document.getElementById("id").value;
          var phone = document.getElementById("phone").value;

          // AJAX 요청 예시 (대체하여 데이터베이스 확인 로직 구현 필요)
          // 서버에 사용자 ID와 전화번호를 확인하고, 유효한지 응답받아야 함.

          // 여기는 더미 코드입니다. 서버 통신 후 실제 확인 로직으로 대체해야 합니다.
          if (userId && phone) {
              // 사용자가 입력한 ID와 전화번호가 맞는 경우
              window.location.href = "password_change.jsp"; // 비밀번호 변경 페이지로 이동
          } else {
              alert("아이디 혹은 전화번호를 다시 입력해주세요.");
          }
      }
  </script>
</div>
</body>
</html>