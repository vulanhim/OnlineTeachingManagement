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
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
            String query = "select * from OnlineTeaching.dbo.courses where userID =? and isDelete=0";
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
                int group = set.getInt("groupClass");
                int lab = set.getInt("lab");
                int hasLab = set.getInt("labGroup");
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
            String q = "insert into OnlineTeaching.dbo.post(courseID,pWeek,pContent,userID,linkCourse,slide) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, p.getCourseID());
            pstmt.setInt(2, p.getpWeek());
            pstmt.setString(3, p.getpContent());
            pstmt.setInt(4, p.getUserID());
            pstmt.setString(5, p.getLinkCourse());
            pstmt.setString(6, p.getSlide());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //get all the posts
    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        //fetch all the posts
        try {
            PreparedStatement p = con.prepareStatement("select * from OnlineTeaching.dbo.post where isDelete=0 order by postID desc");
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int postID = set.getInt("postID");
                int courseID = set.getInt("courseID");
                Timestamp pDate = set.getTimestamp("pDate");
                int pWeek = set.getInt("pWeek");
                String pContent = set.getString("pContent");
                int isCheck = set.getInt("isCheck");
                int userID = set.getInt("userID");
                String checkBy = set.getString("checkBy");
                String linkCourse = set.getString("linkCourse");
                String slide = set.getString("slide");
                Post post = new Post(postID, courseID, pDate, pWeek, pContent, isCheck, userID, checkBy, linkCourse, slide);
                list.add(post);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Post> getPostByCourseID(int courseID) {
        List<Post> list = new ArrayList<>();
        //fetch all the posts of course
        try {
            PreparedStatement p = con.prepareStatement("select * from OnlineTeaching.dbo.post where courseID=? and isDelete=0 order by postID desc");
            p.setInt(1, courseID);
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int postID = set.getInt("postID");
                Timestamp pDate = set.getTimestamp("pDate");
                int pWeek = set.getInt("pWeek");
                String pContent = set.getString("pContent");
                int isCheck = set.getInt("isCheck");
                int userID = set.getInt("userID");
                String checkBy = set.getString("checkBy");
                String linkCourse = set.getString("linkCourse");
                String slide = set.getString("slide");
                Post post = new Post(postID, courseID, pDate, pWeek, pContent, isCheck, userID, checkBy, linkCourse, slide);
                list.add(post);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Post> getPostByUserID(int userID) {
        List<Post> list = new ArrayList<>();
        //fetch all the posts of user
        try {
            PreparedStatement p = con.prepareStatement("select * from OnlineTeaching.dbo.post where userID=? and isDelete=0 order by postID desc");
            p.setInt(1, userID);
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int postID = set.getInt("postID");
                int courseID = set.getInt("courseID");
                Timestamp pDate = set.getTimestamp("pDate");
                int pWeek = set.getInt("pWeek");
                String pContent = set.getString("pContent");
                int isCheck = set.getInt("isCheck");
                String checkBy = set.getString("checkBy");
                String linkCourse = set.getString("linkCourse");
                String slide = set.getString("slide");
                Post post = new Post(postID, courseID, pDate, pWeek, pContent, isCheck, userID, checkBy, linkCourse, slide);
                list.add(post);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Department getDepartmentByDepartmentID(int departmentID) {
        Department dep = null;
        try {
            String query = "select * from OnlineTeaching.dbo.department where departmentID=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, departmentID);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                dep = new Department();
                //data from db
                // set to user object
                dep.setDepartmentID(set.getInt("departmentID"));
                dep.setDepartmentName(set.getString("departmentName"));
                dep.setDepartmentNameAbb(set.getString("departmentNameAbb"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dep;
    }

    public boolean deletePostByPostID(int postID) {
        boolean f = false;
        try {
            String query = "update OnlineTeaching.dbo.post set isDelete=1 where postID=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, postID);
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean updatePost(int postID, String pContent, String linkCourse, String slide) {
        boolean f = false;
        try {
            String query = "update OnlineTeaching.dbo.post set pContent=?,linkCourse=?,slide=?,isCheck=0 where postID=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, pContent);
            p.setString(2, linkCourse);
            p.setString(3, slide);
            p.setInt(4, postID);

            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Post> getAllPostsByDepartmentID(int departmentID) {
        List<Post> list = new ArrayList<>();
        //fetch all the posts of user
        try {
            PreparedStatement p = con.prepareStatement("select postID, OnlineTeaching.dbo.post.courseID, pDate, pWeek, pContent, isCheck, OnlineTeaching.dbo.post.userID, checkBy, linkCourse, slide from OnlineTeaching.dbo.post left join OnlineTeaching.dbo.courses on OnlineTeaching.dbo.courses.courseID = OnlineTeaching.dbo.post.courseID left join OnlineTeaching.dbo.department on OnlineTeaching.dbo.department.departmentID = OnlineTeaching.dbo.courses.departmentID where OnlineTeaching.dbo.courses.departmentID = ? and OnlineTeaching.dbo.post.isDelete = 0 and isCheck = 0 order by postID ");
            p.setInt(1, departmentID);
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int postID = set.getInt("postID");
                int courseID = set.getInt("courseID");
                Timestamp pDate = set.getTimestamp("pDate");
                int pWeek = set.getInt("pWeek");
                String pContent = set.getString("pContent");
                int isCheck = set.getInt("isCheck");
                int userID = set.getInt("userID");
                String checkBy = set.getString("checkBy");
                String linkCourse = set.getString("linkCourse");
                String slide = set.getString("slide");
                Post post = new Post(postID, courseID, pDate, pWeek, pContent, isCheck, userID, checkBy, linkCourse, slide);
                list.add(post);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Course getCourseByCourseID(int courseID) {
        Course course = null;
        try {
            String query = "select * from OnlineTeaching.dbo.courses where courseID=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, courseID);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                course = new Course();
                //data from db
                // set to user object
                course.setCourseID(set.getInt("courseID"));
                course.setCourseName(set.getString("courseName"));
                course.setDepartmentID(set.getInt("departmentID"));
                course.setCourseCode(set.getString("courseCode"));
                course.setWeekDay(set.getString("weekDay"));
                course.setRoom(set.getString("room"));
                course.setInstructor(set.getString("instructor"));
                course.setStartSlot(set.getInt("startSlot"));
                course.setNumbersOfSlots(set.getInt("numbersOfSlots"));
                course.setClassID(set.getString("classID"));
                course.setSemester(set.getInt("semester"));
                course.setSchoolYear(set.getInt("schoolYear"));
                course.setGroup(set.getInt("groupClass"));
                course.setLab(set.getInt("lab"));
                course.setHasLab(set.getInt("labGroup"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return course;
    }

    public Post getPostByPostID(int postID) {
        Post post = null;
        try {
            String q = "select * from OnlineTeaching.dbo.post where postID=?";
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postID);
            ResultSet set = p.executeQuery();
            if(set.next()){
                int courseID = set.getInt("courseID");
                Timestamp pDate = set.getTimestamp("pDate");
                int pWeek = set.getInt("pWeek");
                String pContent = set.getString("pContent");
                int isCheck = set.getInt("isCheck");
                int userID = set.getInt("userID");
                String checkBy = set.getString("checkBy");
                String linkCourse = set.getString("linkCourse");
                String slide = set.getString("slide");
                post = new Post(postID, courseID, pDate, pWeek, pContent, isCheck, userID, checkBy, linkCourse, slide);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
    public boolean checkPost(int postID, String checkBy) {
        boolean f = false;
        try {
            String query = "update OnlineTeaching.dbo.post set isCheck=1,checkBy=? where postID=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, checkBy);
            p.setInt(2, postID);
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    public List<Course> getCourseForStudentByUserID(int userID) {
        List<Course> list = new ArrayList<>();

        try {
            String query = "select * from OnlineTeaching.dbo.courses left join OnlineTeaching.dbo.student on courses.courseID = student.courseID where student.userID = ? and OnlineTeaching.dbo.student.isDelete = 0 and OnlineTeaching.dbo.courses.isDelete = 0";
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
                int group = set.getInt("groupClass");
                int lab = set.getInt("lab");
                int hasLab = set.getInt("labGroup");
//                int userID = set.getInt("userID");

                Course c = new Course(courseID, courseName, departmentID, courseCode, weekDay, room, instructor, startSlot, numbersOfSlots, classID, semester, schoolYear, group, lab, hasLab, userID);
                list.add(c);
            }
        } catch (Exception e) {
        }

        return list;
    }
}
