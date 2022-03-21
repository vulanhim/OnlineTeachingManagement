<%-- 
    Document   : admin
    Created on : Jan 10, 2022, 10:34:03 PM
    Author     : LeeBen
--%>

<%@page import="com.onlineteaching.dao.UserDAO"%>
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
    UserDAO userd = new UserDAO(ConnectionProvider.getConnection());
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
        <link rel="stylesheet" href="css/home.css">
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
                        <a>
                            <i class="fas fa-book"></i>
                            <span class="link_name">Course</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow' ></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name">Course</a></li>
                        <li><a id="show-courses-btn" style="cursor: pointer">All Courses</a></li>
                        <li><a href="#!" data-bs-toggle="modal" data-bs-target="#add-course-modal">Add Course</a></li>
                        <li><a href="#!" data-bs-toggle="modal" data-bs-target="#delete-course-modal">Delete Courses</a></li>
                    </ul>
                </li>
                <li>
                    <div class="iocn-link">
                        <a>
                            <i class="fas fa-users"></i>
                            <span class="link_name">User</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow' ></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name">User</a></li>
                        <li><a id="show-users-btn" style="cursor: pointer">All Users</a></li>
                        <li><a href="#!" data-bs-toggle="modal" data-bs-target="#update-user-role-modal">User Access</a></li>
                    </ul>
                </li>
                <li>
                    <div class="iocn-link">
                        <a>
                            <i class="fas fa-user-graduate"></i>
                            <span class="link_name">Student</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow' ></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name">Student</a></li>
                        <li><a href="#!" data-bs-toggle="modal" data-bs-target="#add-course-student-modal">Add Course</a></li>
                        <li><a href="#!" data-bs-toggle="modal" data-bs-target="#delete-course-student-modal">Delete Course</a></li>
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
                <div class="alert <%=m.getCssClass()%>" role="alert">
                    <%=m.getContent()%>
                </div>
                <%
                        session.removeAttribute("msg");
                    }
                %>
                <!--main body of the page-->
                <main class="my-form" id="show-all-courses" style="display: none;">
                    <div class="cotainer">
                        <table id="allCourses" class="display" style="margin: 20px">
                            <thead>
                                <tr>
                                    <th scope="col">CourseID</th>
                                    <th scope="col">Course Name</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Course Code</th>
                                    <th scope="col">Week Day</th>
                                    <th scope="col">Room</th>
                                    <th scope="col">Instructor</th>
                                    <th scope="col">Start Slot</th>
                                    <th scope="col">Numbers Of Slots</th>
                                    <th scope="col">ClassID</th>
                                    <th scope="col">Semester</th>
                                    <th scope="col">School Year</th>
                                    <th scope="col">Group</th>
                                    <th scope="col">Class Type</th>
                                    <th scope="col">Lab Group</th>
                                    <th scope="col">UserID</th>
                                    <th scope="col">Action</th>
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
                                    <td>
                                        <%= postd.getDepartmentByDepartmentID(d.getDepartmentID()).getDepartmentName()%>
                                    </td>
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
                                    <td>
                                        <% if (d.getLab() == 0) {
                                        %>
                                        Theory
                                        <%
                                            }
                                        %>
                                        <% if (d.getLab() == 1) {
                                        %>
                                        Lab
                                        <%
                                            }
                                        %>
                                    </td>
                                    <td>
                                        <% if (d.getHasLab() == 0) {
                                        %>
                                        None
                                        <%
                                            }
                                        %>
                                        <% if (d.getHasLab() != 0) {
                                        %>
                                        <%=d.getHasLab()%>
                                        <%
                                            }
                                        %>
                                    </td>
                                    <td><%=d.getUserID()%></td>
                                    <td>
                                        <a class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#editCourseModal"
                                           data-bs-courseID="<%=d.getCourseID()%>"
                                           data-bs-courseName="<%=d.getCourseName()%>"
                                           data-bs-department="<%=d.getDepartmentID()%>"
                                           data-bs-courseCode="<%=d.getCourseCode()%>"
                                           data-bs-weekDay="<%=d.getWeekDay()%>"
                                           data-bs-room="<%=d.getRoom()%>"
                                           data-bs-instructor="<%=d.getInstructor()%>"
                                           data-bs-startSlot="<%=d.getStartSlot()%>"
                                           data-bs-numbersOfSlots="<%=d.getNumbersOfSlots()%>"
                                           data-bs-classID="<%=d.getClassID()%>"
                                           data-bs-semester="<%=d.getSemester()%>"
                                           data-bs-schoolYear="<%=d.getSchoolYear()%>"
                                           data-bs-group="<%=d.getGroup()%>"
                                           data-bs-lab="<%=d.getLab()%>"
                                           data-bs-hasLab="<%=d.getHasLab()%>"
                                           data-bs-userID="<%=d.getUserID()%>"
                                           >
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteOneCourseModal" data-bs-whatever="<%=d.getCourseID()%>">
                                            <i class="fa fa-trash-alt"></i>
                                        </a>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </main>
                <main class="my-form" id="show-all-users" style="display: none;">
                    <div class="cotainer">
                        <table id="allCourses" class="display" style="margin: 20px">
                            <thead>
                                <tr>
                                    <th scope="col">UserID</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">IUCode</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Role</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ArrayList<User> listu = userd.getAllUsers();
                                    for (User u : listu) {
                                %>
                                <tr>
                                    <th scope="row"><%=u.getUserID()%></th>
                                    <td><%=u.getUsername()%></td>
                                    <td><%=u.getName()%></td>
                                    <td><%=u.getGender()%></td>
                                    <td><%=u.getIUCode()%></td>
                                    <td>
                                        <%= postd.getDepartmentByDepartmentID(u.getDepartmentID()).getDepartmentName()%>
                                    </td>
                                    <td><%=u.getEmail()%></td>
                                    <td>
                                        <% if (u.getRole() == 0) {
                                        %>
                                        Teacher
                                        <%
                                            }
                                        %>
                                        <% if (u.getRole() == 1) {
                                        %>
                                        Faculty Secretary
                                        <%
                                            }
                                        %>
                                        <% if (u.getRole() == 2) {
                                        %>
                                        Student
                                        <%
                                            }
                                        %>
                                        <% if (u.getRole() == 3) {
                                        %>
                                        Admin
                                        <%
                                            }
                                        %>
                                    </td>
                                    <td>
                                        <a class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#editUserModal" 
                                           data-bs-userID="<%=u.getUserID()%>"
                                           data-bs-username="<%=u.getUsername()%>"
                                           data-bs-password="<%=u.getPassword()%>"
                                           data-bs-name="<%=u.getName()%>"
                                           data-bs-gender="<%=u.getGender()%>"
                                           data-bs-IUCode="<%=u.getIUCode()%>"
                                           data-bs-department="<%=u.getDepartmentID()%>"
                                           data-bs-email="<%=u.getEmail()%>"
                                           >
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteUserModal" data-bs-whatever="<%=u.getUserID()%>">
                                            <i class="fa fa-trash-alt"></i>
                                        </a>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </main>
            </div>
        </section>

        <!--add course modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-course-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add New Course</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="add-course-form" action="AddCourseServlet" method="post">
                            <table class="table">
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Course Name</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="courseName">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Department</label>
                                            <div class="col-md-7">
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
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Course Code</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="courseCode">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Week Day</label>
                                            <div class="col-md-7">
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
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Room</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="room">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Instructor</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="instructor">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Start Slot</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="startSlot">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Numbers Of Slots</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="numbersOfSlots">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Class ID</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="classID">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Semester</label>
                                            <div class="col-md-7">
                                                <select class="form-control" aria-label="Default select example" name="semester">
                                                    <option selected disabled>---[Select Semester]---</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                </select>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">School Year</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="schoolYear" value="20212022">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Group</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="group">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Class Type</label>
                                            <div class="col-md-7">
                                                <select id="lab-class-opt" class="form-control" aria-label="Default select example" name="lab">
                                                    <option selected disabled>---[Select Class Type]---</option>
                                                    <option value="0">Theory Class</option>
                                                    <option value="1">Lab Class</option>
                                                </select>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="1" style="display: none;">
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Lab Group</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="hasLab" value="0">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">User ID</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="userID">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn btn-dark" style="float: right">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--end of add course modal-->
        <!--delete course modal-->

        <!-- Modal -->
        <div class="modal fade" id="delete-course-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete Courses</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="delete-courses-form" action="DeleteCourseServlet" method="post">
                            <table class="table">
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Semester</label>
                                            <div class="col-md-7">
                                                <select class="form-control" aria-label="Default select example" name="semester">
                                                    <option selected disabled>---[Select Semester]---</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                </select>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">School Year</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="schoolYear" value="20212022">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn btn-dark" style="float: right">Delete</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--end of delete course modal-->
        <!--update user's role modal-->

        <!-- Modal -->
        <div class="modal fade" id="update-user-role-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">User Access</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="update-user-role-form" action="UserRoleServlet" method="post">
                            <table class="table">
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">UserID</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="userID" value="">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Role</label>
                                            <div class="col-md-7">
                                                <select class="form-control" aria-label="Default select example" name="role">
                                                    <option selected disabled>---[Select Role]---</option>
                                                    <option value="0">Instructor</option>
                                                    <option value="1">Faculty Secretary</option>
                                                    <option value="2">Student</option>
                                                    <option value="3">Admin</option>
                                                </select>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn btn-dark" style="float: right">Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--end of update user's role modal-->
        <!--add course for student modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-course-student-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Course for Student</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="add-course-student-form" action="AddCourseStudentServlet" method="post">
                            <table class="table">
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">UserID</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="userID" value="">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">CourseID</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="courseID" value="">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn btn-dark" style="float: right">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--end of add course for student modal-->

        <!--delete course for student modal-->

        <!-- Modal -->
        <div class="modal fade" id="delete-course-student-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete Course for Student</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="delete-course-student-form" action="DeleteCourseStudent" method="post">
                            <table class="table">
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">UserID</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="userID" value="">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">CourseID</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" name="courseID" value="">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn btn-dark" style="float: right">Delete</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--end of delete course for student modal-->

        <!--delete one course modal-->
        <!-- Button trigger modal -->

        <!-- Modal -->
        <div class="modal fade" id="deleteOneCourseModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="DeleteOneCourseServlet" method="post" enctype="multipart/form-data">
                            Are you sure want to delete this course?<hr>
                            <div class="mb-3" id="course-id-delete">
                                <label for="recipient-name" class="col-form-label">CourseID:</label>
                                <input type="text" class="form-control" name="courseID">
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
        <!--end of delete one course modal-->

        <!--delete user modal-->
        <!-- Button trigger modal -->

        <!-- Modal -->
        <div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="DeleteUserServlet" method="post" enctype="multipart/form-data">
                            Are you sure want to delete this user?<hr>
                            <div class="mb-3" id="user-id-delete">
                                <label for="recipient-name" class="col-form-label">UserID:</label>
                                <input type="text" class="form-control" name="userID">
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
        <!--end of delete user modal-->

        <!--edit course modal-->
        <div class="modal fade" id="editCourseModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Course</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="edit-course-form" action="EditCourseServlet" method="post">
                            <table class="table">
                                <tr id="course-id-edit">
                                    <td>
                                        <div class="mb-3">
                                            <label for="recipient-name" class="col-form-label">CourseID</label>
                                            <input type="text" class="form-control" name="courseID">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Course Name</label>
                                            <div class="a-col-md-7">
                                                <input type="text" class="form-control" name="courseName">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Department ID</label>
                                            <div class="b-col-md-7">
                                                <input type="text" class="form-control" name="departmentID">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Course Code</label>
                                            <div class="c-col-md-7">
                                                <input type="text" class="form-control" name="courseCode">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Week Day</label>
                                            <div class="d-col-md-7">
                                                <input type="text" class="form-control" name="weekDay">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Room</label>
                                            <div class="e-col-md-7">
                                                <input type="text" class="form-control" name="room">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Instructor</label>
                                            <div class="f-col-md-7">
                                                <input type="text" class="form-control" name="instructor">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Start Slot</label>
                                            <div class="g-col-md-7">
                                                <input type="text" class="form-control" name="startSlot">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Numbers Of Slots</label>
                                            <div class="h-col-md-7">
                                                <input type="text" class="form-control" name="numbersOfSlots">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Class ID</label>
                                            <div class="i-col-md-7">
                                                <input type="text" class="form-control" name="classID">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Semester</label>
                                            <div class="j-col-md-7">
                                                <input type="text" class="form-control" name="semester">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">School Year</label>
                                            <div class="k-col-md-7">
                                                <input type="text" class="form-control" name="schoolYear">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Group</label>
                                            <div class="l-col-md-7">
                                                <input type="text" class="form-control" name="group">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Class Type</label>
                                            <div class="m-col-md-7">
                                                <input type="text" class="form-control" name="lab">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Lab Group</label>
                                            <div class="n-col-md-7">
                                                <input type="text" class="form-control" name="hasLab">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">User ID</label>
                                            <div class="o-col-md-7">
                                                <input type="text" class="form-control" name="userID">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn btn-dark" style="float: right">Edit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--end of edit post modal-->

        <!--edit user modal-->
        <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="edit-course-form" action="EditUserServlet" method="post">
                            <table class="table">
                                <tr id="user-id-edit">
                                    <td>
                                        <div class="mb-3">
                                            <label for="recipient-name" class="col-form-label">UserID</label>
                                            <input type="text" class="form-control" name="userID">
                                        </div>
                                    </td>
                                </tr>
                                <tr id="username-edit">
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Username</label>
                                            <div class="a-col-md-7">
                                                <input type="text" class="form-control" name="username">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Password <i class="far fa-eye" id="togglePassword" style="cursor: pointer;"></i></label>
                                            <div class="g-col-md-7">
                                                <input type="password" class="form-control" name="password" id="id_password">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Name</label>
                                            <div class="b-col-md-7">
                                                <input type="text" class="form-control" name="name">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Gender</label>
                                            <div class="c-col-md-7">
                                                <input type="text" class="form-control" name="gender">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">IUCode</label>
                                            <div class="d-col-md-7">
                                                <input type="text" class="form-control" name="IUCode">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Department ID</label>
                                            <div class="e-col-md-7">
                                                <input type="text" class="form-control" name="departmentID">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group row">
                                            <label class="col-md-5 col-form-label text-md-right">Email</label>
                                            <div class="f-col-md-7">
                                                <input type="text" class="form-control" name="email">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn btn-dark" style="float: right">Edit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--end of edit user modal-->

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

        <!--add course-->
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
                                            window.location = "admin.jsp";
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
            $(function () {
                $('#lab-class-opt').change(function () {
                    $('#' + $(this).val()).show();
                });
            });
        </script>


        <!--show course/user button-->
        <script>
            $(document).ready(function () {
                $('#show-courses-btn').click(function () {
                    $("#show-all-courses").show();
                    $("#show-all-users").hide();
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $('#show-users-btn').click(function () {
                    $("#show-all-users").show();
                    $("#show-all-courses").hide();
                });
            });
        </script>


        <!--show datatable-->
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('table.display').DataTable();
            });
        </script>


        <!--delete courses-->
        <script>
            $(document).ready(function (e) {
                $('#delete-courses-form').on('submit', function (event) {
                    event.preventDefault();
                    console.log("you have clicked on submit");
                    let form = new FormData(this);

//                   send post form to servlet
                    $.ajax({
                        url: "DeleteCourseServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === "done") {
                                swal("Delete courses successful!", "Move to home page...", "success")
                                        .then((value) => {
                                            window.location = "admin.jsp";
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
        <!--update user's role-->
        <script>
            $(document).ready(function (e) {
                $('#update-user-role-form').on('submit', function (event) {
                    event.preventDefault();
                    console.log("you have clicked on submit");
                    let form = new FormData(this);

//                   send post form to servlet
                    $.ajax({
                        url: "UserRoleServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === "done") {
                                swal("Grant access successful!", "Move to home page...", "success")
                                        .then((value) => {
                                            window.location = "admin.jsp";
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

        <!--add course for student-->
        <script>
            $(document).ready(function (e) {
                $('#add-course-student-form').on('submit', function (event) {
                    event.preventDefault();
                    console.log("you have clicked on submit");
                    let form = new FormData(this);

//                   send post form to servlet
                    $.ajax({
                        url: "AddCourseStudentServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === "done") {
                                swal("Add course for student successful!", "Close modal to continue...", "success");
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

        <!--delete course for student-->
        <script>
            $(document).ready(function (e) {
                $('#delete-course-student-form').on('submit', function (event) {
                    event.preventDefault();
                    console.log("you have clicked on submit");
                    let form = new FormData(this);

//                   send post form to servlet
                    $.ajax({
                        url: "DeleteCourseStudent",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === "done") {
                                swal("Delete student's course successful!", "Close modal to continue...", "success");
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

        <!--Delete one course--> 
        <script>
            $("#course-id-delete").hide();
            var exampleModal1 = document.getElementById('deleteOneCourseModal')
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

                modalTitle1.textContent = 'Delete Course'
                modalBodyInput1.value = recipient1
            });
        </script>

        <!--Delete user--> 
        <script>
            $("#user-id-delete").hide();
            var exampleModal2 = document.getElementById('deleteUserModal')
            exampleModal2.addEventListener('show.bs.modal', function (event) {
                // Button that triggered the modal
                var button2 = event.relatedTarget
                // Extract info from data-bs-* attributes
                var recipient2 = button2.getAttribute('data-bs-whatever')
                // If necessary, you could initiate an AJAX request here
                // and then do the updating in a callback.
                //
                // Update the modal's content.
                var modalTitle2 = exampleModal2.querySelector('.modal-title')
                var modalBodyInput2 = exampleModal2.querySelector('.modal-body input')

                modalTitle2.textContent = 'Delete User'
                modalBodyInput2.value = recipient2
            });
        </script>

        <!--Edit course-->
        <script>
            $("#course-id-edit").hide();
            var exampleModal = document.getElementById('editCourseModal')
            exampleModal.addEventListener('show.bs.modal', function (event) {
                // Button that triggered the modal
                var button = event.relatedTarget
                // Extract info from data-bs-* attributes
                var recipient = button.getAttribute('data-bs-courseID')
                var recipient2 = button.getAttribute('data-bs-courseName')
                var recipient3 = button.getAttribute('data-bs-department')
                var recipient4 = button.getAttribute('data-bs-courseCode')
                var recipient5 = button.getAttribute('data-bs-weekDay')
                var recipient6 = button.getAttribute('data-bs-room')
                var recipient7 = button.getAttribute('data-bs-instructor')
                var recipient8 = button.getAttribute('data-bs-startSlot')
                var recipient9 = button.getAttribute('data-bs-numbersOfSlots')
                var recipient10 = button.getAttribute('data-bs-classID')
                var recipient11 = button.getAttribute('data-bs-semester')
                var recipient12 = button.getAttribute('data-bs-schoolYear')
                var recipient13 = button.getAttribute('data-bs-group')
                var recipient14 = button.getAttribute('data-bs-lab')
                var recipient15 = button.getAttribute('data-bs-haslab')
                var recipient16 = button.getAttribute('data-bs-userID')
                // If necessary, you could initiate an AJAX request here
                // and then do the updating in a callback.
                //
                // Update the modal's content.
                var modalTitle = exampleModal.querySelector('.modal-title')
                var modalBodyInput = exampleModal.querySelector('.modal-body input')
                var modalBodyInput2 = exampleModal.querySelector('.modal-body .a-col-md-7 input')
                var modalBodyInput3 = exampleModal.querySelector('.modal-body .b-col-md-7 input')
                var modalBodyInput4 = exampleModal.querySelector('.modal-body .c-col-md-7 input')
                var modalBodyInput5 = exampleModal.querySelector('.modal-body .d-col-md-7 input')
                var modalBodyInput6 = exampleModal.querySelector('.modal-body .e-col-md-7 input')
                var modalBodyInput7 = exampleModal.querySelector('.modal-body .f-col-md-7 input')
                var modalBodyInput8 = exampleModal.querySelector('.modal-body .g-col-md-7 input')
                var modalBodyInput9 = exampleModal.querySelector('.modal-body .h-col-md-7 input')
                var modalBodyInput10 = exampleModal.querySelector('.modal-body .i-col-md-7 input')
                var modalBodyInput11 = exampleModal.querySelector('.modal-body .j-col-md-7 input')
                var modalBodyInput12 = exampleModal.querySelector('.modal-body .k-col-md-7 input')
                var modalBodyInput13 = exampleModal.querySelector('.modal-body .l-col-md-7 input')
                var modalBodyInput14 = exampleModal.querySelector('.modal-body .m-col-md-7 input')
                var modalBodyInput15 = exampleModal.querySelector('.modal-body .n-col-md-7 input')
                var modalBodyInput16 = exampleModal.querySelector('.modal-body .o-col-md-7 input')

                modalTitle.textContent = 'Edit Course'
                modalBodyInput.value = recipient
                modalBodyInput2.value = recipient2
                modalBodyInput3.value = recipient3
                modalBodyInput4.value = recipient4
                modalBodyInput5.value = recipient5
                modalBodyInput6.value = recipient6
                modalBodyInput7.value = recipient7
                modalBodyInput8.value = recipient8
                modalBodyInput9.value = recipient9
                modalBodyInput10.value = recipient10
                modalBodyInput11.value = recipient11
                modalBodyInput12.value = recipient12
                modalBodyInput13.value = recipient13
                modalBodyInput14.value = recipient14
                modalBodyInput15.value = recipient15
                modalBodyInput16.value = recipient16
            });
        </script>
        <!--Edit user-->
        <script>
            $("#user-id-edit").hide();
            $("#username-edit").hide();
            var exampleModal3 = document.getElementById('editUserModal')
            exampleModal3.addEventListener('show.bs.modal', function (event) {
                // Button that triggered the modal
                var button = event.relatedTarget
                // Extract info from data-bs-* attributes
                var recipient = button.getAttribute('data-bs-userID')
                var recipient2 = button.getAttribute('data-bs-username')
                var recipient3 = button.getAttribute('data-bs-name')
                var recipient4 = button.getAttribute('data-bs-gender')
                var recipient5 = button.getAttribute('data-bs-IUCode')
                var recipient6 = button.getAttribute('data-bs-department')
                var recipient7 = button.getAttribute('data-bs-email')
                var recipient8 = button.getAttribute('data-bs-password')
                // If necessary, you could initiate an AJAX request here
                // and then do the updating in a callback.
                //
                // Update the modal's content.
                var modalTitle = exampleModal3.querySelector('.modal-title')
                var modalBodyInput = exampleModal3.querySelector('.modal-body input')
                var modalBodyInput2 = exampleModal3.querySelector('.modal-body .a-col-md-7 input')
                var modalBodyInput3 = exampleModal3.querySelector('.modal-body .b-col-md-7 input')
                var modalBodyInput4 = exampleModal3.querySelector('.modal-body .c-col-md-7 input')
                var modalBodyInput5 = exampleModal3.querySelector('.modal-body .d-col-md-7 input')
                var modalBodyInput6 = exampleModal3.querySelector('.modal-body .e-col-md-7 input')
                var modalBodyInput7 = exampleModal3.querySelector('.modal-body .f-col-md-7 input')
                var modalBodyInput8 = exampleModal3.querySelector('.modal-body .g-col-md-7 input')
                modalTitle.textContent = 'Edit User'
                modalBodyInput.value = recipient
                modalBodyInput2.value = recipient2
                modalBodyInput3.value = recipient3
                modalBodyInput4.value = recipient4
                modalBodyInput5.value = recipient5
                modalBodyInput6.value = recipient6
                modalBodyInput7.value = recipient7
                modalBodyInput8.value = recipient8
            });
        </script>
        <script>
            const togglePassword = document.querySelector('#togglePassword');
            const password = document.querySelector('#id_password');

            togglePassword.addEventListener('click', function (e) {
                // toggle the type attribute
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                // toggle the eye slash icon
                this.classList.toggle('fa-eye-slash');
            });
        </script>
    </body>
</html>
