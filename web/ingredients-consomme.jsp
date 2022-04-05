<%-- 
    Document   : ingredients-consomme
    Created on : 5 avr. 2022, 08:39:40
    Author     : ASUS
--%>

<%@page import="model.Ingredients"%>
<%@page import="model.Serveur"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String date1=request.getParameter("date1");
    String date2=request.getParameter("date2");
    Vector<Ingredients> liste=Ingredients.getListeConsomme(date1, date2);
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
        Quantite Ingredients

      </h2>
      <p class="text-center">
       

      </p>
      <div class="">
        <div class="contact_section-container">
          <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="contact-form">
                    <form action="ingredients-consomme.jsp" method="get">
                        <input type="dateTime-local" class="form-control" id="exampleFormControlInput1" name="date1">
                        <input type="dateTime-local" class="form-control" id="exampleFormControlInput1" name="date2">
                        <input type="submit" value="Filtrer" class="btn btn-primary mb-2">
                    </form>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                        <th>Reference</th>
                        <th>Description</th>
                        <th>Quantite Total</th>
                    </tr>
                    </thead>
                    
                    
                        <tbody>
                            
                            <%for(int i=0;i<liste.size();i++){%>
                                <tr>
                                    <td><%=liste.get(i).getId()%></td>
                                    <td><%=liste.get(i).getDesc()%></td>
                                    <td><%=liste.get(i).getPoids()%></td>
                                </tr>
                            <%}%>
                        
                        </tbody>
                        
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
