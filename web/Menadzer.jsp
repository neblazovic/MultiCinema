<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Menadzer</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link href='//fonts.googleapis.com/css?family=Armata' rel='stylesheet'>
    <link rel="stylesheet" href="Stilovi/main_style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>    
    <div class ="pozadina_gradient1">
        <div class="container">
        <%@include file="WEB-INF/jspf/MenadzerTopBar.jspf"%> 
            <div id="main_content">  
            <div id="adminWrapper" class= "main_rezervacija">
        <span class="poruke"> <c:out value="${requestScope.uspeh ne null?requestScope.uspeh:'Unesite podatke'}"></c:out></span>
            <div id="menadzerOkvir" class="okvirAdmin"><br/> 
                <div  class="centrirani">
                <form action="MenadzerServlet" method="post">  
                    <table>                    
                        <tr>
                            <th colspan="2"><strong>Zakazite projekciju</strong></th>
                        </tr>               
                        <tr>
                            <td>
                                Id filma:
                            </td>
                            <td>
                                <input type="text" name="film" size="20"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Id bioskopa:
                            </td>
                            <td>
                                <input type="text" name="bioskop" size="20"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Id sale:
                            </td>
                            <td>
                                <input type="text" name="sala" size="20"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Id tehnologije:
                            </td>
                            <td>
                            <input type="text" name="tehnologija" size="20"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Termin:
                            </td>
                            <td>
                                <input type="text" name="vreme" size="20" placeholder="yyyy-MM-dd hh:mm:ss"/>
                            </td>
                        </tr>
                        <tr>                        
                            <td>
                                <center>
                                    <input type="submit"name="unos" value="Zakazi"/>
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
                <div id="horiz_razmak"></div>
                </div>
            </div>
            <script src="js/JavaScript.js"></script> 
</body>
</html>