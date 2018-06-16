/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nebojsa
 */
public class AdministracijaFilmovaServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdministracijaFilmovaServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdministracijaFilmovaServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String naziv,zanr,linkTrejlera,linkFilma,linkPostera,uloge,reditelj,radnja,aktuelan,rating;
        naziv=request.getParameter("naziv");
        zanr=request.getParameter("zanr");
        linkTrejlera=request.getParameter("trejler");
        linkFilma=request.getParameter("link_filma");
        linkPostera=request.getParameter("link_postera");
        uloge=request.getParameter("uloge");
        reditelj=request.getParameter("reditelj");
        radnja=request.getParameter("radnja");
        aktuelan=request.getParameter("aktuelan");
        rating=request.getParameter("rating");
        if(    naziv != null && naziv.length() >0 && 
               zanr != null && zanr.length() >0 &&
               linkTrejlera != null && linkTrejlera.length() >0 && 
               linkFilma != null && linkFilma.length() > 0 &&
               linkPostera != null && linkPostera.length() > 0 &&
               uloge != null && uloge.length() > 0 &&
               reditelj != null && reditelj.length() > 0 &&
               radnja != null && radnja.length() > 0 &&
               aktuelan != null && aktuelan.length() > 0 &&
               rating != null && rating.length() > 0){
                    MySqlConnect db = new MySqlConnect();
                    String upit = "INSERT INTO film (idfilma,nazivfilma,Zanr,linktrejlera,linkfilma,link_postera,"
                        + "uloge,reditelj,radnja,aktuelan,movieRating) VALUES (null,'"+naziv+"','"+zanr+"',"
                        + "'"+linkTrejlera+"','"+linkFilma+"','"+linkPostera+"','"+uloge+"','"+reditelj+"','"
                        +radnja+"','"+aktuelan+"','"+rating+"')";
                    db.insert(upit);
                    request.setAttribute("uspeh", "Uspesno ste dodali film!!");
        }
        request.getRequestDispatcher("Administracija_filmova.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
