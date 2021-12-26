/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineteaching.dao;

import com.onlineteaching.entities.Course;
import com.onlineteaching.entities.Department;
import com.onlineteaching.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LeeBen
 */
public class PostDAO {

    Connection con;

    public PostDAO(Connection con) {
        this.con = con;
    }

    public ArrayList<Department> getAllDepartment() {
        ArrayList<Department> list = new ArrayList<>();

        try {
            String query = "select * from OnlineTeaching.dbo.department";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(query);
            while (set.next()) {
                int departmentID = set.getInt("departmentID");
                String departmentName = set.getString("departmentName");
                String departmentNameAbb = set.getString("departmentNameAbb");

                Department d = new Department(departmentID, departmentName, departmentNameAbb);
                list.add(d);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Course> getCourseByUserID(int userID) {
        List<Course> list = new ArrayList<>();

        try {
            String query = "select * from OnlineTeaching.dbo.courses where userID =?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userID);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {
                int courseID = set.getInt("courseID");
                String courseName = set.getString("courseName");
                int departmentID = set.getInt("departmentID");
                String courseCode = set.getString("courseCode");
                String weekDay = set.getString("weekDay");
                String room = set.getString("room");
                String instructor = set.getString("instructor");
                int startSlot = set.getInt("startSlot");
                int numbersOfSlots = set.getInt("numbersOfSlots");
                String classID = set.getString("classID");
                int semester = set.getInt("semester");
                int schoolYear = set.getInt("schoolYear");
                int group = set.getInt("group");
                int lab = set.getInt("lab");
                int hasLab = set.getInt("hasLab");
//                int userID = set.getInt("userID");

                Course c = new Course(courseID, courseName, departmentID, courseCode, weekDay, room, instructor, startSlot, numbersOfSlots, classID, semester, schoolYear, group, lab, hasLab, userID);
                list.add(c);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String q = "insert into OnlineTeaching.dbo.post(courseID,pWeek,pContent,userID) values(?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, p.getCourseID());
            pstmt.setInt(2, p.getpWeek());
            pstmt.setString(3, p.getpContent());
            pstmt.setInt(4, p.getUserID());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
