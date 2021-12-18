<%-- 
    Document   : Home
    Created on : Nov 25, 2021, 11:02:03 PM
    Author     : LeeBen
--%>
<%@page import="com.onlineteaching.entities.Message"%>
<%@page import="com.onlineteaching.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("Login.jsp");
    }

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
        <link rel="stylesheet" href="css/home.css?v=1">
        <script src="https://kit.fontawesome.com/7c428afa8c.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <!--navbar-->
        <div class="sidebar close">
            <div class="logo-details">
                <i class='bx bxl-c-plus-plus'></i>
                <span class="logo_name">IU OTM</span>
            </div>
            <ul class="nav-links">
                <li>
                    <a href="#">
                        <i class='bx bx-grid-alt' ></i>
                        <span class="link_name">Dashboard</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="#">Dashboard</a></li>
                    </ul>
                </li>
                <li>
                    <div class="iocn-link">
                        <a href="#">
                            <i class='bx bx-collection' ></i>
                            <span class="link_name">Category</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow' ></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name" href="#">Category</a></li>
                        <li><a href="#">HTML & CSS</a></li>
                        <li><a href="#">JavaScript</a></li>
                        <li><a href="#">PHP & MySQL</a></li>
                    </ul>
                </li>
                <li>
                    <div class="iocn-link">
                        <a href="#">
                            <i class='bx bx-book-alt' ></i>
                            <span class="link_name">Posts</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow' ></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name" href="#">Posts</a></li>
                        <li><a href="#">Web Design</a></li>
                        <li><a href="#">Login Form</a></li>
                        <li><a href="#">Card Design</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-pie-chart-alt-2' ></i>
                        <span class="link_name">Analytics</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="#">Analytics</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-line-chart' ></i>
                        <span class="link_name">Chart</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="#">Chart</a></li>
                    </ul>
                </li>
                <li>
                    <div class="iocn-link">
                        <a href="#">
                            <i class='bx bx-plug' ></i>
                            <span class="link_name">Plugins</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow' ></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name" href="#">Plugins</a></li>
                        <li><a href="#">UI Face</a></li>
                        <li><a href="#">Pigments</a></li>
                        <li><a href="#">Box Icons</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-compass' ></i>
                        <span class="link_name">Explore</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="#">Explore</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-history'></i>
                        <span class="link_name">History</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="#">History</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-cog' ></i>
                        <span class="link_name">Setting</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="#">Setting</a></li>
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
                <i class='bx bx-menu' ></i>

                <!--profile modal-->

                <!-- Modal -->
                <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                                    <td><%= user.getDepartment()%></td>
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
                                                    <td><input type="text" class="form-control" name="gender" value="<%= user.getGender()%>"</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">IUCode:</th>
                                                    <td><input type="text" class="form-control" name="IUCode" value="<%= user.getIUCode()%>"</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Department:</th>
                                                    <td><input type="text" class="form-control" name="department" value="<%= user.getDepartment()%>"</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Password:</th>
                                                    <td><input type="password" class="form-control" name="password" value="<%= user.getPassword()%>"</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Change profile picture:</th>
                                                    <td><input type="file" class="form-control" name="profile"</td>
                                                </tr>
                                            </table>
                                            <div class="container">
                                                <button type="submit" class="btn btn-outline-primary">Save</button>
                                            </div>
                                        </form>
                                    </div>
                                    <!--end of profile modal-->

                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
                            </div>
                        </div>
                    </div>
                </div>
                <span class="text">
                    Welcome <%= user.getName()%>!
                </span>
            </div>
        </section>
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

            });
        </script>
    </body>
</html>
