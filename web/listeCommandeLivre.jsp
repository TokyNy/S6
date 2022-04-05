<%-- 
    Document   : listeCommandeLivre
    Created on : 4 avr. 2022, 16:18:01
    Author     : ACER
--%>

<%@page import="model.Addition"%>
<%@page import="model.AdditionDetails"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                   <section class="contact_section layout_padding" width="800">
    <div class="container" width="800">

      <h2 class="main-heading">
        Commande en cuisine

      </h2>
      <p class="text-center">
       

      </p>
      <div class="" width="800">
        <div class="contact_section-container" width="800">
          <div class="row" width="800">
            <div class="col-md-6 mx-auto" width="800">
                <div class="contact-form" width="800">
                     <% 
                         String idAddition=request.getParameter("idAddition");
    
                        Addition a=Addition.getById(idAddition);
           
                            Vector<AdditionDetails> liste=a.voirListeLivre();
        %>
        <table class="table">
            <thead>
                             <tr>
                                 <th>Plat</th>
                                 <th>Quantite</th>
                                 <th>Prix total</th>
                             </tr>
                         </thead>
                         <tbody>
                             <% for(int i=0;i<liste.size();i++){ %>
                             <tr>
                                 <td><% out.print(liste.get(i).getIdPlat()); %></td>
                                 <td><% out.print(liste.get(i).getId()); %></td>
                                 <td><% out.print(liste.get(i).getPrix()); %></td>
                             </tr>
                             <% } %>
                         </tbody>
                         
        </table>
                     
                         
                </div>
                    
                      
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
    </body>
</html>
