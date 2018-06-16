<%-- 
    Document   : Filmovi
    Created on : Feb 6, 2017, 3:29:51 PM
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
    sql="SELECT * FROM film WHERE aktuelan = 2" var="aktuelniFilmovi" />
<sql:query dataSource="${bioskop}"
    sql="SELECT * FROM film WHERE aktuelan = 3" var="filmoviUNajavi" />
<div class="podaciOFilmovima reper">
    <c:forEach var="f" items="${aktuelniFilmovi.rows}">
    <div class="podaciOFilmu">
        <div class="casting">
            <div class="glumci">
                <span>Uloge:</span>
                <p>${f.uloge}</p>
            </div>
            <div class="reditelj">                
                <span>Reditelj:</span>
                <p>${f.reditelj}</p>
            </div>
        </div>
        <div class="radnja">
            <span>${f.nazivfilma}</span>
                <p>${f.radnja}</p>
        </div>
    </div>
    </c:forEach>
</div>
<div class="podaciOFilmovima uskoro">
    <c:forEach var="n" items="${filmoviUNajavi.rows}">
        <div class="podaciOFilmu">
            <div class="casting">
                <div class="glumci">
                    <span>Uloge:</span>
                    <p>${n.uloge}</p>
                </div>
                <div class="reditelj">                
                    <span>Reditelj:</span>
                    <p>${n.reditelj}</p>
                </div>
            </div>
            <div class="radnja">
                <span>${n.nazivfilma}</span>
                    <p>${n.radnja}</p>
            </div>
        </div>
</c:forEach>
</div>