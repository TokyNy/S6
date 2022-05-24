/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import fonction.Export;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Ingredients;
import model.Stock;

/**
 *
 * @author ASUS
 */
public class ExportController extends HttpServlet {

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
        try {
            String format=request.getParameter("format");
            if(format!=null && format.isEmpty()==false){
                String nomFichier="Etat-stock-ingredients.";
                Vector<Ingredients> liste=Stock.getStockIngredient();
                if(format.equalsIgnoreCase("excel")){
                    Export.exporter(liste);
                    nomFichier+="xlsx";
                }else if(format.equalsIgnoreCase("pdf")){
                    Export.exporterPDF(liste);
                    nomFichier+="pdf";
                }

                InputStream is = new FileInputStream(nomFichier);
                //response.getWriter().close();
                OutputStream os = response.getOutputStream();
                response.setContentType("text/plain");
                response.setHeader("Content-Disposition","attachment;filename="+nomFichier);
                int count;
                byte buf[] = new byte[4096];
                while ((count = is.read(buf)) > -1){
                    os.write(buf, 0, count);
                }
                is.close();
                os.close();
            }
            
        }catch(Exception e){
            e.printStackTrace();
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
