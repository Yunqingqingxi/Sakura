    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <title>登录</title>
    </head>
    <!--section包括一个独立章节，一般含一个标题-->
    <section >
        <body>
<%
    response.setHeader("cache-control","public");
    String message = (String) request.getAttribute("errorMessage");
    if(message== null){
    message="";
    }
%>
            <!--背景颜色和背景框-->
            <!--class选择器-->
            <div class="main-frame"></div>
            <div class="box"></div>
            <!--背景圆-->
            <!--从0开始添加第一个圆,style="--x:0"-->
            <div class="circle" style="--x:0"></div>
            <div class="circle" style="--x:1"></div>
            <div class="circle" style="--x:2"></div>
            <div class="circle" style="--x:3"></div>
            <div class="circle" style="--x:4"></div>
            <!--如果你的div用了container的样式，那么它的宽度最大也大不过12个栅栏总共的最大宽度。-->
            <!--当你的div用了container-fluid的样式，它会无视12个栅栏的规定，根据屏幕自动适应自动填充。-->
            <!--当然，宽度要设置为width:100%-->
            <div class="container">
                <!--HTML <form> 元素表示文档中的一个区域，此区域包含交互控件，用于向 Web 服务器提交信息。-->
                <div class="form">
                    <!--             h2为二级标题-->
                    <h2>登录</h2>
                    <FORM action="login" method="post">
                        <div class="inputBox">
                            <input type="text" placeholder="用户名" name="username" autocomplete="username">
                        </div>
                        <div class="inputBox">
                            <input type="password" placeholder="密码" name="password" autocomplete="current-password">
                        </div>
                        <div style="color: red;">
                            <%=message%>
                        </div>
                        <div class="inputBox" @keyup.enter="Login">
                            <input type="submit" value="登录" name="Login">
                        </div>
                        <p class="forget" name="forget">忘记密码?<a href="update.jsp">
                            点击这里
                        </a></p>
                        <p class="forget a" name="new">没有账户?<a href="register.jsp">
                            注册
                        </a></p>
                    </FORM>
                </div>
            </div>
        </body>
        <script src="js/flower.js"></script>
    </section>
    </html>