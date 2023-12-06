<%--
  Created by IntelliJ IDEA.
  User: Niko
  Date: 2023/12/3
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人信息</title>
    <link rel="stylesheet" href="./css/per message1.css">
</head>
<body >
<form action="/user_mes" method="post">
<div class="form-container">
    <h2>个人信息</h2>
        <div class="form-group">
            <label for="name">姓名:</label>
            <input type="text" id="name" name="username" required>
        </div>
        <div class="form-group">
            <label for="email">邮箱:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label>性别:</label>
            <input type="text" name="sexy">
        </div>
        <div class="form-group">
            <label for="age">年龄:</label>
            <input type="number" id="age" name="age" required>
        </div>
        <button type="submit" id="submitBtn" >保存</button>
    </div>
    </form>
<%--<script src="./js/per message2.js"></script>--%>
</body>
</html>

