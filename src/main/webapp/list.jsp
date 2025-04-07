<%@ page import="dto.BoardDTO" %>
<%@ page import="dao.BoardDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    BoardDAO dao = new BoardDAO();
    List<BoardDTO> dtoList = dao.getBoard("no");
%>
<html>
<head>
    <title>list</title>
</head>
<body>
    <form method="get">
        <table border="1" width="90%">
            <tr>
                <td colspan="5" >
                    <select name="searchOption">
                        <option value="title">제목</option>
                        <option value="id">작성자</option>
                    </select>
                    <input type="text" name="searchWord">
                </td>
            </tr>
            <tr>
                <th>NO</th>
                <th>작성자</th>
                <th>제목</th>
                <th>조회수</th>
                <th>날짜</th>
            </tr>
            <% for (BoardDTO dto : dtoList){ %>
            <tr>
                <td><%=dto.getNo()%></td>
                <td><%=dto.getId()%></td>
                <td><a href="/view?no=<%=dto.getNo()%>"><%=dto.getTitle()%></a></td>
                <td><%=dto.getVisitCount()%></td>
                <td><%=dto.getPostdate()%></td>
            </tr>
            <% } %>
        </table>
    </form>
</body>
</html>