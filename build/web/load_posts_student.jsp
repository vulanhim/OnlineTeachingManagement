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
            <div class="card-header" style="background: #d2d1d6;">
                <div style="float: left">
                    <b>Week <%= p.getpWeek()%></b>
                </div>
                <div style="float: right">
                    <i><%= p.getpDate().toLocaleString()%></i>
                </div>
            </div>
            <div class="card-body" style="background: #f8f9fa;">
                <p><%= p.getpContent()%></p>
            </div>
            <div class="card-footer">
                <a target="_blank" rel="noopener noreferrer" class="btn btn-primary btn-sm" style="float: right; margin:1px" href="<%=p.getLinkCourse()%>">
                    <i class="fas fa-sign-in-alt"></i>
                    Join
                </a>
                <%
                    if (p.getSlide() != null) {
                %>
                <a class="btn btn-primary btn-sm" style="float: right; margin:1px" href="DownloadFileServlet?value=<%= p.getSlide()%>">
                    <i class="fas fa-file-pdf"></i>
                    Slide
                </a>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <%
        }


    %>
</div>


<script>
    $("#post-id-update").hide();
    var exampleModal = document.getElementById('editPostModal')
    exampleModal.addEventListener('show.bs.modal', function (event) {
        // Button that triggered the modal
        var button = event.relatedTarget
        // Extract info from data-bs-* attributes
        var recipient = button.getAttribute('data-bs-whatever')
        // If necessary, you could initiate an AJAX request here
        // and then do the updating in a callback.
        //
        // Update the modal's content.
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')

        modalTitle.textContent = 'Edit Post'
        modalBodyInput.value = recipient
    });
</script>

<script>
    $("#post-id-delete").hide();
    var exampleModal1 = document.getElementById('deletePostModal')
    exampleModal1.addEventListener('show.bs.modal', function (event) {
        // Button that triggered the modal
        var button1 = event.relatedTarget
        // Extract info from data-bs-* attributes
        var recipient1 = button1.getAttribute('data-bs-whatever')
        // If necessary, you could initiate an AJAX request here
        // and then do the updating in a callback.
        //
        // Update the modal's content.
        var modalTitle1 = exampleModal1.querySelector('.modal-title')
        var modalBodyInput1 = exampleModal1.querySelector('.modal-body input')

        modalTitle1.textContent = 'Delete Post'
        modalBodyInput1.value = recipient1
    });
</script>


