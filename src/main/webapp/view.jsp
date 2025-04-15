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
                <td width="25%" >${dto.nickname}</td>
                <th width="15%" >조회수 : </th>
                <td width="15%">${dto.visitCount}</td>
                <th width="15%">날짜 : </th>
                <td >${dto.postdate}</td>
            </tr>
            <tr>
                <th>제목 : </th>
                <td colspan="5" align="left" style="padding-left: 50px;text-align: left ">${dto.title}</td>
            </tr>
            <tr>
                <td colspan="6"  align="left" style="padding-left: 30px; height: 150px;">${dto.content}</td> <!-- 게시글 내용 출력 -->
            </tr>
            <tr>
                <td colspan="7"  style="text-align: right; vertical-align: bottom; padding: 20px;" >
                    <c:if test="${dto.id == mdto.id}">
                        <button type="button" onclick="location.href='/delete?no=${dto.no}&mode=delete'">삭제하기</button>
                    </c:if>
                    <c:if test="${dto.id == mdto.id}">
                        <button type="button" onclick="location.href='/edit?no=${dto.no}'">수정하기</button>
                    </c:if>
                    <button type="button" onclick="location.href='/list'">목록보기</button>
                </td>
            </tr>
            <c:forEach var="comment" items="${commentList}">
                <tr >
                    <td colspan="7">
                        <div class="commentArea" >
                            <span style="display:inline-block; width: 150px; text-align: center">${comment.nickname} </span>:
                            <span>${comment.content}</span>
                        </div>
                        <br>
                        <br>
                        <br>
                        <form method="post" action="/view">
                            <input type="hidden" name="commentMod" value="commentDelete">
                            <input type="hidden" name="comment_no" value="${comment.comment_no}">
                            <input type="hidden" name="board_no" value="${comment.board_no}">
                            <c:if test="${comment.id==userId}">
                                <div style="text-align: right">
                                    <button type="submit">삭제하기</button>
                                </div>
                            </c:if>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <form method="post" action="/view" onsubmit="return validateForm(this);">
            <input type="hidden" name="commentMod" value="commentWrite">
            <input type="hidden" name="no" value="${dto.no}">
            <input type="hidden" name="id" value="${dto.id}">
            <table width="100%">
                <tr >
                    <td style="width: 10%">
                    </td>
                    <td width="10%" style="text-align: center; width: 15% ">
                        <span>${mdto.nickname}</span>
                    </td>
                    <c:if test="${userId!=null}">
                        <td>
                            <textarea name="content" style="width: 700px; height: 100px;resize: none; box-sizing: border-box; "></textarea>
                        </td>
                    </c:if>
                    <td style="width: 30%">

                    </td>
                </tr>
            </table>
            <c:if test="${userId!=null}">
                <button type="submit">댓글쓰기</button>
                <button type="reset" >수정하기</button>
            </c:if>
        </form>
    </main>
    <jsp:include page="footer.jsp"/>
    <script>
        function validateForm(form){
            if(form.content.value == ""){
                alert("내용을 입력하세요");
                return false;
            }
        }
    </script>
</div>
</body>
</html>