<%-- 
    Document   : Bioskopi
    Created on : Feb 9, 2017, 9:34:42 AM
    Author     : Nebojsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>  
<%@page import="java.sql.Driver"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="beans.*"%>
<%@page import="servlets.*"%>
<sql:setDataSource var="bioskop"
    driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/multiCinema"
    user="root" password="" />
<sql:query dataSource="${bioskop}"
    sql="SELECT * FROM bioskop" var="sviBioskopi" />
<div class="podaciOBioskopima">
    <c:forEach var="b" items="${sviBioskopi.rows}">
    <div class="podaciOBioskopu">
        <div class="casting">
            <img src="${b.link_slike}" alt="img.jpg">
        </div>
        <div class="radnja bioskopi">
                <span class="brSalaSpan">Naziv:   ${b.nazivbioskopa}</span>
                <span class="brSalaSpan">Broj sala:  ${b.brojsala}</span>
                <span class="brSalaSpan">Adresa:   ${b.adresa}</span>
            <div class="reditelj">
            </div>
        </div>
    </div>
    </c:forEach>
</div>
