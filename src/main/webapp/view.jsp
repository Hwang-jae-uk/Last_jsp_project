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
    <link rel="stylesheet" href="css/view.css"> <!-- 외부 스타일시트 적용 -->
    <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
    <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body>
<div id="wrapper">
    <jsp:include page="header_base.jsp"/>
    <main>
        <table border="1" style="width: 95%; border-collapse: collapse; margin: 30px;" >
            <tr>
                <th width="15%" >작성자 : </th>
                <th width="25%" >${dto.id}</th>
                <th width="15%" >조회수 : </th>
                <th width="15%">${dto.visitCount}</th>
                <th width="15%">날짜 : </th>
                <th >${dto.postdate}</th>
            </tr>
            <tr>
                <th>제목 : </th>
                <th colspan="5" align="left" style="padding-left: 30px">${dto.title}</th>
            </tr>
            <tr>
                <th>내용</th>
                <th colspan="5"  align="left" style="padding-left: 30px">${dto.content}</th> <!-- 게시글 내용 출력 -->
            </tr>
        </table>


        <button type="button" onclick="location.href='/delete?no=${dto.no}&mode=delete'">삭제하기</button>
        <button type="button" onclick="location.href='/edit?no=${dto.no}'">수정하기</button>
        <button type="button" onclick="location.href='/list'">목록보기</button>
        <br>
        <br>
        <br>
        <c:forEach var="comment" items="${commentList}">
            <hr>
            ${comment.id} :
            ${comment.content}
            <br>
            <br>
        </c:forEach>
        <hr>
        <form method="post" action="/view" onsubmit="return validateForm(this);">
            <input type="hidden" name="no" value="${dto.no}">
            <input type="hidden" name="id" value="${dto.id}">
            <table width="100%">
                <tr >
                    <td style="width: 10%">

                    </td>
                    <td width="10%" style="text-align: center; width: 15% ">
                        <span>닉네임</span>
                    </td>
                    <td>
                        <textarea name="content" style="width: 700px; height: 100px;resize: none; box-sizing: border-box; "></textarea>
                    </td>
                    <td style="width: 30%">

                    </td>
                </tr>
            </table>
            <button type="submit">댓글쓰기</button>
            <button type="reset" >다시쓰기</button>
        </form>

    </main>
    <jsp:include page="footer.jsp"/>
    <script>
        function validateForm(form){
            if(form.title.value.trim() === ""){
                alert("내용을 입력하세요");
                return false;  // Prevents form submission
            }
            return true;  // Allows form submission
        }
    </script>
</div>
</body>
</html>