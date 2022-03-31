<%-- 
    Document   : traitement-commande
    Created on : 28 mars 2022, 15:24:14
    Author     : ACER
--%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>

<%@page import="connexion.*"%>
<%
    String idTable=request.getParameter("idTable");
    String idServeur=request.getParameter("idServeur");
    Connection con=Connexion.getConnection();
    try{
         
    Addition.ajouterAddition(idTable, idServeur, con);
    }
   catch(Exception e){
    out.print(e.getMessage());
}
    String idAddition=Addition.getLast(idTable);
    response.sendRedirect(request.getContextPath()+"/ListePlatParCategorie?idAddition="+idAddition+"&idServeur="+idServeur);
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
