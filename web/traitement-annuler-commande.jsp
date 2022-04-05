<%-- 
    Document   : traitement-annuler-commande
    Created on : 5 avr. 2022, 08:21:13
    Author     : ASUS
--%>

<%@page import="model.Addition"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idAddition=request.getParameter("idAddition");
    String idPlat=request.getParameter("idPlat");
    try{
        Addition.annuler(idAddition, idPlat);
        response.sendRedirect("listeDetailsCommande.jsp?idAddition="+idAddition);
    }catch(Exception e){
        out.println("ERREUR: "+e.getMessage());
    }
%>