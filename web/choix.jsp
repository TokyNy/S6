<%-- 
    Document   : choix
    Created on : 28 mars 2022, 15:20:34
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
       <div class="container">

      <h2 class="main-heading">
       Choisir la table

      </h2>
      <p class="text-center">
       

      </p>
      <div class="">
        <div class="contact_section-container">
          <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="contact-form">
                    <form action="traitement-commande.jsp" method="get">
                        <% Vector<Serveur> li=Serveur.getAll();
                                    
                                    
                                    %>
                                    <p> Serveur : <select name="idServeur" class="form-control" id="exampleFormControlSelect1">
                                        <% for(int g=0;g<li.size();g++){
                                         %>
                                         <option value="<% out.print(li.get(g).getId()); %>"><% out.print(li.get(g).getNom()); %></option>
                                         <% } %>
                                        </select></p>
                                        <p> Table: <select name="idTable" class="form-control" id="exampleFormControlSelect1">
                                        <% Vector<Table> listeTable=Table.getAll();
                                        for(int k=0;k<listeTable.size();k++){
                                        %>
                                        <option value="<% out.print(listeTable.get(k).getId()); %>"><% out.print(listeTable.get(k).getDesc()); %></option>
                                        <% } %>
                                            </select><p>
                                    <input type="submit" value="ok">
                                
                    </form>
                                    <p><a href="additionParTable.jsp">voir addition par table</a></p>
    
                </div>
                    
                      
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </section>

    
    </body>
</html>
