<%@page import="com.onlineteaching.entities.Course"%>
<%@page import="com.onlineteaching.dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.onlineteaching.entities.Post"%>
<%@page import="com.onlineteaching.dao.PostDAO"%>
<%@page import="com.onlineteaching.helper.ConnectionProvider"%>
<div class="row">
    <%
        PostDAO d = new PostDAO(ConnectionProvider.getConnection());
        int userID = Integer.parseInt(request.getParameter("userID"));
        List<Course> course = null;
            course = d.getCourseByUserID(userID);

        for (Course c : course) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <div class="card-body text-center" style="background: #f8f9fa;">
                <div>
                    <b>
                        <%= c.getCourseName()%> 
                        - Group <%= c.getGroup()%>
                        <%
                            if (c.getLab() == 1) {
                        %>
                        - Lab group <%= c.getHasLab()%>
                        <%
                            }
                        %>
                    </b>
                </div>
            </div>
            <div class="card-footer">
                <form target="_blank" rel="noopener noreferrer" action="show_all_post_page.jsp" method="post">
                    <tr>
                        <td><input name="courseID" type="hidden" value="<%= c.getCourseID()%>" class="form-control"/></td>
                    </tr>
                    <button type="submit" class="btn btn-dark btn-sm" style="float: right; margin:1px">
                        <i class="far fa-eye"></i>
                        More
                    </button>
                </form>
            </div>
        </div>
    </div>
    <%
        }


    %>
</div>



