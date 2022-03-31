/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connexion.Connexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Categorie;
import model.Plat;

/**
 *
 * @author ASUS
 */
public class ListePlatParCategorieServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection con;
            try {
                con = Connexion.getConnection();
                String idCategorie=request.getParameter("idCategorie");
                Vector<Plat> listePlat=Plat.getAll(con);
                if(idCategorie!=null && idCategorie.isEmpty()==false){
                    listePlat=Plat.getByIdCategorie(idCategorie, con);
                }
                
                request.setAttribute("listePlat", listePlat);
                request.setAttribute("listeCategorie", Categorie.getAll(con));
                con.close();
                String idAddition=request.getParameter("idAddition");
                String idServeur=request.getParameter("idServeur");
                RequestDispatcher dis=request.getRequestDispatcher("affichageListePlatDisponnible.jsp?idAddition="+idAddition+"&idServeur="+idServeur);
                dis.forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(ListePlatParCategorieServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
