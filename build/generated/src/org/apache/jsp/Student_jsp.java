package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import com.onlineteaching.entities.Course;
import java.util.ArrayList;
import com.onlineteaching.entities.Department;
import com.onlineteaching.dao.PostDAO;
import com.onlineteaching.helper.ConnectionProvider;
import com.onlineteaching.entities.Message;
import com.onlineteaching.entities.User;

public final class Student_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"error_page.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("Login.jsp");
    } else if (user.getRole() == 3) {
        response.sendRedirect("admin.jsp");
    } else if (user.getRole() == 1) {
        response.sendRedirect("Manage.jsp");
    }else if (user.getRole() == 0) {
        response.sendRedirect("Home.jsp");
    }


      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\" dir=\"ltr\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Welcome to IU Online Teaching Management for Student</title>\n");
      out.write("        <!-- Boxiocns CDN Link -->\n");
      out.write("        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("\n");
      out.write("        <!--css-->\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/home.css?\">\n");
      out.write("        <script src=\"https://kit.fontawesome.com/7c428afa8c.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!--navbar-->\n");
      out.write("        <div class=\"sidebar close\">\n");
      out.write("            <div class=\"logo-details\">\n");
      out.write("                <a href=\"Home.jsp\">\n");
      out.write("                    <i class='bx bxl-c-plus-plus'></i>\n");
      out.write("                </a>\n");
      out.write("                <span class=\"logo_name\">IU OTM</span>\n");
      out.write("            </div>\n");
      out.write("            <ul class=\"nav-links\">\n");
      out.write("<!--                <li>\n");
      out.write("                    <div class=\"iocn-link\">\n");
      out.write("                        <a href=\"#!\" data-bs-toggle=\"modal\" data-bs-target=\"#add-post-modal\">\n");
      out.write("                            <i class='bx bx-book-alt' ></i>\n");
      out.write("                            <span class=\"link_name\">Posts</span>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                    <ul class=\"sub-menu\">\n");
      out.write("                        <li><a class=\"link_name\" href=\"#!\" data-bs-toggle=\"modal\" data-bs-target=\"#add-post-modal\">Posts</a></li>\n");
      out.write("\n");
      out.write("                    </ul>\n");
      out.write("                </li>-->\n");
      out.write("\n");
      out.write("                <li>\n");
      out.write("                    <div class=\"profile-details\">\n");
      out.write("                        <div class=\"profile-content\">\n");
      out.write("                            <a href=\"#!\" data-bs-toggle=\"modal\" data-bs-target=\"#profileModal\">\n");
      out.write("                                <img src=\"img/");
      out.print( user.getProfile());
      out.write("\" alt=\"profileImg\">\n");
      out.write("                            </a>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"name-job\">\n");
      out.write("                            <div class=\"profile_name\">");
      out.print( user.getName());
      out.write("</div>\n");
      out.write("                            <div class=\"job\">");
      out.print( user.getIUCode());
      out.write("</div>\n");
      out.write("                        </div>\n");
      out.write("                        <a href=\"LogoutServlet\">\n");
      out.write("                            <i class='bx bx-log-out' ></i>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("        <!--end of navbar-->\n");
      out.write("\n");
      out.write("        <section class=\"home-section\">\n");
      out.write("            <div class=\"home-content\">\n");
      out.write("                <i class='bx bx-menu' ></i>\n");
      out.write("                <span class=\"text\">\n");
      out.write("                    Welcome ");
      out.print( user.getName());
      out.write("!\n");
      out.write("                </span>\n");
      out.write("                ");

                    Message m = (Message) session.getAttribute("msg");
                    if (m != null) {
                
      out.write("\n");
      out.write("                <div class=\"alert ");
      out.print(m.getCssClass());
      out.write(" d-flex align-items-center\" role=\"alert\">\n");
      out.write("                    ");
      out.print(m.getContent());
      out.write("\n");
      out.write("                </div>\n");
      out.write("                ");

                        session.removeAttribute("msg");
                    }
                
      out.write("\n");
      out.write("                <!--main body of the page-->\n");
      out.write("                <main>\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <div class=\"row mt-4\">\n");
      out.write("                            <!--first col-->\n");
      out.write("                            <div class=\"col-md-4\">\n");
      out.write("                                <!--course-->\n");
      out.write("                                <div class=\"list-group\">\n");
      out.write("                                    <!--<a href=\"#\" onclick=\"getPosts(0,");
      out.print(user.getUserID());
      out.write(")\" class=\"list-group-item list-group-item-action active\" aria-current=\"true\" style=\"background: #1d1b31; border: none\">-->\n");
      out.write("                                    <a class=\"list-group-item list-group-item-action active\" aria-current=\"true\" style=\"background: #1d1b31; border: none; font-weight: 500\">\n");
      out.write("                                        Courses\n");
      out.write("                                    </a>\n");
      out.write("                                    ");

                                        PostDAO pd = new PostDAO(ConnectionProvider.getConnection());
                                        List<Course> list1 = pd.getCourseForStudentByUserID(user.getUserID());
                                        for (Course cc : list1) {
                                    
      out.write("\n");
      out.write("                                    <a href=\"#\" onclick=\"getPosts(");
      out.print(cc.getCourseID());
      out.write(", 0, this)\" class=\" c-link list-group-item list-group-item-action\" style=\"border-color: #d2d1d6\">\n");
      out.write("                                        ");
      out.print( cc.getCourseName());
      out.write(" - ");
      out.print( cc.getWeekDay());
      out.write(" - Group ");
      out.print( cc.getGroup());
      out.write("\n");
      out.write("                                        ");

                                            if (cc.getLab() == 1) {
                                        
      out.write("\n");
      out.write("                                        - Lab group ");
      out.print( cc.getHasLab());
      out.write("\n");
      out.write("                                        ");

                                            }
                                        
      out.write("\n");
      out.write("                                        - ");
      out.print( cc.getInstructor());
      out.write("\n");
      out.write("                                    </a>\n");
      out.write("                                    ");

                                        }
                                    
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <!--second col-->\n");
      out.write("                            <div class=\"col-md-8\">\n");
      out.write("                                <!--post-->\n");
      out.write("                                <div class=\"container text-center\" id=\"loader\">\n");
      out.write("                                    <i class=\"fa fa-refresh fa-4x fa-spin\"></i>\n");
      out.write("                                    <h3 class=\"mt-2\">Loading...</h3>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"container-fluid\" id=\"post-container\">\n");
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </main>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!--profile modal-->\n");
      out.write("\n");
      out.write("        <!-- Modal -->\n");
      out.write("        <div class=\"modal fade\" id=\"profileModal\" data-bs-backdrop=\"static\" data-bs-keyboard=\"false\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                        <h5 class=\"modal-title\" id=\"ModalLabel\">Profile</h5>\n");
      out.write("                        <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-body\">\n");
      out.write("                        <div class=\"container text-center\">\n");
      out.write("                            <img src=\"img/");
      out.print( user.getProfile());
      out.write("\" class=\"img-fluid\" style=\"border-radius: 50%;max-width: 150px \">\n");
      out.write("                            <h5 class=\"modal-title mt-3\" id=\"exampleModalLabel\">");
      out.print( user.getName());
      out.write("</h5>\n");
      out.write("                            <div id=\"profile-details\">\n");
      out.write("                                <table class=\"table\">\n");
      out.write("                                    <tbody>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th scope=\"row\">Username:</th>\n");
      out.write("                                            <td>");
      out.print( user.getUsername());
      out.write("</td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th scope=\"row\">Gender:</th>\n");
      out.write("                                            <td>");
      out.print( user.getGender());
      out.write("</td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th scope=\"row\">IUCode:</th>\n");
      out.write("                                            <td>");
      out.print( user.getIUCode());
      out.write("</td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th scope=\"row\">Department:</th>\n");
      out.write("                                            <td>\n");
      out.write("                                                ");

                                                    PostDAO pdd = new PostDAO(ConnectionProvider.getConnection());
                                                
      out.write("\n");
      out.write("                                                ");
      out.print( pdd.getDepartmentByDepartmentID(user.getDepartmentID()).getDepartmentName());
      out.write("\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th scope=\"row\">Email:</th>\n");
      out.write("                                            <td>");
      out.print( user.getEmail());
      out.write("</td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th scope=\"row\">Registered on:</th>\n");
      out.write("                                            <td>");
      out.print( user.getDateTime());
      out.write("</td>\n");
      out.write("                                        </tr>\n");
      out.write("                                    </tbody>\n");
      out.write("                                </table>\n");
      out.write("                            </div>\n");
      out.write("                            <!--profile edit-->\n");
      out.write("                            <div id=\"profile-edit\" style=\"display: none;\">\n");
      out.write("                                <form action=\"EditServlet\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("                                    <table class=\"table\">\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th scope=\"row\">Name:</th>\n");
      out.write("                                            <td><input type=\"text\" class=\"form-control\" name=\"name\" value=\"");
      out.print( user.getName());
      out.write("\"</td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th scope=\"row\">Email:</th>\n");
      out.write("                                            <td><input type=\"email\" class=\"form-control\" name=\"email\" value=\"");
      out.print( user.getEmail());
      out.write("\"</td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th scope=\"row\">Gender:</th>\n");
      out.write("                                            <td>\n");
      out.write("                                                <select class=\"form-control\" aria-label=\"Default select example\" name=\"gender\">\n");
      out.write("                                                    <option selected>");
      out.print( user.getGender());
      out.write("</option>\n");
      out.write("                                                    <option value=\"Male\">Male</option>\n");
      out.write("                                                    <option value=\"Female\">Female</option>\n");
      out.write("                                                </select>\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th scope=\"row\">IUCode:</th>\n");
      out.write("                                            <td><input type=\"text\" class=\"form-control\" name=\"IUCode\" value=\"");
      out.print( user.getIUCode());
      out.write("\"</td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th scope=\"row\">Department:</th>\n");
      out.write("                                            <td>\n");
      out.write("                                                <select class=\"form-control\" aria-label=\"Default select example\" name=\"departmentID\">\n");
      out.write("                                                    <option selected value=\"");
      out.print( user.getDepartmentID());
      out.write('"');
      out.write('>');
      out.print( pdd.getDepartmentByDepartmentID(user.getDepartmentID()).getDepartmentName());
      out.write("</option>\n");
      out.write("                                                    ");

                                                        PostDAO postd = new PostDAO(ConnectionProvider.getConnection());
                                                        ArrayList<Department> listd = postd.getAllDepartment();
                                                        for (Department d : listd) {
                                                    
      out.write("\n");
      out.write("                                                    <option value=\"");
      out.print( d.getDepartmentID());
      out.write('"');
      out.write('>');
      out.print( d.getDepartmentName());
      out.write("</option>\n");
      out.write("                                                    ");

                                                        }
                                                    
      out.write("\n");
      out.write("                                                </select>\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th scope=\"row\">Password:</th>\n");
      out.write("                                            <td><input type=\"password\" class=\"form-control\" name=\"password\" value=\"");
      out.print( user.getPassword());
      out.write("\"</td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th scope=\"row\">Change profile picture:</th>\n");
      out.write("                                            <td><input type=\"file\" class=\"form-control\" name=\"profile\" value=\"");
      out.print( user.getProfile());
      out.write("\"</td>\n");
      out.write("                                        </tr>\n");
      out.write("                                    </table>\n");
      out.write("                                    <div class=\"container\">\n");
      out.write("                                        <button type=\"submit\" class=\"btn btn-outline-primary\">Save</button>\n");
      out.write("                                    </div>\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-footer\">\n");
      out.write("                        <button id=\"close-profile-btn\" type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Close</button>\n");
      out.write("                        <button id=\"edit-profile-btn\" type=\"button\" class=\"btn btn-primary\">Edit</button>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!--end of profile modal-->\n");
      out.write("\n");
      out.write("        <!--post modal-->\n");
      out.write("\n");
      out.write("        <!-- Modal -->\n");
      out.write("        <div class=\"modal fade\" id=\"add-post-modal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                        <h5 class=\"modal-title\" id=\"exampleModalLabel\">Class information declaration</h5>\n");
      out.write("                        <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-body\">\n");
      out.write("                        <form id=\"add-post-form\" action=\"AddPostServlet\" method=\"post\">\n");
      out.write("                            <table class=\"table\">\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>\n");
      out.write("                                        <select class=\"form-control\" aria-label=\"Default select example\" name=\"courseID\">\n");
      out.write("                                            <option selected disabled>--Select your course--</option>\n");
      out.write("                                            ");

                                                PostDAO postc = new PostDAO(ConnectionProvider.getConnection());
                                                List<Course> listc = postc.getCourseByUserID(user.getUserID());
                                                for (Course c : listc) {
                                            
      out.write("\n");
      out.write("                                            <option value=\"");
      out.print( c.getCourseID());
      out.write("\">\n");
      out.write("                                                ");
      out.print( c.getCourseName());
      out.write(" - ");
      out.print( c.getWeekDay());
      out.write(" - Group ");
      out.print( c.getGroup());
      out.write("\n");
      out.write("                                                ");

                                                    if (c.getLab() == 1) {
                                                
      out.write("\n");
      out.write("                                                - Lab group ");
      out.print(c.getHasLab());
      out.write("\n");
      out.write("                                                ");

                                                    }
                                                
      out.write("\n");
      out.write("                                            </option>\n");
      out.write("                                            ");

                                                }
                                            
      out.write("\n");
      out.write("                                        </select>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td><input name=\"pWeek\" type=\"text\" placeholder=\"Enter the week\" class=\"form-control\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td><textarea name=\"pContent\" class=\"form-control\" style=\"height: 200px\" placeholder=\"Enter your content\" ></textarea></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td><input name=\"linkCourse\" type=\"text\" placeholder=\"Enter the class online link\" class=\"form-control\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("                            </table>\n");
      out.write("                            <div class=\"container text-center\">\n");
      out.write("                                <button type=\"submit\" class=\"btn btn-primary\">Post</button>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!--end of post modal-->\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            let arrow = document.querySelectorAll(\".arrow\");\n");
      out.write("            for (var i = 0; i < arrow.length; i++) {\n");
      out.write("                arrow[i].addEventListener(\"click\", (e) => {\n");
      out.write("                    let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow\n");
      out.write("                    arrowParent.classList.toggle(\"showMenu\");\n");
      out.write("                });\n");
      out.write("            }\n");
      out.write("            let sidebar = document.querySelector(\".sidebar\");\n");
      out.write("            let sidebarBtn = document.querySelector(\".bx-menu\");\n");
      out.write("            console.log(sidebarBtn);\n");
      out.write("            sidebarBtn.addEventListener(\"click\", () => {\n");
      out.write("                sidebar.classList.toggle(\"close\");\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("        <!--javascripts-->\n");
      out.write("\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.6.0.min.js\" integrity=\"sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"js/myjs.js?v=0\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                let editStatus = false;\n");
      out.write("                $('#edit-profile-btn').click(function () {\n");
      out.write("                    if (editStatus === false) {\n");
      out.write("                        $(\"#profile-details\").hide();\n");
      out.write("                        $(\"#profile-edit\").show();\n");
      out.write("                        editStatus = true;\n");
      out.write("                        $(this).text(\"Back\");\n");
      out.write("                    } else {\n");
      out.write("                        $(\"#profile-details\").show();\n");
      out.write("                        $(\"#profile-edit\").hide();\n");
      out.write("                        editStatus = false;\n");
      out.write("                        $(this).text(\"Edit\");\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("                $('#close-profile-btn').click(function () {\n");
      out.write("                    if (editStatus === true) {\n");
      out.write("                        $(\"#profile-details\").show();\n");
      out.write("                        $(\"#profile-edit\").hide();\n");
      out.write("                        $('#edit-profile-btn').text(\"Edit\");\n");
      out.write("                        editStatus = false;\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function (e) {\n");
      out.write("                $('#add-post-form').on('submit', function (event) {\n");
      out.write("                    event.preventDefault();\n");
      out.write("                    console.log(\"you have clicked on submit\");\n");
      out.write("                    let form = new FormData(this);\n");
      out.write("\n");
      out.write("//                   send post form to servlet\n");
      out.write("                    $.ajax({\n");
      out.write("                        url: \"AddPostServlet\",\n");
      out.write("                        type: 'POST',\n");
      out.write("                        data: form,\n");
      out.write("                        success: function (data, textStatus, jqXHR) {\n");
      out.write("                            console.log(data);\n");
      out.write("                            if (data.trim() === \"done\") {\n");
      out.write("                                swal(\"Post successful!\", \"Move to home page...\", \"success\")\n");
      out.write("                                        .then((value) => {\n");
      out.write("                                            window.location = \"Home.jsp\";\n");
      out.write("                                        });\n");
      out.write("                            } else {\n");
      out.write("                                swal(\"Error!\", \"Something went wrong! Try again\", \"error\");\n");
      out.write("                            }\n");
      out.write("\n");
      out.write("                        },\n");
      out.write("                        error: function (jqXHR, textStatus, errorThrown) {\n");
      out.write("                            swal(\"Error!\", \"Something went wrong! Try again\", \"error\");\n");
      out.write("                        },\n");
      out.write("                        processData: false,\n");
      out.write("                        contentType: false\n");
      out.write("                    });\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("        <!--loading post using ajax-->\n");
      out.write("        <script>\n");
      out.write("            function getPosts(courseID, userID, temp) {\n");
      out.write("                $(\"#loader\").show();\n");
      out.write("                $(\".c-link\").removeClass('active');\n");
      out.write("                $(\".c-link\").css({\"background-color\": \"white\", \"font-weight\": \"400\"});\n");
      out.write("                $.ajax({\n");
      out.write("                    url: \"load_posts_student.jsp\",\n");
      out.write("                    data: {courseID: courseID, userID: userID},\n");
      out.write("                    success: function (data, textStatus, jqXHR) {\n");
      out.write("                        console.log(data);\n");
      out.write("                        $(\"#loader\").hide();\n");
      out.write("                        $('#post-container').show();\n");
      out.write("                        $('#post-container').html(data);\n");
      out.write("                        $(temp).addClass('text-black active');\n");
      out.write("                        $(temp).css({\"background-color\": \"#d2d1d6\", \"font-weight\": \"600\"});\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("            }\n");
      out.write("            $(document).ready(function (e) {\n");
      out.write("                $(\"#loader\").hide();\n");
      out.write("                $('#post-container').hide();\n");
      out.write("//                getPosts(0,");
      out.print(user.getUserID());
      out.write(", );\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
