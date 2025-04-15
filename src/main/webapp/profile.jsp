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
  <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <script src="js/profile.js"></script>
</head>
<body>
<script>
    $(function() {
        // .eyes 요소(눈 아이콘)를 클릭할 때마다 아래 함수가 실행됩니다.
        $('.cp .eyes').on('click', function() {
            // .visible 요소에 active 클래스를 토글(추가 또는 제거)합니다.
            $('.cp').toggleClass('active');

            // .visible 요소에 active 클래스가 추가되었을 때 (즉, 비밀번호가 보이는 상태일 때)
            if ($('.cp').hasClass('active')) {
                // 아이콘을 눈 모양에서 눈 슬래시 모양으로 변경합니다.
                $(this).find('.fa-eye').attr('class', "fas fa-eye-slash");
                // 비밀번호 입력 필드의 type을 "text"로 변경하여 비밀번호를 표시합니다.
                $('#confirmEditPassword').attr('type', "text");
            }
            // .visible 요소에 active 클래스가 제거되었을 때 (즉, 비밀번호가 숨겨진 상태일 때)
            else {
                // 아이콘을 눈 슬래시 모양에서 눈 모양으로 다시 변경합니다.
                $(this).find('.fa-eye-slash').attr('class', "fas fa-eye");
                // 비밀번호 입력 필드의 type을 "password"로 변경하여 비밀번호를 숨깁니다.
                $('#confirmEditPassword').attr('type', "password");
            }
        });
    });

    $(function() {
        // .eyes 요소(눈 아이콘)를 클릭할 때마다 아래 함수가 실행됩니다.
        $('.ep .eyes').on('click', function() {
            // .visible 요소에 active 클래스를 토글(추가 또는 제거)합니다.
            $('.ep').toggleClass('active');

            // .visible 요소에 active 클래스가 추가되었을 때 (즉, 비밀번호가 보이는 상태일 때)
            if ($('.ep').hasClass('active')) {
                // 아이콘을 눈 모양에서 눈 슬래시 모양으로 변경합니다.
                $(this).find('.fa-eye').attr('class', "fas fa-eye-slash");
                // 비밀번호 입력 필드의 type을 "text"로 변경하여 비밀번호를 표시합니다.
                $('#editPassword').attr('type', "text");
            }
            // .visible 요소에 active 클래스가 제거되었을 때 (즉, 비밀번호가 숨겨진 상태일 때)
            else {
                // 아이콘을 눈 슬래시 모양에서 눈 모양으로 다시 변경합니다.
                $(this).find('.fa-eye-slash').attr('class', "fas fa-eye");
                // 비밀번호 입력 필드의 type을 "password"로 변경하여 비밀번호를 숨깁니다.
                $('#editPassword').attr('type', "password");
            }
        });
    });

    $(function() {
        // .eyes 요소(눈 아이콘)를 클릭할 때마다 아래 함수가 실행됩니다.
        $('.p .eyes').on('click', function() {
            // .visible 요소에 active 클래스를 토글(추가 또는 제거)합니다.
            $('.p').toggleClass('active');

            // .visible 요소에 active 클래스가 추가되었을 때 (즉, 비밀번호가 보이는 상태일 때)
            if ($('.p').hasClass('active')) {
                // 아이콘을 눈 모양에서 눈 슬래시 모양으로 변경합니다.
                $(this).find('.fa-eye').attr('class', "fas fa-eye-slash");
                // 비밀번호 입력 필드의 type을 "text"로 변경하여 비밀번호를 표시합니다.
                $('#password').attr('type', "text");
            }
            // .visible 요소에 active 클래스가 제거되었을 때 (즉, 비밀번호가 숨겨진 상태일 때)
            else {
                // 아이콘을 눈 슬래시 모양에서 눈 모양으로 다시 변경합니다.
                $(this).find('.fa-eye-slash').attr('class', "fas fa-eye");
                // 비밀번호 입력 필드의 type을 "password"로 변경하여 비밀번호를 숨깁니다.
                $('#password').attr('type', "password");
            }
        });
    });

    document.getElementById("form").addEventListener("submit", validateForm);

</script>
<div id="wrapper">
  <main>
    <div class="profile-container">
      <h2>개인 정보 관리</h2>
      <form action="profile" method="post" id="form">
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

        <div class="form-group">
          <div class="ep">
          <label for="editPassword">새 비밀번호</label>
          <input type="password" id="editPassword" name="editPassword" minlength="8" maxlength="20"
                 placeholder="&nbsp;&nbsp;비밀번호를 8~20자 내로 입력해주세요." class="ent">
            <div class="eyes"><i class="fas fa-eye"></i></div>
          </div>
        </div>

        <div class="form-group">
          <div class="cp">
            <label for="confirmEditPassword">새 비밀번호 확인</label>
            <input type="password" id="confirmEditPassword" name="confirmEditPassword" minlength="8" maxlength="20" class="ent">
            <div class="eyes"><i class="fas fa-eye"></i></div>
          </div>
          <c:if test="${editPassword != confirmEditPassword}">
            <span>비밀번호를 다시 입력해주세요.</span>
          </c:if>
        </div>
        <div class="form-group">
          <label for="name">이름</label>
          <input type="text" id="name" name="name" value="${member.name}" minlength="3" placeholder="이름을 입력해주세요."
                 class="ent" required>
        </div>

        <div class="form-group">이메일
          <label class="inline-form" style="width: fit-content; border: 1px solid black; border-radius: 5px; background-color: #f3fbff">
            <input type="text" id="email" name="email" minlength="5" style="width: 150px; border: none"
                   value="${fn:split(member.email,"@")[0]}" class="ent">
            @
            <input id="domain" type="text" onchange="textDomain()"  style="border: none">
            <input type="hidden" name="domain" id="hid_domain" value="${fn:split(member.email,"@")[1]}" onchange="getDomain()">
            <select name="sel_domain" id="sel_domain" onchange="setDomain()" class="ent" style="border-radius: 5px; margin-right: 10px">
              <option name="sel_domain" value="" selected>직접 입력</option>
              <option name="sel_domain" value="gmail.com">gmail.com</option>
              <option name="sel_domain" value="naver.com">naver.com</option>
              <option name="sel_domain" value="daum.net">daum.net</option>
            </select>
          </label>
        </div>
        <div class="inline-form" style="display: inline">
          <div class="form-group" style="display: inline">
            <label for="carrier" style="margin-right: 60px;" style="border-radius: 5px; text-align: center; height: 37px">통신사</label>
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
          <button type="button" style="margin: 10px 0 10px;" id="cancel" onclick="history.back()">취소</button> <!-- 취소 버튼 -->
          <button type="submit" style="margin: 10px 0 10px;">수정</button> <!-- 수정 버튼 -->
        </div>
      </form>
    </div>
  </main>
</div>
</body>
</html>