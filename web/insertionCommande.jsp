<%-- 
    Document   : insertionCommande
    Created on : 28 mars 2022, 15:15:11
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="connexion.*"%>
<%
    String idTable=request.getParameter("idTable");
    String idServeur=request.getParameter("idServeur");
    String idPlat=request.getParameter("idPlat");
    String quantite=request.getParameter("quantite");
    
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
