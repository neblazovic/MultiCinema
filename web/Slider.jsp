    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>      
        <div id="slider1" class="slider">
        <img src="slike/slider/images1.jpg" />
        <img src="slike/slider/images2.jpg" />
        <img src="slike/slider/images3.jpg" />   
        <img src="slike/slider/images4.jpg" />
        <img src="slike/slider/images5.jpg" />
        <img src="slike/slider/images6.jpg" />
        <img src="slike/slider/images7.jpg" />
        <img src="slike/slider/images8.jpg" />
        <img src="slike/slider/images9.jpg" />
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <link rel="stylesheet" href="sss.css" type="text/css" media="all">
        <script src="sss.min.js"></script>
    <div class="wrapper">
        <div class="polja">
            <form  id="frm_rezervacija" method ="post" action="RezervacijaServlet">
                <div class="polje_za_izbor">
                    <input type="text" name="film" class="izbor_input" id="izabraniFilm" size="15" value="${requestScope.film}"/>
                    <input type="hidden" name="idFilma" id="idFilma" value ="${requestScope.id_filma}">
                </div>
                <div class="polje_za_izbor">
                    <input type="text"  name="bioskop" class="izbor_input" id="izabraniBioskop" value="${requestScope.bioskop}" size="15"/>
                    <input type="hidden" name="idBioskopa" id="idBioskopa" value="${requestScope.id_bioskopa}">
                </div>
                <div class="polje_za_izbor">
                    <input type="text"  name="datum" class="izbor_input" id="izabraniDatum" value="${requestScope.datum}" size="25"/>
                    <input type="hidden" name = "idDatuma" id="idDatuma" value="${requestScope.id_datuma}">
                    <input type="hidden" id="salaHid" name ="id_sale_dat" value="${requestScope.id_filma}" >
                </div>
                <div class="polje_za_izbor">
                    <input type="text"  name="tehnologija" class="izbor_input" id="izabranaTehnologija" value="${requestScope.tehnika}" size="15"/>
                    <input type="hidden"  name = "idTehnologije" id="idTehnologije" value="${requestScope.id_sale_ras}">
                </div>
                <div class="polje_za_izbor">
                    <input type="submit" class="izbor_btn" id="potvrda" size="11"  value="Dalje"/>
                    <input type="reset" style="margin-left: 0px;" class="izbor_btn" id="resetovanje" size="11" value="Reset"/>
                    <input type="button" class="izbor_btn" id="odustajanje" size="11"  value="Nazad"/>
                </div>
            </form>
                <span class="opcija">Film</span>
                <span class="opcija">Bioskop</span>
                <span class="opcija">Datum</span>
                <span class="opcija">Tehnika</span>
        </div>
        <div class="prikaz">
            <%@include  file="WEB-INF/jspf/IzborFilma.jspf" %>
            <%@include  file="WEB-INF/jspf/IzborBioskopa.jspf" %>
            <%@include  file="WEB-INF/jspf/IzborTehnologije.jspf" %>
            <%@include  file="WEB-INF/jspf/IzborDatuma.jspf" %>   
        </div>
    </div>


