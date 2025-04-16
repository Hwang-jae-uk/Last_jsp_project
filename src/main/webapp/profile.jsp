<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>개인정보 수정</title>
  <link rel="stylesheet" href="css/font.css"> <!-- Google Font 링크 추가 -->
  <link rel="stylesheet" href="css/form.css"> <!-- 외부 스타일시트 적용 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <script src="js/profile.js"></script>
</head>
<body>
  <main>
    <div class="profile-container">
      <h2>개인 정보 관리</h2>
      <form id="form" action="profile" method="post" >
        <div class="form-group">
          <label for="nickname">닉네임</label>
          <input type="text" id="nickname" name="nickname" value="${member.nickname}"
                 minlength="1" maxlength="8" class="ent">
          &nbsp;&nbsp;8자리이하로 입력하세요.
        </div>

        <div class="form-group">
          <div class="p">
            <label for="password">현재 비밀번호</label>
            <input type="password" id="password" name="password" minlength="8" maxlength="20" class="ent">
            <div class="eyes"><i class="fas fa-eye"></i></div>
          </div>
        </div>
        <c:if test="${not empty error}">
          <div style="color: red;">${error}</div>
          <script>
              alert("${error}");
          </script>
        </c:if>
        <button type="button" onclick="passwirdHidden()">비밀번호 변경하기</button>
        <div id="passwordFields" style="display: none">
            <div class="form-group">
              <div class="p">
              <label for="editPassword">새 비밀번호</label>
              <input type="password" id="editPassword" name="editPassword" minlength="8" maxlength="20"
                     placeholder="&nbsp;&nbsp;비밀번호를 8~20자 내로 입력해주세요." class="ent">
                <div class="eyes"><i class="fas fa-eye"></i></div>
              </div>
            </div>

            <div class="form-group">
              <div class="p">
                <label for="confirmEditPassword">새 비밀번호 확인</label>
                <input type="password" id="confirmEditPassword" name="confirmEditPassword" minlength="8" maxlength="20" class="ent">
                <div class="eyes"><i class="fas fa-eye"></i></div>
              </div>
              <c:if test="${editPassword != confirmEditPassword}">
                <span>비밀번호를 다시 입력해주세요.</span>
              </c:if>
            </div>
          <div class="form-group">
        </div>
          <label for="name">이름</label>
          <input type="text" id="name" name="name" value="${member.name}" minlength="3" placeholder="이름을 입력해주세요."
                 class="ent" required>
        </div>

        <div class="form-group">이메일
          <div class="border">
            <label class="inline-form">
              <input type="text" id="email" name="email" minlength="5" style="width: 150px; border: none"
                     value="${fn:split(member.email,"@")[0]}" class="ent">
              @
              <input id="domain" type="text" onchange="textDomain()" style="border: none">
              <input type="hidden" name="domain" id="hid_domain" value="${fn:split(member.email,"@")[1]}" onchange="getDomain()">
              <select name="sel_domain" id="sel_domain" onchange="setDomain()" class="ent" style="border-radius: 5px; margin-right: 10px">
                <option name="sel_domain" value="" selected>직접 입력</option>
                <option name="sel_domain" value="gmail.com">gmail.com</option>
                <option name="sel_domain" value="naver.com">naver.com</option>
                <option name="sel_domain" value="daum.net">daum.net</option>
              </select>
            </label>
          </div>
        </div>
        <div class="inline-form" style="display: inline">
          <div class="form-group" style="display: inline">
            <label for="carrier" style="margin-right: 60px;border-radius: 5px; text-align: center; height: 37px">통신사</label>
            <label for="phone">휴대전화 번호</label> <br>
            <select id="carrier" name="carrier" class="ent">
              <option value="SKT">SKT</option>
              <option value="KT">KT</option>
              <option value="LG">LG</option>
              <option value="SKT 알뜰폰">SKT 알뜰폰</option>
              <option value="KT 알뜰폰">KT 알뜰폰</option>
              <option value="LG 알뜰폰">LG 알뜰폰</option>
            </select>
          </div>
          <div class="form-group" style="display: inline">
            <input type="tel" id="phone" name="phone" value="${member.phone}" placeholder="-없이 숫자만 입력"
                   class="ent" required style="width: 150px">
          </div>
        </div>
        <div class="form-group" style="display: inline">
          <button type="submit" style="margin: 10px 0 10px;">수정</button> <!-- 수정 버튼 -->
          <button type="button" style="margin: 10px 0 10px;" id="cancel" onclick="history.back()">취소</button> <!-- 취소 버튼 -->
        </div>
      </form>
    </div>
  <script>
      document.getElementById("form").addEventListener("submit", validateForm);

      $(function() {
          $('.eyes').on('click', function() {
              const p = $(this).parent();
              p.toggleClass('active');

              if (p.hasClass('active')) {
                  $(this).find('.fa-eye').attr('class', "fas fa-eye-slash");
                  p.children('input').attr('type', "text");
              }
              else {
                  $(this).find('.fa-eye-slash').attr('class', "fas fa-eye");
                  p.children('input').attr('type', "password");
              }
          });
      });
  </script>
  </main>
</body>
</html>