<%--
  Created by IntelliJ IDEA.
  User: hking
  Date: 2023/12/10
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>评论页面</title>
    <style>
        body {
            background-image: url("./image/preview.jpg");
            background-size: cover;
            position: absolute;
            left: 0;
            top: 0;
            filter: blur(5px);
            width: 100%;
            height: 100%;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="frame-pl"></div>
<h1>发表评论</h1>
<form action="pl" method="post">
    <label for="username">用户名：</label>
    <input type="text" id="username" name="username" placeholder="请输入用户名" required><br><br>
    <label for="comment">评论内容：</label>
    <textarea id="comment" name="comment" rows="4" cols="50" placeholder="请输入评论内容" required></textarea><br><br>
    <input type="submit" value="提交评论" href="">
</form>
<p>请确保您的用户名和评论内容符合规范，提交后评论将被公开显示。</p>
</body>
</html>
