<%-- 
    Document   : affichageListePlatDisponnible
    Created on : 22 mars 2022, 09:40:47
    Author     : ACER
--%>

<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>JSP Page</title>
        <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Adward</title>



  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <!-- progress barstle -->
  <link rel="stylesheet" href="css/css-circular-prog-bar.css">
  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
  <!-- font wesome stylesheet -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />




  <link rel="stylesheet" href="css/css-circular-prog-bar.css">


    </head>
    <body>
    
  
        
        
    </body>
    
    <section class="contact_section layout_padding" width="800">
    <div class="container" width="800">

      <h2 class="main-heading">
        Liste de nos plats disponible

      </h2>
      <p class="text-center">
       

      </p>
      <div class="" width="800">
        <div class="contact_section-container" width="800">
          <div class="row" width="800">
            <div class="col-md-6 mx-auto" width="800">
                <div class="contact-form" width="800">
                     <form action="<%=request.getContextPath()%>/ListePlatParCategorie" method="get">
                           
                            <div class="form-group mx-sm-3 mb-2">
                       <select name="idCategorie" class="form-control" id="exampleFormControlSelect1">
                                    <% Vector<Categorie> l=(Vector<Categorie>)request.getAttribute("listeCategorie");
                        for(int i=0;i<l.size();i++){
                    %>
                    
                        <option value="<% out.print(l.get(i).getId());%>"><% out.println(l.get(i).getDescri()); %></option>
                    
                    <% } %>
                                </select>
                 </div>
                                <input type="submit" value="ok" class="btn btn-primary mb-2">

                          </form>
                                <form action="insertionCommande.jsp" method="get">
                                    
                        
                               <table class="table" width="800">
            <thead class="thead-light">
                <tr>
                    <th>serveur</th>
                    <th>plat</th>
                    <th>prix</th>
                
                
                
                <th>quantite</th>
            </tr>

            </thead>
            <tbody>
            <form action="insertionCommande.jsp" method="get">
                     <% Vector<Plat> liste=(Vector<Plat>)request.getAttribute("listePlat");
                    for(int j=0;j<liste.size();j++){
                %>
            <tr>
                <td> <% Vector<Serveur> li=Serveur.getAll();
                                    
                                    
                                    %>
                                    <select name="idSer">
                                        <% Serveur serveur=Serveur.getById(request.getParameter("idServeur")); %>
                                        <option value="<% out.print(request.getParameter("idServeur")); %>"><% out.print(serveur.getNom());%></option>
                                        <% for(int g=0;g<li.size();g++){
                                         %>
                                         
                                         <option value="<% out.print(li.get(g).getId()); %>"><% out.print(li.get(g).getNom()); %></option>
                                         <% } %>
                                    </select></td>
            <input type="text" name="idAddition" value="<% out.print(request.getParameter("idAddition")); %>" style="display: none;" >
                
                <td><% out.println(liste.get(j).getDesc()); %> </td>
                <td><% out.println(liste.get(j).getPrix()); %></td>
                <input type="text" name="idPlat" value="<%out.print(liste.get(j).getId()); %>" style="display:none;">
                <td><input type="number" name="quantite"></td>
                <td><a href="detailProduit.jsp?id=<%out.print(liste.get(j).getId()); %>">voir detail</a></td>
                
                <td><input type="submit" value="ok"></td>
            </tr>
            <% } %>
           
            
            </form>
             </tbody>
                       
        </table>
                               
                                </form>
                                
                                
                                
                                    
                </div>
                    
                      
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </section>

       
</html>
