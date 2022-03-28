<%-- 
    Document   : pourBoire
    Created on : 28 mars 2022, 14:12:45
    Author     : ACER
--%>

<%@page import="java.util.Vector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="connexion.*"%>
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
        <section class="contact_section layout_padding">
    <div class="container">

      <h2 class="main-heading">
        Liste de nos plats

      </h2>
      <p class="text-center">
       

      </p>
      <div class="">
        <div class="contact_section-container">
          <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="contact-form">
                    <form action="pourBoire.jsp" method="get">
                        <input type="text" class="form-control" id="exampleFormControlInput1" name="date1">
                        <input type="text" class="form-control" id="exampleFormControlInput1" name="date2">
                        <input type="submit" value="ok">
                    </form>
                </div>
                <table class="table">
                    <tr>
                        <th>nom</th>
                        <th>pourboire</th>
                    </tr>
                    <% 
                        Vector<Serveur> liste=Serveur.getAll();
                        for(int i=0;i<liste.size();i++){
                        %>
                        <tr>
                            <td><%out.print(liste.get(i).getNom()); %></td>
                            
                            <td><% out.print(liste.get(i).getSommePourBoire(request.getParameter("date1"),request.getParameter("date2"),2)); %></td>
                        </tr>
                        <% } %>
                </table>
                    
                      
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </section>

    </body>
</html>
