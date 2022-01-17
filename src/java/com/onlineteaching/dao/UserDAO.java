/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineteaching.dao;

import com.onlineteaching.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
                user.setDepartmentID(set.getInt("departmentID"));
                user.setEmail(set.getString("email"));
                user.setProfile(set.getString("profile"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setRole(set.getInt("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update OnlineTeaching.dbo.users set name=?,password=?,gender=?,IUCode=?,departmentID=?,email=?,profile=? where userID=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getPassword());
            p.setString(3, user.getGender());
            p.setString(4, user.getIUCode());
            p.setInt(5, user.getDepartmentID());
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
    public boolean updateUserRole(int role, int userID) {
        boolean f = false;
        try {
            String query = "update OnlineTeaching.dbo.users set role=? where userID=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, role);
            p.setInt(2, userID);

            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    public List<User> getUserByDepartmentID(int departmentID) {
        List<User> list = new ArrayList<>();

        try {
            String query = "select * from OnlineTeaching.dbo.users where departmentID=? and role=0";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, departmentID);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {
                int userID = set.getInt("userID");
                String username = set.getString("username");
                String password = set.getString("password");
                String name = set.getString("name");
                String gender = set.getString("gender");
                String IUCode = set.getString("IUCode");
                String email = set.getString("email");
                Timestamp dateTime = set.getTimestamp("rdate");

                User user = new User(userID, username, password, name, gender, IUCode, departmentID, email, dateTime);
                list.add(user);
            }
        } catch (Exception e) {
        }

        return list;
    }
    public ArrayList<User> getAllUsers() {
        ArrayList<User> list = new ArrayList<>();

        try {
            String query = "select * from OnlineTeaching.dbo.users";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(query);
            while (set.next()) {
                int userID = set.getInt("userID");
                String username = set.getString("username");
                String name = set.getString("name");
                String gender = set.getString("gender");
                String IUCode = set.getString("IUCode");
                int departmentID = set.getInt("departmentID");
                String email = set.getString("email");
                int role = set.getInt("role");

                User user = new User(userID, username, name, gender, IUCode, departmentID, email, role);
                list.add(user);
            }
        } catch (Exception e) {
        }

        return list;
    }
    public boolean addCourseForStudent(int userID, int courseID) {
        boolean f = false;
        try {
            //user --> database
            String query = "insert into OnlineTeaching.dbo.student(userID,courseID) values (?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, userID);
            pstmt.setInt(2, courseID);
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
