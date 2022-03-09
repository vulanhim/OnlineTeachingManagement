package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import com.onlineteaching.entities.Course;
import com.onlineteaching.dao.CourseDAO;
import com.onlineteaching.helper.ConnectionProvider;
import com.onlineteaching.helper.ConnectionProvider;

public final class newjsp1_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<link href='https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css' rel='stylesheet'>\n");
      out.write("<link href='https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css' rel='stylesheet'>\n");
      out.write("<link href='https://cdn.datatables.net/select/1.3.4/css/select.dataTables.min.css' rel='stylesheet'>\n");
      out.write("<link href='https://cdn.datatables.net/datetime/1.1.1/css/dataTables.dateTime.min.css' rel='stylesheet'>\n");
      out.write("<link href='https://editor.datatables.net/extensions/Editor/css/editor.dataTables.min.css' rel='stylesheet'>\n");
 CourseDAO coursed = new CourseDAO(ConnectionProvider.getConnection()); 
      out.write("\n");
      out.write("<table id=\"example\" class=\"display\" style=\"width:100%\">\n");
      out.write("    <thead>\n");
      out.write("        <tr>\n");
      out.write("            <th scope=\"col\">CourseID</th>\n");
      out.write("            <th scope=\"col\">CourseName</th>\n");
      out.write("            <th scope=\"col\">DepartmentID</th>\n");
      out.write("            <th scope=\"col\">CourseCode</th>\n");
      out.write("            <th scope=\"col\">WeekDay</th>\n");
      out.write("            <th scope=\"col\">Room</th>\n");
      out.write("            <th scope=\"col\">Instructor</th>\n");
      out.write("            <th scope=\"col\">StartSlot</th>\n");
      out.write("            <th scope=\"col\">NumbersOfSlots</th>\n");
      out.write("            <th scope=\"col\">ClassID</th>\n");
      out.write("            <th scope=\"col\">Semester</th>\n");
      out.write("            <th scope=\"col\">SchoolYear</th>\n");
      out.write("            <th scope=\"col\">GroupClass</th>\n");
      out.write("            <th scope=\"col\">Lab</th>\n");
      out.write("            <th scope=\"col\">LabGroup</th>\n");
      out.write("            <th scope=\"col\">UserID</th>\n");
      out.write("        </tr>\n");
      out.write("    </thead>\n");
      out.write("    <tbody>\n");
      out.write("        ");

            ArrayList<Course> listc = coursed.getAllCourses();
            for (Course d : listc) {
        
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <th scope=\"row\">");
      out.print(d.getCourseID());
      out.write("</th>\n");
      out.write("            <td>");
      out.print(d.getCourseName());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(d.getDepartmentID());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(d.getCourseCode());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(d.getWeekDay());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(d.getRoom());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(d.getInstructor());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(d.getStartSlot());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(d.getNumbersOfSlots());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(d.getClassID());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(d.getSemester());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(d.getSchoolYear());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(d.getGroup());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(d.getLab());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(d.getHasLab());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(d.getUserID());
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("        ");

            }
        
      out.write("\n");
      out.write("    </tbody>\n");
      out.write("    <tfoot>\n");
      out.write("        <tr>\n");
      out.write("            <th scope=\"col\">CourseID</th>\n");
      out.write("            <th scope=\"col\">CourseName</th>\n");
      out.write("            <th scope=\"col\">DepartmentID</th>\n");
      out.write("            <th scope=\"col\">CourseCode</th>\n");
      out.write("            <th scope=\"col\">WeekDay</th>\n");
      out.write("            <th scope=\"col\">Room</th>\n");
      out.write("            <th scope=\"col\">Instructor</th>\n");
      out.write("            <th scope=\"col\">StartSlot</th>\n");
      out.write("            <th scope=\"col\">NumbersOfSlots</th>\n");
      out.write("            <th scope=\"col\">ClassID</th>\n");
      out.write("            <th scope=\"col\">Semester</th>\n");
      out.write("            <th scope=\"col\">SchoolYear</th>\n");
      out.write("            <th scope=\"col\">GroupClass</th>\n");
      out.write("            <th scope=\"col\">Lab</th>\n");
      out.write("            <th scope=\"col\">LabGroup</th>\n");
      out.write("            <th scope=\"col\">UserID</th>\n");
      out.write("        </tr>\n");
      out.write("    </tfoot>\n");
      out.write("</table>\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\" integrity=\"sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=\" crossorigin=\"anonymous\"></script>\n");
      out.write("<script src=\"https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js\"></script>\n");
      out.write("<script>\n");
      out.write("    var editor; // use a global for the submit and return data rendering in the examples\n");
      out.write("\n");
      out.write("    $(document).ready(function () {\n");
      out.write("        editor = new $.fn.dataTable.Editor({\n");
      out.write("            ajax: \"../php/staff.php\",\n");
      out.write("            table: \"#example\",\n");
      out.write("            fields: [{\n");
      out.write("                    label: \"First name:\",\n");
      out.write("                    name: \"first_name\"\n");
      out.write("                }, {\n");
      out.write("                    label: \"Last name:\",\n");
      out.write("                    name: \"last_name\"\n");
      out.write("                }, {\n");
      out.write("                    label: \"Position:\",\n");
      out.write("                    name: \"position\"\n");
      out.write("                }, {\n");
      out.write("                    label: \"Office:\",\n");
      out.write("                    name: \"office\"\n");
      out.write("                }, {\n");
      out.write("                    label: \"Extension:\",\n");
      out.write("                    name: \"extn\"\n");
      out.write("                }, {\n");
      out.write("                    label: \"Start date:\",\n");
      out.write("                    name: \"start_date\",\n");
      out.write("                    type: \"datetime\"\n");
      out.write("                }, {\n");
      out.write("                    label: \"Salary:\",\n");
      out.write("                    name: \"salary\"\n");
      out.write("                }\n");
      out.write("            ]\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        $('#example').DataTable({\n");
      out.write("            dom: \"Bfrtip\",\n");
      out.write("            ajax: \"../php/staff.php\",\n");
      out.write("            columns: [\n");
      out.write("                {data: null, render: function (data, type, row) {\n");
      out.write("                        // Combine the first and last names into a single table field\n");
      out.write("                        return data.first_name + ' ' + data.last_name;\n");
      out.write("                    }},\n");
      out.write("                {data: \"position\"},\n");
      out.write("                {data: \"office\"},\n");
      out.write("                {data: \"extn\"},\n");
      out.write("                {data: \"start_date\"},\n");
      out.write("                {data: \"salary\", render: $.fn.dataTable.render.number(',', '.', 0, '$')}\n");
      out.write("            ],\n");
      out.write("            select: true,\n");
      out.write("            buttons: [\n");
      out.write("                {extend: \"create\", editor: editor},\n");
      out.write("                {extend: \"edit\", editor: editor},\n");
      out.write("                {extend: \"remove\", editor: editor}\n");
      out.write("            ]\n");
      out.write("        });\n");
      out.write("    });\n");
      out.write("</script>\n");
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
