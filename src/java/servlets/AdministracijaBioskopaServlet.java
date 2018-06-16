/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nebojsa
 */
public class AdministracijaBioskopaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
 
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nazivBioskopa;
        nazivBioskopa = request.getParameter("naziv_bioskopa");
            if(nazivBioskopa != null && nazivBioskopa.length() > 0){

            MySqlConnect db=new MySqlConnect();
            String upit ="delete from bioskop where nazivbioskopa='"+nazivBioskopa+"'";
            db.insert(upit);
            String bioskopUspesnoObrisan = "Uspesno ste obrisali bioskop: "+nazivBioskopa;
            request.setAttribute("uspeh", bioskopUspesnoObrisan);
            RequestDispatcher rd = request.getRequestDispatcher("Rezervacija.jsp");
              rd.forward(request, response);


    }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nazivBioskopa,link,adresa;
        int brSala;
        nazivBioskopa = request.getParameter("naziv_bioskopa");
        link = "slike/Bioskopi/"+request.getParameter("lokacija_slike");
        brSala= Integer.parseInt(request.getParameter("broj_sala"));
        adresa = request.getParameter("adresa");
        if( nazivBioskopa != null && nazivBioskopa.length() >0 && link != null && link.length() >0 && brSala > 0 && adresa != null && adresa.length()>0){
            MySqlConnect db=new MySqlConnect();
            String upit ="insert into bioskop (idbioskopa,nazivbioskopa,adresa,brojsala,link_slike) values (null,'"+nazivBioskopa+"','"+adresa+"','"+brSala+"','"+link+"')";
            db.insert(upit);
            String bioskopUspesnoKreiran = "Uspesno ste kreirali novi bioskop";
            request.setAttribute("uspeh", bioskopUspesnoKreiran);
            RequestDispatcher rd = request.getRequestDispatcher("Rezervacija.jsp");
              rd.forward(request, response);
        }
                else{
        request.setAttribute("uspeh", "Svi podaci moraju biti uneti!!!");
        request.getRequestDispatcher("Rezervacija.jsp").forward(request, response);
        }
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
