<%@ page import="com.example.demo1.DBUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: Niko
  Date: 2023/12/3
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/frame.css">
    <link rel="stylesheet" href="css/blog.css">
    <link rel="stylesheet" href="css/per%20message1.css">
    <!-- 引入依赖 -->
    <link rel="stylesheet" href="editor.md-master/css/editormd.min.css">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="editor.md-master/lib/marked.min.js"></script>
    <script src="editor.md-master/lib/prettify.min.js"></script>
    <script src="editor.md-master/editormd.js"></script>
</head>
<body>
<div class="frame">
    <div class="top-Bar">
        <img src="image/XG.jpg" alt="" id="img">
        <p id="panel">首页</p>
        <form action="search" method="post">
            <div class="top-Bar-pos">
                <input class="search-input" type="search" placeholder="搜索" id="search" name="s-title"/>
                <button type="submit" name="search" id="button">搜索</button>
            </div>
        </form>
        <div class="top-Bar-tool">
            <a href="Sakura.html" id="main">主页</a>
            <a href="wzxq2.jsp" id="send">查看文章</a>
            <a href="login.jsp" id="login">登录</a>
            <a href="login.jsp" id="down" style="display: none">注销</a>
        </div>
    </div>
    <p><%= request.getAttribute("user_message") %>
    </p>
    <%
        // 从session中获取用户名信息
        HttpSession session1 = request.getSession();
        String loggedInUsername = (String) session1.getAttribute("username");

        // 设置默认值
        String name1 = (loggedInUsername != null) ? loggedInUsername : "";

        // 从info数据库中获取信息
        String[] s = DBUtil.selectMes(loggedInUsername);
        String name = null;
        String sex = null;
        String email = null;
        String age;

        if (s.length == 4) {
            name = s[0] != null ? s[0] : "";
            sex = s[1] != null ? s[1] : "";
            email = s[2] != null ? s[2] : "";
            age = s[3] != null ? s[3] : "";

            // Now you can use the individual variables (name, sex, email, age) as needed
            System.out.println("Name: " + name);
            System.out.println("Sex: " + sex);
            System.out.println("Email: " + email);
            System.out.println("Age: " + age);
        } else {
            // Handle the case where the array doesn't have the expected length
            System.out.println("Invalid array length or null array.");
        }
    %>

    <div class="right-Bar-frame">
        <img src="image/XG.jpg" alt="" id="per_img">
        <h2 id="per_username">我是<span><%= name%></span></h2>
        <div class="right-Bar-frame-filed">
            <p>性别:<span><%= sex %></span></p>
            <p>账号:<%=name1%>
            </p>
            <p>邮箱:<span><%= email %></span></p>
            <button id="add">添加资料</button>
        </div>
    </div>

    <form action="message" method="post">
        <div class="blog-edit-container">
            <!-- 标题编辑区 -->
            <div class="title">
                <input type="text" placeholder="在这里写下文章标题" id="title" name="title">
                <input type="submit" value="发布文章" id="submit">
            </div>

            <!-- 内容编辑区 -->
            <div id="editor">

            </div>
        </div>
    </form>
</div>
<div>
    <form action="person" method="post">
        <div class="form-container" style="display: none" id="user-mes">
            <h2>个人信息</h2>
            <div class="form-group">
                <label for="name">姓名:</label>
                <input type="text" id="name" name="name" required>
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
            <button type="submit" id="submitBtn" onclick="saveAndHide()">保存</button>
        </div>
    </form>
</div>
<!-- 其他HTML代码 -->
<script>
    // 在页面加载完成后执行
    document.addEventListener('DOMContentLoaded', function () {
        // 获取name的值
        var nameValue = '<%= name %>';
        var email = '<%= email%>>'

        // 判断name是否为空，如果不为空则隐藏个人信息表单
        if (nameValue.trim() !== "") {

            // 隐藏登录按钮,显示注销按钮
            document.querySelector('#login').style.display = 'none';

            document.querySelector('#down').style.display = 'inline';

            // 隐藏个人信息表单
            document.querySelector('.form-container').style.display = 'none';

            if (email.trim() !== "") {
                document.querySelector('#add').style.display = 'none';
            }

            // 检查 sessionStorage 中的标志
            var hasRefreshed = sessionStorage.getItem('hasRefreshed');

            if (!hasRefreshed) {
                // 设置 sessionStorage 标志
                sessionStorage.setItem('hasRefreshed', 'true');

                // 刷新页面
                location.reload();
            }
        }
    });
</script>
</body>
<script>
    // 初始化 editor.md
    let editor = editormd("editor", {
        // 这里的尺寸必须在这里设置，设置样式会被 editormd 自动覆盖
        width: "100%",
        // 设定编辑高度
        height: "500px",
        // 编辑页中的初始化内容
        markdown: "# 在这里写下一篇博客",
        //指定 editor.md 依赖的插件路径
        path: "editor.md-master/lib/"
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Your script here
        let clickCount = 0;
        const paragraphElement = document.getElementById('add');
        var user_mes = document.getElementById('user-mes');

        paragraphElement.addEventListener('click', function () {
            clickCount++;
            console.log('点击次数:', clickCount);
            if (user_mes.style.display === 'none') {
                user_mes.style.display = 'block';  // 或者 'inline'，具体取决于元素类型
            } else {
                user_mes.style.display = 'none';
            }
        });
    });
</script>
</html>