/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineteaching.dao;

import com.onlineteaching.entities.Course;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LeeBen
 */
public class CourseDAO {
    private Connection con;

    public CourseDAO(Connection con) {
        this.con = con;
    }
    public boolean saveCourse(Course course) {
        boolean f = false;
        try {
            //user --> database
            String query = "insert into OnlineTeaching.dbo.courses(courseName,departmentID,courseCode,weekDay,room,instructor,startSlot,numbersOfSlots,classID,semester,schoolYear,groupClass,lab,labGroup,userID) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, course.getCourseName());
            pstmt.setInt(2, course.getDepartmentID());
            pstmt.setString(3, course.getCourseCode());
            pstmt.setString(4, course.getWeekDay());
            pstmt.setString(5, course.getRoom());
            pstmt.setString(6, course.getInstructor());
            pstmt.setInt(7, course.getStartSlot());
            pstmt.setInt(8, course.getNumbersOfSlots());
            pstmt.setString(9, course.getClassID());
            pstmt.setInt(10, course.getSemester());
            pstmt.setInt(11, course.getSchoolYear());
            pstmt.setInt(12, course.getGroup());
            pstmt.setInt(13, course.getLab());
            pstmt.setInt(14, course.getHasLab());
            pstmt.setInt(15, course.getUserID());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    public ArrayList<Course> getAllCourses() {
        ArrayList<Course> list = new ArrayList<>();

        try {
            String query = "select * from OnlineTeaching.dbo.courses where isDelete=0";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(query);
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
                int group = set.getInt("groupClass");
                int lab = set.getInt("lab");
                int hasLab = set.getInt("labGroup");
                int userID = set.getInt("userID");

                Course course = new Course(courseID, courseName, departmentID, courseCode, weekDay, room, instructor, startSlot, numbersOfSlots, classID, semester, schoolYear, group, lab, hasLab, userID);
                list.add(course);
            }
        } catch (Exception e) {
        }

        return list;
    }
    public boolean deleteCourse(int semester, int schoolYear) {
        boolean f = false;
        try {
            String query = "update OnlineTeaching.dbo.courses set isDelete=1 where semester=? and schoolYear=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, semester);
            p.setInt(2, schoolYear);
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
