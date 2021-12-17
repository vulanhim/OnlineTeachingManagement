package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.onlineteaching.entities.User;

public final class Home_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("Login.jsp");
    }


      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\" dir=\"ltr\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Welcome to IU Online Teaching Management</title>\n");
      out.write("        <!-- Boxiocns CDN Link -->\n");
      out.write("        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("\n");
      out.write("        <!--css-->\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/home.css?v=1\">\n");
      out.write("        <script src=\"https://kit.fontawesome.com/7c428afa8c.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!--navbar-->\n");
      out.write("        <div class=\"sidebar close\">\n");
      out.write("            <div class=\"logo-details\">\n");
      out.write("                <i class='bx bxl-c-plus-plus'></i>\n");
      out.write("                <span class=\"logo_name\">IU OTM</span>\n");
      out.write("            </div>\n");
      out.write("            <ul class=\"nav-links\">\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\">\n");
      out.write("                        <i class='bx bx-grid-alt' ></i>\n");
      out.write("                        <span class=\"link_name\">Dashboard</span>\n");
      out.write("                    </a>\n");
      out.write("                    <ul class=\"sub-menu blank\">\n");
      out.write("                        <li><a class=\"link_name\" href=\"#\">Dashboard</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <div class=\"iocn-link\">\n");
      out.write("                        <a href=\"#\">\n");
      out.write("                            <i class='bx bx-collection' ></i>\n");
      out.write("                            <span class=\"link_name\">Category</span>\n");
      out.write("                        </a>\n");
      out.write("                        <i class='bx bxs-chevron-down arrow' ></i>\n");
      out.write("                    </div>\n");
      out.write("                    <ul class=\"sub-menu\">\n");
      out.write("                        <li><a class=\"link_name\" href=\"#\">Category</a></li>\n");
      out.write("                        <li><a href=\"#\">HTML & CSS</a></li>\n");
      out.write("                        <li><a href=\"#\">JavaScript</a></li>\n");
      out.write("                        <li><a href=\"#\">PHP & MySQL</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <div class=\"iocn-link\">\n");
      out.write("                        <a href=\"#\">\n");
      out.write("                            <i class='bx bx-book-alt' ></i>\n");
      out.write("                            <span class=\"link_name\">Posts</span>\n");
      out.write("                        </a>\n");
      out.write("                        <i class='bx bxs-chevron-down arrow' ></i>\n");
      out.write("                    </div>\n");
      out.write("                    <ul class=\"sub-menu\">\n");
      out.write("                        <li><a class=\"link_name\" href=\"#\">Posts</a></li>\n");
      out.write("                        <li><a href=\"#\">Web Design</a></li>\n");
      out.write("                        <li><a href=\"#\">Login Form</a></li>\n");
      out.write("                        <li><a href=\"#\">Card Design</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\">\n");
      out.write("                        <i class='bx bx-pie-chart-alt-2' ></i>\n");
      out.write("                        <span class=\"link_name\">Analytics</span>\n");
      out.write("                    </a>\n");
      out.write("                    <ul class=\"sub-menu blank\">\n");
      out.write("                        <li><a class=\"link_name\" href=\"#\">Analytics</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\">\n");
      out.write("                        <i class='bx bx-line-chart' ></i>\n");
      out.write("                        <span class=\"link_name\">Chart</span>\n");
      out.write("                    </a>\n");
      out.write("                    <ul class=\"sub-menu blank\">\n");
      out.write("                        <li><a class=\"link_name\" href=\"#\">Chart</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <div class=\"iocn-link\">\n");
      out.write("                        <a href=\"#\">\n");
      out.write("                            <i class='bx bx-plug' ></i>\n");
      out.write("                            <span class=\"link_name\">Plugins</span>\n");
      out.write("                        </a>\n");
      out.write("                        <i class='bx bxs-chevron-down arrow' ></i>\n");
      out.write("                    </div>\n");
      out.write("                    <ul class=\"sub-menu\">\n");
      out.write("                        <li><a class=\"link_name\" href=\"#\">Plugins</a></li>\n");
      out.write("                        <li><a href=\"#\">UI Face</a></li>\n");
      out.write("                        <li><a href=\"#\">Pigments</a></li>\n");
      out.write("                        <li><a href=\"#\">Box Icons</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\">\n");
      out.write("                        <i class='bx bx-compass' ></i>\n");
      out.write("                        <span class=\"link_name\">Explore</span>\n");
      out.write("                    </a>\n");
      out.write("                    <ul class=\"sub-menu blank\">\n");
      out.write("                        <li><a class=\"link_name\" href=\"#\">Explore</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\">\n");
      out.write("                        <i class='bx bx-history'></i>\n");
      out.write("                        <span class=\"link_name\">History</span>\n");
      out.write("                    </a>\n");
      out.write("                    <ul class=\"sub-menu blank\">\n");
      out.write("                        <li><a class=\"link_name\" href=\"#\">History</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\">\n");
      out.write("                        <i class='bx bx-cog' ></i>\n");
      out.write("                        <span class=\"link_name\">Setting</span>\n");
      out.write("                    </a>\n");
      out.write("                    <ul class=\"sub-menu blank\">\n");
      out.write("                        <li><a class=\"link_name\" href=\"#\">Setting</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <div class=\"profile-details\">\n");
      out.write("                        <div class=\"profile-content\">\n");
      out.write("                            <a href=\"#!\" data-bs-toggle=\"modal\" data-bs-target=\"#profileModal\">\n");
      out.write("                                <img src=\"img/error.png\" alt=\"profileImg\">\n");
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
      out.write("        <!--profile modal-->\n");
      out.write("\n");
      out.write("        <!--end of profile modal-->\n");
      out.write("\n");
      out.write("        <section class=\"home-section\">\n");
      out.write("            <div class=\"home-content\">\n");
      out.write("                <i class='bx bx-menu' ></i>\n");
      out.write("                <!-- Modal -->\n");
      out.write("                <div class=\"modal fade\" id=\"profileModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("                    <div class=\"modal-dialog\">\n");
      out.write("                        <div class=\"modal-content\">\n");
      out.write("                            <div class=\"modal-header\">\n");
      out.write("                                <h5 class=\"modal-title\" id=\"exampleModalLabel\">Modal title</h5>\n");
      out.write("                                <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"modal-body\">\n");
      out.write("                                ...\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"modal-footer\">\n");
      out.write("                                <button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Close</button>\n");
      out.write("                                <button type=\"button\" class=\"btn btn-primary\">Save changes</button>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <span class=\"text\">\n");
      out.write("                    Welcome ");
      out.print( user.getName());
      out.write("\n");
      out.write("                </span>\n");
      out.write("                <span class=\"text\">\n");
      out.write("                    ");
      out.print( user.getUsername());
      out.write("\n");
      out.write("                </span>\n");
      out.write("                <span class=\"text\">\n");
      out.write("                    ");
      out.print( user.getPassword());
      out.write("\n");
      out.write("                </span>\n");
      out.write("                <span class=\"text\">\n");
      out.write("                    ");
      out.print( user.getGender());
      out.write("\n");
      out.write("                </span>\n");
      out.write("                <span class=\"text\">\n");
      out.write("                    ");
      out.print( user.getDepartment());
      out.write("\n");
      out.write("                </span>\n");
      out.write("                <span class=\"text\">\n");
      out.write("                    ");
      out.print( user.getEmail());
      out.write("\n");
      out.write("                </span>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
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
      out.write("    </body>\n");
      out.write("</html>\n");
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
