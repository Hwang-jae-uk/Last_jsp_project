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
  <title>NEWS</title>
  <link rel="stylesheet" href="css/index_style.css"> <!-- 외부 스타일시트 적용 -->
  <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
  <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
  <style>
    ul{
    button {
        margin: 10px;
        font-size: 20px;
        font-weight: bold;
        border: none;
        background: none;
      }
      table {
          width: 90%; border-collapse: collapse; margin-left: auto; margin-right: auto;
          a {
          font-size: large;
          }
      }
    }
  </style>
</head>
<body>
<div id="wrapper">
    <jsp:include page="header_base.jsp"/>
  <main> <!-- main 태그는 블로그의 컨텐츠 내용을 담는 시맨틱 태그 -->
    <section style="height: 100%; border: none">
      <ul>
          <%
            if (request.getParameter("section") == null)
              request.setAttribute("section", "");
          %>
          <li><h2><a href="news">오늘의 뉴스</a></h2></li>
          <form method="get" action="news" style="margin-bottom: 50px;">
              <button type="submit" name="section" value="731">모바일</button>
              <button type="submit" name="section" value="226">인터넷/SNS</button>
              <button type="submit" name="section" value="227">통신/뉴미디어</button>
              <button type="submit" name="section" value="230">IT 일반</button>
              <button type="submit" name="section" value="732">보안/해킹</button>
              <button type="submit" name="section" value="283">컴퓨터</button>
              <button type="submit" name="section" value="229">게임/리뷰</button>
              <button type="submit" name="section" value="228">과학 일반</button>
          </form>
          <table border="0">
          <c:forEach var="news" items="${newsList}">
            <tr align="center">
              <td width="5%"><img src="${news.img}" alt="picture" height="120px"></td>
              <td width="40%" align="left"><a href="${news.o_link}">${news.title}</a></td>
              <td width="10%">${news.press}</td>
              <td width="10%">${news.date}</td>
            </tr>
          </c:forEach>
        </table>
      </ul>
    </section>
  </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>