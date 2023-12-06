package com.example.demo1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "update", value = "/update")
public class updateServlet extends HttpServlet {
    public updateServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置请求和响应的编码和内容类型
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
        // 获取请求参数
        String username = req.getParameter("username").trim();
        String pwd = req.getParameter("password").trim();
        String pwd1 = req.getParameter("password1").trim();


        // 检查用户名是否为空
        if (username.isEmpty()) {
            // 设置错误信息
            req.setAttribute("message", "用户名不能为空");
            // 转发到注册界面
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }
        // 检查密码是否为空
        if (pwd.isEmpty() || pwd1.isEmpty()) {
            // 设置错误信息
            req.setAttribute("message", "密码不能为空");
            // 转发到注册界面
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }
        // 检查密码是否一致
        if (!pwd.equals(pwd1)) {
            // 设置错误信息
            req.setAttribute("message", "两次输入的密码不一致");
            // 转发到注册界面
            req.getRequestDispatcher("update.jsp").forward(req, resp);
            return;
        }
        // 更新用户信息
        int row = Server.updatePassword(username, pwd);

        if (row > 0) {
            resp.sendRedirect("login.jsp");
            System.out.println("更新成功");
        } else {
            resp.sendRedirect("update.jsp");
            System.out.println("更新失败");
        }
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}

