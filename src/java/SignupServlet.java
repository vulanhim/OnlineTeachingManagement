/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LeeBen
 */
@WebServlet(urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String retypePassword = request.getParameter("retypePassword");
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=OnlineTeaching;user=ben;password=ben1");
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from account where userName='"+username+"'and password ='"+password+"'");
            if (rs.next()){
                response.sendRedirect("Home.jsp");
            }
            else{
                request.getRequestDispatcher("Login.jsp").include(request, response);
//                out.print("<center><p style=\"color:Red; padding-top: 34%\">Sorry username or password error!</p></center>");
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }



}
