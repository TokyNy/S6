<%-- 
    Document   : commandeCuite.jsp
    Created on : 4 avr. 2022, 15:48:20
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%
    String idAdditionDetails=request.getParameter("idAdditionDetails");
    AdditionDetails.finir(idAdditionDetails);
    response.sendRedirect("CommandeCuisine.jsp");
    
    %>