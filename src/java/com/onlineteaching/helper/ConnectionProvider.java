/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineteaching.helper;
import java.sql.*;

/**
 *
 * @author LeeBen
 */
public class ConnectionProvider {
    private static Connection con;

    public static Connection getConnection() {
        try {

            if (con == null) {
                //driver class load
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

                //create a connection..
                con = DriverManager.
                        getConnection("jdbc:sqlserver://localhost:1433;databaseName=OnlineTeaching;user=ben;password=ben1");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}
