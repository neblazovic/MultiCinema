/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nebojsa
 */
public class OtvaranjeFormeServlet extends HttpServlet {


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
        try (PrintWriter out = response.getWriter()) {
            String str =request.getParameter("forma");
            HttpSession sesija= request.getSession();
            char forma = str.charAt(0);
            RequestDispatcher rd;
            rd=request.getRequestDispatcher("Korisnik.jsp");
        switch (forma){
            case '2':
                sesija.setAttribute("prikaz", '2');
                break;
            case '3':
                sesija.setAttribute("prikaz", '3');
                break;
            case '4':
                sesija.setAttribute("prikaz",'4');
                break;
            case '1':
                request.setAttribute("prikaz", '1');
                break;
            default:
               
                sesija.setAttribute("prikaz", '1');
                rd.forward(request, response);
        }
        
                rd.forward(request, response);
        }       

    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
