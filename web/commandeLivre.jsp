<%-- 
    Document   : commandeLivre.jsp
    Created on : 4 avr. 2022, 16:00:39
    Author     : ACER
--%>

<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idAdditionDetails=request.getParameter("idAdditionDetails");
    AdditionDetails.livrer(idAdditionDetails);
%>
