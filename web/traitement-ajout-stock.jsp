<%-- 
    Document   : traitement-ajout-stock
    Created on : 30 mai 2022, 07:59:31
    Author     : ASUS
--%>

<%@page import="model.Stock"%>
<%@page import="model.Ingredients"%>
<%@page import="connexion.Connexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idIngredient=request.getParameter("idIngredient");
    String qte=request.getParameter("quantite");
    Connection con=Connexion.getConnection();
    try{
        Ingredients ingredient=Ingredients.getById(idIngredient, con);
        Stock.insert(idIngredient, Double.valueOf(qte), 1, ingredient.getPrixMoyen(con), con);
    }catch(Exception e){
        out.print(e.getMessage());
    }
    con.close();
    response.sendRedirect("/ajout-stock.jsp?succes=1");
%>
