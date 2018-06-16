/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Sediste;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class PopunjavanjePodatakaServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String film, bioskop, date, tehnologija;
         String idFilma,idBioskopa,idDatuma,idTehnike;
         int idSale=0;
        //id-jevi filmova
         idFilma=request.getParameter("idFilma");
         idBioskopa=request.getParameter("idBioskopa");
         idDatuma=request.getParameter("idDatuma");
         idTehnike=request.getParameter("id_tehnike");
        
        //imena filmova, da bi se posle load-a stranice ponovo ucitale izabrane vrednosti
        film=request.getParameter("film");
        bioskop = request.getParameter("bioskop");
        date=request.getParameter("datum");
        tehnologija=request.getParameter("tehnologija");
        ResultSet rs ;
        MySqlConnect db=new MySqlConnect();
        String upit="SELECT sed.*,s.brojRedova,s.sedistaURedu FROM sediste sed join sala s on s.idsale = sed.idsale WHERE s.idsale = (select idsale from projekcija where idprojekcije ='"+idDatuma+"')";
        String redovi_i_sedista = "select brojRedova,sedistaURedu from sala where idsale =(select idsale from projekcija where idprojekcije ='"+idDatuma+"')";
        String sala= "select idsale from projekcija where idprojekcije="+idDatuma;
        rs=db.query(sala);
        try{
        if(rs.next()){
            idSale=rs.getInt(1);
        }
        }
        catch(SQLException e){
            
        }
        rs=db.query(upit);
        
        ArrayList sedista = new ArrayList();
        Sediste sediste ;
        try{
        while(rs.next()) {
            sediste=new Sediste();
            sediste.setIdSedista(rs.getInt(1));
            sediste.setBrojSedista(rs.getString(2));
            sediste.setZauzeto(rs.getInt(3));
            sediste.setInvalidsko(rs.getInt(4));
            sediste.setOdabrano(rs.getInt(5));
            sediste.setIdSale(rs.getInt(6));
            sedista.add(sediste);
            
        }
        int sed=0;
        int red=0;
        rs=db.query(redovi_i_sedista);
        try{
        while(rs.next()){
        sed=rs.getInt(2);
        red=rs.getInt(1);
        }
        
        }
        catch (SQLException e){
            System.out.println("e+\"greska u radu sa bazom!!\"");
        }
        
            request.setAttribute("brRedova",red);
            request.setAttribute("brSedista",sed);
        request.setAttribute("sedista", sedista);
        }
        catch (SQLException e){
            System.out.println("e+\"greska u radu sa bazom!!\"");
        }
        request.setAttribute("id_bioskopa",idBioskopa);                   
            request.setAttribute("bioskop",bioskop);    
            
            request.setAttribute("id_datuma",idDatuma);
            request.setAttribute("datum",date);     
            
            request.setAttribute("id_tehnike",idTehnike);
            request.setAttribute("tehnika",tehnologija);   
            
            request.setAttribute("id_filma",idFilma);
            request.setAttribute("film",film);
            request.setAttribute("sledeci_raspored","true");            
            request.setAttribute("id_sale",idSale);
            request.getRequestDispatcher("rasporedSedista.jsp").forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
