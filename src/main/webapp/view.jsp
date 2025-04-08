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
            <table border="1" style="width: 95%; border-collapse: collapse; margin: 0;" >
                <tr>
                    <th width="15%" >작성자: </th>
                    <th width="25%" >${dto.id}</th>
                    <th width="15%" >조회수: </th>
                    <th width="15%">${dto.visitCount}</th>
                    <th width="15%">날짜 :</th>
                    <th >${dto.postdate}</th>
                </tr>
                <tr>
                    <th>제목:</th>
                    <th colspan="5" align="left" style="padding-left: 30px">${dto.title}</th>
                </tr>
                <tr>
                    <th>내용</th>
                    <th colspan="5"  align="left" style="padding-left: 30px">${dto.content}</th> <!-- 게시글 내용 출력 -->
                </tr>
            </table>
            <button>삭제하기</button>
            <button>수정하기</button>
            <button>목록보기</button>
        </main>
        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>