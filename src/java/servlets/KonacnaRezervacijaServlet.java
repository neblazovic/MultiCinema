package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nebojsa
 */
public class KonacnaRezervacijaServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet KonacnaRezervacijaServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet KonacnaRezervacijaServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    String film, bioskop, date, tehnologija,idSale;
    String idFilma,idBioskopa,idDatuma,idTehnike;
    String[] sedista;
    List lista=null;
    sedista = request.getParameterValues("check");
    if(sedista!=null){
     lista = Arrays.asList(sedista); 
    }
             
    film=request.getParameter("izborFilma");
    idFilma=request.getParameter("id_filma"); 
    idSale=request.getParameter("izborSale");
    date=request.getParameter("izborDatuma"); 
    idDatuma=request.getParameter("id_datuma");
    idBioskopa = request.getParameter("id_bioskopa");
    bioskop = request.getParameter("izborBioskopa");
    tehnologija=request.getParameter("izborTehnike");
    idTehnike=request.getParameter("id_tehnike");
    String mesta=request.getParameter("izborMesta");
    
    request.setAttribute("id_bioskopa", idBioskopa);
    request.setAttribute("izborBioskopa", bioskop);
    request.setAttribute("id_sale_dat", idSale); 
     request.setAttribute("izborDatuma", date);
    request.setAttribute("id_datuma", idDatuma);  
     request.setAttribute("izborFilma", film);  
     request.setAttribute("id_filma", idFilma);  
     request.setAttribute("izborMesta", mesta);   
    request.setAttribute("listaCB", lista);
    request.getRequestDispatcher("PopunjavanjePodataka.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String film, bioskop, date, tehnologija,idSale;
            String idFilma,idBioskopa,idDatuma,ime,list_cb;
            String[] sedista;
            HttpSession sesija=request.getSession();
            int korisnik = (int)sesija.getAttribute("userID");
            ime=request.getParameter("ime"); 
            date=request.getParameter("datum");             
            film=request.getParameter("film");
            idBioskopa = request.getParameter("idBioskopa");
            
            bioskop = request.getParameter("bioskop");
            idDatuma=request.getParameter("id_datuma");
            idFilma=request.getParameter("id_filma");
            idSale=request.getParameter("sala");
            list_cb = request.getParameter("lista_cb");
            
            request.setAttribute("izborBioskopa", bioskop);
            request.setAttribute("id_sale_dat", idSale); 
             request.setAttribute("izborDatuma", date);
            request.setAttribute("id_datuma", idDatuma);  
            
             request.setAttribute("izborFilma", film);  
             request.setAttribute("id_filma", idFilma);  
             request.setAttribute("izborMesta", list_cb); 
            //izbacivanje uglastih zagrada koje oznacavaju niz iz stringa
             int duzina = list_cb.length();
             list_cb = list_cb.substring(1, duzina-1);
                MySqlConnect db=new MySqlConnect();
                String unosRezervacije = "INSERT INTO rezervacija (idrezervacije, datumRezervacije,idkorisnika, idzaposlenirezervisao,"
                        + " idbioskopa,idsale, idprojekcije, rezervisana, aktivna, placena)"
                        + "values (null,null, '"+korisnik+"',null, '"+idBioskopa+"', '"+idSale+"', '"+idDatuma+"', '"+1+"', '"+1+"' ,'"+0+"');"
                        + "UPDATE sediste SET zauzeto = 1 where idsedista in("+list_cb+")";
                db.insert(unosRezervacije);
                request.setAttribute("uspesnaRezervacija", "true");
                request.getRequestDispatcher("Korisnik.jsp").forward(request, response);
}


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
