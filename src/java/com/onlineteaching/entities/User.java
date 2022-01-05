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
public class User {

    private int userID;
    private String username;
    private String password;
    private String name;
    private String gender;
    private String IUCode;
    private int departmentID;
    private String email;
    private String profile;
    private Timestamp dateTime;
    private int role;

    public User(int userID, String username, String password, String name, String gender, String IUCode, int departmentID, String email, Timestamp dateTime) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.name = name;
        this.gender = gender;
        this.IUCode = IUCode;
        this.departmentID = departmentID;
        this.email = email;
        this.dateTime = dateTime;
    }

    public User() {
    }

    public User(String username, String password, String name, String gender, String IUCode, int departmentID, String email) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.gender = gender;
        this.IUCode = IUCode;
        this.departmentID = departmentID;
        this.email = email;
    }

    public User(String username, String password, String name) {
        this.username = username;
        this.password = password;
        this.name = name;
    }
    
    
    // getters and setters

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getIUCode() {
        return IUCode;
    }

    public void setIUCode(String IUCode) {
        this.IUCode = IUCode;
    }

    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
    
}
