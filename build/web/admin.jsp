<%-- 
    Document   : admin
    Created on : Jan 10, 2022, 10:34:03 PM
    Author     : LeeBen
--%>

<%@page import="com.onlineteaching.dao.CourseDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.onlineteaching.entities.Course"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.onlineteaching.entities.Department"%>
<%@page import="com.onlineteaching.dao.PostDAO"%>
<%@page import="com.onlineteaching.helper.ConnectionProvider"%>
<%@page import="com.onlineteaching.entities.Message"%>
<%@page import="com.onlineteaching.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("Login.jsp");
    } else if (user.getRole() == 1) {
        response.sendRedirect("Manage.jsp");
    } else if (user.getRole() == 0) {
        response.sendRedirect("Home.jsp");
    } else if (user.getRole() == 2) {
        response.sendRedirect("Student.jsp");
    }
    PostDAO postd = new PostDAO(ConnectionProvider.getConnection());
    CourseDAO coursed = new CourseDAO(ConnectionProvider.getConnection());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to IU Online Teaching Management</title>
        <!-- Boxiocns CDN Link -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/home.css?">
        <script src="https://kit.fontawesome.com/7c428afa8c.js" crossorigin="anonymous"></script>
        <link href='https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css' rel='stylesheet'>
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
                        <a href="admin.jsp">
                            <i class='bx bx-book-alt' ></i>
                            <span class="link_name">Course</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow' ></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name" href="admin.jsp">Course</a></li>
                        <li><a id="show-courses-btn" style="cursor: pointer">All Courses</a></li>
                        <li><a id="add-course-btn" style="cursor: pointer">Add Course</a></li>
                        <!--
                           <li><a href="#">Card Design</a></li>-->
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
                <span class="text">
                    Welcome <%= user.getName()%>!
                </span>
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
                <table id="example" class="table table-bordered" style="margin: 20px">
                    <thead>
                        <tr>
                            <th scope="col">CourseID</th>
                            <th scope="col">CourseName</th>
                            <th scope="col">DepartmentID</th>
                            <th scope="col">CourseCode</th>
                            <th scope="col">WeekDay</th>
                            <th scope="col">Room</th>
                            <th scope="col">Instructor</th>
                            <th scope="col">StartSlot</th>
                            <th scope="col">NumbersOfSlots</th>
                            <th scope="col">ClassID</th>
                            <th scope="col">Semester</th>
                            <th scope="col">SchoolYear</th>
                            <th scope="col">GroupClass</th>
                            <th scope="col">Lab</th>
                            <th scope="col">LabGroup</th>
                            <th scope="col">UserID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Course> listc = coursed.getAllCourses();
                            for (Course d : listc) {
                        %>
                        <tr>
                            <th scope="row"><%=d.getCourseID()%></th>
                            <td><%=d.getCourseName()%></td>
                            <td><%=d.getDepartmentID()%></td>
                            <td><%=d.getCourseCode()%></td>
                            <td><%=d.getWeekDay()%></td>
                            <td><%=d.getRoom()%></td>
                            <td><%=d.getInstructor()%></td>
                            <td><%=d.getStartSlot()%></td>
                            <td><%=d.getNumbersOfSlots()%></td>
                            <td><%=d.getClassID()%></td>
                            <td><%=d.getSemester()%></td>
                            <td><%=d.getSchoolYear()%></td>
                            <td><%=d.getGroup()%></td>
                            <td><%=d.getLab()%></td>
                            <td><%=d.getHasLab()%></td>
                            <td><%=d.getUserID()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <main class="my-form" id="add-course" style="display: none;">
                    <div class="cotainer">
                        <div class="row justify-content-center">
                            <div class="col-md-7">
                                <div class="card">
                                    <div class="card-header">Add New Course</div>
                                    <form id="add-course-form" action="AddCourseServlet" method="post">
                                        <div class="card-body">
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right">Course Name</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="courseName">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right">Department</label>
                                                <div class="col-md-6">
                                                    <select class="form-control" aria-label="Default select example" name="departmentID">
                                                        <option selected disabled>---[Select Department]---</option>
                                                        <%
                                                            ArrayList<Department> listd = postd.getAllDepartment();
                                                            for (Department d : listd) {
                                                        %>
                                                        <option value="<%= d.getDepartmentID()%>"><%= d.getDepartmentName()%></option>
                                                        <%
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right">Course Code</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="courseCode">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right">Week Day</label>
                                                <div class="col-md-6">
                                                    <select class="form-control" aria-label="Default select example" name="weekDay">
                                                        <option selected disabled>---[Select Week Day]---</option>
                                                        <option value="Monday">Monday</option>
                                                        <option value="Tuesday">Tuesday</option>
                                                        <option value="Wednesday">Wednesday</option>
                                                        <option value="Thursday">Thursday</option>
                                                        <option value="Friday">Friday</option>
                                                        <option value="Saturday">Saturday</option>
                                                        <option value="Sunday">Sunday</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right">Room</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="room">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right">Instructor</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="instructor">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right">Start Slot</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="startSlot">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right">Numbers Of Slots</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="numbersOfSlots">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right">Class ID</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="classID">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right">Semester</label>
                                                <div class="col-md-6">
                                                    <select class="form-control" aria-label="Default select example" name="semester">
                                                        <option selected disabled>---[Select Semester]---</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right">School Year</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="schoolYear" value="20212022">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right">Group</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="group">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right">Class Type</label>
                                                <div class="col-md-6">
                                                    <select id="lab-class-opt" class="form-control" aria-label="Default select example" name="lab">
                                                        <option selected disabled>---[Select Class Type]---</option>
                                                        <option value="0">Theory Class</option>
                                                        <option value="1">Lab Class</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row" id="1" style="display: none;">
                                                <label class="col-md-4 col-form-label text-md-right">Lab Group</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="hasLab" value="0">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right">User ID</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="userID">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body text-center">
                                            <button type="submit" class="btn btn-dark">Add</button>
                                        </div>
                                    </form>
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
            $(function () {
                $('#lab-class-opt').change(function () {
                    $('#' + $(this).val()).show();
                });
            });
        </script>
        <script>
            $(document).ready(function (e) {
                $('#add-course-form').on('submit', function (event) {
                    event.preventDefault();
                    console.log("you have clicked on submit");
                    let form = new FormData(this);

//                   send post form to servlet
                    $.ajax({
                        url: "AddCourseServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === "done") {
                                swal("Add course successful!", "Move to home page...", "success")
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
            $(document).ready(function () {
                $('#add-course-btn').click(function () {
                    $("#add-course").show();
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
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
    </body>
</html>
