
package servlets;
import beans.Bioskop;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RezervacijaServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ResultSet rs;
        String id=request.getParameter("id_filma");
                if(id != null && id.length() >0){
        }
        MySqlConnect db=new MySqlConnect(); 
                String bioskopi="SELECT * from bioskop where 1";
                rs=db.query(bioskopi); 
        try {
            while(rs.next()) {
                int idBioskopa=rs.getInt(1);
                request.setAttribute("id_bioskopa"+idBioskopa,idBioskopa);
                
            }
            request.getRequestDispatcher("Korisnik.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RezervacijaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        String film, bioskop, datum, tehnologija, adresa,link;
        String br_sala,idFilma,idBioskopa,idDatuma,idTehnike,idSale;
        //id-jevi filmova
         idFilma=request.getParameter("idFilma");
         idBioskopa=request.getParameter("idBioskopa");
         idDatuma=request.getParameter("idDatuma");
         idTehnike=request.getParameter("idTehnologije");
         
        
        //imena filmova, da bi se posle load-a stranice ponovo ucitale izabrane vrednosti
        film=request.getParameter("film");
        bioskop = request.getParameter("bioskop");
        datum=request.getParameter("datum");
        tehnologija=request.getParameter("tehnologija");         
        LinkedHashMap<Integer,String> lhmap = new LinkedHashMap<>();
        
            if(!"".equals(film)){
                 lhmap.put(1,"da");
            }
            else{
                lhmap.put(1,"ne");
            }
            if(!"".equals(bioskop)){                
                lhmap.put(2,"da");
            }
            else{
                lhmap.put(2,"ne");
            }
            if(!"".equals(datum)){                
                lhmap.put(3,"da");
            }
            else{
                lhmap.put(3,"ne");
            }
            if(!"".equals(tehnologija)){                
                lhmap.put(4,"da");
            }            
            else{
                lhmap.put(4,"ne");
            }if(!"".equals(tehnologija) && !"".equals(datum) && !"".equals(bioskop) && !"".equals(film)){
                lhmap.put(5,"ne");
            }    
         Set set = lhmap.entrySet();
       
        Iterator iterator = set.iterator();
         while(iterator.hasNext()) {
            Map.Entry me = (Map.Entry)iterator.next();
                if ( me.getValue().equals("ne")){
                    int i;
                i = (Integer)(me.getKey());
                    switch (i){
                        case 2:
                        
        ResultSet rs ;
        Bioskop cinema;
        LinkedList bioskopi;
            
            request.setAttribute("id_bioskopa",idBioskopa);                   
            request.setAttribute("bioskop",bioskop);    
            
            request.setAttribute("id_datuma",idDatuma);
            request.setAttribute("datum",datum);     
            
            request.setAttribute("id_tehnike",idTehnike);
            request.setAttribute("tehnika",tehnologija);   
            
            request.setAttribute("id_filma",idFilma);
            request.setAttribute("film",film);
      
           
            MySqlConnect db=new MySqlConnect();            
            String upit_bioskopi_za_film="SELECT * from bioskop where idbioskopa in (select idBioskopa from projekcija where idfilma ="+idFilma+")";
            bioskopi = new LinkedList();
            
        try {
            rs=db.query(upit_bioskopi_za_film);
            while(rs.next()) {
                cinema = new Bioskop();
                cinema.setId_bioskopa(rs.getInt(1));
                cinema.setBr_sala(rs.getInt(4));
                cinema.setNaziv_bioskopa(rs.getString(2));
                cinema.setLink_slike(rs.getString(5));
                bioskopi.add(cinema);                
            }                                                       
            request.setAttribute("sledeci_bioskop","true");         //Prikazivanje trake za rezervaciju kada se stranica ponovo ucita
            request.setAttribute("bioskopi", bioskopi);
            request.getRequestDispatcher("Korisnik.jsp").forward(request, response);
        }
        catch (SQLException ex) {
            Logger.getLogger(RezervacijaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }          
        break;
            case 3:
            request.getRequestDispatcher("DatumServlet").forward(request, response);  
            break;
            case 4:
            idSale=request.getParameter("id_sale_dat"); 
            request.setAttribute("id_sale_rez",idSale);
            request.getRequestDispatcher("TehnologijaServlet").forward(request, response);
            break;
            case 5:
            idSale=request.getParameter("id_sale_dat"); 
            request.setAttribute("id_sale_ras",idSale); 
            request.setAttribute("id_bioskopa",idBioskopa);                   
            request.setAttribute("bioskop",bioskop);    
            
            request.setAttribute("id_datuma",idDatuma);
            request.setAttribute("datum",datum);     
            
            request.setAttribute("id_tehnike",idTehnike);
            request.setAttribute("tehnika",tehnologija);   
            
            request.setAttribute("id_filma",idFilma);
            request.setAttribute("film",film);
            request.getRequestDispatcher("PopunjavanjePodatakaServlet").forward(request, response);
            break;
            
            default:
                request.getRequestDispatcher("Korisnik.jsp").forward(request, response);
       }
      }
    }
  }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
