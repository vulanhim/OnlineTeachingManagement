package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      			null, true, 8192, true);
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>IU Online Teaching Management</title>\n");
      out.write("        <script src=\"https://kit.fontawesome.com/7c428afa8c.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <!--css-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel = \"stylesheet\" href = \"css/login.css?v=1\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <input type=\"checkbox\" id=\"flip\"> \n");
      out.write("            <div class=\"cover\">\n");
      out.write("                <div class=\"front\">\n");
      out.write("                    <img src=\"img/IU1.jpg\" alt=\"\">\n");
      out.write("                    <div class=\"text\">\n");
      out.write("                        <span class=\"text-1\">Every new friend is a <br> new adventure</span>\n");
      out.write("                        <span class=\"text-2\">Let's get connected</span>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"back\">\n");
      out.write("                    <img class=\"backImg\" src=\"img/IU2.jpg\" alt=\"\">\n");
      out.write("                    <div class=\"text\">\n");
      out.write("                        <span class=\"text-1\">Complete miles of journey <br> with one step</span>\n");
      out.write("                        <span class=\"text-2\">Let's get started</span>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"forms\">\n");
      out.write("                <div class='form-content'>\n");
      out.write("                    <div class=\"login-form\">\n");
      out.write("                        <div class=\"title\">Login</div>\n");
      out.write("                        <form action=\"LoginServlet\" method=\"post\">\n");
      out.write("                            <div class=\"input-boxes\">\n");
      out.write("                                <div class=\"input-box\">\n");
      out.write("                                    <i class=\"fas fa-envelope\"></i>\n");
      out.write("                                    <input type=\"text\" name=\"username\" placeholder=\"Enter your username\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"input-box\">\n");
      out.write("                                    <i class=\"fas fa-lock\"></i>\n");
      out.write("                                    <input type=\"password\" name=\"password\" placeholder=\"Enter your password\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"text\"><a href=\"#\">Forgot password?</a></div>\n");
      out.write("                                <div class=\"button input-box\">\n");
      out.write("                                    <input type=\"submit\" value=\"Login\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"text sign-up-text\">Don't have an account? <label for='flip'>Signup now</label></div>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"signup-form\">\n");
      out.write("                        <div class=\"title\">Signup</div>\n");
      out.write("                        <form id=\"reg-form\" action=\"RegisterServlet\" method=\"post\">\n");
      out.write("                            <div class=\"input-boxes\">\n");
      out.write("                                <div class=\"input-box\">\n");
      out.write("                                    <i class=\"fas fa-user\"></i> \n");
      out.write("                                    <input type=\"text\" name=\"name\" placeholder=\"Enter your name\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"input-box\">\n");
      out.write("                                    <i class=\"fas fa-envelope\"></i>\n");
      out.write("                                    <input type=\"text\" name=\"username\" placeholder=\"Enter your username\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"input-box\">\n");
      out.write("                                    <i class=\"fas fa-lock\"></i>\n");
      out.write("                                    <input type=\"password\" name=\"password\" placeholder=\"Enter your password\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"loader-box text-center\" id=\"loader\" style=\"display: none;\">\n");
      out.write("                                    <span class=\"fa fa-refresh fa-spin fa-4x\"></span>\n");
      out.write("                                    <h4>Please wait..</h4>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"button input-box\">\n");
      out.write("                                    <input id=\"submit-btn\" type=\"submit\" value=\"Register\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"text sign-up-text\">Already have an account? <label for='flip'>Login now</label></div>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!--javascripts-->\n");
      out.write("\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.6.0.min.js\" integrity=\"sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"js/myjs.js?v=0\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                console.log(\"loaded...\")\n");
      out.write("\n");
      out.write("                $('#reg-form').on('submit', function (event) {\n");
      out.write("                    event.preventDefault();\n");
      out.write("\n");
      out.write("                    let form = new FormData(this);\n");
      out.write("\n");
      out.write("                    $(\"#submit-btn\").hide();\n");
      out.write("                    $(\"#loader\").show();\n");
      out.write("//                   send register servlet\n");
      out.write("                    $.ajax({\n");
      out.write("                        url: \"RegisterServlet\",\n");
      out.write("                        type: 'POST',\n");
      out.write("                        data: form,\n");
      out.write("                        success: function (data, textStatus, jqXHR) {\n");
      out.write("                            console.log(data)\n");
      out.write("                            $(\"#submit-btn\").show();\n");
      out.write("                            $(\"#loader\").hide();\n");
      out.write("                            swal(\"Registered successfully..Please login!\")\n");
      out.write("                                    .then((value) => {\n");
      out.write("                                        window.location = \"Login.jsp\"\n");
      out.write("                                    });\n");
      out.write("                        },\n");
      out.write("                        error: function (jqXHR, textStatus, errorThrown) {\n");
      out.write("                            console.log(jqXHR)\n");
      out.write("                            $(\"#submit-btn\").show();\n");
      out.write("                            $(\"#loader\").hide();\n");
      out.write("                            swal(\"Something went wrong..try again\");\n");
      out.write("                        },\n");
      out.write("                        processData: false,\n");
      out.write("                        contentType: false\n");
      out.write("                    });\n");
      out.write("                });\n");
      out.write("            })\n");
      out.write("        </script>\n");
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
