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
                          
                      
                 
                      
                
                
                      
                                <table class="table">
            <thead class="thead-light">
                <tr>
                <th>plat</th>
                <th>prix</th>
            </tr>

            </thead>
            <tbody>
                            <% Vector<Plat> liste=(Vector<Plat>)request.getAttribute("listePlat");
                    for(int j=0;j<liste.size();j++){
                %>
            <tr>
                
                <td><% out.println(liste.get(j).getDesc()); %> </td>
                <td><% out.println(liste.get(j).getPrix()); %></td>
                <td><a href="detailProduit.jsp?id=<%out.print(liste.get(j).getId()); %>">voir detail</a></td>
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
  </section>

       
</html>
