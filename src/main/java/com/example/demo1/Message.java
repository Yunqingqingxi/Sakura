package com.example.demo1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/message")
public class Message extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

/* 
*这个servlet是用来写入文章内容的
*通过per_frame.jsp端发送的username，title，content
*调用DBUtil.selectUsername()方法实现文章的写入
*/
    

        // 设置请求和响应的编码和内容类型
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");

        // 获取请求参数
        String title = req.getParameter("title");
        String content = req.getParameter("editor-markdown-doc");
        String username = null;
        System.out.println(title);

        try {
            // 创建session记住当前登录状态，并获取username存入loggedInUsername
            HttpSession session = req.getSession();
            String loggedInUsername = (String) session.getAttribute("username");

            username = DBUtil.selectUsername(loggedInUsername);
            System.out.println(username);

            String result = null;
            result = Server.insertMessage(username, title, content);

            if ("Success".equals(result)) {
                req.getRequestDispatcher("wzxq2.jsp").forward(req, resp);
            } else {
                System.out.println("fail");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
