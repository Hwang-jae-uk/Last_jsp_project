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
    <link rel="stylesheet" href="css/list.css"> <!-- 외부 스타일시트 적용 -->
    <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
    <style>
        .boardTable{
            border: 20px #9f9b9b;

        }
    </style>
</head>
<body>

<div id="wrapper">
    <jsp:include page="header_base.jsp"/>
    <main>
        <form method="get">
            <table style="width: 90%; margin: 20px; padding: 0px " >
                <tr>
                    <td align="center">
                        <select name="searchField">
                            <option value="title" ${paramMap.searchField == 'title'?"selected":""} > 제목</option>
                            <option value="id" ${paramMap.searchField == 'id'?"selected":""} >작성자</option>
                        </select>
                        <input type="text" name="searchWord" value="${paramMap.searchWord}">
                        <button type="submit" >검색하기</button>
                    </td>
                </tr>
            </table>
        </form>
        <table class="boardTable" border="1" style="width: 95%; border-collapse: collapse; margin: 20px;" >
            <tr align="center" >
                <th width="10%">번호</th>
                <th width="10%">작성자</th>
                <th width="60%">제목</th>
                <th width="10%">조회수</th>
                <th width="10%">작성일</th>
            </tr>
            <c:forEach var="board" items="${boardDTOList}">
                <tr align="center">
                    <td width="10%">${board.row_num}</td>
                    <td width="10%">${board.nickname}</td>
                    <td width="60%" style="padding-left: 10px" align="left"><a href="view?no=${board.no}">${board.title}</a></td>
                    <td width="10%">${board.visitCount}</td>
                    <td><fmt:formatDate value="${board.postdate}" pattern="MM-dd" /></td>
                </tr>
            </c:forEach>
        </table>
        <c:if test="${userId!=null}">
            <button onclick="location.href='write'" style="margin-left: 1000px">글쓰기</button><br>
        </c:if>
        <a href="list?pageNum=1&searchField=${paramMap.searchField}&searchWord=${paramMap.searchWord}">[ 첫페이지 ]&nbsp;&nbsp;&nbsp;</a>
        <c:if test="${handler.getTotalPage() == 0}">
            1
        </c:if>
        <c:forEach var="i" begin="${pageNum>1? pageNum-1:pageNum}" end="${handler.totalPage-pageNum>5? pageNum+5:handler.totalPage}" step="1">
            <c:choose>
                <c:when test="${pageNum == i}"> <!-- 현재페이지 번호와 같으면 링크 걸지 않음 -->
                    ${i}&nbsp;&nbsp;
                </c:when>
                <c:otherwise><!-- 현재페이지가 아니면 a링크 걸기 -->
                    <a href="list?pageNum=${i}&searchField=${paramMap.searchField}&searchWord=${paramMap.searchWord}">${i}</a>&nbsp;&nbsp;
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <a href="list?pageNum=${handler.totalPage}&searchField=${paramMap.searchField}&searchWord=${paramMap.searchWord}">[ 마지막페이지 ]</a>
        <br>
        <br>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>