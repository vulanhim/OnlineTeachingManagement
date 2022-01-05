<%-- 
    Document   : show_post_page
    Created on : Jan 6, 2022, 4:07:23 AM
    Author     : LeeBen
--%>
<%
  int postID = Integer.parseInt(request.getParameter("postID"));
%>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%= postID %>
    </body>
</html>
