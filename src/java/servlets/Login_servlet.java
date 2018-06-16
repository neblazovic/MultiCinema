/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Korisnik;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class Login_servlet extends HttpServlet {

       
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    HttpSession sesija= request.getSession();
    sesija.invalidate(); 
    request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sesija= request.getSession();
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
        ResultSet rs;
   
    if(username !=null && username.length()>0&& password!=null && password.length()>0){
         try{
                MySqlConnect db=new MySqlConnect(); 
                String pass_query="SELECT * FROM korisnik WHERE korisnickoime='"+username+"'and aktivan=1";
                rs=db.query(pass_query); 
                if(rs.next()){
                    String pass=rs.getString(3);
                    int id = (int)rs.getInt(1);
                    String ime = rs.getString(4);
                    String prezime = rs.getString(5);
                    int klupska = rs.getInt(13);
                    if (passwordEncryptor.checkPassword(password, pass)) {                         
                      Korisnik korisnik=new Korisnik(rs.getString(4),rs.getString(5),rs.getString(2),rs.getString(3),rs.getString(9),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(8),rs.getString(6),rs.getString(12),rs.getInt(17));
                  
                      sesija.setAttribute("user",username);
                      sesija.setAttribute("userID",id);                      
                      sesija.setAttribute("ime",ime);                      
                      sesija.setAttribute("prezime",prezime);
                      sesija.setAttribute("korisnik",korisnik);
                      sesija.setAttribute("klupska",klupska);
                        switch (rs.getInt(17)) {
                            case 1: 
                                request.getRequestDispatcher("Administracija_filmova.jsp").forward(request, response);
                                break;
                            case 2:
                                request.getRequestDispatcher("Menadzer.jsp").forward(request, response);
                                break;
                            case 3:
                                request.getRequestDispatcher("Prodavac.jsp").forward(request, response);
                                break;
                            case 4:
                                request.getRequestDispatcher("Korisnik.jsp").forward(request, response);
                                break;
                            default:
                                out.println("Greska u logovanju!!");
                        }
                    } else {
                         request.setAttribute("poruka", "Molimo Vas da proverite vase podatke za prijavu!");
                         request.getRequestDispatcher("index.jsp").forward(request, response);                         
                      }
                }
                request.setAttribute("poruka", "Ne postoji korisnik sa unetim podacima!");                
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
                catch(SQLException sqle){
                    request.setAttribute("poruka", "Greska pri radu sa bazom"+sqle);                
                request.getRequestDispatcher("index.jsp").forward(request, response);
                }
    }else{
        request.setAttribute("poruka", "Morate uneti korisnicko ime i lozinku!");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }}

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
