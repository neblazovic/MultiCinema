<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>

    <%@ page language="java" %>
    <title>Korisnik</title>    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link rel="stylesheet" href="Stilovi/main_style.css">
    <link href='//fonts.googleapis.com/css?family=Armata' rel='stylesheet'>
    <link rel="stylesheet" href="Stilovi/jquery.mCustomScrollbar.css" >
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

</head>
    <body onload="loading()">
    <input type="hidden" id="sesija" data-user="${sessionScope.user}"/>
    <div class ="pozadina_gradient">
        <div class="container">
        <%@include file="WEB-INF/jspf/KorisnikTopBar.jspf"%>
            <div id="main_korisnik" class="main_content">  
                <div class="horiz_razmak"></div>
                    <div id="login_pozadina_korisnik"></div>
                <div id="login_forma_korisnik">                        
                    <form method="post" name="login_f" action="Login_servlet">
                        <table>
                             <tr>
                                <th colspan="2">Login:</th>
                            </tr>
                        <tr>
                            <td>
                                <label>Korisnicko ime:</label>
                            </td>
                            <td>
                                <input type="text" name="username" size="15"/>
                            </td>
                                </tr>
                        <tr>
                            <td><label>Lozinka:</label></td>
                            <td><input type="password" name="password" size="15"/></td>
                        </tr><tr>
                            <th><input id="submit_button" type="submit" value="Uloguj se"/></th>
                            <th><input type="reset" value="Resetuj"/></th>
                        </tr><tr>
                            <th colspan="2">
                                <a href="#">Zaboravili ste lozinku?</a>
                            </th>
                        </tr>
                         <c:set var="postoji" value="${requestScope.postoji!=null?requestScope.postoji:'0'}"></c:set>
                    <c:set var="clanstvo" value="${requestScope.uspeh!=null?requestScope.uspeh:'false'}"></c:set>
                <c:set var="rezultat" value="${requestScope.uspesnaRezervacija!=null?requestScope.uspesnaRezervacija:'false'}"></c:set>
                    <c:set var="poruka" value="${requestScope.poruka}"></c:set>
                        <c:set var="sledeciB" value="${requestScope.sledeci_bioskop!=null?requestScope.sledeci_bioskop:'false'}"></c:set>
                    <c:set var="sledeciD" value="${requestScope.sledeci_datum!=null?requestScope.sledeci_datum:'false'}"></c:set>
                <c:set var="sledecaT" value="${requestScope.sledeca_tehnologija!=null?requestScope.sledeca_tehnologija:'false'}"></c:set>
                    <c:set var="sledeciR" value="${requestScope.sledeci_raspored!=null?requestScope.sledeci_raspored:'false'}"></c:set>
                        <c:choose>
                            <c:when test="${poruka!=null}">
                                <tr><td colspan="2" style="text-align: center; color:red;"><c:out value="${poruka}"></c:out></td></tr>
                            </c:when>
                        </c:choose>
                    </table>
                </form>
            </div>
            <div class="slider_1">
                 <%@include file="Slider.jsp"%>                      
                    </div>
                        <div class="maska"></div>
                  
                
            <div id="popup"><span>Cestitamo!!!<br><br> <b><c:out value="${sessionScope.user}"></c:out></b> , uspesno ste obavili rezervaciju. 
                Ocekujemo Vas na blagajni Vaseg omiljenog bioskopa gde mozete podici rezervisane ulaznice, najkasnije 3o minuta pre pocetka projekcije.
                    Hvala Vam sto ste koristili nas online servis.</span><br><p>Kliknite na poruku ili sacekajte <span id="time"></span> sekundi!!</p>
                        </div>
                    <div id="popupClan"><span>Cestitamo!!!<br><br> <b><c:out value="${sessionScope.user}"></c:out></b> , uspesno ste se uclanili. 
                Postali ste clan kluba <c:out value="${requestScope.uspeh}"></c:out><br>
            Hvala Vam sto ste koristili nas online servis.</span><br><p>Kliknite na poruku ili sacekajte 10 sekundi!!</p>
                </div>
                    <div id="popupPostoji">
                        <span>Vi ste vec clan kluba sa brojem kartice <c:out value="${sessionScope.klupska}"></c:out>.</span><br><br> <span>Mozete biti clan samo jednog kluba.</span><br><p>Kliknite na poruku ili sacekajte 10 sekundi!!</p>          
                    </div>
                    
                </div>
                      <%@include file="pocetni_sadrzaj.jsp"%>
                   <%@include file="WEB-INF/jspf/Footer.jspf"%> 
            </div>
        </div>
            <script>

</script>
<script>
    $(document).ready(function(){ 
    $("#resetovanje").on("click",function(){
         $("#izabraniFilm, #izabraniBioskop, #izabraniDatum, #izabranaTehnologija").val("");
         $("#klik_film").trigger("click");
     });
    function prikazi_raspored(){
        $(document).ready(function(){            
            $("#main_korisnik").load("rasporedSedista.jsp #main_raspored>*");
                
          });
      }

    var sledeci_bioskop = ${sledeciB};
    var sledeci_datum = ${sledeciD};
    var sledeca_tehnologija = ${sledecaT};
    var sledeci_raspored = ${sledeciR};
      if (sledeci_bioskop===true){                    
             $("#slider1").css({"display":"none"});
             $("#klik_bioskop").trigger("click");
      }
            if (sledeci_datum===true){                    
             $("#slider1").css({"display":"none"});
             $("#klik_datum").trigger("click");
      }
            if (sledeca_tehnologija===true){                    
             $("#slider1").css({"display":"none"});
             $("#klik_tehnika").trigger("click");
      }
            if (sledeci_raspored===true){                    
             prikazi_raspored();
      }
      
    var postoji ='${postoji}';
    var porukaUsp=${rezultat};
    var clan ='${clanstvo}';
        function hideMsg(){
           document.getElementById("popup").style.display = "none";
        }
        function hideMsgClan(){
            document.getElementById("popupClan").style.display = "none";
         }
        function hideMsgPostoji(){
            document.getElementById("popupPostoji").style.display = "none";
         }
        if(porukaUsp===true){
            document.getElementById("popup").style.display = "block";
            window.setTimeout(function(){
            hideMsg();}, 10000);
         }
        if(clan==='Vip'||clan==='Kids'||clan==='Senior'){
             document.getElementById("popupClan").style.display = "block";
             window.setTimeout(function(){
                 hideMsgClan();}, 10000);
         }
        if(postoji!=='0'){
            document.getElementById("popupPostoji").style.display = "block";
            window.setTimeout(function(){
            hideMsgPostoji();}, 10000);
         }
     $("#popup").on("click",function(){
        hideMsg(); 
     });
    $("#popupClan").on("click",function(){
        hideMsgClan(); 
     });
    $("#popupPostoji").on("click",function(){
        hideMsgPostoji(); 
     });

});

function startTimer(duration, display) {
    var start = Date.now(),
        diff,
        minutes,
        seconds;
    function timer() {
        // get the number of seconds that have elapsed since 
        // startTimer() was called
        diff = duration - (((Date.now() - start) / 1000) | 0);

        // does the same job as parseInt truncates the float
        minutes = (diff / 60) | 0;
        seconds = (diff % 60) | 0;

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;
        
    //    display.textContent = minutes + ":" + seconds;
        display.textContent = seconds; 

        if (diff <= 0) {
            // add one second so that the count down starts at the full duration
            // example 05:00 not 04:59
            start = Date.now() + 1000;
        }
    };
    // we don't want to wait a full second before the timer starts
    timer();
    setInterval(timer, 1000);
}
$(document).ready(function(){
    var desetSekundi = 10,
    display = document.querySelector('#time');
    startTimer(desetSekundi, display);
});

</script>
<script src="js/JavaScript.js"></script>
<script>
  (function($){
    $(window).on("load",function(){
      $(".prozor, .prikaz").mCustomScrollbar({
        axis:"x"
      });
    });
  })(jQuery);
    jQuery(function ($) {
  $('.slider').sss();
});

</script>                          <%--Aktiviranje slider-a--%>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

</body>
</html>