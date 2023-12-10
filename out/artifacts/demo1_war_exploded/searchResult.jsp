<%--
  Created by IntelliJ IDEA.
  User: Niko
  Date: 2023/12/6
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String[] t = (String[]) request.getAttribute("title");
    String username = null;
    String title = null;
    String content = null;

    if (t.length == 3) {
        username = t[0] != null ? t[0] : "";
        title = t[1] != null ? t[1] : "";
        content = t[2] != null ? t[2] : "";
    }
    // 读取username,title和content

%>
username:<%= username%>><br>
title:<%= title%>><br>
content:<%= content%>><br>
</body>
</html>
