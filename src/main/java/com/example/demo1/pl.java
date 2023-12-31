package com.example.demo1;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "pl", value = "/pl")
public class pl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
/*
*这是实现评论的servlet
*通过comment和username
*调用DBUtil.insertMessage2(name,content);方法实现
*/
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
        
        String content = req.getParameter("comment");
        String name = req.getParameter("username");

        try {
            // 实现写评论
            DBUtil.insertMessage2(name,content);
            req.getRequestDispatcher("wzxq2.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
