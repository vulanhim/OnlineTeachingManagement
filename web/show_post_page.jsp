<%-- 
    Document   : show_post_page
    Created on : Jan 6, 2022, 4:07:23 AM
    Author     : LeeBen
--%>
<%@page import="com.onlineteaching.entities.Course"%>
<%@page import="com.onlineteaching.entities.Post"%>
<%@page import="com.onlineteaching.entities.Message"%>
<%@page import="com.onlineteaching.dao.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.onlineteaching.entities.Department"%>
<%@page import="com.onlineteaching.helper.ConnectionProvider"%>
<%@page import="com.onlineteaching.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("Login.jsp");
    }

%>
<%    int postID = Integer.parseInt(request.getParameter("postID"));
    PostDAO postdao = new PostDAO(ConnectionProvider.getConnection());
    Post post = postdao.getPostByPostID(postID);
    Course course = postdao.getCourseByCourseID(post.getCourseID());
%>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=course.getCourseName()%> - Week <%=post.getpWeek()%> - <%=course.getInstructor()%></title>
        <!-- Boxiocns CDN Link -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/home.css?">
        <script src="https://kit.fontawesome.com/7c428afa8c.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <!--navbar-->
        <div class="sidebar close">
            <div class="logo-details">
                <a href="Home.jsp">
                    <i class='bx bxl-c-plus-plus'></i>
                </a>
                <span class="logo_name">IU OTM</span>
            </div>
            <ul class="nav-links">
                <li>
                    <div class="iocn-link">
                        <a href="Manage.jsp">
                            <i class="fas fa-tasks"></i>
                            <span class="link_name">Check</span>
                        </a>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name" href="Manage.jsp">Check</a></li>
                    </ul>
                </li>
                <li>
                    <div class="iocn-link">
                        <a>
                            <i class="fas fa-book"></i>
                            <span class="link_name">View Post</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow' ></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name">View Post</a></li>
                        <li><a href="Search.jsp">by Instructor</a></li>
                    </ul>
                </li>
                <li>
                    <div class="profile-details">
                        <div class="profile-content">
                            <a href="#!" data-bs-toggle="modal" data-bs-target="#profileModal">
                                <img src="img/<%= user.getProfile()%>" alt="profileImg">
                            </a>

                        </div>
                        <div class="name-job">
                            <div class="profile_name"><%= user.getName()%></div>
                            <div class="job"><%= user.getIUCode()%></div>
                        </div>
                        <a href="LogoutServlet">
                            <i class='bx bx-log-out' ></i>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
        <!--end of navbar-->

        <section class="home-section">
            <div class="home-content">
                <i class='bx bx-menu' ></i>
                <%
                    Message m = (Message) session.getAttribute("msg");
                    if (m != null) {
                %>
                <div class="alert <%=m.getCssClass()%> d-flex align-items-center" role="alert">
                    <%=m.getContent()%>
                </div>
                <%
                        session.removeAttribute("msg");
                    }
                %>
                <!--main body of the page-->
                <main>
                    <div class="container">
                        <div class="row my-4">
                            <div class="col-md-8 offset-md-2">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row my-1" style="padding-left: 15px; padding-right: 15px">
                                            <div class="col-md-7" style="border: 1px solid #e2e2e2; padding: 15px">
                                                <div>
                                                    <b>Course:</b> <%=course.getCourseName()%>
                                                </div>
                                                <div>
                                                    <b>Course Code:</b> <%=course.getCourseCode()%> Group <%=course.getGroup()%>
                                                    <%
                                                        if (course.getLab() == 1) {
                                                    %>
                                                    Lab group <%=course.getHasLab()%>
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                                <div>
                                                    <b>Instructor:</b> <%=course.getInstructor()%>
                                                </div>
                                                <div>
                                                    <b>Room:</b> <%=course.getRoom()%>
                                                    - <b>Class:</b> <%=course.getClassID()%>
                                                </div>
                                                <div>
                                                    <b>Week day:</b> <%=course.getWeekDay()%>
                                                </div>
                                                <div>
                                                    <b>Start slot:</b> <%=course.getStartSlot()%>
                                                    - <b>Numbers of slots:</b> <%=course.getNumbersOfSlots()%>
                                                </div>
                                                <div>
                                                    <b>Semester:</b> <%=course.getSemester()%>
                                                    - <b>School Year:</b>
                                                    <%
                                                        if (course.getSchoolYear() == 20212022) {
                                                    %>
                                                    2021-2022
                                                    <%
                                                    } else {
                                                    %>
                                                    <%=course.getSchoolYear()%>
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                            <div style= "padding: 15px">
                                                <div>
                                                    Week <%=post.getpWeek()%>
                                                    <i style="font-size: 14px; float: right">Posted on: <%=post.getpDate().toLocaleString()%> </i>
                                                </div>
                                                <hr>
                                                <div style="font-size: 18px">
                                                    <%=post.getpContent()%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <%
                                            if (post.getIsCheck() == 1) {
                                        %>
                                        <a href="#!" class="btn btn-outline btn-sm" style="float: left">
                                            <i class="fa fa-user-check"></i>
                                            by <%= post.getCheckBy()%>
                                        </a>
                                        <%
                                            }
                                        %>
                                        <form id="check-post-form" action="CheckPostServlet" method="post">
                                            <tr>
                                                <td><input name="postID" type="hidden" value="<%= post.getPostID()%>" class="form-control"/></td>
                                            </tr>
                                            <tr>
                                                <td><input name="checkBy" type="hidden" value="<%= user.getName()%>" class="form-control"/></td>
                                            </tr>
                                            <button type="submit" class="btn btn-dark btn-sm" style="float: right; margin:1px">
                                                <i class="fas fa-check"></i>
                                                Check
                                            </button>
                                        </form>
                                        <a target="_blank" rel="noopener noreferrer" class="btn btn-primary btn-sm" style="float: right; margin:1px" href="<%=post.getLinkCourse()%>">
                                            <i class="fas fa-sign-in-alt"></i>
                                            Join online class
                                        </a>
                                        <a class="btn btn-primary btn-sm" style="float: right; margin:1px" href="DownloadFileServlet?value=<%= post.getSlide()%>">
                                            <i class="fas fa-file-pdf"></i>
                                            Slide
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </main>
            </div>
        </section>



        <!--profile modal-->

        <!-- Modal -->
        <div class="modal fade" id="profileModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel">Profile</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="img/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%;max-width: 150px ">
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
                            <div id="profile-details">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">Username:</th>
                                            <td><%= user.getUsername()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%= user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">IUCode:</th>
                                            <td><%= user.getIUCode()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Department:</th>
                                            <td>
                                                <%
                                                    PostDAO pdd = new PostDAO(ConnectionProvider.getConnection());
                                                %>
                                                <%= pdd.getDepartmentByDepartmentID(user.getDepartmentID()).getDepartmentName()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><%= user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on:</th>
                                            <td><%= user.getDateTime()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--profile edit-->
                            <div id="profile-edit" style="display: none;">
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <th scope="row">Name:</th>
                                            <td><input type="text" class="form-control" name="name" value="<%= user.getName()%>"</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><input type="email" class="form-control" name="email" value="<%= user.getEmail()%>"</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td>
                                                <select class="form-control" aria-label="Default select example" name="gender">
                                                    <option selected><%= user.getGender()%></option>
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">IUCode:</th>
                                            <td><input type="text" class="form-control" name="IUCode" value="<%= user.getIUCode()%>"</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Department:</th>
                                            <td>
                                                <select class="form-control" aria-label="Default select example" name="departmentID">
                                                    <option selected value="<%= user.getDepartmentID()%>"><%= pdd.getDepartmentByDepartmentID(user.getDepartmentID()).getDepartmentName()%></option>
                                                    <%
                                                        PostDAO postd = new PostDAO(ConnectionProvider.getConnection());
                                                        ArrayList<Department> listd = postd.getAllDepartment();
                                                        for (Department d : listd) {
                                                    %>
                                                    <option value="<%= d.getDepartmentID()%>"><%= d.getDepartmentName()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Password:</th>
                                            <td><input type="password" class="form-control" name="password" value="<%= user.getPassword()%>"</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Change profile picture:</th>
                                            <td><input type="file" class="form-control" name="profile" value="<%= user.getProfile()%>"</td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="close-profile-btn" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of profile modal-->

        <script>
            let arrow = document.querySelectorAll(".arrow");
            for (var i = 0; i < arrow.length; i++) {
                arrow[i].addEventListener("click", (e) => {
                    let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow
                    arrowParent.classList.toggle("showMenu");
                });
            }
            let sidebar = document.querySelector(".sidebar");
            let sidebarBtn = document.querySelector(".bx-menu");
            console.log(sidebarBtn);
            sidebarBtn.addEventListener("click", () => {
                sidebar.classList.toggle("close");
            });
        </script>
        <!--javascripts-->

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="js/myjs.js?v=0" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-btn').click(function () {
                    if (editStatus === false) {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Back");
                    } else {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }
                });
                $('#close-profile-btn').click(function () {
                    if (editStatus === true) {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        $('#edit-profile-btn').text("Edit");
                        editStatus = false;
                    }
                });

            });
        </script>
        <script>
            $(document).ready(function (e) {
                $('#check-post-form').on('submit', function (event) {
                    event.preventDefault();
                    console.log("you have clicked on submit");
                    let form = new FormData(this);

//                   send post form to servlet
                    $.ajax({
                        url: "CheckPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === "done") {
                                swal("Check post successful!", "Move to home page...", "success")
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
    </body>
</html>
