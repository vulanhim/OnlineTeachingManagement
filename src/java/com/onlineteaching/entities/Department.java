/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineteaching.entities;

/**
 *
 * @author LeeBen
 */
public class Department {
    private int departmentID;
    private String departmentName;
    private String departmentNameAbb;

    public Department(int departmentID, String departmentName, String departmentNameAbb) {
        this.departmentID = departmentID;
        this.departmentName = departmentName;
        this.departmentNameAbb = departmentNameAbb;
    }

    public Department(String departmentName, String departmentNameAbb) {
        this.departmentName = departmentName;
        this.departmentNameAbb = departmentNameAbb;
    }

    public Department() {
    }
    

    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getDepartmentNameAbb() {
        return departmentNameAbb;
    }

    public void setDepartmentNameAbb(String departmentNameAbb) {
        this.departmentNameAbb = departmentNameAbb;
    }


    
    
}
