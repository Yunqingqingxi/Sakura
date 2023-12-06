package com.example.demo1;

import java.sql.SQLException;


public class Server {

    // 登录方法
    public static boolean login(String username, String password) {
        return DBUtil.login(username, password);
    }

    // 注册方法
    public static int register(String username, String password) {
        int row = 0;
        row = DBUtil.register(username, password);
        return row;
    }


    // 修改密码方法
    public static int updatePassword(String username, String password) {
        int row = 0;
        row = DBUtil.updatePassword(username, password);
        return row;
    }

    // 验证用户是否已存在
    public static int select(String username) {
        int row = 0;

        try {
            row = DBUtil.select(username);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return row;
    }

    public static String insertMessage(String username, String title, String content) throws SQLException {
        DBUtil.insertMessage(username, title, content);
        return "Success";
    }

    public static String insertMes(String username, String name, String email, String sex, int age) {
        DBUtil.insertMes(username, name, email, sex, age);
        return "Success";
    }
}