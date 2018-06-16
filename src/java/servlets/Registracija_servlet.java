/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Korisnik;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jasypt.util.password.*;
/**
 *
 * @author Nebojsa
 */
public class Registracija_servlet extends HttpServlet {

    
        MySqlConnect konekcija= new MySqlConnect();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {     

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
        String kreditna;
        String klupska;
        String datumRodjenja;
        int aktivan =1;
            ime=request.getParameter("ime");
            prezime=request.getParameter("prezime");
            telefon=request.getParameter("phone");
            email=request.getParameter("email");
            username=request.getParameter("username");
            password=request.getParameter("password");
            grad=request.getParameter("grad");
            drzava=request.getParameter("drzava");            
            datumRodjenja=request.getParameter("datum");
            adresa=request.getParameter("adress");
            kreditna = request.getParameter("kreditna");
            klupska = request.getParameter("klupska");
            String encryptedPassword = passwordEncryptor.encryptPassword(password);

                if(ime != null && ime.length()>0 && prezime!=null && prezime.length() >0 && 
                   username != null && username.length()>0 && password !=null && password.length() >0 && 
                   email !=null && email.length()>0)
                {
                Korisnik korisnik=new Korisnik( ime,prezime, username, encryptedPassword,telefon, adresa, grad, drzava,email,datumRodjenja,kreditna,aktivan);
                HttpSession session=request.getSession();
                session.setAttribute("korisnik", korisnik);
                String upit="INSERT INTO korisnik(idkorisnika, korisnickoime, lozinka, ime, prezime, datumrodjenja, adresa, email, grad, drzava, platnakartica,aktivan, idrole)values(null,'"+username+"','"+encryptedPassword+"','"+ime+"','"+prezime+"','"+datumRodjenja+"','"+adresa+"','"+email+"','"+grad+"','"+drzava+"','"+kreditna+"','"+aktivan+"',4)";
               
                konekcija.insert(upit);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            else{
                request.setAttribute("poruka", "Svi podaci moraju biti uneti!!!");
                request.getRequestDispatcher("Registracija.jsp").forward(request, response);
            }
    }
    }

