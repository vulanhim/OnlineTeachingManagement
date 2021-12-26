/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineteaching.entities;

import java.sql.*;

/**
 *
 * @author LeeBen
 */
public class Post {

    private int postID;
    private int courseID;
    private Timestamp pDate;
    private int pWeek;
    private String pContent;
    private int isCheck;
    private int userID;
    private String checkBy;

    public Post() {
    }

    public Post(int postID, int courseID, Timestamp pDate, int pWeek, String pContent, int isCheck, int userID, String checkBy) {
        this.postID = postID;
        this.courseID = courseID;
        this.pDate = pDate;
        this.pWeek = pWeek;
        this.pContent = pContent;
        this.isCheck = isCheck;
        this.userID = userID;
        this.checkBy = checkBy;
    }

    public Post(int courseID, int pWeek, String pContent, int userID) {
        this.courseID = courseID;
        this.pWeek = pWeek;
        this.pContent = pContent;
        this.userID = userID;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getpWeek() {
        return pWeek;
    }

    public void setpWeek(int pWeek) {
        this.pWeek = pWeek;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public int getIsCheck() {
        return isCheck;
    }

    public void setIsCheck(int isCheck) {
        this.isCheck = isCheck;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getCheckBy() {
        return checkBy;
    }

    public void setCheckBy(String checkBy) {
        this.checkBy = checkBy;
    }
    
    
}
