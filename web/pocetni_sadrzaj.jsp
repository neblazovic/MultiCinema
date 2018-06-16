
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>  
<%@page import="java.sql.Driver"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="beans.*"%>
<%@page import="servlets.*"%>
<sql:setDataSource var="bioskop"
    driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/multiCinema"
    user="root" password="" />
<sql:query dataSource="${bioskop}"
    sql="SELECT * FROM film WHERE aktuelan = 2" var="aktuelniFilmovi" />
<sql:query dataSource="${bioskop}"
    sql="SELECT * FROM film WHERE aktuelan = 3" var="filmoviUNajavi" />

<div class="repertoar"><h4 id="repertoar">REPERTOAR</h4></div>
    <div class="scroll_div" >
        <div class="prozor reper">
            <div class="scroll_div_horizontal">
            <div class="scroll_div_vertical">
                <div class="scroll_image">
                    <c:set var="poz" value="0"/>
                    <c:forEach var="f" items="${aktuelniFilmovi.rows}">
                        <a href="${f.linktrejlera}">
                            <img class="poster" src="${f.link_postera}" alt="${f.nazivfilma}"/>
                        </a>
                        <div class="rating">                            
                        <c:set var="rating" value="${f.movieRating}"></c:set>
                        <c:set var="text" value="slike/MovieRating/g.png"></c:set>
                            <c:choose>
                                <c:when test="${rating eq 1}">
                                    <c:set var="text" value="${text}"></c:set>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${rating eq 2}">
                                             <c:set var="text" value="slike/MovieRating/PG.png"></c:set>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${rating eq 3}">
                                                    <c:set var="text" value="slike/MovieRating/pg13.png"></c:set>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${rating eq 4}">
                                                            <c:set var="text" value="slike/MovieRating/r.png"></c:set>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:choose>
                                                                <c:when test="${rating eq 5}">
                                                                    <c:set var="text" value="slike/MovieRating/nc17.png"></c:set>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:choose>
                                                                        <c:when test="${rating eq 6}">
                                                                            <c:set var="text" value="slike/MovieRating/TBC.png"></c:set>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                            <img class="rating_img" src="${text}" alt="tbc"/>
                            <span class="naslov">
                                ${f.nazivfilma}
                            </span>
                        </div>
                        <a href="#" class = "rezervacija_btn" onclick="film_div()">
                        </a>
                    <c:choose>
                       <c:when test="${poz == '0'}">
                            </div>
                            <div class="scroll_image">
                       <c:set var="poz" value="1"/>
                       </c:when>
                <c:otherwise >
                    </div>
                    </div>
                    <div class="scroll_div_vertical">
                    <div class="scroll_image">
                    <c:set var="poz" value="0"/>
                </c:otherwise>
                    </c:choose>
                    </c:forEach>
                    </div>
            </div>
            </div>
        </div>
<div class="player_wrapper">
    <button class="close">X</button>
    <div class="player">
     <iframe  width="640" height="390"  frameborder="0" allowfullscreen></iframe> 
    </div>
</div>
         </div>
        <hr/><div  class="repertoar"><h4 id="uskoro">USKORO</h4></div>
    <div class="scroll_div" >
        <div class="prozor uskoro">
            <div class="scroll_div_horizontal">
            <div class="scroll_div_vertical">
                <div class="scroll_image">
                    <c:set var="pozicija" value="0"/>
                    <c:forEach var="usk" items="${filmoviUNajavi.rows}">
                        <a href="${usk.linktrejlera}">
                            <img class="poster" src="${usk.link_postera}" alt="${usk.nazivfilma}"/>
                        </a>
                        <div class="rating">                                                        
                        <c:set var="rating" value="${usk.movieRating}"></c:set>
                        <c:set var="text" value="slike/MovieRating/g.png"></c:set>
                            <c:choose>
                                <c:when test="${rating eq 1}">
                                    <c:set var="text" value="${text}"></c:set>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${rating eq 2}">
                                             <c:set var="text" value="slike/MovieRating/PG.png"></c:set>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${rating eq 3}">
                                                    <c:set var="text" value="slike/MovieRating/pg13.png"></c:set>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${rating eq 4}">
                                                            <c:set var="text" value="slike/MovieRating/r.png"></c:set>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:choose>
                                                                <c:when test="${rating eq 5}">
                                                                    <c:set var="text" value="slike/MovieRating/nc17.png"></c:set>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:choose>
                                                                        <c:when test="${rating eq 6}">
                                                                            <c:set var="text" value="slike/MovieRating/TBC.png"></c:set>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                            <img class="rating_img" src="${text}"  alt="tbc"/>
                                <span class="naslov">
                                    ${usk.nazivfilma}
                                </span>
                            </div>
                        <c:choose>
                            <c:when test="${pozicija == '0'}">
                                </div>
                                    <div class="scroll_image">
                                <c:set var="pozicija" value="1"/>
                            </c:when>
                        <c:otherwise >
                            </div>
                                </div>
                            <div class="scroll_div_vertical">
                        <div class="scroll_image">
                            <c:set var="pozicija" value="0"/>
                        </c:otherwise>
                    </c:choose>
                    </c:forEach>
                </div>
            </div>
            </div>
                                        
        </div>

         </div>
        <span class="clear"></span>