<%-- 
    Document   : detailProduit
    Created on : 24 mars 2022, 14:23:07
    Author     : ACER
--%>

<%@page import="java.util.Vector"%>
<%@page import="java.sql.Connection"%>
<%@page import="connexion.Connexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%
    String idPlat=request.getParameter("id");
    Connection con=Connexion.getConnection();
    Plat plat=Plat.getById(idPlat,con);
    Vector<PlatDetails> liste=plat.getListeDetail(con);
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
       <section class="contact_section layout_padding">
    <div class="container">

      <h2 class="main-heading">
          Plat: <% out.print(plat.getDesc()); %>

      </h2>
      <p class="text-center">
        

      </p>
      <div class="">
          <table>
              <thead>
                  <tr>
                      <th>ingredients</th>
                      <th>prix</th>
                       <th>prix total</th>
                  </tr>
              </thead>
              <tbody>
                  <% for(int i=0;i<liste.size();i++){ 
                        Ingredients ingredients=Ingredients.getById(liste.get(i).getIdIngredient(),con);
                        String nom=ingredients.getDesc();
                        double prix=ingredients.getPrixMoyen(con);
                        double prixTotal=liste.get(i).getPoids()*prix;
                  %>
                  <tr>
                      <td><%out.print(nom); %></td>
                      <td><% out.print(prix); %></td>
                      <td><% out.print(prixTotal); %></td>
                  </tr>
                  <% } %>
              </tbody>
          </table>
      </div>

    </div>
  </section>

    </body>
</html>
