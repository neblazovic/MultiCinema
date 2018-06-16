<%-- 
    Document   : Admin
    Created on : Jan 6, 2017, 9:21:22 PM
    Author     : Nebojsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <link href='//fonts.googleapis.com/css?family=Armata' rel='stylesheet'>
    <link rel="stylesheet" href="Stilovi/main_style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
    </head>
    <body>
            <div class ="pozadina_gradient1">
        <div class="container">
        <%@include file="WEB-INF/jspf/AdminTopBar.jspf"%>        
            <div class="horiz_razmak"></div>
                <div class = "main_admin">
                
                </div>
                <%@include file="WEB-INF/jspf/Footer.jspf"%>
        </div>
        </div>
    <script src="js/JavaScript.js"></script>
    <script src="js/Log_in_out.js"></script>
    </body>
</html>
