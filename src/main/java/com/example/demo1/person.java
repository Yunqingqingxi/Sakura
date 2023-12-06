package com.example.demo1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/person")
public class person extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        // 获取请求参数
        String name = req.getParameter("name");
        int age = 0;
        try {
            age = Integer.parseInt(req.getParameter("age"));
        } catch (NumberFormatException e) {
            // 处理年龄不是有效整数的情况
            e.printStackTrace();
        }

        String sex = req.getParameter("sexy");
        String email = req.getParameter("email");

        String userInname = null;
        String loggedInUsername = null;
        try {
            HttpSession session = req.getSession();
            loggedInUsername = (String) session.getAttribute("username");

            userInname = DBUtil.selectUsername(loggedInUsername);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if (name != null) {
            // 写入信息到服务器
            String mes = Server.insertMes(userInname, name, email, sex, age);
            System.out.println("写入成功");

            if ("Success".equals(mes)) {
                // 设置成功消息和用户数据以供显示
                req.setAttribute("user_message", "信息写入成功");
                req.setAttribute("username", name);
                req.setAttribute("email", email);
                req.setAttribute("sex", sex);
                req.setAttribute("age", age);

                req.setAttribute("hideForm", true);

                // 转发请求到 per_frame.jsp 页面
                req.getRequestDispatcher("/per_frame.jsp").forward(req, resp);
            } else {
                System.out.println("fail");
            }
        }
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
