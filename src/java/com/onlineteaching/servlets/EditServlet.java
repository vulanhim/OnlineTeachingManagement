/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineteaching.servlets;

import com.onlineteaching.dao.UserDAO;
import com.onlineteaching.entities.Message;
import com.onlineteaching.entities.User;
import com.onlineteaching.helper.ConnectionProvider;
import com.onlineteaching.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
/**
 *
 * @author LeeBen
 */
@WebServlet(name = "EditServlet", urlPatterns = {"/EditServlet"})

public class EditServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            //            fetch all form data
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String IUCode = request.getParameter("IUCode");
            int departmentID = Integer.parseInt(request.getParameter("departmentID"));
            String email = request.getParameter("email");
            Part part = request.getPart("profile");
            String imageName = part.getSubmittedFileName();
            imageName = UUID.randomUUID().toString() + "_" + imageName;

            //get the user from the session
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");

            user.setName(name);
            user.setPassword(password);
            user.setGender(gender);
            user.setIUCode(IUCode);
            user.setDepartmentID(departmentID);
            user.setEmail(email);
            String oldFile = user.getProfile();
            user.setProfile(imageName);

            UserDAO userDao = new UserDAO(ConnectionProvider.getConnection());
            boolean ans = userDao.updateUser(user);
            if (ans) {
                String path = request.getRealPath("/") + "img" + File.separator + user.getProfile();

//                delete code
                String pathOldFile = request.getRealPath("/") + "img" + File.separator + oldFile;
                if (!oldFile.equals("default.png")) {
                    Helper.deleteFile(pathOldFile);
                }
                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("Profile updated");
                    Message msg = new Message("Update profile successful!", "success", "alert-success");
                    s.setAttribute("msg", msg);

                } else {
                    Message msg = new Message("Something went wrong..", "error", "alert-danger");
                    s.setAttribute("msg", msg);

                }

            } else {
                out.println("Not updated");
                Message msg = new Message("Something went wrong..", "error", "alert-danger");
                s.setAttribute("msg", msg);
            }
                int job = user.getRole();
                switch (job) {
                    case 0:
                        response.sendRedirect("Home.jsp");
                        break;
                    case 1:
                        response.sendRedirect("Manage.jsp");
                        break;
                    case 2: 
                        response.sendRedirect("Student.jsp");
                        break;
                    case 3:
                        response.sendRedirect("admin.jsp");
                        break;
                    default:
                        response.sendRedirect("Home.jsp");
                        break;
                }

            out.println("</body>");
            out.println("</html>");
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
