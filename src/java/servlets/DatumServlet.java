/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;


import beans.Projekcija;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
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
public class DatumServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DatumServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DatumServlet at " + request.getContextPath() + "</h1>");
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
          String film, bioskop, datum, tehnologija;
        String idFilma,idBioskopa,idDatuma,idTehnike;
        //id-jevi filmova
         idFilma=request.getParameter("idFilma");
         idBioskopa=request.getParameter("idBioskopa");
         idDatuma=request.getParameter("idDatuma");
         idTehnike=request.getParameter("idTehnike");
        
        //imena filmova, da bi se posle load-a stranice ponovo ucitale izabrane vrednosti
        film=request.getParameter("film");
        bioskop = request.getParameter("bioskop");
        datum=request.getParameter("datum");
        tehnologija=request.getParameter("tehnologija"); 
        
        ResultSet rs ;
        Projekcija projekcija;
        LinkedList projekcije;
            
            request.setAttribute("id_bioskopa",idBioskopa);                   
            request.setAttribute("bioskop",bioskop);    
            
            request.setAttribute("id_datuma",idDatuma);
            request.setAttribute("datum",datum);     
            
            request.setAttribute("id_tehnike",idTehnike);
            request.setAttribute("tehnika",tehnologija);   
            
            request.setAttribute("id_filma",idFilma);
            request.setAttribute("film",film);
      
           
            MySqlConnect db=new MySqlConnect();            
            String projekcije_za_film_i_bioskop="select * from projekcija where idfilma='"+idFilma+"' and idbioskopa ="+idBioskopa;
            projekcije = new LinkedList();
            
        try {
            rs=db.query(projekcije_za_film_i_bioskop);
           
            while(rs.next()) {
                
                
                projekcija = new Projekcija();
                projekcija.setId_projekcije(rs.getInt(1));
                projekcija.setId_sale(rs.getInt(6));
                 request.setAttribute("sala",rs.getInt(6));
                String day = rs.getString(2);
           //     DateFormat df = new SimpleDateFormat("EEE/dd MMM/hh:mm");
                String strDay =day.substring(0,16);
                projekcija.setDatumprojekcije(strDay);
                projekcije.add(projekcija);                
            }
            
            request.setAttribute("sledeci_datum","true");         //Prikazivanje trake za rezervaciju kada se stranica ponovo ucita
            request.setAttribute("projekcije", projekcije);
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
