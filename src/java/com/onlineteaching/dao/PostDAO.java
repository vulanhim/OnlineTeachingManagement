/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineteaching.dao;

import com.onlineteaching.entities.Department;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
                
                Department d = new Department(departmentID,departmentName,departmentNameAbb);
                list.add(d);
            }
        } catch (Exception e) {
        }

        return list;
    }
}
