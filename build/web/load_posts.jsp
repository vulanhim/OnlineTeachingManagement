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
                    <%
                        if (p.getIsActive() == 1) {
                    %>
                    <a data-bs-toggle="modal" data-bs-target="#off-post-modal" data-bs-whatever="<%=p.getPostID()%>" style="cursor: pointer">
                        <i class="fas fa-circle" style="color: green;"></i>
                    </a>
                    <%
                        }
                    %>
                    <%
                        if (p.getIsActive() == 0) {
                    %>
                    <a data-bs-toggle="modal" data-bs-target="#active-post-modal" data-bs-whatever="<%=p.getPostID()%>" style="cursor: pointer">
                        <i class="fas fa-circle" style="color: gray;"></i>
                    </a>
                    <%
                        }
                    %>
                    <b>Week <%= p.getpWeek()%></b>
                </div>
                <div style="float: right">
                    <i><%= p.getpDate().toLocaleString()%></i>
                </div>
            </div>
            <div class="card-body" style="background: #f8f9fa;">
                <p><%= p.getpContent()%></p>
            </div>
            <%
                if (p.getSlide() != null) {
            %>
            <div class="card-body" style="background: #f8f9fa;">
                <a class="btn btn-primary btn-sm" style="float: right; margin:1px" href="DownloadFileServlet?value=<%= p.getSlide()%>">
                    <i class="fas fa-file-pdf"></i>
                    Slide
                </a>
            </div>
            <%
                }
            %>
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
                <a class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#editPostModal" data-bs-whatever="<%=p.getPostID()%>" data-bs-content="<%=p.getpContent()%>" data-bs-linkcourse="<%=p.getLinkCourse()%>" style="float: right; margin:1px">
                    <i class="fa fa-edit"></i>
                    Edit
                </a>
                <a target="_blank" rel="noopener noreferrer" class="btn btn-primary btn-sm" style="float: right; margin:1px" href="<%=p.getLinkCourse()%>">
                    <i class="fas fa-sign-in-alt"></i>
                    Join
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
                    <div class="a-mb-3">
                        <label for="message-text" class="col-form-label">Online class link:</label>
                        <input type="text" class="form-control" name="linkCourse">
                    </div>
                    <div class="mb-3">
                        <label for="message-text" class="col-form-label">Slide:</label>
                        <input type="File" class="form-control" name="slide">
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

<!--active post modal-->

<!-- Modal -->
<div class="modal fade" id="active-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="active-post-form" action="ActivePostServlet" method="post" enctype="multipart/form-data">
                    Start the class?<hr>
                    <div class="mb-3" id="post-id-active">
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
<!--end of active post modal-->

<!--off post modal-->

<!-- Modal -->
<div class="modal fade" id="off-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="off-post-form" action="OffPostServlet" method="post" enctype="multipart/form-data">
                    Off the class?<hr>
                    <div class="mb-3" id="post-id-off">
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
<!--end of active post modal-->

<script>
    $("#post-id-update").hide();
    var exampleModal = document.getElementById('editPostModal')
    exampleModal.addEventListener('show.bs.modal', function (event) {
        // Button that triggered the modal
        var button = event.relatedTarget
        // Extract info from data-bs-* attributes
        var recipient = button.getAttribute('data-bs-whatever')
        var recipient2 = button.getAttribute('data-bs-content')
        var recipient3 = button.getAttribute('data-bs-linkcourse')
        // If necessary, you could initiate an AJAX request here
        // and then do the updating in a callback.
        //
        // Update the modal's content.
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        var modalBodyInput2 = exampleModal.querySelector('.modal-body textarea')
        var modalBodyInput3 = exampleModal.querySelector('.modal-body .a-mb-3 input')
        modalTitle.textContent = 'Edit Post'
        modalBodyInput.value = recipient
        modalBodyInput2.value = recipient2
        modalBodyInput3.value = recipient3
    });
</script>

<script>
    $("#post-id-active").hide();
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

<script>
    $("#post-id-off").hide();
    var exampleModal2 = document.getElementById('active-post-modal')
    exampleModal2.addEventListener('show.bs.modal', function (event) {
        // Button that triggered the modal
        var button1 = event.relatedTarget
        // Extract info from data-bs-* attributes
        var recipient1 = button1.getAttribute('data-bs-whatever')
        // If necessary, you could initiate an AJAX request here
        // and then do the updating in a callback.
        //
        // Update the modal's content.
        var modalBodyInput1 = exampleModal2.querySelector('.modal-body input')

        modalBodyInput1.value = recipient1
    });
</script>

<script>
    $("#post-id-delete").hide();
    var exampleModal3 = document.getElementById('off-post-modal')
    exampleModal3.addEventListener('show.bs.modal', function (event) {
        // Button that triggered the modal
        var button1 = event.relatedTarget
        // Extract info from data-bs-* attributes
        var recipient1 = button1.getAttribute('data-bs-whatever')
        // If necessary, you could initiate an AJAX request here
        // and then do the updating in a callback.
        //
        // Update the modal's content.
        var modalBodyInput1 = exampleModal3.querySelector('.modal-body input')

        modalBodyInput1.value = recipient1
    });
</script>
<script>
    $(document).ready(function (e) {
        $('#active-post-form').on('submit', function (event) {
            event.preventDefault();
            console.log("you have clicked on submit");
            let form = new FormData(this);

//                   send post form to servlet
            $.ajax({
                url: "ActivePostServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    if (data.trim() === "done") {
                        swal("Class is started!", "", "success")
                                .then((value) => {
                                    window.location = "Home.jsp";
                                });
                    } else {
                        swal("Error!", "Something went wrong! Try again", "error");
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("Error!", "Something went wrong! Try again", "error");
                },
                processData: false,
                contentType: false
            });
        });
    });
</script>
<script>
    $(document).ready(function (e) {
        $('#off-post-form').on('submit', function (event) {
            event.preventDefault();
            console.log("you have clicked on submit");
            let form = new FormData(this);

//                   send post form to servlet
            $.ajax({
                url: "OffPostServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    if (data.trim() === "done") {
                        swal("Class is off!", "", "success")
                                .then((value) => {
                                    window.location = "Home.jsp";
                                });
                    } else {
                        swal("Error!", "Something went wrong! Try again", "error");
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("Error!", "Something went wrong! Try again", "error");
                },
                processData: false,
                contentType: false
            });
        });
    });
</script>


