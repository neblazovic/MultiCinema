/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nebojsa
 */
public class MenadzerServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    String unos;
    String brisanje;
    String film,bioskop,tehnologija,vreme,sala;
    brisanje=request.getParameter("brisanje");
    unos=request.getParameter("unos");
    film=request.getParameter("film");
    bioskop=request.getParameter("bioskop");
    tehnologija=request.getParameter("tehnologija");
    vreme=request.getParameter("vreme");
    sala=request.getParameter("sala");
     MySqlConnect db = new MySqlConnect();
     if(unos != null){
        if( film != null && film.length()>0 &&
           bioskop!=null && bioskop.length()>0 && 
           tehnologija !=null && tehnologija.length() > 0 &&
           vreme != null && vreme.length() > 0 &&
           sala != null && sala.length() > 0){
               String insertUpit="INSERT INTO projekcija (idprojekcije, datumprojekcije, idtehnologije, idfilma, idBioskopa, idSale) VALUES (NULL, '"+vreme+"', '"+tehnologija+"', '"+film+"', '"+bioskop+"', '"+sala+"')";

               db.insert(insertUpit);
               request.setAttribute("uspeh","Projekcija je uspesno zakazana.");
               request.getRequestDispatcher("Menadzer.jsp").forward(request, response);
           }
           else{
           request.setAttribute("uspeh", "Svi podaci moraju biti uneti!!!");
           request.getRequestDispatcher("Menadzer.jsp").forward(request, response);
           }
     }
     
     if(brisanje != null){
        String film_brisanje;
        film_brisanje=request.getParameter("Projekcija");
            if(film_brisanje != null && film_brisanje.length() > 0){
                String brisanjeProjekcije ="delete from projekcija where iprojekcije ="+film_brisanje;
                db.query(brisanjeProjekcije);
                    request.setAttribute("uspeh","Projekcija je uspesno otkazana.");
                    request.getRequestDispatcher("Menadzer.jsp").forward(request, response);
            }
     }
    }
@Override

    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
