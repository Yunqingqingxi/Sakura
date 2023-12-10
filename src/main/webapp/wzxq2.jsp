<%--
Created by IntelliJ IDEA.
User: hking
Date: 2023/12/5
Time: 19:09
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.demo1.DBUtil" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>文章详情</title>
    <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
    <link rel="icon" href="image/文章.png">
    <link rel="stylesheet" href="css/frame.css">
    <link rel="stylesheet" href="css/blog.css">
    <link rel="stylesheet" href="css/per%20message1.css">

    <style>
        .container {
            width: 80%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 38px;
            color: #4d4f53;
            letter-spacing: 1px;
            line-height: 54px;
            padding: 40px 0;
        }
        p {
            line-height: 1.5;
            margin-bottom: 20px;
            font-size: 18px;
            color: #000;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            color: #999;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .date{
            font-size: 16px;
            color: #888;
        }
        .hk{
          float: right;
        }
        .name{
            font-size: 28px;
        }
    </style>
</head>
<body>
<%
    HttpSession session1 = request.getSession();
    String loggedInUsername = (String) session1.getAttribute("username");
%>
<div class="container">
    <%
        String content1 = null;
        String title = null;
        String datetime = null;
        try {
            content1 = DBUtil.readContent(loggedInUsername);
            title = DBUtil.readTitle(loggedInUsername);
            datetime = DBUtil.readDatetime(loggedInUsername);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    %>
    <h1 style="text-align: center"><%-- 从数据库中获取文章标题 --%><%= title%></h1>
    <hr>
    <div class="date" style="text-align: center"><%= datetime%>
    </div>
    <hr>
    <div>
        <%-- 从数据库中获取文章内容 --%>
        <div id="$m" class="markdown-body"></div>
        <textarea id="$t" style="display: none"><%= content1%></textarea>
    </div>
</div>
<div  class="container">
<a>评论</a>
<a class="hk" href="pl.jsp">发表评论</a>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DBUtil.getConnection();
            String sql1 = "SELECT * FROM pl";
            PreparedStatement Statement = conn.prepareStatement(sql1);
            ResultSet resultSet1 = Statement.executeQuery();
            while (resultSet1.next()) {
    %>
    <div class="name"><%-- 从数据库中获取文章内容 --%><p><%=resultSet1.getString("name")%>
    </p></div>
    <div><%-- 从数据库中获取文章内容 --%><p><%=resultSet1.getString("content")%>
    </p></div>
    <div class="date"><%=resultSet1.getString("date")%>
    </div>
    <hr>
    <%
            }
            resultSet1.close();
            Statement.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    %>
</div>
<%--<script>--%>
<%--    // 获取从数据库中获取的 markdown 格式内容--%>
<%--    var markdownContent = document.getElementById('markdownContent').innerHTML;--%>

<%--    console.log(markdownContent);--%>

<%--    // 将 markdown 转换为 HTML--%>
<%--    var htmlContent = marked(markdownContent);--%>

<%--    // 将转换后的 HTML 内容替换到原有的元素中--%>
<%--    document.getElementById('markdownContent').innerHTML = htmlContent;--%>
<%--</script>--%>
<script>$m.innerHTML = marked.parse($t.value);</script>
</body>

</html>


