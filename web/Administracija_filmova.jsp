<%-- 
    Document   : Administracija_filmova
    Created on : Feb 6, 2017, 8:14:47 PM
    Author     : Nebojsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin/Filmovi</title>
        <link href='//fonts.googleapis.com/css?family=Armata' rel='stylesheet'>
        <link  rel="stylesheet" href="Stilovi/main_style.css">
    </head>
    <body onload="loading()">
        <div class ="pozadina_gradient1">
            <div class="container">   
                <%@include file="WEB-INF/jspf/AdminTopBar.jspf"%>
                    <div id="adminWrapper" class= "main_rezervacija">
                        <span class="poruke"><c:out value="${requestScope.uspeh ne null?requestScope.uspeh:null}"></c:out></span>
                <div id="adminOkvir" class="okvirAdmin"><br/> 
            <div  class="centrirani">
                <form  action="AdministracijaFilmovaServlet"  method="post">  
                    <table>                    
                        <tr>
                            <th colspan="2"><strong>Unesite podatke o filmu</strong></th>
                        </tr>               
                        <tr>
                            <td>
                                naziv filma:
                            </td>
                            <td>
                                <input type="text" name="naziv" size="30">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Zanr:
                            </td>
                            <td>
                                <input type="text" name="zanr" size="30">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Link trejlera:
                            </td>
                            <td>
                                <input type="text" name="trejler" size="30">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Link filma:
                            </td>
                            <td>
                                <input type="text" name="link_filma" size="30">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Link postera:
                            </td>
                            <td>
                                <input type="text" name="link_postera" size="30">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Uloge:
                            </td>
                            <td>
                                <input type="text" name="uloge" size="30">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Reditelj filma:
                            </td>
                            <td>
                                <input type="text" name="reditelj" size="30">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Radnja filma:
                            </td>
                            <td>
                                <textarea type="text" name="radnja" cols="23" rows="4" ></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Aktuelan:
                            </td>
                            <td>
                                <input type="text" name="aktuelan" size="30">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Rating:
                            </td>
                            <td>
                                <input type="text" name="rating" size="30">
                            </td>
                        </tr>
                       
                        <tr>                        
                            <td>
                                <center>
                                    <input type="submit" value="Kreiraj"/>
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
                </div>            
           <%@include file="WEB-INF/jspf/Footer.jspf"%>
        </div>                        
            
        </div>
        <script src="js/JavaScript.js"></script>
    </body>
</html>
 
