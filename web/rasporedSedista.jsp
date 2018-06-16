<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <link href='//fonts.googleapis.com/css?family=Armata' rel='stylesheet'>
        <link rel="stylesheet" href="Stilovi/main_style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Raspored sedista</title>
        <link  rel="stylesheet" href="Stilovi/check_box_style.css">   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    
    </head>
    <body onload="loading()">
        <div class ="pozadina_gradient1">
            <div class="container">
                <%@include file="WEB-INF/jspf/RezervacijaTopBar.jspf"%>   
                    <div class="okvirSale">
                        <div class="main_content" id="main_raspored">
                    <c:set var="sedista" value="${requestScope.sedista}"/>                     <%-- kolekcija sedista--%>
                <c:set var="br_mesta_u_redu" value="${requestScope.brSedista}"></c:set> 
                    <c:set var="br_redova" value="${requestScope.brRedova}"></c:set>  
                        <c:set var="mesto_u_redu" value="0"></c:set>                           <%--  pocetna pozicija brojaca u redu--%>
                            <c:set var="broj_reda" value="1"></c:set>                          <%--pocetna pozicija brojaca redova--%>                   
                        <form action="KonacnaRezervacijaServlet" method="get">
                    <div class="preostali_koraci">
                <div class="korak" >
                    <input type="text" name="izborFilma" value="${requestScope.film}" size="15"/>                   
                        <input type="hidden"  name="id_filma" value="${requestScope.id_filma}"/>
                            Film:
                        <input type="text"  name="izborSale" value="${requestScope.id_sale}" size="15"/>
                            Sala:
                        <input type="text"  name="izborDatuma" value="${requestScope.datum}" size="15"/>
                            <input type="hidden"  name="id_datuma" value="${requestScope.id_datuma}"/>
                                Termin:
                            </div>
                        <div class="korak" >
                             <input type="text" name="izborBioskopa" value="${requestScope.bioskop}" size="15"/>                                       
                        <input type="hidden"  name="id_bioskopa" value="${requestScope.id_bioskopa}"/>
                                Bioskop:
                            <input type="text" name="izborTehnike" value="${requestScope.tehnika}" size="15"/>                                        
                        <input type="hidden"  name="id_tehnike" value="${requestScope.id_tehnike}"/>
                            Tehnika:
                </div>
            <div class="brojeviSedista" >
        <textarea rows="2" cols="20" name="izborMesta"></textarea>
            <span class="sp">Mesta:</span>
                <input type="hidden" name="id_sedista" id="id_sedista"/>
                   </div>
                       <input type="button" value="Povratak" class="dugme" onclick="goBack()" />
                    <input type="reset" id="ponisti" value="Ponisti" class="dugme"/>
                <input type="submit"  id="nastavak" value="Nastavi"  class="dugme"/>
            <div class="legenda">
                <div class="invalidsko boja"><span>Invalidsko</span></div> 
                    <div class="zauzeto boja"><span>Zauzeto</span></div>    
                        <div class="odabrano boja" ><span>Odabrano</span></div>     
                             <div class="slobodno boja" ><span>Slobodno</span></div>   
                    </div>
                        </div>
                    <div class="horiz_razmak"></div>
                    
                    <div id="prozor" class="main_content">
                <hr/>
                    <div class="center">
                <div class="red">
             <c:forEach var="sediste" items="${sedista}">                
        <c:choose>     
            <c:when test="${ br_mesta_u_redu == mesto_u_redu+1 }">
                </div>
                <span class="oznakaReda">${broj_reda}</span>       
                    <div class="red">
                        <c:set var="broj_reda" value="${broj_reda+1}"></c:set> 
                    <c:set var="mesto_u_redu" value="0"></c:set>   
                </c:when>
            <c:otherwise>
                <div class="sediste">
                    <input type="checkbox" value="${sediste.idSedista}" id="${sediste.idSedista}"  name="check"
                        data-idsedista="${sediste.idSedista}" data-brojsedista="${sediste.brojSedista}" 
                          data-zauzeto="${sediste.zauzeto}" data-invalidsko="${sediste.invalidsko}" 
                      data-odabrano="${sediste.odabrano}" />
                    <label for="${sediste.idSedista}"></label>           
                </div>
                     <c:set var="mesto_u_redu" value="${mesto_u_redu+1}"></c:set>
                     
                         <c:choose>
                            <c:when test="${mesto_u_redu eq br_mesta_u_redu/2}">
                                <div class="prolaz"></div>
                            </c:when>                             
                         </c:choose>                    
                    </c:otherwise>
                </c:choose>  
            </c:forEach>
                </div>
                    </div>
                </div>
                        </form>
                    </div> 
                </div>
               </div>
            </div>
        <script src="js/JavaScript.js"></script>
    </body>
</html>
