/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineteaching.dao;

import com.onlineteaching.entities.User;
import java.sql.*;

/**
 *
 * @author LeeBen
 */
public class UserDAO {

    private Connection con;

    public UserDAO(Connection con) {
        this.con = con;
    }

    //method to insert user to database
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            //user --> database
            String query = "insert into OnlineTeaching.dbo.users(username,password,name) values (?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getName());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //get user by username and password
    public User getUserByUsernameAndPassword(String username, String password) {
        User user = null;
        try {
            String query = "select * from OnlineTeaching.dbo.users where username=? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();
                //data from db
                String name = set.getString("name");
                // set to user object
                user.setName(name);
                user.setUserID(set.getInt("userID"));
                user.setUsername(set.getString("username"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setIUCode(set.getString("IUCode"));
                user.setDepartment(set.getString("department"));
                user.setEmail(set.getString("email"));
                user.setProfile(set.getString("profile"));
                user.setDateTime(set.getTimestamp("rdate"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update OnlineTeaching.dbo.users set name=?,password=?,gender=?,IUCode=?,department=?,email=?,profile=? where userID=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getPassword());
            p.setString(3, user.getGender());
            p.setString(4, user.getIUCode());
            p.setString(5, user.getDepartment());
            p.setString(6, user.getEmail());
            p.setString(7, user.getProfile());
            p.setInt(8, user.getUserID());

            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
