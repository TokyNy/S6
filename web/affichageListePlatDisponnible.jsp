<%-- 
    Document   : affichageListePlatDisponnible
    Created on : 22 mars 2022, 09:40:47
    Author     : ACER
--%>

<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h1>liste plats</h1>
                <table>
            <tr>
                <th>plat</th>
                <th>prix</th>
            </tr>
            <% Vector<Plat> liste=Plat.getAll();
                    for(int i=0;i<liste.size();i++){
                %>
            <tr>
                
                <td><% out.println(liste.get(i).getDesc()); %> </td>
                <td><% out.println(liste.get(i).getPrix()); %></td>
            </tr>
            <% } %>
        </table>
            </div>
            <div class="col-md-4"></div>
        </div>
        
        
    </body>
       
</html>
