<%-- 
    Document   : Error
    Created on : Jan 17, 2017, 2:12:25 PM
    Author     : Nebojsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <jsp:useBean id="film" scope="page" class="beans.Film" />
        <h1>${requestScope.greska}</h1>
    </body>
</html>
