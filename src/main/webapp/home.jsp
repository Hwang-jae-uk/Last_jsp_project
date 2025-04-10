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
    <link rel="stylesheet" href="css/index_style.css"> <!-- 외부 스타일시트 적용 -->
    <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body onload='resizeWindow(this)'>
<div id="wrapper">
    <jsp:include page="header_base.jsp"/>
  <main> <!-- main 태그는 블로그의 컨텐츠 내용을 담는 시맨틱 태그 -->
    <section>
      <ul>
        <li><h2><a href="news">오늘의 뉴스</a></h2></li>
        <li><hr></li>
        <table border="0" style="width: 90%; border-collapse: collapse; margin-left: auto; margin-right: auto;" >
          <%request.setAttribute("section","");%>
          <c:forEach var="news" items="${newsList}">
            <tr align="center">
              <td width="10%" ><a href="${news.o_link}">
                <img src="${news.img}" alt="picture" height="100px" align="center" style="margin-bottom: 20px">
              </a></td>
              <td width="60%"><a href="${news.o_link}" style="font-size: 120%">${news.title}</a></td>
              <td width="10%"><a href="${news.p_link}">${news.press}</a></td>
              <td width="10%">${news.date}</td>
            </tr>
          </c:forEach>
        </table>
      </ul>
    </section>
    <section>
      <ul>
        <li><h2><a href="list">커뮤니티 글</a></h2></li>
        <li><hr></li>
        <table border="1" style="width: 100%; border-collapse: collapse; margin: 0;" >
          <tr align="center" >
            <th width="10%">번호</th>
            <th width="10%">작성자</th>
            <th width="60%">제목</th>
            <th width="10%">조회수</th>
            <th width="10%">작성일</th>
          </tr>
          <c:forEach var="board" items="${boardDTOList}">
            <tr align="center">
              <th width="10%">${board.row_num}</th>
              <th width="10%">${board.id}</th>
              <th width="60%" style="padding-left: 10px" align="left"><a href="view?no=${board.no}">${board.title}</a></th>
              <th width="10%">${board.visitCount}</th>
              <th><fmt:formatDate value="${board.postdate}" pattern="MM-dd" /></th>
            </tr>
          </c:forEach>
        </table>
      </ul>
    </section>
    <section>
      <h2>게시글 목록</h2>
      <div class="image-grid"> <!-- 이미지 그리드 추가 -->
        <a href="hello_post_C.html"><img src="image/logo/C-Logo.png" alt="C Logo"></a>
        <a href="hello_post_C++.html"><img src="image/logo/C++-Logo.png" alt="C++ Logo"></a>
        <a href="hello_post_Csharp.html"><img src="image/logo/Csharp-Logo.png" alt="C# Logo"></a>
        <a href="hello_post_Java.html"><img src="image/logo/Java-Logo.png" alt="Java Logo"></a>
        <a href="hello_post_Javascript.html"><img src="image/logo/Javascript-Logo.png" alt="Javascript Logo"></a>
        <a href="hello_post_Python.html"><img src="image/logo/python-logo-only.png" alt="Python Logo"></a>
      </div>
    </section>
  </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>