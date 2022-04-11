<%-- 
    Document   : stock
    Created on : 5 avr. 2022, 11:00:51
    Author     : ASUS
--%>

<%@page import="java.util.Date"%>
<%@page import="model.Ingredients"%>
<%@page import="java.util.Vector"%>
<%@page import="model.Stock"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Date d=new Date();
    Vector<Ingredients> liste=Stock.getStockIngredient();
%>
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

  <title>Projet resto</title>



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
             <section class="contact_section layout_padding" width="800">
    <div class="container" width="800">

      <h2 class="main-heading">
        Stock des ingredients

      </h2>
      <p class="text-center">
       

      </p>
      <div class="" width="800">
        <div class="contact_section-container" width="800">
          <div class="row" width="800">
            <div class="col-md-6 mx-auto" width="800">
                <div class="contact-form" width="800">
                     
                     <table class="table">
                         <thead>
                             <tr>
                                 <th>reference</th>
                                 <th>Description</th>
                                 <th>Stock</th>
                             </tr>
                         </thead>
                         <tbody>
                             <% for(int i=0;i<liste.size();i++){ %>
                             <tr>
                                  <td><% out.print(liste.get(i).getId()); %></td>
                                    <td><% out.print(liste.get(i).getDesc()); %></td>
                                    <td><% out.print(liste.get(i).getPoids()); %></td>
                             </tr>
                             <% } %>
                         </tbody>
                     </table>
                         <p><a href="choix.jsp">retour</a></p>
                         
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
