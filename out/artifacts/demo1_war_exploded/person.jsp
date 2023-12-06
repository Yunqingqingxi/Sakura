<%--
  Created by IntelliJ IDEA.
  User: Niko
  Date: 2023/12/4
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/frame.css">\
</head>
<body>
<div class="frame">
    <div class="top-Bar">
        <img src="image/XG.jpg" alt="" id="img">
        <p id="panel">首页</p>
        <div class="top-Bar-pos">
            <input class="search-input" type="search" placeholder="搜索" id="search" />
            <button type="submit" name="search" id="button">搜索</button>
        </div>
        <div class="top-Bar-tool">
            <a href="Sakura.html" id="main">主页</a>
            <a href="Sakura.html" id="send">发布</a>
            <a href="login.jsp" id="login">登录</a>
        </div>
    </div>
    <div class="right-Bar-frame">
        <img src="image/XG.jpg" alt="" id="per_img">
        <h2 id="per_username">我是</h2>
        <div class="right-Bar-frame-filed">
            <p>性别:</p>
            <p>生日:</p>
            <p>邮箱:</p>
            <a href="Sakura.html">美图</a>
        </div>
    </div>

</div>
</body>
</html>
