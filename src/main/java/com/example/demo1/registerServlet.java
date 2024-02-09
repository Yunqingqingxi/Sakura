package com.example.demo1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

@WebServlet("/register")
public class registerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
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
//        String email = req.getParameter("email").trim();
        // 创建用户对象
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
        // 检查邮箱是否为空
//        if (email.isEmpty()) {
//            // 设置错误信息
//            req.setAttribute("message", "邮箱不能为空");
//            // 转发到注册界面
//            req.getRequestDispatcher("register.jsp").forward(req, resp);
//            return;
//        }
        // 检查用户名是否已存在
        boolean isEmptyname = DBUtil.isExist(username);
        if (isEmptyname) {
            // 设置错误信息
            req.setAttribute("message", "用户名已存在");
            // 转发到注册界面
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }
        // 检查密码是否一致
        if (!pwd.equals(pwd1)) {
            // 设置错误信息
            req.setAttribute("message", "两次输入的密码不一致");
            // 转发到注册界面
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        // 调用Server.register方法注册用户
        int row = Server.register(username, pwd1);
        // 如果注册成功，重定向到登录界面
        if (row > 0) {
            // 设置延迟时间，单位为毫秒
            int delay = 3000;
// 使当前线程暂停指定的时间
            try {
                Thread.sleep(delay);
                resp.sendRedirect("index.jsp");
                return;
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
        // 如果注册失败，设置错误信息并转发到注册界面
        req.setAttribute("message", "注册失败");
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
