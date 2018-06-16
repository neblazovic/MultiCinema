<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin/bioskopi</title>
        <link href='//fonts.googleapis.com/css?family=Armata' rel='stylesheet'>
        <link  rel="stylesheet" href="Stilovi/main_style.css">
    </head>
    <body onload="loading()">
        <div class ="pozadina_gradient1">
         <div class="container">   
             <%@include file="WEB-INF/jspf/AdminTopBar.jspf"%>
             <div class= "main_rezervacija">
                <div class="okvirAdmin"><br/> 
                <div class="centrirani">
                <form  action="AdministracijaSaleServlet" name="sala" method="post">  
                    <table>
                        <tr>
                            <th colspan="2"><strong>Unesite podatke o sedistima u sali</strong></th>
                        </tr>             
                        <tr>
                            <td>
                                ID sale:
                            </td>
                            <td>
                                <input type="text" name="id_sale" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Naziv sale:
                            </td>
                            <td>
                                <input type="text" name="naziv_sale" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Broj redova:
                            </td>
                            <td>
                                <input type="text" name="redovi" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Broj sedista:
                            </td>
                            <td>
                                <input type="text" name="br_sedista" size="20">
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
            <div class="okvirAdmin"><br/> 
                <div class="centrirani">
                <form  action="AdministracijaBioskopaServlet" name="bioskop" method="post">  
                    <table>
                    
                        <tr>
                            <th colspan="2"><strong>Unesite podatke o bioskopu</strong></th>
                        </tr>       
                        <tr>
                            <td>
                                Naziv bioskopa:
                            </td>
                            <td>
                                <input type="text" name="naziv_bioskopa" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Adresa bioskopa:
                            </td>
                            <td>
                                <input type="text" name="adresa" size="20">
                            </td>
                        </tr>
                       
                        <tr>
                            <td>
                                Broj sala:
                            </td>
                            <td>
                                <input type="text" name="broj_sala" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="file" name="lokacija_slike" size="15">
                            </td>
                        </tr>
                        <tr>                        
                            <td>
                                <input type="submit" value="Sacuvaj"/>
                            </td>
                            <td>
                                <input type="reset" value="Ponisti"/>
                            </td>
                        </tr>                      
                    </table>
                </form>
            </div>
            </div>  
            <div class="okvirAdmin"><br/> 
                <div class="centrirani">
                <form  action="AdministracijaSaleServlet" name="sala" method="get">  
                    <table>
                        <tr>
                            <th colspan="2"><strong>Brisanje sale</strong></th>
                        </tr>              
                        <tr>
                            <td>
                                ID sale:
                            </td>
                            <td>
                                <input type="text" name="id_sale" size="20">
                            </td>
                        </tr>
                        
                       
                        <tr>                        
                            <td>
                                <center>
                                    <input type="submit" value="Obrisi"/>
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
                <form  action="AdministracijaBioskopaServlet" name="bioskop" method="get">  
                    <table>
                        <tr>
                            <th colspan="2"><strong>Brisanje bioskopa</strong></th>
                        </tr>      
                        <tr>
                            <td>
                                Naziv bioskopa:
                            </td>
                            <td>
                                <input type="text" name="naziv_bioskopa" size="20">
                            </td>
                        </tr>
                       
                        <tr>                        
                            <td>
                                <center>
                                    <input type="submit" value="Obrisi"/>
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
                 <div class="poruke"><c:out value="${poruka}"></c:out></div>
            </div>            
           <%@include file="WEB-INF/jspf/Footer.jspf"%>
        </div>                        
            
        </div>
        <script src="js/JavaScript.js"></script>
    </body>
</html>
