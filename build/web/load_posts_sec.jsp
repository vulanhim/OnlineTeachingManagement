<%@page import="com.onlineteaching.entities.Course"%>
<%@page import="com.onlineteaching.dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.onlineteaching.entities.Post"%>
<%@page import="com.onlineteaching.dao.PostDAO"%>
<%@page import="com.onlineteaching.helper.ConnectionProvider"%>
<div class="row">
    <%
        PostDAO d = new PostDAO(ConnectionProvider.getConnection());
        int courseID = Integer.parseInt(request.getParameter("courseID"));
        int userID = Integer.parseInt(request.getParameter("userID"));
        int departmentID = Integer.parseInt(request.getParameter("departmentID"));
        List<Post> posts = null;
        if (courseID == 0 && userID == 0) {
            posts = d.getAllPostsByDepartmentID(departmentID);
        } else if (courseID == 0 && departmentID == 0) {
            posts = d.getPostByUserID(userID);
        } else {
            posts = d.getPostByCourseID(courseID);
        }

        for (Post p : posts) {
    %>
    <div class="col-md-4 mt-2">
        <div class="card">
            <div class="card-header text-center" style="background: #d2d1d6;">
                <div>
                    <b>
                        <%= d.getCourseByCourseID(p.getCourseID()).getCourseName()%>
                        - <%= d.getCourseByCourseID(p.getCourseID()).getWeekDay()%>
                        - group <%= d.getCourseByCourseID(p.getCourseID()).getGroup()%>
                        <%
                            if (d.getCourseByCourseID(p.getCourseID()).getLab() == 1) {
                        %>
                        - Lab
                        <%
                            }
                        %>
                    </b>
                </div>
                <div>
                    <%
                        if (p.getIsActive() == 1) {
                    %>
                    <i class="fas fa-circle" style="color: green; float: left"></i>
                    <%
                        }
                    %>
                    <%
                        if (p.getIsActive() == 0) {
                    %>
                    <i class="fas fa-circle" style="color: gray; float: left"></i>
                    <%
                        }
                    %>
                    <a style="float: right">
                        <%= d.getCourseByCourseID(p.getCourseID()).getInstructor()%>
                    </a>
                </div>
            </div>
            <div class="card-body" style="background: #f8f9fa;">
                <div style="float: left">
                    Week <%= p.getpWeek()%>
                </div>
                <div style="float: right">
                    <i>
                        <%= p.getpDate().toLocaleString()%>
                    </i>
                </div>
            </div>
            <div class="card-footer">
                <form action="show_post_page.jsp" method="post">
                    <tr>
                        <td><input name="postID" type="hidden" value="<%= p.getPostID()%>" class="form-control"/></td>
                    </tr>
                    <button type="submit" class="btn btn-dark btn-sm" style="float: right; margin:1px">
                        <i class="far fa-eye"></i>
                        More
                    </button>
                </form>
            </div>
        </div>
    </div>
    <script>
        function showNotification() {
            const notification = new Notification("Class has started!", {
                body: '<%= d.getCourseByCourseID(p.getCourseID()).getCourseName()%> - <%= d.getCourseByCourseID(p.getCourseID()).getInstructor()%>'
                        });
                        notification.onclick = (e) => {
                            window.open('show_post_page.jsp?postID=<%= p.getPostID()%>','_blank');
                            notification.close();
                        };
                        setTimeout(() => {
                            notification.close()
                        }, 4000);
                    }
                    console.log(Notification.permission);
                    if (Notification.permission === "granted" && <%= p.getIsActive()%> === 1) {
                        showNotification();
                    } else if (Notification.permission !== "denied") {
                        Notification.requestPermission().then(permission => {
                            if (permission === "granted" && <%= p.getIsActive()%> === 1) {
                                showNotification();
                            }
                        });
                    }
    </script>
    <%
        }
    %>
</div>




