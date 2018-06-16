<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registracija</title>
        <link href='//fonts.googleapis.com/css?family=Armata' rel='stylesheet'>
        <link  rel="stylesheet" href="Stilovi/main_style.css">
    </head>
    <body onload="loading()">
        <div class ="pozadina_gradient1">
         <div class="container">   
             <%@include file="WEB-INF/jspf/TopBar.jspf"%>
             <div id="main_content">
            <div class="okvir"><br/> 
                <div class="centrirani">
                <form  action="Registracija_servlet" method="post">  
                    <table>
                    <strong>Molimo Vas da unesete podatke</strong>
                    <%
                         String poruka=(String)request.getAttribute("poruka");
                         if(poruka!=null&&poruka.length()>0){
                     %>                
                        <tr>
                            <td colspan="2">
                                <font color="red">
                                  <%=poruka%>
                                </font>
                            </td>
                        </tr>
                    <%}%> 
                        <tr>
                            <td>Ime:</td><td><input type="text" name="ime"/></td>
                        </tr>   
                        <tr>                        
                            <td>Prezime:</td><td><input type="text" name="prezime"/></td>
                        </tr>  
                         <tr>
                            <td>Korisnicko ime:</td><td><input type="text" name="username"/></td>
                        </tr>  
                        <tr>                        
                            <td>Lozinka:</td><td><input type="password" name="password"/></td>
                        </tr> 
                         <tr>
                            <td>Adresa:</td><td><input type="text" name="adress"/></td>
                        </tr>   
                        <tr>                        
                            <td>Grad:</td><td><input type="text" name="grad"/></td>
                        </tr>   
                        <tr>                        
                            <td>Drzava:</td><td><input type="text" name="drzava"/></td>
                        </tr>  
                        <tr>                        
                            <td>Datum rodjenja:</td><td><input type="text" name="datum"/></td>
                        </tr> 
                         <tr>
                            <td>Kreditna kartica:</td><td><input type="text" name="kreditna"/></td>
                        </tr> 
                        <tr>
                            <td>Klupska karta:</td><td><input type="text" name="klupska"/></td>
                        </tr>   
                        <tr>                        
                            <td>E-mail:</td><td><input type="text" name="email"/></td>
                        </tr> 
                        <tr>                        
                            <td>
                                <center>
                                    <input type="submit" value="Registracija"/>
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
            </div>
        </div>                        
            <%@include file="WEB-INF/jspf/Footer.jspf"%>
        </div>
        <script src="js/JavaScript.js"></script>
    </body>
</html>
