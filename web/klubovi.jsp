<%-- 
    Document   : klubovi
    Created on : Jan 8, 2017, 10:41:49 PM
    Author     : Nebojsa
--%>


<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    sql="SELECT * FROM klub" var="sviKlubovi" />
<div class="podaciOKlubovima">
    <c:forEach var="k" items="${sviKlubovi.rows}">
    <div class="podaciOKlubu">
        <div class="klubovi">
            <form method="post" action="KluboviServlet"><button type="submit"><img src="${k.link_slike}" alt="img.jpg"></button>
                <input type="hidden" name="klub" value="${k.nazivkluba}"/>
                <input type="hidden" name="id" value="${k.idkluba}"/>
            </form>

        </div>
        <div class="radnja bioskopi">
                <span class="brSalaSpan">Klub:   ${k.nazivkluba}</span>
                <span class="brSalaSpan">Pogodnosti:  ${k.pogodnosti}</span>
                <span class="brSalaSpan">Clanarina:   ${k.Cena}</span>
                <div class="reditelj"><span class="clear"></span>
            </div>
        </div>
    </div>
    </c:forEach>
</div>