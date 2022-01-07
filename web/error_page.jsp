<%-- 
    Document   : error_page
    Created on : Dec 16, 2021, 1:34:11 AM
    Author     : LeeBen
--%>
<%@page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container text-center">
            <img src="img/error.png" class="img-fluid" >
            <h3 class="display-4">Sorry ! Something went wrong...</h3>
            <br>
            <a href="Home.jsp" class="btn-danger primary-background btn-lg mt-3" style="text-decoration: none;">Home</a>
            <br><br>
            <%= exception%>
            </body>
            </html>
