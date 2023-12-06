package com.example.demo1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


/**
 * @author Niko
 */
@WebServlet(name = "login", value = "/login")
public class loginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println("Please use POST method to login.");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        PrintWriter out = resp.getWriter();

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        boolean userLoggedIn = Server.login(username, password);

        if (userLoggedIn) {
            // 用session来储存
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            System.out.println("session得到的登录Username:" + username);


//            // 在浏览器上创建Cookie，用cookie来储存用户名和密码，并设置过期时间为一个小时
//            Cookie cookie = new Cookie("username", username);
//            cookie.setMaxAge(60 * 60 * 24 *7); // 设置过期时间为一个小时（单位：秒）
//            resp.addCookie(cookie);

            // 将登录成功的username数据存储到request属性中
//            req.setAttribute("loggedInUsername", username);
//            System.out.println("得到的登录Username:" + username);

            req.getRequestDispatcher("per_frame.jsp").forward(req, resp);

        } else {
            req.setAttribute("errorMessage", "用户名或密码错误");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    public void destroy() {
        super.destroy();
    }

}
