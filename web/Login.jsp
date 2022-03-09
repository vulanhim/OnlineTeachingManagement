<%-- 
    Document   : Login
    Created on : Nov 25, 2021, 10:43:32 PM
    Author     : LeeBen
--%>

<%@page import="com.onlineteaching.entities.User"%>
<%@page import="com.onlineteaching.entities.Message"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user != null) {
        response.sendRedirect("Home.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IU Online Teaching Management</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel = "stylesheet" href = "css/login.css?v=1.1">
        <script src="https://kit.fontawesome.com/7c428afa8c.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="container">
            <input type="checkbox" id="flip"> 
            <div class="cover">
                <div class="front">
                    <img src="img/IU1.jpg" alt="">
                    <div class="text">
                        <span class="text-1">Every new friend is a <br> new adventure</span>
                        <span class="text-2">Let's get connected</span>
                    </div>
                </div>
                <div class="back">
                    <img class="backImg" src="img/IU2.jpg" alt="">
                    <div class="text">
                        <span class="text-1">Complete miles of journey <br> with one step</span>
                        <span class="text-2">Let's get started</span>
                    </div>
                </div>
            </div>
            <div class="forms">
                <div class='form-content'>
                    <div class="login-form">
                        <div class="title">Login</div>
                        <form action="LoginServlet" method="post">
                            <div class="input-boxes">
                                <div class="input-box">
                                    <i class="fas fa-envelope"></i>
                                    <input type="text" name="username" placeholder="Enter your username" required>
                                </div>
                                <div class="input-box">
                                    <i class="fas fa-lock"></i>
                                    <input type="password" name="password" placeholder="Enter your password" required>
                                </div>
                                <%
                                    Message m = (Message) session.getAttribute("msg");
                                    if (m != null) {
                                %>    
                                <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                                <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                </symbol>
                                </svg>
                                <div class="alert <%=m.getCssClass()%> d-flex align-items-center" role="alert">
                                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                                    <div>
                                        <%=m.getContent()%>
                                    </div>
                                </div>
                                <%
                                        session.removeAttribute("msg");
                                    }
                                %>

                                <!--<div class="text"><a href="#">Forgot password?</a></div>-->
                                <div class="button input-box">
                                    <input type="submit" value="Login">
                                </div>
                                <div class="text sign-up-text">Don't have an account? <label for='flip'>Signup now</label></div>
                            </div>
                        </form>
                    </div>
                    <div class="signup-form">
                        <div class="title">Signup</div>
                        <form id="reg-form" action="RegisterServlet" method="post">
                            <div class="input-boxes">
                                <div class="input-box">
                                    <i class="fas fa-user"></i> 
                                    <input type="text" name="name" placeholder="Enter your name" required>
                                </div>
                                <div class="input-box">
                                    <i class="fas fa-envelope"></i>
                                    <input type="text" name="username" placeholder="Enter your username" required>
                                </div>
                                <div class="input-box">
                                    <i class="fas fa-lock"></i>
                                    <input type="password" name="password" placeholder="Enter your password" required>
                                </div>
                                <div class="loader-box text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait..</h4>
                                </div>
                                <div class="button input-box">
                                    <input id="submit-btn" type="submit" value="Register">
                                </div>
                                <div class="text sign-up-text">Already have an account? <label for='flip'>Login now</label></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--javascripts-->

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js?v=0" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded...")

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("#loader").show();
//                   send register servlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

                            $("#submit-btn").show();
                            $("#loader").hide();

                            if (data.trim() === 'done')
                            {
                                swal("Registered successfully..Please login!")
                                        .then((value) => {
                                            window.location = "Login.jsp"
                                        });
                            } else
                            {

                                swal("Account already exists");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data)
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("Something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            })
        </script>
    </body>
</html>
