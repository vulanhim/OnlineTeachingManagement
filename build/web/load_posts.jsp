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
                <%
                    if (p.getIsCheck() == 1) {
                %>
                <a href="#!" class="btn btn-outline btn-sm" style="float: left">
                    <i class="fa fa-user-check"></i>
                    by <%= p.getCheckBy()%>
                </a>
                <%
                    }
                %>
                <a class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deletePostModal" data-bs-whatever="<%=p.getPostID()%>" style="float: right; margin:1px">
                    <i class="fa fa-trash-alt"></i>
                </a>
                <a class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#editPostModal" data-bs-whatever="<%=p.getPostID()%>" style="float: right; margin:1px">
                    <i class="fa fa-edit"></i>
                    Edit
                </a>
            </div>
        </div>
    </div>
    <%
        }


    %>
</div>

<!--edit post modal-->
<div class="modal fade" id="editPostModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Edit Post</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="EditPostServlet" method="post" enctype="multipart/form-data">
                    <div class="mb-3" id="post-id-update">
                        <label for="recipient-name" class="col-form-label">PostID:</label>
                        <input type="text" class="form-control" name="postID">
                    </div>
                    <div class="mb-3">
                        <label for="message-text" class="col-form-label">Content:</label>
                        <textarea class="form-control" name="pContent"></textarea>
                    </div>
                    <hr>
                    <div class="container text-center">
                        <button type="submit" class="btn btn-outline-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--end of edit post modal-->

<!--delete modal-->
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="deletePostModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="DeletePostServlet" method="post" enctype="multipart/form-data">
                    Are you sure want to delete this post?<hr>
                    <div class="mb-3" id="post-id-delete">
                        <label for="recipient-name" class="col-form-label">PostID:</label>
                        <input type="text" class="form-control" name="postID">
                    </div>
                    <div class="container text-center">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                        <button type="submit" class="btn btn-outline-primary">Yes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--end of delete modal-->
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


