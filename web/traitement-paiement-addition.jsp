<%-- 
    Document   : traitement-paiement-addition
    Created on : 24 mai 2022, 09:40:13
    Author     : admin
--%>

<%@page import="model.Paiement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idType=request.getParameter("typePaiement");
    String idAddition=request.getParameter("idAddition");
    String montant=request.getParameter("montant");
    Paiement.payer(idAddition,idType,montant);
    response.sendRedirect("paiement-addition.jsp?idAddition="+idAddition+"&montant="+montant+"");
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
