<%-- 
    Document   : validerCommande
    Created on : 4 avr. 2022, 15:30:27
    Author     : ACER
--%>

<%@page import="model.Addition"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idAddition=request.getParameter("idAddition");
   Addition a=Addition.getById(idAddition);
    a.valider();
    int envoie=0;
    response.sendRedirect("choix1.jsp?envoie=1");
%>

