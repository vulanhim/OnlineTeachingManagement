<%-- 
    Document   : editpost
    Created on : Dec 31, 2021, 12:59:57 AM
    Author     : LeeBen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <!--edit post modal-->
<%
    int postID = Integer.parseInt(request.getParameter("post_id"));
%>
    <!-- Modal -->
    <div class="modal fade" id="edit-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Edit post</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="edit-post-form" action="EditPostServlet" method="post">
                        <table class="table">
                            <tr>
                                <td><%=postID%></td>
                            </tr>
                            <tr>
                                <td><textarea name="pContent" class="form-control" style="height: 200px" placeholder="" ></textarea></td>
                            </tr>
                        </table>
                        <div class="container text-center">
                            <button type="submit" class="btn btn-primary">Post</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--end edit post modal-->
    </body>
</html>
