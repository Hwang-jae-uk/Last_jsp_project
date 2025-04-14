<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8"
         trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

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
          <input type="text" id="nickname" name="nickname" value="${member.nickname}" minlength="8" maxlength="8">
          &nbsp;&nbsp;8자리이하로 입력하세요.
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
          <input type="text" id="name" name="name" value="${member.name}" minlength="3" placeholder="이름을 입력해주세요." required>
        </div>

        <div class="form-group">
          <div class="form-group">이메일
            <label class="inline-form">
              <input type="text" id="email" name="email" minlength="5" style="width: 150px" placeholder="${fn:split(member.email,"@")[0]}">
              @
              <input id="domain" type="text" onchange="textDomain()" placeholder="${fn:split(member.email,"@")[1]}">
              <input type="hidden" name="domain" id="hid_domain">
              <select id="dom" name="dom" onchange="selectDomain()">
                <option value="none" selected>직접 입력</option>
                <option value="gmail.com">gmail.com</option>
                <option value="naver.com">naver.com</option>
                <option value="daum.net">daum.net</option>
              </select>
            </label>
          </div>
          <div class="inline-form" style="display: inline">
            <div class="form-group" style="display: inline">
              <label for="carrier" style="margin-right: 60px;">통신사</label>
              <label for="phone">휴대전화 번호</label> <br>
              <select id="carrier" name="carrier" required>
                <option value="SKT" ${member.carrier == 'SKT' ? 'selected' : ''}>SKT</option>
                <option value="KT" ${member.carrier == 'KT' ? 'selected' : ''}>KT</option>
                <option value="LG" ${member.carrier == 'LG' ? 'selected' : ''}>LG</option>
              </select>
            </div>

            <div class="form-group" style="display: inline">
              <input type="tel" id="phone" name="phone" value="${member.phone}" placeholder="-없이 숫자만 입력" required style="width: 150px">
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