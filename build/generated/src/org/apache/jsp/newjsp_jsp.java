package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class newjsp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<!-- Coding by CodingLab | www.codinglabweb.com-->\n");
      out.write("<html lang=\"en\" dir=\"ltr\">\n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <!--<title> Login and Registration Form in HTML & CSS | CodingLab </title>-->\n");
      out.write("    <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("    <!-- Fontawesome CDN Link -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("   </head>\n");
      out.write("<body>\n");
      out.write("  <div class=\"container\">\n");
      out.write("    <input type=\"checkbox\" id=\"flip\">\n");
      out.write("    <div class=\"cover\">\n");
      out.write("      <div class=\"front\">\n");
      out.write("        <!--<img src=\"images/frontImg.jpg\" alt=\"\">-->\n");
      out.write("        <div class=\"text\">\n");
      out.write("          <span class=\"text-1\">Every new friend is a <br> new adventure</span>\n");
      out.write("          <span class=\"text-2\">Let's get connected</span>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"back\">\n");
      out.write("        <!--<img class=\"backImg\" src=\"images/backImg.jpg\" alt=\"\">-->\n");
      out.write("        <div class=\"text\">\n");
      out.write("          <span class=\"text-1\">Complete miles of journey <br> with one step</span>\n");
      out.write("          <span class=\"text-2\">Let's get started</span>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"forms\">\n");
      out.write("        <div class=\"form-content\">\n");
      out.write("          <div class=\"login-form\">\n");
      out.write("            <div class=\"title\">Login</div>\n");
      out.write("          <form action=\"#\">\n");
      out.write("            <div class=\"input-boxes\">\n");
      out.write("              <div class=\"input-box\">\n");
      out.write("                <i class=\"fas fa-envelope\"></i>\n");
      out.write("                <input type=\"text\" placeholder=\"Enter your email\" required>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"input-box\">\n");
      out.write("                <i class=\"fas fa-lock\"></i>\n");
      out.write("                <input type=\"password\" placeholder=\"Enter your password\" required>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"text\"><a href=\"#\">Forgot password?</a></div>\n");
      out.write("              <div class=\"button input-box\">\n");
      out.write("                <input type=\"submit\" value=\"Sumbit\">\n");
      out.write("              </div>\n");
      out.write("              <div class=\"text sign-up-text\">Don't have an account? <label for=\"flip\">Sigup now</label></div>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("      </div>\n");
      out.write("        <div class=\"signup-form\">\n");
      out.write("          <div class=\"title\">Signup</div>\n");
      out.write("        <form action=\"#\">\n");
      out.write("            <div class=\"input-boxes\">\n");
      out.write("              <div class=\"input-box\">\n");
      out.write("                <i class=\"fas fa-user\"></i>\n");
      out.write("                <input type=\"text\" placeholder=\"Enter your name\" required>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"input-box\">\n");
      out.write("                <i class=\"fas fa-envelope\"></i>\n");
      out.write("                <input type=\"text\" placeholder=\"Enter your email\" required>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"input-box\">\n");
      out.write("                <i class=\"fas fa-lock\"></i>\n");
      out.write("                <input type=\"password\" placeholder=\"Enter your password\" required>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"button input-box\">\n");
      out.write("                <input type=\"submit\" value=\"Sumbit\">\n");
      out.write("              </div>\n");
      out.write("              <div class=\"text sign-up-text\">Already have an account? <label for=\"flip\">Login now</label></div>\n");
      out.write("            </div>\n");
      out.write("      </form>\n");
      out.write("    </div>\n");
      out.write("    </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</body>\n");
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
