
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nebojsa
 */
public class KluboviServlet extends HttpServlet {


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
        HttpSession sesija = request.getSession();
        String klub,id;
        int korisnik,clanskaKarta;
        id=request.getParameter("id");        
        klub=request.getParameter("klub");
        clanskaKarta = (int)sesija.getAttribute("klupska");
        korisnik=(int)sesija.getAttribute("userID");
        MySqlConnect db = new MySqlConnect();
        String insert = "INSERT into clanstvo (idclanskekarte,idkluba,idkorisnika) values(null,'"+id+"','"+korisnik+"')";
        if(clanskaKarta==0){
            db.insert(insert);        
            request.setAttribute("uspeh",klub );
            request.getRequestDispatcher("Korisnik.jsp").forward(request, response);
        }else{
            request.setAttribute("postoji",clanskaKarta );
            request.getRequestDispatcher("Korisnik.jsp").forward(request, response);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
