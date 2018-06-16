
<!DOCTYPE html>
    <%@ page language="java" %>
<html>
<head>       
    <title>Top Cinema</title>
    <link href='//fonts.googleapis.com/css?family=Armata' rel='stylesheet'>
    <link rel="stylesheet" href="Stilovi/main_style.css">
    <link rel="stylesheet" href="Stilovi/jquery.mCustomScrollbar.css" >   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    </head>
    <body onload="loading()">
    <div class ="pozadina_gradient">
        <div class="container">  
        <%@include file="WEB-INF/jspf/TopBar.jspf"%>
            <div class="main_content">  
                <div class="horiz_razmak"></div>
                    <div id="login_pozadina"></div>
                <div id="login_forma">                        
            <form method="post" name="login_f" action="Login_servlet" onsubmit="return validateForm()">
                <table>
                    <tr><th colspan="2">Login:</th></tr>
                        <tr>
                            <td><label>Korisnicko ime:</label></td>
                            <td><input type="text" name="username" size="15"/></td>
                        </tr><tr>
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
                    <c:set var="poruka" value="${requestScope.poruka}"></c:set>
                <c:choose>
                    <c:when test="${poruka!=null}">
                        <tr><td colspan="2" style="text-align: center; color:red;"><c:out value="${poruka}"></c:out></td></tr>
                    </c:when>
                </c:choose>
                    </table>
                        </form>                        
                    </div>
                <div class="slider_1">
                    <jsp:include page="Slider.jsp" />
                </div>
                    <div id="popupKlub">
                        <span>Molimo Vas da se prethodno registrujete.<br>Morate biti registrovani korisnik da bi mogli da se uclanite u klub</span>
                        <br><p>Kliknite na poruku ili sacekajte <span id="time"></span> sekundi!!</p>             
                    </div>
            <div class="maska"></div>
                <div class="sadrzaj">
                    <jsp:include page="pocetni_sadrzaj.jsp" />
                </div>
                    <jsp:include page="WEB-INF/jspf/Footer.jspf" />
            </div>
        </div>
    </div>
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/JavaScript.js"></script>   
    <script src="sss.min.js"></script>
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
</script>
<script>
    function hideMsgKlub(){
       document.getElementById("popupKlub").style.display = "none";
    }
    $("#main_klub_index").parent().on("click",function(){      
        $("#popupKlub").css({"display":"block"});        
         window.setTimeout(function(){
             hideMsgKlub();}, 10000);
     });
    $("#popupKlub").on("click",function(){
        hideMsgKlub(); 
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
</body>
</html>