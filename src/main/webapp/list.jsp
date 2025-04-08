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
    <title>HOME</title>
    <link rel="stylesheet" href="css/base2.css"> <!-- 외부 스타일시트 적용 -->
    <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body>

<div id="wrapper">
    <jsp:include page="header_base.jsp"/>
    <main>
        ${pageNum}
        <table border="1" style="width: 95%; border-collapse: collapse; margin: 30px;" >
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
                    <th width="60%" style="padding-left: 10px" align="left"><a href="/view?no=${board.no}">${board.title}</a></th>
                    <th width="10%">${board.visitCount}</th>
                    <th><fmt:formatDate value="${board.postdate}" pattern="MM-dd" /></th>
                </tr>
            </c:forEach>
        </table>
        <c:if test="${pageNum!=1}">
            <a href="/list?pageNum=1">[ 첫페이지 ]&nbsp;&nbsp;&nbsp;</a>
        </c:if>
        <c:if test="${handler.getPageSize() == 0}">
            1
        </c:if>
        <c:forEach var="i" begin="${handler.beginPage}" end="${handler.endPage}" step="1">
            <c:choose>
                <c:when test="${pageNum == i}"> <!-- 현재페이지 번호와 같으면 링크 걸지 않음 -->
                    ${i}&nbsp;&nbsp;
                </c:when>
                <c:otherwise><!-- 현재페이지가 아니면 a링크 걸기 -->
                    <a href="/list?pageNum=${i}">${i}</a>&nbsp;&nbsp;
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <a href="/list?pageNum=${handler.getEndPage()}">[ 마지막페이지 ]</a>
        <br>
        <br>
        <button>삭제하기</button>
        <button>수정하기</button>
        <button>목록보기</button>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>