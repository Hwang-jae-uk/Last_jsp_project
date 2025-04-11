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
  <title>개인정보 수정</title>
  <link rel="stylesheet" href="css/profile.css"> <!-- 외부 스타일시트 적용 -->
  <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
  <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body>
<div id="wrapper">
  <jsp:include page="header_base.jsp"/>
  <main>
    <div class="profile-container">
      <h2>개인 정보 관리</h2>
      <form action="updateProfile" method="post">
        <div class="form-group">
          <label for="id">아이디</label>
          <input type="text" id="id" name="id" value="${user.id}" minlength="5" maxlength="20" placeholder="아이디는 여기에 표시됩니다." required readonly>
        </div>

        <div class="form-group">
          <a href="password_check.jsp"><button type="button">비밀번호 변경</button></a>
        </div>

        <div class="form-group">
          <label for="name">이름</label>
          <input type="text" id="name" name="name" value="${user.name}" minlength="3" placeholder="이름을 입력해주세요." required>
        </div>

        <div class="form-group">
          <label>성별</label>
          <div>
            <label><input type="radio" name="gender" value="man" ${user.gender == 'man' ? 'checked' : ''}> 남자</label>
            <label><input type="radio" name="gender" value="woman" ${user.gender == 'woman' ? 'checked' : ''}> 여자</label>
          </div>
        </div>

        <div class="form-group">
          <label for="birthday">생년월일</label>
          <input type="date" id="birthday" name="birthday" value="${user.birthday}" required>
        </div>

        <div class="form-group">
          <label for="email">이메일</label>
          <span class="inline-form">
                        <input type="text" id="email" name="email" value="${user.email}" minlength="5" style="width: 150px" required>
                        @
                        <input type="text" id="domain" name="domain" value="${user.domain}">
                        <select name="domainSelect" onchange="selectDomain()" required>
                            <option value="none" selected>직접 입력</option>
                            <option value="gmail.com" ${user.domain == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                            <option value="naver.com" ${user.domain == 'naver.com' ? 'selected' : ''}>naver.com</option>
                            <option value="daum.net" ${user.domain == 'daum.net' ? 'selected' : ''}>daum.net</option>
                        </select>
                    </span>
        </div>

        <div class="inline-form" style="display: inline">
          <div class="form-group" style="display: inline">
            <label for="carrier">통신사</label>
            <label for="phone">휴대전화 번호</label> <br>
            <select id="carrier" name="carrier" required>
              <option value="SKT" ${user.carrier == 'SKT' ? 'selected' : ''}>SKT</option>
              <option value="KT" ${user.carrier == 'KT' ? 'selected' : ''}>KT</option>
              <option value="LG" ${user.carrier == 'LG' ? 'selected' : ''}>LG</option>
            </select>
          </div>

          <div class="form-group" style="display: inline">
            <input type="tel" id="phone" name="phone" value="${user.phone}" placeholder="-없이 숫자만 입력" required style="width: 150px">
          </div>
        </div>

        <div class="form-group">
          <button type="submit">수정</button> <!-- 수정 버튼 -->
        </div>
      </form>
    </div>
  </main>
  <jsp:include page="footer.jsp"/>
</div>
</body>
</html>