package com.example.demo1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/search")
public class search extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String title = req.getParameter("s-title");

        // Check if the title is not empty before making a database query
        if (title != null && !title.isEmpty()) {
            String[] tit = DBUtil.selectTitle(title);

            // Set the attribute only if the tit array is not null
            req.setAttribute("title", tit);
        } else {
            req.setAttribute("error", "Title cannot be empty.");
        }

        req.getRequestDispatcher("wzxq2.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
