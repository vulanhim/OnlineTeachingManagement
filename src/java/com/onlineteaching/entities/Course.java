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
public class Course {
    private int courseID;
    private String courseName;
    private int departmentID;
    private String courseCode;
    private String weekDay;
    private String room;
    private String instructor;
    private int startSlot;
    private int numbersOfSlots;
    private String classID;
    private int semester;
    private int schoolYear;
    private int group;
    private int lab;
    private int hasLab;
    private int userID;

    public Course(int courseID, String courseName, int departmentID, String courseCode, String weekDay, String room, String instructor, int startSlot, int numbersOfSlots, String classID, int semester, int schoolYear, int group, int lab, int hasLab, int userID) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.departmentID = departmentID;
        this.courseCode = courseCode;
        this.weekDay = weekDay;
        this.room = room;
        this.instructor = instructor;
        this.startSlot = startSlot;
        this.numbersOfSlots = numbersOfSlots;
        this.classID = classID;
        this.semester = semester;
        this.schoolYear = schoolYear;
        this.group = group;
        this.lab = lab;
        this.hasLab = hasLab;
        this.userID = userID;
    }

    public Course(String courseName, int departmentID, String courseCode, String weekDay, String room, String instructor, int startSlot, int numbersOfSlots, String classID, int semester, int schoolYear, int group, int lab, int hasLab, int userID) {
        this.courseName = courseName;
        this.departmentID = departmentID;
        this.courseCode = courseCode;
        this.weekDay = weekDay;
        this.room = room;
        this.instructor = instructor;
        this.startSlot = startSlot;
        this.numbersOfSlots = numbersOfSlots;
        this.classID = classID;
        this.semester = semester;
        this.schoolYear = schoolYear;
        this.group = group;
        this.lab = lab;
        this.hasLab = hasLab;
        this.userID = userID;
    }

    public Course() {
    }
    

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getWeekDay() {
        return weekDay;
    }

    public void setWeekDay(String weekDay) {
        this.weekDay = weekDay;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public int getStartSlot() {
        return startSlot;
    }

    public void setStartSlot(int startSlot) {
        this.startSlot = startSlot;
    }

    public int getNumbersOfSlots() {
        return numbersOfSlots;
    }

    public void setNumbersOfSlots(int numbersOfSlots) {
        this.numbersOfSlots = numbersOfSlots;
    }

    public String getClassID() {
        return classID;
    }

    public void setClassID(String classID) {
        this.classID = classID;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public int getSchoolYear() {
        return schoolYear;
    }

    public void setSchoolYear(int schoolYear) {
        this.schoolYear = schoolYear;
    }

    public int getGroup() {
        return group;
    }

    public void setGroup(int group) {
        this.group = group;
    }

    public int getLab() {
        return lab;
    }

    public void setLab(int lab) {
        this.lab = lab;
    }

    public int getHasLab() {
        return hasLab;
    }

    public void setHasLab(int hasLab) {
        this.hasLab = hasLab;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
    
    
}

