<%-- 
    Document   : Administracija_clanova
    Created on : Feb 7, 2017, 1:19:52 PM
    Author     : Nebojsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin/Clanovi</title>
        <link href='//fonts.googleapis.com/css?family=Armata' rel='stylesheet'>
        <link  rel="stylesheet" href="Stilovi/main_style.css">
    </head>
    <body onload="loading()">
    <sql:setDataSource var="bioskop"
        driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/multiCinema"
        user="root" password="" />
    <sql:query dataSource="${bioskop}"
        sql="SELECT * FROM korisnik WHERE aktivan = 1" var="aktivniKorisnici" />
        <div class ="pozadina_gradient1">
         <div class="container">   
             <%@include file="WEB-INF/jspf/AdminTopBar.jspf"%>
             <div class="main_rezervacija">
            <div class="okvirAdmin"><br/> 
                <div class="centrirani">
                <form  action="AdministracijaClanovaServlet"  method="post">  
                    <table>
                        <tr>
                            <th colspan="2"><strong>Unesite podatke o korisniku</strong></th>
                        </tr>             
                        <tr>
                            <td>
                              *  Ime:
                            </td>
                            <td>
                                <input type="text" name="ime" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                              *  Prezime:
                            </td>
                            <td>
                                <input type="text" name="prezime" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                              *  Korisnicko ime:
                            </td>
                            <td>
                                <input type="text" name="username" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                              *  Lozinka:
                            </td>
                            <td>
                                <input type="password" name="pass" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Datum rodjenja:
                            </td>
                            <td>
                                <input type="text" name="datrodj" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Adresa:
                            </td>
                            <td>
                                <input type="text" name="adresa" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                              *  E mail:
                            </td>
                            <td>
                                <input type="text" name="email" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Telefon:
                            </td>
                            <td>
                                <input type="text" name="telefon" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Grad:
                            </td>
                            <td>
                                <input type="text" name="grad" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Drzava:
                            </td>
                            <td>
                                <input type="text" name="drzava" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Kreditna:
                            </td>
                            <td>
                                <input type="text" name="kreditna" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Rola:
                            </td>
                            <td>
                                <input type="text" name="rola" size="20">
                            </td>
                        </tr>
                       
                        <tr>                        
                            <td>
                                <center>
                                    <input type="submit" name ="unos" value="Kreiraj"/>
                                </center>
                            </td>
                            <td>
                                <center>
                                    <input type="reset" value="Ponisti"/>
                                </center>
                            </td>
                        </tr>                      
                    </table>
                </form>
            </div>
        </div> 
                   
            <div class="okvirAdmin"><br/> 
                <div class="centrirani">
                <form  action="AdministracijaClanovaServlet" name="korisnik" method="get">  
                    <table>
                        <tr>
                            <th colspan="2"><strong>Brisanje clanova</strong></th>
                        </tr>      
                        <tr>
                            <td>
                                Korisnicko ime:
                            </td>
                            <td>
                                <input type="text" id="izbor" name="usernamebrisi" size="20">
                            </td>
                        </tr>
                       
                        <tr>                        
                            <td>
                                <center>
                                    <input type="submit" name="brisanje" value="Obrisi"/>
                                </center>
                            </td>
                            <td>
                                <center>
                                    <input type="reset" value="Ponisti"/>
                                </center>
                            </td>
                        </tr>                      
                    </table>
                </form>
            </div>
            </div>

                   <span class="clear"></span>
                <c:set var ="poruka" value="${requestScope.uspeh!=null?requestScope.uspeh:''}" ></c:set>
                 <div class="poruke"><c:out value="${poruka}"></c:out><span class="clear"></span></div>
                </div>            
           <%@include file="WEB-INF/jspf/Footer.jspf"%>
        </div>                        
            
        </div>
        <script src="js/JavaScript.js"></script>
    </body>
</html>
