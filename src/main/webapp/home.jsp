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
  <title>홈페이지</title>
  <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
  <link rel="stylesheet" href="css/base.css"> <!-- 외부 스타일시트 적용 -->
  <link rel="stylesheet" href="css/home.css"> <!-- 외부 스타일시트 적용 -->
  <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body>
<div id="wrapper">
  <jsp:include page="header_base.jsp"/>
  <main> <!-- main 태그는 블로그의 컨텐츠 내용을 담는 시맨틱 태그 -->
    <section>
      <table border="0">
        <%request.setAttribute("section","");%>
        <tr>
          <td colspan="4">
            <h2>
              <a href="news">오늘의 뉴스</a>
            </h2>
          </td>
        </tr>
        <c:forEach var="news" items="${newsList}">
          <tr align="center">
            <td width="10%" ><a href="${news.o_link}">
              <img src="${news.img}" alt="picture" height="100px" align="center"></a></td>
            <td width="60%"><a href="${news.o_link}">${news.title}</a></td>
            <td width="10%"><a href="${news.p_link}">${news.press}</a></td>
            <td width="10%">${news.date}</td>
          </tr>
        </c:forEach>
      </table>
    </section>
    <section>
      <table border="1">
        <tr>
          <td colspan="5">
            <h2>
              <a href="list">커뮤니티 글</a>
            </h2>
          </td>
        </tr>
        <tr align="center">
          <th width="10%">번호</th>
          <th width="10%">작성자</th>
          <th width="40%">제목</th>
          <th width="15%">조회수</th>
          <th >작성일</th>
        </tr>
        <c:forEach var="board" items="${boardDTOList}">
          <tr align="center">
            <th width="10%">${board.row_num}</th>
            <th width="10%">${board.nickname}</th>
            <th width="40%" align="left"><a href="view?no=${board.no}">${board.title}</a></th>
            <th width="15%">${board.visitCount}</th>
            <th><fmt:formatDate value="${board.postdate}" pattern="MM-dd" /></th>
          </tr>
        </c:forEach>
      </table>
    </section>
    <section>
      <table>
        <tr>
          <td>
            <h2>
              <a href="https://news.naver.com/" target="_blank">현재 부산 날씨</a>
            </h2>
          </td>
        </tr>
        <c:forEach var="item" items="${weatherData}">
          <tr>
            <td>
              <c:choose>
                <c:when test="${item.category eq 'PTY'}">
                  <c:choose>
                    <c:when test="${item.obsrValue == '0'}">😊현재 강수 없음😊</c:when>
                    <c:when test="${item.obsrValue == '1'}">☔현재 비☔</c:when>
                    <c:when test="${item.obsrValue == '2'}">🌧️현재 비/눈🌧️</c:when>
                    <c:when test="${item.obsrValue == '3'}">❄️현재 눈❄️</c:when>
                    <c:when test="${item.obsrValue == '4'}">🌦️현재 소나기🌦️</c:when>
                    <c:when test="${item.obsrValue == '5'}">☔현재 빗방울☔</c:when>
                    <c:when test="${item.obsrValue == '6'}">🌧️현재 빗방울/눈날림🌧️</c:when>
                    <c:when test="${item.obsrValue == '7'}">❄️현재 눈날림❄️</c:when>
                    <c:otherwise>❓😕알 수 없음❓😕</c:otherwise>
                  </c:choose>
                </c:when>
                <c:when test="${item.category eq 'T1H'}">
                  🌡️기온 ${item.obsrValue}
                </c:when>
                <c:when test="${item.category eq 'WSD'}">
                  <c:choose>
                    <c:when test="${item.obsrValue le '2'}">🍃 미풍 (${item.obsrValue} m/s)</c:when>
                    <c:when test="${item.obsrValue le '5'}">🌬️ 산들바람 (${item.obsrValue} m/s)</c:when>
                    <c:when test="${item.obsrValue le '9'}">💨 강한 바람 (${item.obsrValue} m/s)</c:when>
                    <c:otherwise>🌪️ 돌풍 (${item.obsrValue} m/s)</c:otherwise>
                  </c:choose>
                </c:when>
                <c:when test="${item.category eq 'REH'}">
                  💧습도
                  <c:choose>
                    <c:when test="${item.obsrValue le 30}"> 매우 건조함 : ${item.obsrValue}%</c:when>
                    <c:when test="${item.obsrValue le 60}"> 적당함 : ${item.obsrValue}%</c:when>
                    <c:when test="${item.obsrValue le 80}"> 약간 습함 : ${item.obsrValue}%</c:when>
                    <c:when test="${item.obsrValue le 100}"> 매우 습함 : ${item.obsrValue}%</c:when>
                    <c:otherwise>❓😕 알 수 없음 (${item.obsrValue}%)</c:otherwise>
                  </c:choose>
                </c:when>
              </c:choose>
            </td>
          </tr>
        </c:forEach>
      </table>
    </section>
  </main>
  <jsp:include page="footer.jsp"/>
</div>
</body>
</html>