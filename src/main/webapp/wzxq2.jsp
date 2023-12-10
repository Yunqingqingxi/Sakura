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
    <title>微博文章详情</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
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
        try {
            Connection connection = DBUtil.getConnection();
            String sql = "SELECT * FROM message where username=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,loggedInUsername);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
    %>
    <h1><%-- 从数据库中获取文章标题 --%><%= resultSet.getString("title") %></h1>
    <hr>
    <div class="date"><%= resultSet.getString("datetime") %></div>
    <hr>
    <div><%-- 从数据库中获取文章内容 --%><p><%= resultSet.getString("content") %></p></div>
    <%
            }
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
</div>
<div  class="container">
<a>评论</a>
<a class="hk" href="pl.jsp">发表评论</a>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "123456");
            String sql1 = "SELECT * FROM pl";
            PreparedStatement preparedStatement = connection.prepareStatement(sql1);
            ResultSet resultSet1 = preparedStatement.executeQuery();
            while (resultSet1.next()) {
    %>
    <div class="name"><%-- 从数据库中获取文章内容 --%><p><%= resultSet1.getString("name") %></p></div>
    <div><%-- 从数据库中获取文章内容 --%><p><%= resultSet1.getString("content") %></p></div>
    <div class="date"><%= resultSet1.getString("date") %></div>
    <hr>
    <%
            }
            resultSet1.close();
            preparedStatement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    %>
</div>
</body>
</html>


