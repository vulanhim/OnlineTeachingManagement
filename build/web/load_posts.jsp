<%@page import="java.util.List"%>
<%@page import="com.onlineteaching.entities.Post"%>
<%@page import="com.onlineteaching.dao.PostDAO"%>
<%@page import="com.onlineteaching.helper.ConnectionProvider"%>
<div class="row">
    <%
        PostDAO d = new PostDAO(ConnectionProvider.getConnection());
        int courseID = Integer.parseInt(request.getParameter("courseID"));
        int userID = Integer.parseInt(request.getParameter("userID"));
        List<Post> posts = null;
        if (courseID == 0) {
            posts = d.getPostByUserID(userID);
        } else {
            posts = d.getPostByCourseID(courseID);
        }
        
        for (Post p : posts) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <div class="card-body" style="background: #d2d1d6;">
                <b>Week <%= p.getpWeek()%></b>
            </div>
            <div class="card-body" style="background: #f8f9fa;">
                <p><%= p.getpContent()%></p>
            </div>
        </div>
    </div>
    <%
        }


    %>
</div>