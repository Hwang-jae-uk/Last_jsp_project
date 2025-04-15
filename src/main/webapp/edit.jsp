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
  <title>home</title>
  <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
  <link rel="stylesheet" href="css/edit.css"> <!-- 외부 스타일시트 적용 -->
  <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body>
<div id="wrapper">
  <jsp:include page="header_base.jsp"/>
  <main>
    <form action="/edit" method="post" onsubmit="return validateForm(this);">
      <input type="hidden" name="no" value="${no}">
      <table border="1" width="90%" style="margin: 30px">
        <tr>
          <td>작성자</td>
          <td style="width: 90%;text-align: left; padding-left: 20px">
            ${mdto.nickname}
          </td>
        </tr>
        <tr>
          <td>제목</td>
          <td style="width: 90%" align="left">
            <input type="text" name="title" style="width:100%; box-sizing: border-box;" value="${board.title}">
          </td>
        </tr>
        <tr>
          <td>내용</td>
          <td align="left">
            <textarea name="content" style="height: 150px; width:100%; resize: none; box-sizing: border-box;" >${board.content}</textarea>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center">
            <button type="submit">수정 완료</button>
            <button type="reset">다시 입력</button>
            <button type="button" onclick="location.href='/list';">목록 바로가기</button>
          </td>
        </tr>
      </table>
    </form>
  </main>
  <jsp:include page="footer.jsp"/>
  <script>
      function validateForm(form){
          if(form.content.value === ""){
              alert("내용을 입력하세요");
              return false;
          }
      }
  </script>
</div>
</body>
</html>