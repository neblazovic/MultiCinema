/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Tehnologija;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nebojsa
 */
public class TehnologijaServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TehnologijaServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TehnologijaServlet at " + request.getContextPath() + "</h1>");
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
            
            throws ServletException, IOException{
    String film, bioskop, date, tehnologija;
    String idFilma,idBioskopa,idDatuma,idTehnike,id_sale;
        //id-jevi filmova
         idFilma=request.getParameter("idFilma");
         idBioskopa=request.getParameter("idBioskopa");
         idDatuma=request.getParameter("idDatuma");
         idTehnike=request.getParameter("idTehnike");
         id_sale=request.getParameter("id_sale_rez");
        
        //imena filmova, da bi se posle load-a stranice ponovo ucitale izabrane vrednosti
        film=request.getParameter("film");
        bioskop = request.getParameter("bioskop");
        date=request.getParameter("datum");
        tehnologija=request.getParameter("tehnologija");
        ResultSet rs ;
        ArrayList tehnologije;
        Tehnologija tehnology;
            
            request.setAttribute("id_bioskopa",idBioskopa);                   
            request.setAttribute("bioskop",bioskop);    
            
            request.setAttribute("id_datuma",idDatuma);
            request.setAttribute("datum",date);     
            
            request.setAttribute("id_tehnike",idTehnike);
            request.setAttribute("tehnika",tehnologija);   
            
            request.setAttribute("id_filma",idFilma);
            request.setAttribute("film",film);
            request.setAttribute("idSaleTeh",id_sale);
      
           
            MySqlConnect db=new MySqlConnect();            
            String tehnologije_za_film_bioskop_i_datum="select * from tehnologija where idtehnologije IN (SELECT idtehnologije from projekcija where idfilma ="+idFilma+" and idBioskopa = "+idBioskopa+" and idprojekcije="+idDatuma+")";
            tehnologije = new ArrayList();
            
        try {
            rs=db.query(tehnologije_za_film_bioskop_i_datum);
            
                    while(rs.next()) {
                        tehnology = new Tehnologija();
                        tehnology.setId_tehnologije(rs.getInt(1));
                        tehnology.setLink(rs.getString(3));
                        tehnology.setNaziv_tehnologije(rs.getString(2));
                        tehnologije.add(tehnology);                
                    }
                    
                    request.setAttribute("sledeca_tehnologija","true");         //Prikazivanje trake za rezervaciju kada se stranica ponovo ucita
                    request.setAttribute("tehnologije", tehnologije);
                    request.getRequestDispatcher("Korisnik.jsp").forward(request, response);
                    
            
                } catch (SQLException ex) {
                    Logger.getLogger(RezervacijaServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
             
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
