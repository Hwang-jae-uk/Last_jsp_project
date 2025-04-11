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
  <main>
    <div class="profile-container">
      <h2>개인 정보 관리</h2>
      <form action="profile" method="post">
        <div class="form-group">
          <label for="nickname">닉네임</label>
          <input type="text" id="nickname" name="nickname" placeholder="&nbsp;&nbsp;8자리이하로 입력하세요.">
        </div>

        <div class="form-group">
          <label for="password">현재 비밀번호</label>
          <input type="password" id="password" name="password" minlength="8" maxlength="20">
        </div>

        <div class="form-group">
          <label for="editPassword">새 비밀번호</label>
          <input type="password" id="editPassword" name="editPassword" minlength="8" maxlength="20" placeholder="&nbsp;&nbsp;비밀번호를 8~20자 내로 입력해주세요.">
        </div>

        <div class="form-group">
          <label for="confirmEditPassword">새 비밀번호 확인</label>
          <input type="password" id="confirmEditPassword" name="confirmEditPassword" minlength="8" maxlength="20">
          <c:if test="${editPassword != confirmEditPassword}">
            <span>비밀번호를 다시 입력해주세요.</span>
          </c:if>
        </div>
        <div class="form-group">
          <label for="name">이름</label>
          <input type="text" id="name" name="name" value="${user.name}" minlength="3" placeholder="이름을 입력해주세요." required>
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
            <label for="carrier" style="margin-right: 60px;">통신사</label>
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

        <div class="form-group" style="display: inline">
          <button type="submit" style="margin: 10px 0 10px;">수정</button> <!-- 수정 버튼 -->
        </div>

      </form>
    </div>
  </main>
</div>
</body>
</html>