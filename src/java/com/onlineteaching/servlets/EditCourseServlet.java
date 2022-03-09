/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineteaching.servlets;

import com.onlineteaching.dao.CourseDAO;
import com.onlineteaching.entities.Message;
import com.onlineteaching.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
/**
 *
 * @author LeeBen
 */
public class EditCourseServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int courseID = Integer.parseInt(request.getParameter("courseID"));
            String courseName = request.getParameter("courseName");
            int departmentID = Integer.parseInt(request.getParameter("departmentID"));
            String courseCode = request.getParameter("courseCode");
            String weekDay = request.getParameter("weekDay");
            String room = request.getParameter("room");
            String instructor = request.getParameter("instructor");
            int startSlot = Integer.parseInt(request.getParameter("startSlot"));
            int numbersOfSlots = Integer.parseInt(request.getParameter("numbersOfSlots"));
            String classID = request.getParameter("classID");
            int semester = Integer.parseInt(request.getParameter("semester"));
            int schoolYear = Integer.parseInt(request.getParameter("schoolYear"));
            int group = Integer.parseInt(request.getParameter("group"));
            int lab = Integer.parseInt(request.getParameter("lab"));
            int hasLab = Integer.parseInt(request.getParameter("hasLab"));
            int userID = Integer.parseInt(request.getParameter("userID"));
            HttpSession s = request.getSession();
            CourseDAO dao = new CourseDAO(ConnectionProvider.getConnection());
            boolean ans = dao.editCourse(courseID, courseName, departmentID, courseCode, weekDay, room, instructor, startSlot, numbersOfSlots, classID, semester, schoolYear, group, lab, hasLab, userID);
            if (ans) {
                    out.println("Course Updated!");
                    Message msg = new Message("Update course successful!", "success", "alert-success");
                    s.setAttribute("msg", msg);
                    
            } else {
                out.println("Not updated");
                Message msg = new Message("Something went wrong..", "error", "alert-danger");
                s.setAttribute("msg", msg);
            }
            response.sendRedirect("admin.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
