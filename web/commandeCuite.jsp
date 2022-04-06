<%-- 
    Document   : commandeCuite.jsp
    Created on : 4 avr. 2022, 15:48:20
    Author     : ACER
--%>

<%@page import="connexion.Connexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%
    String idAdditionDetails=request.getParameter("idAdditionDetails");
    String idPlat=AdditionDetails.getById(idAdditionDetails).getIdPlat();
    Connection con=Connexion.getConnection();
    con.setAutoCommit(false);
    Plat plat=Plat.getById(idPlat, con);
    try{
        AdditionDetails.finir(idAdditionDetails,con);
        plat.changerStock(con);
        con.commit();
        con.close();
        response.sendRedirect("CommandeCuisine.jsp");
    }catch(Exception e){
        e.printStackTrace();
        con.rollback();
        out.println(e.getMessage());
    }finally{
        con.close();
    }
    
    
    
    %>