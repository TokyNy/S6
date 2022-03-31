<%-- 
    Document   : insertionCommande
    Created on : 28 mars 2022, 15:15:11
    Author     : ACER
--%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="connexion.*"%>
<%
    String idAddition=request.getParameter("idAddition");
    String idServeur=request.getParameter("idSer");
    String idPlat=request.getParameter("idPlat");
    String quantite=request.getParameter("quantite");
    //int idA=Integer.valueOf(idAddition)+1;
    //Connection con=Connexion.getConnection();
    try{
        AdditionDetails.ajouter(idAddition, idPlat, quantite, idServeur);
    }
    catch(Exception e){
        out.print(e.getMessage());
    }
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
