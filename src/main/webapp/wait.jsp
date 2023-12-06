<%--
  Created by IntelliJ IDEA.
  User: Niko
  Date: 2023/12/4
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>等待响应</title>
</head>
<style>
    body {
        margin: 0;
        padding: 0;
        background: #34495e;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .loading {
        width: 200px;
        height: 200px;
        border-top: 10px solid #e74c3c;
        border-radius: 50%;
        box-sizing: border-box;
        position: relative;
        animation: a1 2s linear infinite;
    }

    .loading::before, .loading::after {
        content: '';
        width: 200px;
        height: 200px;
        box-sizing: border-box;
        border-radius: 50%;
        /* background-color: #E74C3C; */
        position: absolute;
        left: 0px;
        top: -8px;
    }

    .loading::before {
        border-top: 10px solid yellow;
        transform: rotate(120deg);
    }

    .loading::after {
        border-top: 10px solid royalblue;
        transform: rotate(240deg);
    }

    .loading span {
        position: absolute;
        text-align: center;
        color: #fff;
        width: 200px;
        height: 200px;
        line-height: 180px;
        animation: a2 2s linear infinite;
    }

    @keyframes a1 {
        to {
            transform: rotate(360deg);
        }
    }

    @keyframes a2 {
        to {
            transform: rotate(-360deg);
        }
    }

</style>
<body>

<div class="loading">
    <span>Waiting...</span>
</div>

<%
    response.setHeader("cache-control", "public");
    // 让线程睡两秒
    try {
        Thread.sleep(3 * 1000);
    } catch (InterruptedException e) {
        throw new RuntimeException(e);
    }
    request.getRequestDispatcher("per_frame.jsp").forward(request, response);
%>

</body>
</html>
