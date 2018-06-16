<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <link id="themecss" rel="stylesheet" type="text/css" href="//www.shieldui.com/shared/components/latest/css/light/all.min.css" />
    <script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
    <link rel="stylesheet" href="Stilovi/main_style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vasi podaci</title>        
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class ="pozadina_gradient1"> 
         <div class="containerForma"> 
            <div class="okvir">
                <form name="konacna" method="post" action="KonacnaRezervacijaServlet">
                    <table>
                        <tr>
                            <th colspan="2">Rezervacija</th>
                        </tr>
                        <tr>
                            <td>Korisnicko ime</td>
                            <td><input type="text" name="user" disabled= "true" value="${sessionScope.user}"/></td>
                        </tr>
                        <tr>
                            <td>Ime i prezime</td>
                            <td><input type="text" name="ime" disabled= "true" value="${sessionScope.ime} ${sessionScope.prezime}"/></td>
                        </tr>
                        <tr>
                            <td>Clanska karta</td>
                            <td><input type="text" name="klub" disabled= "true" value="${sessionScope.klupska}"/></td>
                        </tr>
                        <tr>
                            <td>Film</td>
                            <td><input type="text" name="film" disabled= "true" value="${requestScope.izborFilma}"/></td>
                            <input type="hidden" name="id_filma" value="${requestScope.id_filma}"/>
                        </tr> 
                        <tr>
                            <td>Bioskop</td>
                            <td><input type="text" name="bioskop" disabled= "true" value="${requestScope.izborBioskopa}"/></td>
                            <input type="hidden" name="idBioskopa" value="${requestScope.id_bioskopa}"/>
                        </tr>
                        <tr>
                            <td>Sala</td>
                            <td><input type="text" name="sala"  value="${requestScope.id_sale_dat}"/></td>
                        </tr>  
                        <tr>
                            <td>Datum i vreme</td>
                            <td><input type="text" disabled= "true" name="datum" value="${requestScope.izborDatuma}"/></td>
                            <input type="hidden" name="id_datuma" value="${requestScope.id_datuma}"/>
                        </tr>  
                        <tr>
                            <td>Sedista</td>
                           <td> <textarea disabled= "true" name="sedista">${requestScope.izborMesta}</textarea></td>
                            <input type="hidden" name="lista_cb" value="${requestScope.listaCB}"/>
                        </tr>    
                        <tr>
                            <th><input type="submit" id="potvrda_rezervacije" name="potvrda" value="Rezervisi"/></th>
                          <th><input type="reset" name="otkaz" value="Odustani" onclick="goBack()"/></th>
                        </tr>     
                        <tr>
                            <th colspan="2">
                                <span id = "kod">Ovaj kod mozete snimiti mobilnim telefonom i koristiti umesto ulaznice</span>
                            </th>
                        </tr>
                </table>
            </form>                     
                <div class="qr_container">
                    <div id="qrcode" class="qrcode"></div>
                    <div class="qrcode-config">
                        <h3>Text Value</h3>
                        <textarea style="width: 160px;" id="textValue" escape="false" >Ime:${sessionScope.ime}
Prezime:${sessionScope.prezime}
Clanska karta:${sessionScope.klupska}
Film:${requestScope.izborFilma}
Bioskop:${requestScope.izborBioskopa}
Sala:${requestScope.id_sale_dat}
Termin:${requestScope.izborDatuma}
Sedista:${requestScope.izborMesta}</textarea>
                        <h3>Options</h3>
                        <div class="clearfix">
                            <label for="size">Size:</label>
                            <input type="text" id="size" value="250" /> 
                        </div>
                        <div class="clearfix">
                            <label for="mode">Mode:</label>
                            <select id="mode">
                                <option value="Byte">Byte</option>
                                <option value="Alphanumeric">Alphanumeric</option>
                                <option value="Numeric">Numeric</option>
                            </select>
                        </div>
                        <div class="clearfix">
                            <label for="error">Error Level:</label>
                            <select id="error">
                                <option value="L">L</option>
                                <option value="M">M</option>
                                <option value="H">H</option>
                                <option value="Q">Q</option>
                            </select>
                        </div>
                        <div class="clearfix">
                            <div class="exception"></div>
                        </div>
                    </div>
                        <div class="pokrivac"></div>

                </div>   
                </div>
        </div>
        </div>
            <%@include file="WEB-INF/jspf/Footer.jspf"%>
                    <style type="text/css" scoped>
    .qr_container
    {
        max-width: 600px;
        margin-left: auto;
        margin-right: auto;
        display: inline-block;
    }
    .qrcode
    {
        display: inline-block;
    }
    .qrcode-config
    {
        display: none;
        padding: 10px;
    }
        .qrcode-config h3
        {
            margin-bottom: 10px;
            
            display: none;
        }
        .qrcode-config textarea
        {
            display: none;
            height: 60px;
            resize: none;
            margin-bottom: 20px;
        }
        .qrcode-config label
        {
            float: left;
            width: 75px;
            
            
            display: none;
        }
    .exception
    {
        color: red;
        display: none;
    }
    .clearfix{
        display: none;
    }
</style>
        <script src="js/JavaScript.js"></script>
        <script type="text/javascript">
    jQuery(function ($) {
        var textValue = $("#textValue").shieldTextBox({
            events: {
                change: update
            }
        }).swidget();
        var size = $("#size").shieldNumericTextBox({
            min: 100,
            max: 350,
            step: 10,
            events: {
                change: update
            }
        }).swidget();
        var mode = $("#mode").shieldDropDown({
            events: {
                select: update
            }
        }).swidget();
        var error = $("#error").shieldDropDown({
            events: {
                select: update
            }
        }).swidget();
        var qrcode = null;
        function update() {
            if (qrcode) {
                qrcode.destroy();
            }
            $(".exception").html("");
            try {
                qrcode = $("#qrcode").shieldQRcode({
                    value: textValue.value(),
                    size: size.value(),
                    errorLevel: error.value(),
                    mode: mode.value()
                }).swidget();
            }
            catch (err) {
                $(".exception").html(err);
                return;
            }
        }
        update();
    });
</script>

    </body>
</html>


