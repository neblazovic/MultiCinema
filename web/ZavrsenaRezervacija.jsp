<%-- 
    Document   : ZavrsenaRezervacija
    Created on : Feb 2, 2017, 4:16:04 PM
    Author     : Nebojsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        
    <link rel="stylesheet" href="Stilovi/main_style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cestitamo!!!</title>
    </head>
    <body>
         <div id="wraper">
             <span>Cestitamo!!!<br> <b><c:out value="${sessionScope.user}"></c:out></b> , uspesno ste obavili rezervaciju. 
                Ocekujemo Vas na blagajni Vaseg omiljenog bioskopa gde mozete podici rezervisane ulaznice, najkasnije 3o minuta pre pocetka projekcije.
                Hvala Vam sto ste koristili nas online servis.</span><br/>
                <button id="ok" onclick="goBack()"><b>NASTAVITE</b></button>
        </div>
    </body>

