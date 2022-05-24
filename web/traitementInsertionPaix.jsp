<%-- 
    Document   : traitementInsertionPaix
    Created on : 23 mai 2022, 16:06:10
    Author     : admin
--%>

<%@page import="model.Paiement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String prix=request.getParameter("prix");
   String idDetail=request.getParameter("idAdditionDetail");
   String type=request.getParameter("typePaiement");
   String idAddition=request.getParameter("idAddition");
   Paiement.payer(idDetail,type,prix);
   response.sendRedirect("detail-non-paye1.jsp?idAddition="+idAddition+"");
    
%>
