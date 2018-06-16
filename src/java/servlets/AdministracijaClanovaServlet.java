/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Korisnik;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jasypt.util.password.StrongPasswordEncryptor;

/**
 *
 * @author Nebojsa
 */
public class AdministracijaClanovaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user_za_brisanje;
        user_za_brisanje = request.getParameter("usernamebrisi");
        MySqlConnect db =new MySqlConnect();
        String upit ="UPDATE korisnik set aktivan =0 where korisnickoime ='"+user_za_brisanje+"'";
        if(user_za_brisanje!=null){
            db.insert(upit);
        }
        request.setAttribute("uspeh","Uspesno ste obrisali korisnika "+user_za_brisanje);
        request.getRequestDispatcher("Administracija_clanova.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
            
        String ime,prezime,username,password, email;
        String telefon;
        String adresa;
        String grad;
        String drzava;
        String rola;
        String kreditna;
        //String klupska;
        String datumRodjenja;
        int aktivan =1;
        
        MySqlConnect konekcija =new MySqlConnect();
            ime=request.getParameter("ime");
            prezime=request.getParameter("prezime");
            telefon=request.getParameter("telefon");
            email=request.getParameter("email");
            username=request.getParameter("username");
            password=request.getParameter("pass");
            grad=request.getParameter("grad");
            drzava=request.getParameter("drzava");            
            datumRodjenja=request.getParameter("datrodj");
            adresa=request.getParameter("adresa");
            kreditna = request.getParameter("kreditna");
           // klupska = request.getParameter("klupska")!=null?request.getParameter("klupska"):"";
            rola=request.getParameter("rola");
            String encryptedPassword = passwordEncryptor.encryptPassword(password);

                if(ime != null && ime.length()>0 && prezime!=null && prezime.length() >0 && 
                   username != null && username.length()>0 && password !=null && password.length() >0 && 
                   email !=null && email.length()>0)
                {
                Korisnik korisnik=new Korisnik( ime,prezime, username, encryptedPassword,telefon, adresa, grad, drzava,email,datumRodjenja,kreditna,aktivan);
                HttpSession session=request.getSession();
                session.setAttribute("korisnik", korisnik);
                String upit="INSERT INTO korisnik(idkorisnika, korisnickoime, lozinka, ime, prezime, datumrodjenja, adresa, email, telefon, grad, drzava, platnakartica,aktivan, idrole)values(null,'"+username+"','"+encryptedPassword+"','"+ime+"','"+prezime+"','"+datumRodjenja+"','"+adresa+"','"+email+"','"+telefon+"','"+grad+"','"+drzava+"','"+kreditna+"','"+aktivan+"','"+rola+"')";
               
                konekcija.insert(upit);
                 request.setAttribute("uspeh", "Uspesno ste uneli korisnika "+username);
                request.getRequestDispatcher("Administracija_clanova.jsp").forward(request, response);
            }
            else{
                request.setAttribute("uspeh", "Svi podaci sa zvezdicom moraju biti uneti!!!");
                request.getRequestDispatcher("Administracija_clanova.jsp").forward(request, response);
            }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
