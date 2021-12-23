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
    private int pid;
    private int courseID;
    private Timestamp pDate;
    private int pWeek;
    private String pContent;
    private int isCheck;

    public Post(int pid, int courseID, Timestamp pDate, int pWeek, String pContent, int isCheck) {
        this.pid = pid;
        this.courseID = courseID;
        this.pDate = pDate;
        this.pWeek = pWeek;
        this.pContent = pContent;
        this.isCheck = isCheck;
    }

    public Post(int courseID, Timestamp pDate, int pWeek, String pContent, int isCheck) {
        this.courseID = courseID;
        this.pDate = pDate;
        this.pWeek = pWeek;
        this.pContent = pContent;
        this.isCheck = isCheck;
    }

    public Post() {
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
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
    
    
}
