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
import static java.lang.Integer.parseInt;

public class AdministracijaSaleServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            int idSale;        
            idSale = parseInt(request.getParameter("id_sale"));
                if(idSale>0){
                    
                        MySqlConnect db=new MySqlConnect();
                        String upit ="delete from sala where idsale="+idSale;
                        db.query(upit);
                         String porukaUspesno = "Uspesno ste obrisali salu sa id-jem: "+idSale;
                          request.setAttribute("uspeh", porukaUspesno);
                         RequestDispatcher rd = request.getRequestDispatcher("Rezervacija.jsp");
                          rd.forward(request, response);
                    
               
                }
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nazivSale;
        int brRedova,brSedista,idSale;
        
        
        idSale = parseInt(request.getParameter("id_sale"));
        nazivSale = request.getParameter("naziv_sale");
        brRedova = parseInt(request.getParameter("redovi"));
        brSedista = parseInt(request.getParameter("br_sedista"));

                
        if( idSale > 0 && nazivSale != null && nazivSale.length() >0 && brRedova >0 && brSedista>0 ){
        int r,s;
        MySqlConnect db=new MySqlConnect(); 
        
        
        for(int i=1;i<=brRedova;i++){
            for(int j=1;j<=brSedista;j++){
               r=i;
               s=j;
                db.insert("INSERT INTO sediste(idsedista, brojsedista, zauzeto, invalidsko, odabrano, idsale) VALUES (null,'r"+r+"s"+s+"',0,0,0,"+idSale+")");
            }
        }
            String porukaUspesno = "Uspesno ste dodali sedista u salu: "+nazivSale;
            request.setAttribute("uspeh", porukaUspesno);
                RequestDispatcher rd = request.getRequestDispatcher("Rezervacija.jsp");
                rd.forward(request, response);
        }
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
